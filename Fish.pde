class Fish {
  protected float x;
  protected float y;
  protected int frame;
  protected float xspeed;
  protected float yspeed = 0.2;
  protected int W = 30;
  protected int H = 17;
  protected PImage nemo;
  protected int scaling = 1;
  protected boolean killMe = false;
  protected boolean killFish = false;


  Fish (float xpos, float ypos, float speed) { //Fish constructor. Parameters from waterQuality is being imported
    xspeed = speed;
    x = xpos;
    y = ypos;
    nemo = loadImage("fishy"+int(random(1, 4))+".png"); //Image from directory randomly being picked out, from 1-4
  }


  public void update() { //image is moved here

    pushMatrix();    
    translate(x, y);
    x +=xspeed;
    y +=yspeed;

    if (x > width+50 || x < -50) { //if the fish is outside stage, AND setLiveOrDie(setting killFish to true) has been called from waterQuality to announce this object 
                                   //that as soon as its out of stage, its going to be eliminated. setLiverOrDie called if this objects index in the arraylist is smaller than
                                   // the amount of objects to be removed. 
      if (killFish == true) {
        killMe = true;             //Announces to waterQuality, that this object can be eliminated 
      }
      else {
        xspeed *= -1;
        scaling *=-1;            //turns the fish around
      }
    }
    if (y >=height+19 || y <= 368) { //opposite y-direction. Bounce
      yspeed *= -1;
    }
    if (xspeed<0 && scaling ==1) { 
      scaling =-1;
    }
    if (xspeed>0 && scaling == -1) // These to "ifs" makes sure that every fish has the right direction, because its xspeed is random, it can start by going both forward and backwards
    {
      scaling = 1;
    }
    scale(scaling, 1);

    image(nemo, -50, -37.5, W, H);    //puts image on stage

    popMatrix();
  }

  public boolean getLiveOrDie() {
    return killMe;
  }
  public void setLiveOrDie(boolean kill) {
    killFish = kill;
  }
}

