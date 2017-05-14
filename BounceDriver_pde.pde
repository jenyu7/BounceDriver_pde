ArrayList<Ball> balls = new ArrayList<Ball>();
boolean bigBang = false;

void setup() 
{
  size(700, 700);
  background(100);
  int size = (int)(Math.random()*100);
  for (int i=0; i < size; i++) 
  {
    balls.add(new Ball());
  }
}

void draw() 
{
  background(0);
  for (int k = 0; k < balls.size(); k ++)
  {
    balls.get(k).stateAnalysis(balls, bigBang);
  }
}

void mouseClicked()
{
  balls.add(new Ball(mouseX, mouseY));
  bigBang = true;
}