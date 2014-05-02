private Importer imports;
private float no2;
private float noX;
private float cO;
private Wave ocean;
private WaterQuality waterLife;
private Sky sky;
boolean valuesChanged = false;

void setup() {

  size(640, 360, P2D);
  imports =  new Importer();
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
  //*****
  // SETTING TESTING VALUES!
  //an example of low values is 10, 20, 0.19

  setValues(10, 50, 0.19);
   //setValues(70, 200, 0.36);

  // printing values
  println("NO2: " + no2);
  println("NOx: " + noX);
  println("CO: " + cO);

  //adding sky with values
  ocean= new Wave(no2, noX, cO);
  sky = new Sky(no2, noX, cO); 
  waterLife = new WaterQuality(no2);
}
void draw() {//asdsa
  int min = minute();
  int secs = second();

  //if (min % 5 == 0 && secs == 0){ // DETTE ER DEN DER SKAL BRUGES ENDELIGT - Og setValues-kaldet (ovenfor) skal fjernes
  if (min/* % 5 == 0*/ ==30 && secs == 15) {  // Den her opdaterer når du beder den om det hans! Programmet bruger lige nu faste høje tal, og opdaterer når du beder den om det.
    println("Checking server for updated data ...");
    getDataValues();
    valuesChanged = true;
  }
  sky.fade(no2, noX, cO); // make the sky update its color
  sky.animate();
  ocean.update();

  fill(140, 140, 0);

  if (valuesChanged == false) {
    waterLife.updateFish();
   waterLife.updateBadStuff();
  }
  
  if (valuesChanged == true) {
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

