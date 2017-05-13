class Ball {
  float x;
  float y;
  float dx;
  float dy;
  color c; 
  int rad;

  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    rad = 15;
    x = random((width - rad) + rad/2);
    y = random((height - rad) + rad/2);
    dx = random(10)-5;
    dy = random(10) -5;
    //System.out.println("" + x + " " + y);
  }

  boolean bounce() {
    if (x > width || x < 0) {
      if (x > width)
        x = width;
      else
        x = 0;
      dx = -1 * dx;
      return true;
    }

    if (y > height || y < 0) {
      if (y > height)
        y = height;
      else
        y = 0;
      dy = -1 * dy;
      return true;
    }
    return false;
  }

  void update() {
    if (!bounce()) {
      x += dx;
      y += dy;
    }
  }
}