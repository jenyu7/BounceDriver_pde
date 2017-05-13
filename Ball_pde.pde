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
    if (x + rad/2 > width || x - rad/2 < 0) {
      if (x + rad/2 > width)
        x = width - rad/2;
      else
        x = 0 + rad/2;
      dx = -1 * dx;
      return true;
    }

    if (y + rad/2 > height || y - rad/2 < 0) {
      if (y + rad/2 > height)
        y = height - rad/2;
      else
        y = 0 + rad/2;
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