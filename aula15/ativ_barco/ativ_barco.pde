PImage ondas;
float ang = 0;

void setup() {
  size(550, 381);
  background(0);
  frameRate(30);
  ondas = loadImage("wave.jpg");
}

void draw() {
  image(ondas, 0, 0);
  
  // preciso do seno pra oscilação vertical
  float y = sin(ang);
  ang += 0.1;
  
  // realoca a posição da origem
  translate((ang * 20), (y * 20) + (height / 2) + 150);
  
  // dividindo por 4 pra suavizar a rotação - divisão opcional, mas recomendo dividir pelo menos por 2
  rotate(cos(ang) / 4);
  desenhaBarquinho(0, 0);

  // reinicia a movimentação
  if ((ang * 20) >= width) {
    ang = 0;
  }
}

void desenhaBarquinho(float x, float y) {
  noStroke();
  fill(170, 3, 0);
  triangle((x - 35), (y - 20), (x + 35), (y - 20), x, (y - 50));

  fill(197, 149, 68);
  quad(x-50, y-30, x+50, y-30, x+25, y, x-25, y);
}
