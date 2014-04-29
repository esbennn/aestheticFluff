class Sky { 
  private int r = 30;
  private int g = 150;
  private int b = 255;
  //  private color top = color(31,178,255);
  //  private color buttom = color(196,235,255);
  private color top;// = color(r,g,b);
  private color buttom;// = color(r*6,g*1.6,b);
  private float no2, noX, cO;

  private Cloud cloud;

  private ArrayList<Cloud> clouds;

  Sky(float no2, float noX, float cO) {
    this.no2 = no2;
    this.noX = noX;
    this.cO = cO;

    int hue = int(140 - noX);
    int brightness = int(100 - no2);
    colorMode(HSB, 200, 99, 99); //using HSB colors for this, so we can just adjust satuation and brightness
    top = color(hue, 85, brightness);
    buttom = color(hue, 5, 95);
    colorMode(RGB); //using RGB for everything else

    //   cloud = new Cloud(200, no2, cO, -1.5);
    clouds = new ArrayList<Cloud>();
    int nrOfClouds = int(no2/10);
    float cloudX = 800/nrOfClouds;
    for (int i = 0; i <= nrOfClouds; i++) {
      //println(i);

      clouds.add(new Cloud(cloudX, no2, noX, cO));
      cloudX += cloudX;
    }
  }
  public void animate() {
    fill(#FF9D9D);
    noStroke();
    //rect(0,0,640,360);
    beginShape();
    fill(top);
    vertex(0, 0);
    vertex(640, 0);
    fill(buttom);
    vertex(640, 360);
    vertex(0, 360);
    endShape(); 
    for (Cloud c : clouds) {
      c.animate();
    }
    // cloud.animate();
  }
}

