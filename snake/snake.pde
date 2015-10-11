int[] ax;
int[] ay;

int points;

int velicina; 
int step = 20;
int w = 25, h = 25;
int vx, vy;

int food_x, food_y;
boolean lost = false; 

void setup() 
{
  frameRate(5);
  size(500,500);
  velicina = 3;
  vx = 1; vy = 0;
  points = 0;
  ax = new int[1024];
  ax[0 ] = w/2;
  ax[1] = w/2 - 1;
  ax[2] = w/2;
  
  ay = new int[1024]; 
  ay[0] = h/2; 
  ay[1] = h/2;
  ay[2] = h/2; 
  
  food_x = (int) random(1, w-1); 
  food_y = (int) random(1, h-1);
}

void draw() 
{
  background(0,0,0);
  
  fill(255);
  textSize(20);
  text("Points " + points, 20, 20);
  
  if (ax[0] == food_x && ay[0] == food_y) 
  {
    velicina++; 
    food_x = (int) random(1, w-1);
    food_y = (int) random(1, h-1); 
    points++;
  }
  for (int i = velicina-1; i>0; i--) 
  {
    ax[i] = ax[i-1]; 
    ay[i] = ay[i-1];
  }
  ax[0] = ax[0] + vx;
  ay[0] = ay[0] + vy;
  
  // check is game lost 
  if (ax[0] == 0 || ax[0] == w || ay[0] == 0 || ay[0] == h) lost = true;
  for (int i = 1; i<velicina; i++) 
  {
    if (ax[0] == ax[i] && ay[0] == ay[i]) lost = true;
  }
  
  if (lost) 
  {
    stroke(255,255,255);
    textSize(20);
    text("LOST!", width/2, height/2);
    return;
    
  }
  
  // if not lost, draw
  fill(0,0,255);
  rect(food_x*step, food_y*step, step, step);
  
  // draw snake 
  fill(255,0,0);
  for (int i = 0; i<velicina; i++) 
  {
    rect(ax[i]*step, ay[i]*step, step, step);
  }
}

void keyPressed()
{

    if (keyCode == UP || keyCode == DOWN) 
    {
      if (vx == 0) return;
      vx = 0;
      if (keyCode == UP) 
      {
        vy = -1;
      }
      else 
      {
        vy = 1;
      }
    }
    if (keyCode == LEFT || keyCode == RIGHT) 
    {
      if (vy == 0) return;
      vy = 0; 
      if (keyCode == LEFT) vx = -1;
      else vx = 1;
    }
}