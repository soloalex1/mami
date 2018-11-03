// importando uma biblioteca de interface. optei pela ControlP5 por parecer mais simples.
import controlP5.*;

ControlP5 cp5;

// sliders
Slider sliderAlt, sliderLarg, sliderZ;

// variáveis globais das dimensões da forma
int valX, valY, valZ;

// instanciando o botão
Button btnVol;

// instanciando a área de texto
Textarea text;

// função para calcular o volume do paralelepípedo
int calcVol(int b, int h, int d) {
  int aux = b * h * d;
  return aux/100;
}

// função padrão de comparação das dimensões
boolean maxVol(int x, int y, int z) {
  boolean aux = x == y && y == z;
  return aux;
}

// checando o valor das dimensões e exibindo no console quando forem iguais
String checkVal() {
  String aux = "";
  if (maxVol(valX, valY, valZ)) {
    print("Volume máximo!" + "\t");
    println("X: " + valX + " | Y: " + valY + " | Z: " + valZ);
    println();
  }
  return aux;
}

void setup() {

  // para utilizar os reposicionamentos em formas 3D, preciso passar o argumento P3D na função size()
  size(800, 400, P3D);

  // criando uma instância de ControlP5
  cp5 = new ControlP5(this);

  // criando e configurando a caixa de texto na qual será exibida a área calculada a partir das dimensões definidas pelo usuário
  text = cp5.addTextarea("text")
    .setPosition(0, height - 100)
    .setSize(width, 100)
    .setFont(createFont("arial", 12))
    .setLineHeight(20)
    .setColor(color(0))
    .setColorBackground(color(255));

  // criando e configurando os sliders de altura, largura e profundidade
  sliderAlt = cp5.addSlider("X");
  sliderAlt.setPosition(40, 40)
    .setSize(150, 20)
    .setRange(50, 200)
    .setValue(100)
    .setColorCaptionLabel(color(20, 20, 20));

  sliderLarg = cp5.addSlider("Y");
  sliderLarg.setPosition(40, 100)
    .setSize(150, 20)
    .setRange(50, 200)
    .setValue(100)
    .setColorCaptionLabel(color(20, 20, 20));

  sliderZ = cp5.addSlider("Z");
  sliderZ.setPosition(40, 160)
    .setSize(150, 20)
    .setRange(50, 200)
    .setValue(100)
    .setColorCaptionLabel(color(20, 20, 20));

  // criando um botão para chamar a função do cálculo da área
  btnVol = cp5.addButton("Calcular area");
  btnVol.setPosition(85, 200)

    // o método onPress() requer um objeto CallbackListener como parâmetro
    .onPress(new CallbackListener() {
    public void controlEvent(CallbackEvent e) {
      if (maxVol(valX, valY, valZ)) {
        text.setText("Área do cubo: " + "\n" + calcVol(floor(sliderAlt.getValue()), floor(sliderLarg.getValue()), floor(sliderZ.getValue())) + "cm³" + "\n" + "Cubo perfeito!" + "\n" + "Volume máximo!");
      } else {
        text.setText("Área do cubo: " + "\n" + calcVol(floor(sliderAlt.getValue()), floor(sliderLarg.getValue()), floor(sliderZ.getValue())) + "cm³");
      }
    }
  }
  );
}

void draw() {

  // recuperando os valores dos sliders pelas variáveis globais
  valX = floor(sliderAlt.getValue());
  valY = floor(sliderLarg.getValue());
  valZ = floor(sliderZ.getValue());
  
  // checando os valores a cada frame
  checkVal();
  
  // posicionando e desenhando o paralelepípedo na tela
  background(145);
  
  // distorcendo o plano de fundo para reposicionar o cubo
  pushMatrix();
  translate(width/2 + 20, height/2 - 20, 0);
  rotateY(1.25);
  rotateX(-0.4);
  stroke(223);
  
  // caso as dimensões sejam iguais, o paralelepípedo é preenchido de verde
  if (maxVol(valX, valY, valZ)) {
    fill(13, 225, 78);
  } else {
    fill(223, 147, 84);
  }
  
  // desenhando a forma com os valores recuperados dos sliders em tempo real
  box(valY, valZ, valX);
  popMatrix();
}