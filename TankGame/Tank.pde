class Tank {
  int x, y, w, h, speed, health; 
  PImage t1;

  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 5; 
    health = 100;
    t1 = loadImage("tank1.png");
  }

  void display() {
    imageMode(CENTER);
    image(t1, x, y);
  }

  void move() {
    if (key == CODED) {
      if (keyCode == UP) {
        y -= speed;
      } else if (keyCode == DOWN) {
        y += speed;
      } else if (keyCode == LEFT) {
        x -= speed;
      } else if (keyCode == RIGHT) {
        x += speed;
      }
    }
  }
}
