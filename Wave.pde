class Wave {

  float yoff = 0.0;        // 2nd dimension of perlin noise
  float noXToWave;
  float no2Color;
  float no2Color2;
  float cOtoIncrement;


  Wave (float tempno2, float tempNoX, float tempcO) {
    float no2 = tempno2;
    float noX = tempNoX;
    float cO = tempcO;

    no2Color = map(no2, 10, 150, 30, 255); 
    no2Color2 = map(no2, 10, 150, 80, 0); 
    cOtoIncrement = map(cO, 0.18, 0.50, 0.003, 0.01);
    noXToWave = map(noX, 10, 250, 260, 0);
  }
  void update() {
    // We are going to draw a polygon out of the wave points
    beginShape(); 
    fill(0, no2Color, no2Color2);
    // Option #1: 2D Noise
    float xoff = 0;
    // Iterate over horizontal pixels
    for (float x = 0; x <= width; x += 5) {
      // Calculate a y value according to noise, map to 
      float y = map(noise(xoff, yoff), 0, 1, 340, noXToWave); // Option #1: 2D Noise

        // Set the vertex
      vertex(x, y); 
      // Increment x dimension for noise
      xoff += 0.02;
    }
    //println("out!");
    // increment y dimension for noise
    yoff += cOtoIncrement;

    vertex(width, height);
    vertex(0, height);

    endShape(CLOSE);
  }
  public void fade(float _no2, float _noX, float _cO) {
    no2Color = map(no2, 10, 150, 30, 255); 
    no2Color2 = map(no2, 10, 150, 80, 0); 
    cOtoIncrement = map(cO, 0.18, 0.50, 0.003, 0.01);
    noXToWave = map(noX, 10, 250, 260, 0);
    
    if (_no2 > no2) {
      no2 += 0.1;
    }
    if (_no2 < no2) {
      no2 -= 0.1;
    }
    if (_noX > noX) {
      noX += 0.1;
    }
    if (_noX < noX) {
      noX -= 0.1;
    }
    // println("nox: " + noX + "no2: " + no2);

    hue = int(140 - noX);
    brightness = int(100 - no2);
    setColors();
  }
}

