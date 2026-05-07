// Elie Cooper | Apr 14 2026 | TankGame
Tank t1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
PImage bg;
int score;
Timer objTimer, puTimer;


void setup() {
  size(500, 500);
  score = 0;
  bg = loadImage("bg1.png");
  t1 = new Tank();
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);

  //distribute object on timer
  if (objTimer.isFinished()) {
    //add object
    obstacles.add(new Obstacle(0, 250));
    //restart timer
    objTimer.start();
  }
  if (puTimer.isFinished()) {
    //add power up
    powerups.add(new PowerUp());
    //restart timer
    puTimer.start();
  }

  //DISPLAY AND REMOVE POWER UPS
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu  = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      powerups.remove(pu);
    }
    if (pu.intersect(t1)) {
      if (pu.type == 'h') {
        t1.health = t1.health + 100;
        powerups.remove(pu);
      } else if (pu.type == 'a') {
        t1.laserCount = t1.laserCount + 100;
        powerups.remove(pu);
      } else if (pu.type == 'a') {
        t1.turretCount = t1.turretCount + 1;
        powerups.remove(pu);
      }
    }
  }


  // displays and removes obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedEdge()) {
      obstacles.remove(i);
    }
    if (t1.intersect(o)) {
    }
  }

  //detect collision to tank
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score + 100;
        projectiles.remove(i);
        obstacles.remove(j);
        continue;
      }
    }

    // displaying projectiles
    //for (int i = 0; i < projectiles.size(); i++) {
    //  Projectile p = projectiles.get(i);
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
  }

  t1.display();
  scorePanel();
  println("Objects in Memory:"+obstacles.size());
  println("Objects in Memory:"+projectiles.size());
}


void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, 250, 25);
  text("Health:" + t1.health, 400, 25);
  text("Ammo:" + t1.laserCount, width/2-150, 25);
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'd') {
    t1.move('d');
  } else if (key == 'a') {
    t1.move('a');
  }
}
void mousePressed() {
  if (t1.turretCount == 1) {
    projectiles.add(new Projectile(t1.x, t1.y));
  } else if (t1.turretCount == 2) {
    projectiles.add(new Projectile(t1.x, t1.y+10));
  }
}
