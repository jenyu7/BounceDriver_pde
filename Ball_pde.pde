//Ball Class
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
    fill(c, 200);
    ellipse(x, y, rad, rad);
  }

  //Mutates the state of the ball 
  void setState(int i)
  {
    state = i;
  }

  //Mechanism for movement
  void bounce() 
  {
    x += dx;
    y += dy;
    if (x < rad || x > width-rad)  
      dx = -dx;
    if (y < rad|| y > height-rad) 
      dy = -dy;
  }

  //checks if the balls have collided
  boolean isCollision(Ball other)
  {
    return dist(x, y, other.x, other.y) < (rad/2 + other.rad / 2);
  }

  /****
   * Analyzes the current state of the ball
   * 0: bouncing around, mouse has not yet been clicked. 
   * 1: Collision after mouse click~ begins to expand until rad = 100
   * 2: Radius is 100, begins to shrink by decrementing rad
   * 3: Radius is less than 2, set radius to 0, rendering the circle into a "point"
   * Note: display() is utilized here for a smooth showing of the growth/shrinkage of the circle
   ****/
  void stateAnalysis(ArrayList<Ball> a, boolean globState)
  {
    if (state == 3)
    {
      a.remove(a.indexOf(this));
      return;
    }
    display();
    if (state == 0)
    {
      bounce();
      for (Ball b : a)
      {
        //if there is a collision, and not with itself
        if (this.isCollision(b) && this != b && (b.state == 2 || b.state == 1))
        {
          // if mouse has already been clicked
          if (globState)
          {
            setState(1);
          }
        }
      }
    }
    //if mouse clicked and collision occurred
    else if (state == 1)
    {
      //if radius surpassed 100
      if (rad > 100)
      {
        setState(2);
      }
      //otherwise, increment the radius
      rad ++;
    }
    //if the radius has hit 100
    else if (state == 2)
    {
      //if radius is less than 2
      if (rad < 2)
      {
        //die
        setState(3);
      }
      //otherwise, decrement the radius
      rad --;
    }
  }
}