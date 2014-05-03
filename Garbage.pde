class Garbage extends Fish {

  Garbage(float xpos, float ypos, float speed) {
    super(xpos, ypos, speed);
    nemo = loadImage("bad"+int(random(1, 4))+".png");
  }
  void update() {

    pushMatrix();
    translate(x, y);

    y +=yspeed;
    if (y<height/1.15) {
      y+=1;
    }

    if (y >=height+19) {

      if (killFish == true) {
        y +=0.1;
      }
      else {
        yspeed =0;
      }
      if (y>height+30) {
        killMe = true;
      }
    }
    image(nemo, -50, -37.5, W, H);
    popMatrix();
  }
} 

