import controlP5.*;

ControlP5 cp5;

Knob angSlider;

Button btnStart, btnClean;

float tAtual = 0.0; // tempo inicial do modelo
float velH = 70.0; // velocidade geral do projétil
float grav = -10.0; // gravidade no eixo Y
float dAtualX; // distância atual do projétil no eixo X
float dAtualY; // distância atual do projétil no eixo Y
float tempinho = 1 / 60.0;
float angulo;

void setup() {
  size(601, 601);
  background(255); 

  cp5 = new ControlP5(this);

  // controle do ângulo
  angSlider = cp5.addKnob("Angulo")
    .setRange(0, 90)
    .setValue(30)
    .setPosition(480, 400)
    .setRadius(50)
    .setDragDirection(Knob.VERTICAL);
  
  // botão de relançamento
  btnStart = cp5.addButton("Reiniciar")
    .setPosition(495, 510)
    .onPress(new CallbackListener() {
    public void controlEvent(CallbackEvent e) {
      angulo = floor(angSlider.getValue());
      reset();
    }
  });
  
  // botão que limpa os rastros da tela
  btnClean = cp5.addButton("Limpar")
    .setPosition(495, 540)
    .onPress(new CallbackListener() {
    public void controlEvent(CallbackEvent e) {
      background(255);
    }
  });
}

void draw() {

  dAtualX = MRU(velH, tAtual, angulo);
  dAtualY = MRUV(velH, grav, tAtual, angulo);
  fill(255, 195, 255);
  ellipse(dAtualX, 600 - dAtualY, 10, 10);
  mostraMundo();
  tAtual += tempinho;
}

float MRU(float v, float t, float a) {
  float vX = v * cos(radians(a));
  float d = vX * t;
  return d;
}

float MRUV(float v, float a, float t, float ang) {
  float vY = v * sin(radians(ang));
  float d = vY * t + a * t * t / 2.0;
  return d;
}

void mostraMundo() { //mostra a grade
  for (int i = 0; i < 12; i++) {
    line(i * 50, 0, i * 50, 600);
    line(0, i * 50, 600, i * 50);
  }
}

void reset() { // reseta todos os valores das variáveis
  tAtual = 0.0; 
  velH = 70.0;
  grav = -10.0; 
  dAtualX = 0; 
  dAtualY = 0; 
  tempinho = 1 / 60.0;
}
