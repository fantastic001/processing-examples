
int i; 

void setup() 
{
  size(500,500);
  i = 0;
}

void draw() 
{
  background(0,0,0);
  fill(255,0,0);
  ellipse(i,height/2,50,50);
  i++;
}