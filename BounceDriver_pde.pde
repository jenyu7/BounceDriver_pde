Ball[] balls = new Ball[20];
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
        if (b.checkCollision(p) && (b != p))
        {
          System.out.println("collision");
          if (!b.checkShrink())
          {
            b.grow();
            p.grow();
          }
          break;
        }
      }
    }
}
void mouseClicked()
{
  bigBang = 1;
}