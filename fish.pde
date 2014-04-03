class fish { //the circles class. Here, everything concerning the change of the behavior and appearance of each circle is manipulated

  float x;
  float y; 
  float circleSize;

  boolean dragged;
  float xspeed = random (-0.5, 0.5);
  float yspeed = random (-0.5, 0.5);



  fish (float xpos, float ypos, float bSize) { //parameters that comes with the objects instantiated from above

      x = xpos;
    y = ypos;
    circleSize = bSize;

    dragged = false;

    }
    void gravity() { // sets the circles in motion if the enterIsPressed boolean is true
   
      x += xspeed;
      y += yspeed;
    
  }
  





  void bouncing () { //makes the circles bounce when hitting a wall

    if ( (x<0) || (x>width-circleSize)) {

      xspeed = -xspeed;
    }

    if ( (y<330)  || (y>height-circleSize)) {
      yspeed = -yspeed;
    }
  }

  void drawCircles () { //draws the circles with a color depending on if the circle is clicked or not


      fill(255,255,0);
    
    ellipse (x, y, circleSize,5);
        /*beginShape();
  fill(0,0,255);
  vertex(50, 50);
 vertex(75,75);
vertex(100,50);
vertex(125,75);
vertex(100,100);
vertex(75,80);
vertex(50,100);
endShape();*/
  }



}

