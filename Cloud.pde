class Cloud {
  private color c;
  private float alpha;
  private float x;
  private float y;
  private float vel = -1.5;
  private float cloudHeight;
  private float cloudWidth;
  private PShape svgCloud = loadShape("cloud.svg");

  Cloud(float x, float no2, float noX, float cO) {
    this.x = x;
    vel = cO;
    float multiplier = noX / 100;
    cloudHeight = 38 * multiplier;
    cloudWidth = 150 * multiplier;
    y = random(0, 200);
    shapeMode(CENTER);
    float tempC = (270 - no2 > 255)? 255 : 270 - no2;  //make sure color doesnt get higher than 255 
    c = color(tempC - no2);
  }

  public void animate() {
    x -= vel; // move cloud left   
    if (x < -200){ // move it back to the right of stage once it's left stage
      x = 800;
    }
    svgCloud.disableStyle(); //disable cloud.svg's color and alpha
    fill(c, alpha); //use calculated color / alpha
    shape(svgCloud, x, y, cloudWidth, cloudHeight);
  }

  public void setAlpha(float a){
    alpha = a;
  }
  
  public float getAlpha(){
    return alpha;
  }
}

