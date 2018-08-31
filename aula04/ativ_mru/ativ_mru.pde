int tAtual = 0;
int vel = 10;
float tNew = 1.0 / 60.0;

void setup() {
  size(600, 600);
  //frameRate(1);
  
}

void draw() {
  background(255);
  int dist = MRU(vel, tAtual);
  fill(255, 195, 255);
  //ellipse(dist + 10, 10, 10, 10);
  mostraCarro(dist + 20, 30);
  mostraMundo();
  println("Distância Percorrida: ", dist);
  println("Velocidade: ", vel);
  println("Tempo Atual: ", tAtual);
  println();
  tAtual += tNew;
}

int MRU(int v, int t) {
  int d = v * t;
  return d;
}

void mostraMundo() {
  for (int i = 0; i < 12; i++) {
    line(i * 50, 0, i * 50, 600);
    line(0, i * 50, 600, i * 50);
  }
}

void mostraCarro(int x, int y){
  rectMode(CENTER);
  fill(255, 120, 45);
  rect(x, y, 40, 20);
  ellipseMode(CENTER);
  fill(120, 255, 45);
  ellipse(x + 10, y + 10, 10, 10);
  ellipse(x - 10, y + 10, 10, 10);
}
