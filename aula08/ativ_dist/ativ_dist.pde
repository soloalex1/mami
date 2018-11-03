// variáveis do map
float x, y;

void setup() {
  size(800, 600);
  rectMode(CENTER);
}

void draw() {

  // desenhando o retângulo central
  background(255);
  fill(123, 44, 204);
  rect((width / 2), (height / 2), 320, 180);

  // remapeando o valor de x e y
  x = 240 + map(mouseX, 0, width, 0, 320);
  y = 210 + map(mouseY, 0, height, 0, 180);

  // desenhando a elipse na posição (x, y)
  fill(255, 0, 130);
  ellipse(x, y, 20, 20);

  // mostrando a distância
  showDist();
}

void showDist() {
  fill(0);
  
  // mostrando a posição X e Y do mouse em proporção
  text("X: " + int(dist(0, 0, mouseX, 0) / 4), mouseX + 10, mouseY + 10);
  text("Y: " + int(dist(0, 0, 0, mouseY) / 3), mouseX + 10, mouseY + 20);
  
  // mostrando X e Y da elipse em proporção
  text("X: " + int(dist(240, 0, x, 0) * 5 / 8), x, y - 20);
  text("Y: " + int(dist(0, 210, 0, y) * 10 / 9), x, y - 10);
}
