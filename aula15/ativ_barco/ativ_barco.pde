PImage ondas;

void setup() {
  size(600, 600);
  background(0);
  desenhaBarquinho(width / 2, height / 2);
}

void draw() {
  // ??
}

void desenhaBarquinho(float x, float y) {
  noStroke();
  fill(230);
  triangle((x - 25), (y - 10), (x + 25), (y - 10), x, (y - 40));

  fill(110, 38, 17);
  quad(x-40, y-20, x+40, y-20, x+15, y, x-15, y);
}
