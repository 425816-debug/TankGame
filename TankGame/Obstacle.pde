class Obstacle {
  int x, y, w, h, speed, health;
  PImage obst1;

  //constructor
  Obstacle(int x, int y) {
    this.x = x;
    this.y = y;
    w = 100;
    h = 100;
    speed = 2;
    health = 100;
    obst1 = loadImage("obstacle.png");
  }

  void display() {
    imageMode(CENTER);
    image(obst1, x, y);
  }

  void move() {
    x = x + speed;
    if (x > width) {
      x = 0;
    }
  }
  Boolean reachedEdge() {
    return x >= width+150 || x <= -150 || y  > height + 150 || y < -150;
  }
}
