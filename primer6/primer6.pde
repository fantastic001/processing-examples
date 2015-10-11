
int x; 
int y;

void setup() 
{
  size(500,500);
  x = 0;
  y = 0;
}

void draw() 
{
  background(0,0,0);
  fill(255,0,0);
  ellipse(x,y,50,50);
  x++;
  y++;
}