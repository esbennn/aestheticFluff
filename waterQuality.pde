class WaterQuality {
  ArrayList <Fish> fishies;
  ArrayList <Garbage> badStuff;
  boolean valuesChanged = true;
int flockOfFish;

float no2Mapped;
float no2MappedUpdated;

  WaterQuality() {
    fishies = new ArrayList<Fish>();
    badStuff = new ArrayList<Garbage>();

    no2Mapped = map(no2, 25, 70, 30, 0);

    for (int i=0; i<no2Mapped; i++) {

      fishies.add(new Fish (random(37.5, 640), random(350, 370), random(-1.5, 1.5))); //size and placement of circles
    }
    for (int i=30; i> no2Mapped; i--) {
      badStuff.add(new Garbage (random(37.5, 640), random(350, 370), 0));
    }
    noStroke();
    
    flockOfFish = fishies.size();
  }

  void updateFish() {
    for (int i=0; i<fishies.size(); i++) { 
      fishies.get(i).update();
      fishies.get(i).setValues(no2, noX, cO);
    }
  }
  void regulateFish() {
    no2MappedUpdated = map(no2, 25, 70, 30, 0);

    //  println("no2 "+no2Mapped);
    println("no2updated "+no2MappedUpdated);
    float fishDiff = 5; //no2Mapped - no2MappedUpdated;


    for (int i=0; i<fishies.size(); i++) {
      if (i<fishDiff) {
        fishies.get(i).setLiveOrDie(true);
        fishies.get(i).update();
        if (fishies.get(i).getLiveOrDie() == true) {
          fishies.remove(i);
          println(i);
        }
      }
      else {
        fishies.get(i).update();
      }
      if (fishies.size()==flockOfFish-fishDiff) {
        valuesChanged = false;
        println("imrun!!!");
        no2Mapped = no2MappedUpdated;
        flockOfFish = fishies.size();
      }
    }
  }
  boolean valuesChanged(){
   return valuesChanged;
    
  }
}

