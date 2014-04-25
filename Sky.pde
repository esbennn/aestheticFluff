class Sky { 
  private int r = 30;
  private int g = 150;
  private int b = 255;
//  private color top = color(31,178,255);
//  private color buttom = color(196,235,255);
  private color top;// = color(r,g,b);
  private color buttom;// = color(r*6,g*1.6,b);
  
  Sky(float no2, float noX, float cO) {
    int hue = int(120 - noX);
    int brightness = int(100 - no2);
    colorMode(HSB, 200, 99, 99); //using HSB colors for this, so we can just adjust satuation and brightness
    top = color(hue, 85, brightness);
    buttom = color(hue, 5, 95);
      colorMode(RGB); //using RGB for everything else

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
  }  
}

