class Ball 
{
  float x;
  float y;
  float dx;
  float dy;
  color c; 
  int rad;
  int stage;

  Ball() 
  {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    rad = 15;
    x = random((width - rad) + rad/2);
    y = random((height - rad) + rad/2);
    dx = random(10)-5;
    dy = random(10) -5;
    stage = 0;
  }



  boolean bounce() 
  {
    if (x + rad/2 > width || x - rad/2 < 0) 
    {
      if (x + rad/2 > width) 
      {
        x = width - rad/2;
      } 
      else 
      {
        x = 0 + rad/2;
      }
      dx = -1 * dx + 1;
      return true;
    }

    if (y + rad/2 > height || y - rad/2 < 0) 
    {
      if (y + rad/2 > height) 
      {
        y = height - rad/2;
      } 
      else 
      {
        y = 0 + rad/2;
      }
      dy = -1 * dy + 1;
      return true;
    }
 
    return false;
  }

  void update() 
  {
    if (!bounce()) 
    {
      x += dx;
      y += dy;
    }
  }
  
  void grow()
  {
    rad ++;
  }
  
  boolean checkCollision(Ball other)
  {
    if ((Math.abs(other.x-x) < rad/2) && (Math.abs(other.y-y) < rad/2))
    {
      //System.out.println("collisions");
      return true;
    }
    return false;
  }
  
  boolean checkShrink()
  {
    return rad >= 100;
  }
  
  boolean checkDead()
  {
    return rad <= 2 && stage == 1;
  }
  
  void shrink()
  {
      rad -= 1;
  }
}