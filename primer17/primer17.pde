
void setup() 
{
  frameRate(60);
  size(500,500);
}

void draw() 
{
  background(0,0,0);
  for (int i = 0; i<width; i++) 
  {
    stroke(i,i/2,i/10);
    line(i, 0, i, height);
  }
}