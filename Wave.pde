class Wave {

  float yoff = 0.0;        // 2nd dimension of perlin noise
  float noXToWave;
  void Wave(float tempno2, float tempNoX, float tempcO) {
    float no2 = tempno2;
    float noX = tempNoX;
    float cO = tempcO;
    println(noX);
    println("no2 " + no2);
    println("cO " + cO);
    float no2Color = map(no2, 9, 93, 0, 255); 
    float cOtoIncrement = map(cO, 0.18, 0.35, 0.003, 0.01);
    noXToWave = map(noX, 10, 413, 340, 0); 
    println("noXMappet " + noXToWave);


    // We are going to draw a polygon out of the wave points
    beginShape(); 
    fill(0, no2Color, 230);
    // Option #1: 2D Noise
    // float xoff = yoff; // Option #2: 1D Noise
    float xoff = 0;
    // Iterate over horizontal pixels
    for (float x = 0; x <= width; x += 5) {
      // Calculate a y value according to noise, map to 
      float y = map(noise(xoff, yoff), 0, 1, 340, noXToWave); // Option #1: 2D Noise
      // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
      //println(y);
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
  float getnoXToWave() {
    return noXToWave;
  }
}


