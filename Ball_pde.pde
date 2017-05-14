class Ball 
{
  //Instance Variables
  float x;
  float y;
  float dx;
  float dy;
  color c; 
  int rad;
  int state;

  //Default Constructor
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
    state = 0;
  }

  //Overloaded Constructor
  Ball(int a, int b)
  {
    this();
    x = a; 
    y = b;
    state = 1;
  }
  
  //Displays the ball
  void display()
  {
    fill(c);
    ellipse(x, y, rad, rad);
  }

  //Mechanism for movement
  void bounce() 
  {
    if (x < rad || x > width-rad)  
      dx = -dx;
    if (y < rad|| y > height-rad) 
      dy = -dy;
    x += dx;
    y += dy;
  }
 
 //checks if the balls have collided
  boolean isCollision(Ball other)
  {
    if ((Math.abs(other.x-x) < rad/2) && (Math.abs(other.y-y) < rad/2))
    {
      return true;
    }
    return false;
  }
  
  void stateAnalysis(ArrayList<Ball> a, boolean globState)
  {
    if (state == 3)
    {
      return;
    }
    System.out.println("hello");
    display();
    if (state == 0)
    {
      bounce();
      for (Ball b: a)
      {
        if (this.isCollision(b) && this != b)
        {
          if (globState)
          {
            setState(1);
          }
        }
      }
    }
    else if (state == 1)
    {
      if (rad > 100)
      {
        setState(2);
      }
      rad ++;
    }
    else if (state == 2)
    {
      if (rad > 2)
      {
        setState(3);
      }
      rad --;
    }
  }
  
  void setState(int i)
  {
    state = i;
  }

  void grow()
  {
    rad ++;
  }
  
    void shrink()
  {
      rad -= 1;
  }
  
}