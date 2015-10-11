
int x,y;

void setup() 
{
  frameRate(20);
  size(500,500);
}

void draw() 
{
  x = (int) random(width);
  y = (int) random(height);
  background(0,0,0);
  strokeWeight(5);
  if (x < width / 2) 
  {
    stroke(255,0,0);
  }
  else {
    stroke(0,0,255);
  }
  line(x,y,50,50);
}