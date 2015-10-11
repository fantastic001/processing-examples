
int x;

void setup() 
{
  size(500,500);
  x = 0;
}

void draw() 
{
  background(0,0,0);
  if (x < width / 2) 
  {
    fill(255,0,0);
  }
  else {
    fill(0,0,255);
  }
  ellipse(x,height/2,50,50);
  x++;
}