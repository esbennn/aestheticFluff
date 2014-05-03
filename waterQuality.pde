class WaterQuality {
  private ArrayList <Fish> fishies;
  private ArrayList <Garbage> badStuff;
  public boolean valuesChanged = true;
  private int flockOfFish;
  private float diff;
  private float no2Mapped;
  private float no2MappedUpdated;
  private float no2;
  private float fishOrGarbIncoming = 0;

  WaterQuality(float _no2) { //imports no2 through setup in main
    no2 = _no2;
    fishies = new ArrayList<Fish>();
    badStuff = new ArrayList<Garbage>();

    no2Mapped = map(no2, 25, 70, 30, 0); //maps no2 value, to amount of fish


    for (int i=0; i<no2Mapped; i++) { //fish are created

      fishies.add(new Fish (random(37.5, 640), random(350, 370), random(-1.5, 1.5))); //size and placement of circles
    }
    for (int i=30; i> no2Mapped; i--) { //garbage is created
      badStuff.add(new Garbage (random(37.5, 640), random(350, 370), 0));
    }
    noStroke();

    flockOfFish = fishies.size(); //original size of arralists are stored, in order to compare with newer arraylists
  }

  public void updateBadStuff() {
    for (int i = 0; i<badStuff.size();i++) {
      badStuff.get(i).update();
    }
  }

  public void updateFish() {  //regular update function. Updates movement
    for (int i=0; i<fishies.size(); i++) { 
      fishies.get(i).setLiveOrDie(false);
      fishies.get(i).update();
    }
  }

  public void regulateBadStuff(float _newNo2) {
    float newNo2 = _newNo2;
    no2MappedUpdated = map(newNo2, 25, 75, 30, 0);  
    diff = round(abs(no2MappedUpdated-no2Mapped));  // stores the absolute value of the difference between the mapped no2 values
    if (no2Mapped<no2MappedUpdated) {               // if old mapped no2 is smaller than new mapped no2, garbage is removed

        for (int i=0; i<badStuff.size(); i++) {
        if (i<diff) {                               // the stored difference in the two mappings
          badStuff.get(i).setLiveOrDie(true);       // informs object that it will be removed as soon as it returns getLiveOrDie with a value of true(see line 50-51)
          badStuff.get(i).update();
          if (badStuff.get(i).getLiveOrDie() == true) {
            badStuff.remove(i);
          }
        }
        else {
          badStuff.get(i).update();                // when every garbage object to be removed has been picked, the rest will simply be updated
        }
      }
    }
    if (no2Mapped>no2MappedUpdated) {                         // garbage is created if the new data is worse. The comparison
      println("this big is badstuff " + badStuff.size());     // between the two mapped no2s were stored in diff. 
      while (fishOrGarbIncoming <abs (diff)) {
        badStuff.add(new Garbage (random(37.5, 640), 0, 0));
        fishOrGarbIncoming++;
      }
    }
    updateBadStuff();
  }

  public void regulateFish() {


    // println("Fjernelse på "+ diff);
    if (no2Mapped>no2MappedUpdated) {                    // if old mapped no2 is bigger than new mapped no2, fish is going to die
      for (int i=0; i<fishies.size(); i++) {
        if (i<diff) {                                // the stored difference in the two mappings
          fishies.get(i).setLiveOrDie(true);             // informs object that it will be removed as soon as it returns getLiveOrDie with a value of true(see line 50-51)
          fishies.get(i).update();                       
          if (fishies.get(i).getLiveOrDie() == true) {
            fishies.remove(i);
          }
        }

        else {
          fishies.get(i).update();                      // when all fish to be removed has been picked, the rest will just be updated
        }
        if (fishies.size()==flockOfFish-diff) {     //if enough fish has been removed, valueschanged is set to false, so that regulateFish and regulateBadStuff wont run
          println("No more fish are going to die. " + diff + " fish left the area!");

          //resetting values for next time data is being imported. It happens here, because this is the last part that is run, if the new data is worse than the old
          valuesChanged = false;
          flockOfFish = fishies.size();
          no2Mapped = no2MappedUpdated;
          fishOrGarbIncoming = 0;
        }
      }
    }

    if (no2Mapped<no2MappedUpdated) {                  

      while (fishOrGarbIncoming<diff) {                                                         //fish are created if the new data is better. The comparison
        fishies.add(new Fish (random(width+50, 640), random(350, 370), random(-1.5, 1.5)));   // between the two mapped no2s were stored in diff. New fish are created
        fishOrGarbIncoming++;
      }
      //resetting values for next time data is being imported. It happens here, because this is the last part that is run, if the new data is better than the old
      valuesChanged = false;
      flockOfFish = fishies.size();
      no2Mapped = no2MappedUpdated;
      fishOrGarbIncoming = 0;

      println("No more fish incoming! " + diff + " fish came to these waters!");
    }
  }

  public boolean valuesChanged() {

    return valuesChanged;
  }
}

