private Importer imports;
private float no2;
private float noX;
private float cO;
ArrayList <Fish> fishies;
ArrayList <Garbage> badStuff;


private Wave ocean = new Wave(); //lala

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
  fishies = new ArrayList<Fish>();
  badStuff = new ArrayList<Garbage>();
  float no2 = imports.getNo2();  // should these be moved to class definition?
  float noX = imports.getNoX();
  float cO = imports.getCO();
  // printing values
  println("NO2: " + no2);
  println("NOx: " + noX);
  println("CO: " + cO);

  float no2Mapped = map(no2, 25, 70, 30, 0);
  float noXMapped = map(noX, 10, 413, 0, 10);

  println(no2Mapped);
  for (int i=0; i<no2Mapped; i++) {

    fishies.add(new Fish (random(37.5, 640), random(350, 370), random(-1.5, 1.5))); //size and placement of circles
  }
  for (int i = 0; i<noXMapped;i++) {
    badStuff.add(new Garbage (random(37.5, 640), random(350, 370), 0));
  }
  noStroke();
}


void draw() {

  background(55);

  ocean.setValues(no2, noX, cO);

  fill(140, 140, 0);

  for (int i=0; i<fishies.size(); i++) { //important for-loop. first, each object is created
    fishies.get(i).update();
    fishies.get(i).setValues(no2, noX, cO);
    if (i<badStuff.size()) {
      badStuff.get(i).update();
      badStuff.get(i).setValues(no2, noX, cO);
    }
  }
}
private void getDataValues() {  //method to get the data values from the html source. 
  no2 = imports.getNo2();    //is only run if there are no errors getting the data...
  noX = imports.getNoX();
  cO = imports.getCO();
}

