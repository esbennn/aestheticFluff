importer importz = new importer();
wave ocean = new wave();

fish[] fishies = new fish[8];
void setup() {

size(640, 360);
for (int i=0; i<fishies.length; i++) {
    fishies[i] = new fish (random(0,width), 350, random(2, 15)); //size and placement of circles
  }
  noStroke();
  

}


void draw(){
  float no2 = importz.getno2();
  float noX = importz.getnoX();
  float cO = importz.getcO();
  background(55);
   ocean.wave(no2, noX, cO);
  
  float mappednoX = ocean.getnoXToWave();
   
   fill(140,140,0);
      for (int i=0; i<fishies.length; i++) { //important for-loop. first, each object is created
    fishies[i].drawCircles (); //first, each object is created,
    fishies[i].bouncing ();   //then each object is given bouncy properties
    fishies[i].gravity();

}
}
