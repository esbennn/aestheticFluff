private Importer imports;
private float no2;
private float noX;
private float cO;
private Wave ocean;
private WaterQuality waterLife;
private Sky sky;
private boolean valuesChanged = false;

void setup() {
  size(640, 360, P2D);
  imports =  new Importer();
  getDataValues(); 
  //*****
  // SETTING TESTING VALUES!
  //an example of low values is 10, 20, 0.19
  //setValues(70, 200, 0.36);
  //setValues(10, 20, 0.19);

  //adding sky and ocean with values
  ocean= new Wave(no2, noX, cO);
  sky = new Sky(no2, noX, cO); 
  waterLife = new WaterQuality(no2);
}
void draw() {
  int min = minute();
  int secs = second();
  
  if (min %5  == 0 && secs == 00) { 
//    if (min/* % 23 == 0*/ == 10 && secs == 40){  // For testing purposes. It will update at the given mintue/second
    // println("Checking server for updated data ...");
    float tempNo2 = no2;  //store the current values temporaryli
    float tempNoX = noX;
    float tempCo = cO;
    getDataValues();
    
    if(tempNo2 != no2 || tempNoX != noX || tempCo != cO){ //check if values have actually changed
    valuesChanged = true;
    }
  }
  sky.update(no2, noX, cO); // make the sky update its color and clouds
  sky.animate();
  ocean.update();
  ocean.fade(no2, noX, cO);

  if (valuesChanged == false) {  //this will run as long as no new data is being imported
    waterLife.updateFish();
    waterLife.updateBadStuff();
  }

  if (valuesChanged == true) { //when new data is imported. This will run until valuesChanged once again is set to false, through a setter in waterQuality
    waterLife.regulateBadStuff(no2);
    waterLife.regulateFish();
    valuesChanged = waterLife.valuesChanged();
  }
}

private void getDataValues() {  //method to get the data values from the html source. 
println(hour() + "." + minute() + "." + second() + ":");
println("Data updated on server.\nFetching new data...");
  try {
    imports.getData();
    no2 = imports.getNo2();       
    noX = imports.getNoX();
    cO = imports.getCO();
  }
  catch(Exception e) {
    println(e);
    println("Using default values instead.");
    no2 = 30.0;
    noX = 60.0;
    cO = 0.22;
  } 
  // printing values
  println("NO2: " + no2);
  println("NOx: " + noX);
  println("CO: " + cO);
}

private void setValues(float _no2, float _noX, float _cO) { // only for testing purposes
  no2 = _no2;
  noX = _noX;
  cO = _cO;
}

