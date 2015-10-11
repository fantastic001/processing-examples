int x,y;
void setup() 
{
  frameRate(60);
  size(500,500);
  x = y = 0;
}

void draw() 
{
  background(0,0,0);
  if (keyPressed) {
    if (keyCode == UP) y--;
    else if (keyCode == DOWN) y++;
    else if (keyCode == LEFT) x--;
    else if (keyCode == RIGHT) x++;
  }
  fill(255,255,255);
  ellipse(x,y,50,50);
}