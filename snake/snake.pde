
int step = 20;
int w = 25, h = 25;
int vx, vy;

int food_x, food_y;

class Snake 
{
  int size; 
  int[] ax; 
  int[] ay;
  int points;
  boolean lost;
  int vx;
  int vy;
  
  Snake() 
  {
    size = 3; 
    points = 0;
    vx = 1;
    vy = 0;
    
    ax = new int[1024];
    ax[0 ] = w/2;
    ax[1] = w/2 - 1;
    ax[2] = w/2;
    
    ay = new int[1024]; 
    ay[0] = h/2; 
    ay[1] = h/2;
    ay[2] = h/2; 
    
    lost = false; 
  }
  
  void move() 
  {
      if (ax[0] == food_x && ay[0] == food_y) 
      {
        size++; 
        food_x = (int) random(1, w-1);
        food_y = (int) random(1, h-1); 
        points++;
      }
      for (int i = size-1; i>0; i--) 
      {
        ax[i] = ax[i-1]; 
        ay[i] = ay[i-1];
      }
      ax[0] = ax[0] + vx;
      ay[0] = ay[0] + vy;
  }
  
  void check_collision_wall()
  {
    if (ax[0] == 0 || ax[0] == w || ay[0] == 0 || ay[0] == h) lost = true;
  }
  
  void check_collision_snake(Snake s)
  {
      for (int i = 1; i<s.size; i++) 
      {
        if (ax[0] == s.ax[i] && ay[0] == s.ay[i]) lost = true;
      }
  }
  
  void draw(int r, int g, int b)
  {
      // draw snake 
      fill(r,g,b);
      for (int i = 0; i<size; i++) 
      {
        rect(ax[i]*step, ay[i]*step, step, step);
      }
  }
  
};

Snake s;

void setup() 
{
  frameRate(5);
  size(500,500);
  
  s = new Snake();
  
  food_x = (int) random(1, w-1); 
  food_y = (int) random(1, h-1);
}

void draw() 
{
  background(0,0,0);
  
  fill(255);
  textSize(20);
  text("Points " + s.points, 20, 20);
  s.move();
  
  // check is game lost 
  s.check_collision_wall();
  s.check_collision_snake(s);
  
  if (s.lost) 
  {
    stroke(255,255,255);
    textSize(20);
    text("LOST!", width/2, height/2);
    return;
    
  }
  
  // if not lost, draw
  fill(0,0,255);
  rect(food_x*step, food_y*step, step, step);
  s.draw(255,0,0);

}

void keyPressed()
{

    if (keyCode == UP || keyCode == DOWN) 
    {
      if (s.vx == 0) return;
      s.vx = 0;
      if (keyCode == UP) 
      {
        s.vy = -1;
      }
      else 
      {
        s.vy = 1;
      }
    }
    if (keyCode == LEFT || keyCode == RIGHT) 
    {
      if (s.vy == 0) return;
      s.vy = 0; 
      if (keyCode == LEFT) s.vx = -1;
      else s.vx = 1;
    }
}