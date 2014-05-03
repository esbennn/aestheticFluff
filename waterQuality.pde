class WaterQuality {
  ArrayList <Fish> fishies;
  ArrayList <Garbage> badStuff;
  boolean valuesChanged = true;
  int flockOfFish;
  int amountOfGarbage;
  float fishDiff;
  float no2Mapped;
  float no2MappedUpdated;
  float no2;
  boolean reset = false;
  float fishIncoming = 0;
  float garbageIncoming = 0;

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
    amountOfGarbage = badStuff.size();
  }

  void updateFish() {
    for (int i=0; i<fishies.size(); i++) { 
      fishies.get(i).setLiveOrDie(false);
      fishies.get(i).update();
    }
  }
  void regulateFish() {

    // println("no2 "+no2Mapped + "update " + no2MappedUpdated);

    fishDiff = abs(round(no2Mapped - no2MappedUpdated));
    // println("Fjernelse på "+ fishDiff);
    if (no2Mapped>no2MappedUpdated) {
      for (int i=0; i<fishies.size(); i++) {
        if (i<fishDiff) {
          fishies.get(i).setLiveOrDie(true);
          fishies.get(i).update();
          if (fishies.get(i).getLiveOrDie() == true) {
            fishies.remove(i);
            //println(i);
          }
        }

        else {
          fishies.get(i).update();
        }
        if (fishies.size()==flockOfFish-fishDiff) {

          println("No more fish are going to die. " + fishDiff + " fish left the area!");
          valuesChanged = false;
          //  println(fishies.size());
          flockOfFish = fishies.size();
          no2Mapped = no2MappedUpdated;
        }
      }
      // println("the number of fish are " + fishies.size());
    }

    if (no2Mapped<no2MappedUpdated) {

      //println("tilføjelse på "+ fishDiff + " fisk");
      while (fishIncoming<fishDiff) {
        fishies.add(new Fish (random(width+50, 640), random(350, 370), random(-1.5, 1.5))); //size and placement of fish
        fishIncoming++;
      }
      no2Mapped = no2MappedUpdated;
      valuesChanged = false;
      println("No more fish incoming! " + fishDiff + " fish came to these waters!");
    }
  }
  void updateBadStuff() {
    for (int i = 0; i<badStuff.size();i++) {
      badStuff.get(i).update();
    }
  }

  void regulateBadStuff(float _newNo2) {
    float newNo2 = _newNo2;
    no2MappedUpdated = map(newNo2, 25, 75, 30, 0);
    fishDiff = round(abs(no2MappedUpdated-no2Mapped));
    if (no2Mapped<no2MappedUpdated) {

      for (int i=0; i<badStuff.size(); i++) {
        if (i<fishDiff) {
          badStuff.get(i).setLiveOrDie(true);
          badStuff.get(i).update();
          if (badStuff.get(i).getLiveOrDie() == true) {
            badStuff.remove(i);
        
            
          }
        }
        else {
          badStuff.get(i).update();
        }

   /*     if (badStuff.size()==amountOfGarbage-fishDiff) {
          amountOfGarbage = badStuff.size();
          println("garbageimrun!!!");
        }*/
      }
    }
    if (no2Mapped>no2MappedUpdated) {
      println("this big is badstuff " + badStuff.size());
     while (garbageIncoming <abs(fishDiff)) {
        badStuff.add(new Garbage (random(37.5, 640), 0, 0));
        garbageIncoming++;
      }
      
    }
    
      updateBadStuff();

  }

  boolean valuesChanged() {

    return valuesChanged;
  }
}

