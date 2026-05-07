class PowerUp {
  float x, y, w, h, speed;
  char type;
  // PImage obst1;
  //char idir;

  //constructor
  PowerUp() {
    w = 100;
    h= 100;
    speed = 5;
    x = random(width);
    y = -100;
    if (int(random(4))==2) {
      type = 'h'; // h is for health
    } else if (int(random(3))==1) {
      type = 't'; // t is for turret
    } else {
      type = 'a'; // a is for ammo
    }
  }

  void display() {
    if (type == 'h') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Health", x, y);
    } else if (type == 't') {
      fill(0, 0, 200);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Turret", x, y);
    } else if (type == 'a') {
      fill(200, 0, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Ammo", x, y);
    }
  }

  void move() {
    y = y + speed;
  }

  boolean reachedEdge() {
    return x >= width+150 || x <= -150 || y  > height + 150 || y < -150;
  }

  boolean intersect(Tank t) {
    float distance = dist(x, y, t.x, t.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
}
