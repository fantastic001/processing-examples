
void setup() 
{
  size(500,500);
}

void draw() 
{
  background(0,0,0);
  strokeWeight(5);
  if (mouseX < width / 2) 
  {
    stroke(255,0,0);
  }
  else {
    stroke(0,0,255);
  }
  line(mouseX,mouseY,50,50);
}