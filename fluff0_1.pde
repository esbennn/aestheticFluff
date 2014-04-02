Importer imports;
private float no2;
private float noX;
private float cO;

void setup() {
  size(50, 50);
  imports =  new Importer();
  // grab the data from the website
  try {
    imports.getData();
    getDataValues();
  }
  catch(Exception e) {
    println(e);
    println("Using default values instead.");
    no2 = 30.0;
    noX = 60.0;
    cO = 0.22;
  }

  println("NO2: " + no2);
  println("NOx: " + noX);
  println("CO: " + cO);
}
private void getDataValues() {  //method to get the data values from the html source. 
  no2 = imports.getNo2();    //is only run if there are no errors getting the data...
  noX = imports.getNoX();
  cO = imports.getCO();
}

void draw() {
}

