
void setup() 
{
  size(500,500);
}

void draw() 
{
  background(0,0,0);
  if (mouseX < width / 2) 
  {
    fill(255,0,0);
  }
  else {
    fill(0,0,255);
  }
  ellipse(mouseX,mouseY,50,50);
}