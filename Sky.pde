class Sky { 
  private int r = 30;
  private int g = 150;
  private int b = 255;
  //  private color top = color(31,178,255);
  //  private color buttom = color(196,235,255);
  private color top;// = color(r,g,b);
  private color buttom;// = color(r*6,g*1.6,b);
  private float no2, noX, cO;

  private int hue;
  private int brightness;

  private ArrayList<Cloud> clouds;

  Sky(float no2, float noX, float cO) {
    this.no2 = no2;
    this.noX = noX;
    this.cO = cO;

    hue = int(140 - noX);
    brightness = int(100 - no2);
    setColors();

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
  public void setColors() {
    colorMode(HSB, 200, 99, 99); //using HSB colors for this, so we can just adjust satuation and brightness
    top = color(hue, 85, brightness);
    buttom = color(hue, 5, 95);
    colorMode(RGB); //using RGB for everything else
  }
  public void fade(float _no2, float _noX, float _cO) {
    if (_no2 > no2) {
      no2 += 0.1;
    }
    if (_no2 < no2){
      no2 -= 0.1;
    }
    if (_noX > noX){
      noX += 0.1;
    }
    if (_noX < noX){
      noX -= 0.1;
    }
   // println("nox: " + noX + "no2: " + no2);

    hue = int(140 - noX);
    brightness = int(100 - no2);
    setColors();
  }
  public void animate() {
    fill(#FF9D9D);  // draw gradient sky
    noStroke();
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
  }
}

