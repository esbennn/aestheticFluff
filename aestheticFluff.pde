private Importer imports;
private float no2;
private float noX;
private float cO;
private Wave ocean = new Wave(); //lala
Fish[] fishies = new Fish[8];
//,alskdlaskdlaskdlaskdlasldkasldkla
void setup() {
  size(640, 360);
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
  // printing values
  println("NO2: " + no2);
  println("NOx: " + noX);
  println("CO: " + cO);

  for (int i=0; i<fishies.length; i++) {
    fishies[i] = new Fish (random(0, width), 350, random(2, 15)); //size and placement of circles
  }
  noStroke();
}


void draw() {
  float no2 = imports.getNo2();  // should these be moved to class definition?
  float noX = imports.getNoX();
  float cO = imports.getCO();
  background(55);
  ocean.setValues(no2, noX, cO);
  float mappednoX = ocean.getnoXToWave();

  fill(140, 140, 0);
  for (int i=0; i<fishies.length; i++) { //important for-loop. first, each object is created
    fishies[i].drawCircles ();           //first, each object is created,
    fishies[i].bouncing ();              //then each object is given bouncy properties
    fishies[i].gravity();
  }
  
}
private void getDataValues() {  //method to get the data values from the html source. 
  no2 = imports.getNo2();    //is only run if there are no errors getting the data...
  noX = imports.getNoX();
  cO = imports.getCO();
}

