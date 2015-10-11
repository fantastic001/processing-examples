
void setup() 
{
  frameRate(20);
  size(500,500);
  textSize(60);
}

void draw() 
{
  background(0,0,0);
  if (keyPressed) 
  {
    text(key, width/2, height/2);
  }
}