Ball[] balls = new Ball[50];
boolean bigBang = true;

void setup() {
  size(700, 700);
  background(100);
  //fill(255,0,0);
  for (int i=0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(100);
  for (Ball b : balls) {
    stroke(100);
    fill(b.c);
    //b.bounce();
    b.update();
    ellipse(b.x, b.y, b.rad, b.rad);
    if (bigBang){
      for (Ball p: balls){
        if (b.checkCollision(p)){
          b.expand();
          p.expand();
          if (b.checkShrink() && p.checkShrink()){
            b.shrink();
            p.shrink();
        }
      }
    }
  }
}