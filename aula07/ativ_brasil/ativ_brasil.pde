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
  rectMode(CENTER); 
  // rectMode(CENTER) tira a necessidade de calcular a distância do ponto (0, 0) até o centro do retângulo
  // rectMode(CORNER) é o default
  // rectMode(CORNERS) implica em calcular novamente o dimensionamento e posicionamento do retângulo
  // rectMode(RADIUS) significaria colocar apenas a metade das dimensões reais como terceiro e quarto parâmetros
  
  ellipseMode(RADIUS);
  // em contraponto, ellipseMode(CORNER) cria a necessidade de efetuar o cálculo citado
  // ellipseMode(RADIUS) só altera os parâmetros de dimensionamento da elipse
  // ellipseMode(CORNERS) utiliza o terceiro e quarto parâmetros como outro canto da caixa de limite da elipse, o que implica em novos cálculos para dimensionar e posicionar a elipse apropriadamente
  noStroke();
  fill(0, 155, 58);
  rect(x, y, larg, altura);  
  fill(254, 223, 0);
  quad(x, y - (mod * 5.3), x + (mod * 8.3), y, x, y + (mod * 5.3), x - (mod * 8.3), y);
  fill(0, 39, 118);
  ellipse(x, y, (3.5 * mod), (3.5 * mod));
}
