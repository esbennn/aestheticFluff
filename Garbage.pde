class Garbage extends Fish { //inherits most functions and variables from fish class

  Garbage(float xpos, float ypos, float speed) {
    super(xpos, ypos, speed);
    nemo = loadImage("bad"+int(random(1, 4))+".png");
  }
  void update() {

    pushMatrix();
    translate(x, y);

    y +=yspeed;
    if (y<height/1.15) {  //as long as its above the lowest part of the stage, the garbage will fly quicker
      y+=1;
    }

    if (y >=height+19) {

      if (killFish == true) { // If this object has been chosen for elimination, it starts to sink
        y +=0.1;
      }
      else {
        yspeed =0;            // if it hasnt been chosen, it will stay on the ocean floor
      }
      if (y>height+30) {      // If the object has gone outside stage (because of if-construction at line 19), it will inform waterQuality that it is ready for elimination
        killMe = true;
      }
    }
    image(nemo, -50, -37.5, W, H);
    popMatrix();
  }
} 

