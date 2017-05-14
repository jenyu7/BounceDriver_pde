Ball[] balls = new Ball[10];
int bigBang = 0;

void setup() 
{
  size(700, 700);
  background(100);
  //fill(255,0,0);
  for (int i=0; i < balls.length; i++) 
  {
    balls[i] = new Ball();
  }
}

void draw() 
{
  background(100);
  for (Ball b : balls) 
  {
    stroke(100);
    fill(b.c);
    b.update();
    ellipse(b.x, b.y, b.rad, b.rad);
    checkBang(b);
  }
}

void checkBang(Ball b)
{
  if (bigBang == 1)
    {
      for (Ball p: balls)
      {
        if (b.checkCollision(p) && (b != p) )
        {
          b.dx = 0; 
          p.dx = 0;
          b.dy = 0;
          p.dy = 0;
          if ((b.stage == 0) && (p.stage == 0))
        {
            if (!b.checkShrink())
            {
              b.grow();
              if (b.rad == 100)
              {
                b.stage = 1;
              }
            }
            if (!p.checkShrink())
            {
              p.grow();
              if (p.rad == 100)
              {
                p.stage = 1;
              }
            }
          }
        }
        
        if (b.stage == 1 || p.stage == 1)
        {
          if (!b.checkDead())
          {
            b.shrink();
            if (b.rad == 2)
            {
              b.stage = 2;
            }
          }
          if (!p.checkDead())
          {
            p.shrink();
            if (p.rad == 2)
            {
              p.stage = 2;
            }
          }
        }
        if (b.stage == 2 || p.stage == 2)
        {
          if (b.checkDead())
          {
            b.rad = 0;
          }
          if (p.checkDead())
          {
            p.rad = 0;
          }
        }
        }  
      }
    }
void mouseClicked()
{
  bigBang = 1;
}