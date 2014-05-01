private Importer imports;
private float no2;
private float noX;
private float cO;
private Wave ocean;
private Sky sky;

ArrayList <Fish> fishies;
ArrayList <Garbage> badStuff;

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
  
  //setValues(10, 20, 0.19);

  //setValues(70, 200, 0.36);
  //*****

  
  // printing values
  println("NO2: " + no2);
  println("NOx: " + noX);
  println("CO: " + cO);
  
  //adding sky with values
  ocean= new Wave(no2, noX, cO);
  sky = new Sky(no2, noX, cO); 
  
  fishies = new ArrayList<Fish>();
  badStuff = new ArrayList<Garbage>();
  
  float no2Mapped = map(no2, 25, 70, 30, 0);

  for (int i=0; i<no2Mapped; i++) {

    fishies.add(new Fish (random(37.5, 640), random(350, 370), random(-1.5, 1.5))); //size and placement of circles
  }
  for (int i=30; i> no2Mapped; i--) {
    badStuff.add(new Garbage (random(37.5, 640), random(350, 370), 0));
  }
  noStroke();
}


void draw() {
  
   sky.animate();
   ocean.update();
  
  fill(140, 140, 0);

  for (int i=0; i<fishies.size(); i++) { //important for-loop. first, each object is created
    fishies.get(i).update();
    fishies.get(i).setValues(no2, noX, cO);
  }
      for (int i = 0; i<badStuff.size();i++) {
      badStuff.get(i).update();
      badStuff.get(i).setValues(no2, noX, cO);
    }

}

private void getDataValues() {  //method to get the data values from the html source. 
  no2 = imports.getNo2();    //is only run if there are no errors getting the data...
  noX = imports.getNoX();
  cO = imports.getCO();
}

private void setValues(float _no2, float _noX, float _cO){ // only for testing purposes
  no2 = _no2;
  noX = _noX;
  cO = _cO;
}

