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
   // this.y = y;
    vel = cO;
    float multiplier = noX / 100;
    cloudHeight = 38 * multiplier;
    cloudWidth = 150 * multiplier;
    y = random(0, 200);
    shapeMode(CENTER);
    float tempC = (270 - no2 > 255)? 255 : 270 - no2;
    
    c = color(tempC - no2);
    
   // alpha = 300 * cO; 
  }

  public void animate() {
    x -= vel;
    
    if (x < -200){
      x = 800;
    }
    svgCloud.disableStyle();
    fill(c, alpha);
    shape(svgCloud, x, y, cloudWidth, cloudHeight);
    //filter(BLUR, 3);
    //svgCloud.disableStyle();


    //beginShape();
    //vertex(x-30, y); // first point
    //bezierVertex(x-45, y-15, x-30, y, x-10, y-10);
    //bezierVertex(x-5, x-14, x+5, y-10, x+6, x-7);
    //endShape();

  }
  
  public void setAlpha(float a){
    alpha = a;
  }
  
  public float getAlpha(){
    return alpha;
  }
}

