

void setup(){
  size(300,300);
  background(0);
  Ball[] balls = new Ball[3];
  for(Ball b: balls){
   ellipse(b.x,b.y,b.rad,b.rad); 
  }
}

void draw(){
  background(0);
}

//void bounce(){
//}