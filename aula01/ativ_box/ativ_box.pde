/*
 discutir e justificar o uso de funções num modelo computacional que, empregando
 a instrução box() do Processing, demonstra graficamente que o cubo é
 o paralelepípedo que apresenta o melhor aproveitamento do volume
 */

// importando uma biblioteca de interface. optei pela ControlP5 por parecer mais simples
import controlP5.*;

ControlP5 cp5;
Slider sliderAlt, sliderLarg, sliderZ;
Button btnVol;

// função para calcular o volume do paralelepípedo
int calcVol(int b, int h, int d) {
  int aux = b * h * d;
  return aux;
}

void setup() {

  // para utilizar os reposicionamentos em formas 3D, preciso passar o argumento P3D na função size()
  size(800, 400, P3D);

  // criando uma instância de ControlP5
  cp5 = new ControlP5(this);

  // criando e configurando os sliders de altura, largura e profundidade
  sliderAlt = cp5.addSlider("X");
  sliderAlt.setPosition(40, 350)
    .setSize(150, 20)
    .setRange(50, 200)
    .setValue(100)
    .setColorCaptionLabel(color(20, 20, 20));

  sliderLarg = cp5.addSlider("Y");
  sliderLarg.setPosition(240, 350)
    .setSize(150, 20)
    .setRange(50, 200)
    .setValue(100)
    .setColorCaptionLabel(color(20, 20, 20));

  sliderZ = cp5.addSlider("Z");
  sliderZ.setPosition(440, 350)
    .setSize(150, 20)
    .setRange(50, 200)
    .setValue(100)
    .setColorCaptionLabel(color(20, 20, 20));

  // criando um botão para chamar a função do cálculo da área
  btnVol = cp5.addButton("Calcular area");
  btnVol.setPosition(640, 350)
    .onPress(calcVol(floor(sliderAlt.getValue()), floor(sliderLarg.getValue()), floor(sliderZ.getValue())));


  //cp5.addButton("calcular area")
  //   .setPosition(300, 300);
  //cp5.addSlider("V1")
  //  .setPosition(50, 300)
  //  .setSize(200, 20)
  //  .setRange(100, 300)
  //  .setValue(250)
  //  .setColorCaptionLabel(color(20, 20, 20));
}

void draw() {
  background(145);
  pushMatrix();
  translate(130, height/2, 0);
  rotateY(1.25);
  rotateX(-0.4);
  stroke(223);
  box(100);
  popMatrix();
}
/*

 Assim como na atividade anterior, para representar graficamente de uma maneira mais
 compreensível, espera-se que haja algum tipo de interação. Contudo, cabe uma
 explicação sobre formas 3D no Processing para fins de registro.
 
 Ao contrário das formas 2D convencionais (como rect() e ellipse()), o Processing não permite posicionar via
 argumentos (uma vez que box() e sphere() recebem apenas argumentos de dimensionamento). Entretanto, é possível
 utilizar os métodos rotate() e translate(), descritos com mais detalhes na documentação do Processing.
 
 
 
 
 
 
 
 */
