class importer {
  /*
This needs to be optimized to take into account both 3, 4 and 5-digit
   values in the source ! It works so far, but is far from perfect.
   
   --- EDIT ---
   Has been optimized - is it working properly?
   
   --- TODO ---
   clean up by moving al the data getting to a seperate class
   */
  String[] lines; 
  String htmlSource;
  String trimmedHtmlSource = new String();

  float no2;
  float noX;
  float cO;

  importer() {

    lines = loadStrings("http://www2.dmu.dk/atmosphericenvironment/byer/sortall_files/stat6153.htm");
    htmlSource = join(lines, "\n");
    trimSource();
    getValues();

    //println("NO2: " + no2);
    //println("NOx: " + noX);
    //println("CO: " + cO);
  }
  float getno2() {
    return no2;
  }
  float getnoX() {
    return noX;
  }
  float getcO() {
    return cO;
  }


  private void trimSource() {
    /* 
     This is tricky... The tag-wise configuration of the source-string changes, depending on how many digits there are in
     each of the values. To take that into account, we start by removing any incomplete tag in the beginning and end of the 
     source string
     A while-loop then removes the every html-tag (by searching for "<" and ">") until indexOf("<") == -1, 
     meaning that there are no more tags.
     */
    trimmedHtmlSource = htmlSource.substring(1510, 1625);
    //  println("Data source in html-format:\n" + trimmedHtmlSource);
    // remove any incomplete tag at the beginning of the source string
    if (trimmedHtmlSource.indexOf(">") < trimmedHtmlSource.indexOf("<")) {
      trimmedHtmlSource = trimmedHtmlSource.substring(trimmedHtmlSource.indexOf(">") +1, trimmedHtmlSource.length()-1);
    }
    // remove any incomplete tags at the end of the source string
    if (trimmedHtmlSource.lastIndexOf("<") > trimmedHtmlSource.lastIndexOf(">")) {
      trimmedHtmlSource = trimmedHtmlSource.substring(0, trimmedHtmlSource.lastIndexOf(">")+1);
    }
    Boolean moreTagsLeft = true;                       // any more left ? 
    while (moreTagsLeft) {
      int open = trimmedHtmlSource.indexOf("<");
      int close = trimmedHtmlSource.indexOf(">");
      String tempString = trimmedHtmlSource.substring(0, open) + trimmedHtmlSource.substring(close + 1, trimmedHtmlSource.length());
      //    println("Trimming ...:\n" + tempString);  
      trimmedHtmlSource = tempString;
      if (trimmedHtmlSource.indexOf("<") == -1) {       //check if there are more tags left
        moreTagsLeft = false;                           // if there isn't... remember that
      }
    }
  } 

  private void getValues() {
    /* 
     We need to save three values into variables: no2, noX and cO.
     Each value has a two-digit-decimal, so we can use the decimaal-points to grab the values.
     no2 is from the start of the html-source-file to two digits after first decimal, so we save that substring in no2
     and remove it from the source-string. And then we proceed to the next decimal / variable ... 
     */
    String tempSource = trimmedHtmlSource;                               // make a local working-copy of the html source file
    int decimal = trimmedHtmlSource.indexOf(".");                        // set decimal at first "."
    no2 = Float.parseFloat(tempSource.substring(0, decimal + 3));        // make a substring from start to two decimals after "."
    tempSource = tempSource.substring(decimal + 3, tempSource.length()); // remove no2 from temp source file
    decimal = tempSource.indexOf(".");                                   // next variable, same procedure ....
    noX = Float.parseFloat(tempSource.substring(0, decimal + 3));        
    tempSource = tempSource.substring(decimal + 3, tempSource.length()); 
    decimal = tempSource.indexOf(".");                                   // next variable, same procedure ....
    cO = Float.parseFloat(tempSource.substring(0, decimal + 3));
  }
}

