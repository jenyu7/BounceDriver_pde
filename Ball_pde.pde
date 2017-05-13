class Ball {
  float x;
  float y;
  float dx;
  float dy;
  int c; 
  int rad;
  void Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    rad = 10;
    x = random((width - rad) + rad/2);
    y = random((height - rad) + rad/2);
    dx = random(10)-5;
    dy = random(10) -5;
  }

  boolean check&Bounce() {
    if (x+rad+dx > width || x+rad+dx < 0) {
      if (x+rad+dx > width)
        x = width - rad;
      else
        x = 0 + rad;
      dx = -1 * dx;
      return true;
    }

    if (y+rad+dy > height || y+rad+dy < 0) {
      if (y+rad+dx > height)
        y = height - rad;
      else
        y = 0 + rad;
      dy = -1 * dy;
      return true;
    }
    return false;
  }
}