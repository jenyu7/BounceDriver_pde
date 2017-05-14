//Driver 

//ArrayList of all the balls
ArrayList<Ball> balls = new ArrayList<Ball>();
//global state variable that shows if the mouse has been clicked
boolean bigBang = false;

void setup() 
{
  size(700, 700);
  background(100);
  //random # of balls
  int size = (int)(Math.random()*100);
  for (int i=0; i < size; i++) 
  {
    balls.add(new Ball());
  }
}

void draw() 
{
  //reset background. Black color to disguise ball outline.
  background(0);
  //analyze each ball in relation with the other balls
  for (int k = 0; k < balls.size(); k ++)
  {
    balls.get(k).stateAnalysis(balls, bigBang);
  }
}

//Spawns a ball at location of mouse-click and sets global state var to true
void mouseClicked()
{
  balls.add(new Ball(mouseX, mouseY));
  bigBang = true;
}