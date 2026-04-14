// Elie Cooper | Apr 14 2026 | TankGame
PImage bg;
Tank tank1;

  void setup() {
  size(600, 600);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  tank1.display();
}
void keyPressed() {
  if(keyCode== RIGHT) {
  tank1.move();
  }
  if(keyCode==LEFT) {
  tank1.move();
  }
  if(keyCode==UP) {
  tank1.move();
  }
  if(keyCode==DOWN) {
  tank1.move();
  }
}
