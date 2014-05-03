class Fish {
  float x;
  float y;
  int frame;
  float xspeed;
  float yspeed = 0.2;
  int W = 30;
  int H = 17;
  PImage nemo;
  int scaling = 1;
  boolean killMe = false;
  boolean killFish = false;


  Fish (float xpos, float ypos, float speed) {
    xspeed = speed;
    x = xpos;
    y = ypos;
    nemo = loadImage("fishy"+int(random(1, 4))+".png");
  }


  void update() {
    boolean goingLeft = true; 

    pushMatrix();
    translate(x, y);
    x +=xspeed;
    y +=yspeed;

    if (x > width+50 || x < -50) {
      if (killFish == true) {
        killMe = true;
      }
      else {
        xspeed *= -1;
        scaling *=-1;
      }
    }
    if (y >=height+19 || y <= 368) {
      yspeed *= -1;
    }
    if (xspeed<0 && scaling ==1) {
      scaling =-1;
    }
    if (xspeed>0 && scaling == -1)
    {
      scaling = 1;
    }
    scale(scaling, 1);

    image(nemo, -50, -37.5, W, H);

    popMatrix();
  }

  boolean getLiveOrDie() {
    return killMe;
  }
  void setLiveOrDie(boolean kill) {
    killFish = kill;
  }
}

