class WaterQuality {
  ArrayList <Fish> fishies;
  ArrayList <Garbage> badStuff;
  boolean valuesChanged = true;
  int flockOfFish;
  float fishDiff;
  float no2Mapped;
  float no2MappedUpdated;
  float no2;

  WaterQuality(float _no2) {
    no2 = _no2;
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
      fishies.get(i).setLiveOrDie(false);
      fishies.get(i).update();
    }
  }
  void regulateFish(float _newNo2) {
    float newNo2 = _newNo2;
    no2MappedUpdated = map(newNo2, 25, 70, 30, 0);

    //  println("no2 "+no2Mapped);

    fishDiff = round(no2Mapped - no2MappedUpdated);
    println("Fjernelse på "+ fishDiff);
    if (no2Mapped>no2MappedUpdated) {
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
          println(fishies.size());
          flockOfFish = fishies.size();
        }
      }
    }
    if (no2Mapped<no2MappedUpdated) {
      fishDiff = round(no2MappedUpdated-no2Mapped);
      println("tilføjelse på "+ fishDiff);
      for (int i=0; i<fishDiff; i++) {
        fishies.add(new Fish (random(width+50, 640), random(350, 370), random(-1.5, 1.5))); //size and placement of fish
      }
      no2Mapped = no2MappedUpdated;
      valuesChanged = false;
    }
  }
  void updateBadStuff() {
    for (int i = 0; i<badStuff.size();i++) {
      badStuff.get(i).update();
      badStuff.get(i).setValues(no2, noX, cO);
    }
  }
  boolean valuesChanged() {
    return valuesChanged;
  }
}

