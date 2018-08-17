void setup() {
  // set the canvas size to 256 instead of 255 for counting reasons
  // definindo o tamanho do canvas em 256 ao invés de 255 por motivos de contagem

  size(256, 256);
}

void draw() {
  // canvas and shape config
  // configuração do canvas e da forma

  background(mouseX, mouseY);
  fill(mouseY, mouseX);
  rect(0, 0, mouseX, mouseY);
  noStroke();
}

void mousePressed() {
  // prints the coordinates of the mouse when clicked
  // imprime as coordenadas do mouse quando clicado

  println("X: ", mouseX);
  println("Y: ", mouseY);
  println();
}

int calculaArea(int b, int h) {
  // simple area calculation function
  // função simples de cálculo da área
  
  int aux = b * h;
  return aux;
}

int calculaPerimetro(int b, int h) {
  // simple perimeter calculation function
  // função simples de cálculo do perímetro

  int aux = 2 * b + 2 * h;
  return aux;
}
