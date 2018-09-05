float tAtual = 0.0;
float vel = 10.0;
float tInc = 1 / 60.0;


void setup() {
  size(600, 600);
  //frameRate(1); // sem a alteração na taxa de quadros, conseguimos mudar a posição em tempo real
  
}

void draw() {
  background(255);
  float dist = MRU(vel, tAtual);
  fill(255, 195, 255);
  ellipse(dist + 10, 10, 10, 10); // desenha a elipse com a chamada de MRU()
  mostraMundo();
  println("Distância Percorrida: ", dist);
  println("Velocidade: ", vel);
  println("Tempo Atual: ", tAtual);
  println();
  tAtual += tInc;
}

// função de movimentação do corpo
float MRU(float v, float t) {
  float d = v * t;
  return d;
}

// exibe a grade do plano de fundo
void mostraMundo() {
  for (int i = 0; i < 12; i++) {
    line(i * 50, 0, i * 50, 600);
    line(0, i * 50, 600, i * 50);
  }
}
