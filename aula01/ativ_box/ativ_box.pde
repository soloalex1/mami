/*

 discutir e justificar o uso de funções num modelo computacional que, empregando
 a instrução box() do Processing, demonstra graficamente que o cubo é
 o paralelepípedo que apresenta o melhor aproveitamento do volume
 
*/

// importando uma biblioteca de interface. optei pela ControlP5 por parecer mais simples.
import controlP5.*;

ControlP5 cp5;

// sliders
Slider sliderAlt, sliderLarg, sliderZ;

// variáveis globais das dimensões da box
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

void setup() {

  // para utilizar os reposicionamentos em formas 3D, preciso passar o argumento P3D na função size()
  size(800, 400, P3D);

  // criando uma instância de ControlP5
  cp5 = new ControlP5(this);

  // criando e configurando a caixa de texto na qual será exibida a área calculada a partir das dimensões definidas pelo usuário
  text = cp5.addTextarea("text")
    .setPosition(width - 120, 100)
    .setSize(120, 100)
    .setFont(createFont("arial", 14))
    .setLineHeight(20)
    .setColor(color(0))
    .setColorBackground(color(255));

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
  
    // o método onPress() requer um CallbackListener como parâmetro
    .onPress(new CallbackListener() {
    public void controlEvent(CallbackEvent e) {
      text.setText(calcVol(floor(sliderAlt.getValue()), floor(sliderLarg.getValue()), floor(sliderZ.getValue())) + "cm³");
    }
  });
}

void draw() {

  // recuperando os valores dos sliders pelas variáveis globais
  valX = floor(sliderAlt.getValue());
  valY = floor(sliderLarg.getValue());
  valZ = floor(sliderZ.getValue());

  // posicionando e desenhando o paralelepípedo na tela
  background(145);
  pushMatrix();
  translate(width/2 + 20, height/2, 0);
  rotateY(1.25);
  rotateX(-0.4);
  stroke(223);
  fill(223, 147, 84);
  box(valY, valZ, valX);
  popMatrix();
}

/*

 Assim como na atividade anterior, para representar graficamente de uma maneira mais
 compreensível, espera-se que haja algum tipo de interação. Contudo, cabe uma
 explicação sobre formas 3D no Processing para fins de registro.
 
 Ao contrário das formas 2D convencionais (como rect() e ellipse()), o Processing não permite posicionar via
 argumentos (uma vez que box() e sphere() recebem apenas argumentos de dimensionamento). Entretanto, é possível
 utilizar os métodos rotate() e translate(), descritos com mais detalhes na documentação do Processing. 
 
 Com isso em mente, sabe-se que é possível redimensionar as formas 3D em tempo de execução, dado algum input do 
 usuário. Para tal, fiz uso da biblioteca ControlP5 para criar uma GUI simples para o usuário.
 
 Para calcular a área, é empregada a função calcVol(), que retorna o valor do produto entre as dimensões. Essa função
 é chamada a cada clique no botão "Área", e o resultado é exibido na caixa de texto do lado direito da tela.
 
 Contudo, acredito que o fato mais importante dessa abordagem é o redimensionamento da forma em tempo de execução, que dá
 um retorno visual imediato para o usuário. Os valores dos sliders são configurados em setup(), recuperados pelas variáveis globais (valX, valY e valZ)
 e aplicados na forma em draw(), sendo utilizados como parâmetros da própria função box(). A natureza do método draw(), por sua vez, garante o redimensionamento 
 da figura de acordo com as interações dos usuários com os sliders.
 
 
 */
