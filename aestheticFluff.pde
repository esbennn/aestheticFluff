private Importer imports;
private float no2;
private float noX;
private float cO;
private Wave ocean;
private WaterQuality waterLife;
private Sky sky;
private boolean valuesChanged = false;

void setup() {
  size(640, 360, P2D); //Stage size. P2D for handling gradient sky.
  imports =  new Importer();
  try {  //try grabbing the data.
    imports.getData();
    getDataValues();
  }
  catch(Exception e) { //If something goes wrong (eg no internet, server down...) 
    println(e);        //print the error and use default values instead.
    println("Using default values instead.");
    no2 = 30.0;
    noX = 60.0;
    cO = 0.22;
  }  
  //*****
  // FOR TESTING VALUES AND TRANSITIONS
  //an example of low values is 10, 20, 0.19
  //setValues(70, 200, 0.36);
  //setValues(10, 20, 0.19);
  //*****

  // printing values
  println("NO2: " + no2);
  println("NOx: " + noX);
  println("CO: " + cO);

  //adding sky, wave and fish/garbage current with values
  ocean= new Wave(no2, noX, cO);
  sky = new Sky(no2, noX, cO); 
  waterLife = new WaterQuality(no2);
}
void draw() {
  int min = minute(); //get current minutes
  int secs = second();//and seconds

  if (min % 5 == 0 && secs == 0) { //runs every five minutes
    //if (min/* % 23 == 0*/ == 44 && secs == 35){  // test-ifelse til at teste transitions ved opdateret data
    getDataValues();
    valuesChanged = true;
  }
  sky.update(no2, noX, cO); // make the sky update its color and clouds
  sky.animate();            // animate sky = update colors and clouds
  ocean.update();           // update the ocesn
  ocean.fade(no2, noX, cO); // update oceans colors 

  if (valuesChanged == false) { //if values haven't been updated: jsut update fish positions
    waterLife.updateFish();
    waterLife.updateBadStuff();
  }
  if (valuesChanged == true) { //if values have changed, update amount of fish and garbage
    waterLife.regulateBadStuff(no2);
    waterLife.regulateFish();
    valuesChanged = waterLife.valuesChanged();
  }
}

private void getDataValues() {  //method to get the data values from the html source. 
  no2 = imports.getNo2();    //is only run if there are no errors getting the data...
  noX = imports.getNoX();
  cO = imports.getCO();
}

private void setValues(float _no2, float _noX, float _cO) { // only for testing purposes
  no2 = _no2;
  noX = _noX;
  cO = _cO;
}

