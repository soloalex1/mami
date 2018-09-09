int altura = 300;

float mod = altura / 14.0;
float dist = mod * 1.7;

void setup() {
  size(800, 600);
  println(mod, dist);
}

void draw() {
  background(0);
  mostraBandeira(mouseX, mouseY, int(20 * mod));
}

void mostraBandeira(int x, int y, int larg) {
  noStroke();
  fill(0, 155, 58);
  rect(x - (mod * 10), y - (mod * 7), larg, altura);  
  fill(254, 223, 0);
  quad(x, y - (mod * 5.3), x + (mod * 8.3), y, x, y + (mod * 5.3), x - (mod * 8.3), y);
  fill(0, 39, 118);
  ellipse(x, y, (7 * mod), (7 * mod));
}
