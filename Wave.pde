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
    //values are mapped
    no2Color = map(no2, 10, 150, 30, 255); 
    no2Color2 = map(no2, 10, 150, 80, 0); 
    cOtoIncrement = map(cO, 0.18, 0.50, 0.003, 0.01);
    noXToWave = map(noX, 10, 250, 260, 0);
  }
  void update() {
    // We are going to draw a polygon out of the wave points
    beginShape();                                            //inside this beginshape-endshape construction, a wave is being made through vertex being created inside a for-loop.
    //color of the wave is set with mapped no2 values        // the xoff is reset every time this function is called, but the yoff continues to grow, in order to diverse the look
    fill(0, no2Color, no2Color2);                            // of the wave, with the use of 2d perlin noise. The shape is completed outside the for-loop, with the last to vertex
                                                             // points being created at (width,height) and (0,height).
    float xoff = 0;
    // Iterate over horizontal pixels
    for (float x = 0; x <= width; x += 5) {
      // Calculate a y value according to noise, map to 
      float y = map(noise(xoff, yoff), 0, 1, 340, noXToWave); 
      // Set the vertex
      vertex(x, y); 
      
      xoff += 0.02;
    }
    
    yoff += cOtoIncrement;

    vertex(width, height);
    vertex(0, height);

    endShape(CLOSE);
  }
  public void fade(float _no2, float _noX, float _cO) { //Maps the imported data, and changes the original mappings slowly until they are equal to the imported mappings


    float _no2Color = map(no2, 10, 150, 30, 255); 
    float _no2Color2 = map(no2, 10, 150, 80, 0); 
    float _cOtoIncrement = map(cO, 0.18, 0.50, 0.003, 0.01);
    float _noXToWave = map(noX, 10, 250, 260, 0);

    if (_no2Color > no2Color) {
      no2Color += 0.1;
    }
    if (_no2Color2 > no2Color2) {
      no2Color2 += 0.1;
    }
    if (_cOtoIncrement > cOtoIncrement) {
      cOtoIncrement += 0.0001;
    }
    if (_noXToWave > noXToWave) {
      noXToWave += 0.1;
    }


    if (_no2Color < no2Color) {
      no2Color -= 0.1;
    }
    if (_no2Color2 < no2Color2) {
      no2Color2 -= 0.1;
    }
    if (_cOtoIncrement <cOtoIncrement) {
      cOtoIncrement -= 0.0001;
    }
    if (_noXToWave < noXToWave) {
      noXToWave -= 0.1;
    }
  }
}

