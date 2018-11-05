PImage stone, stone2;
int position;
int x = 0; // define a coluna de pixels atual
int col1, col2, col3, col4;

void setup() {
  size(550, 413);
  stone = loadImage("img/stonehenge.jpg");
  stone2 = loadImage("img/stonehenge2.jpg");
  col1 = (width / 5);
  col2 = 2 * col1;
  col3 = 3 * col1;
  col4 = 4 * col1;
  image(stone, 0, 0);
}

void draw() {
  toRight();
}

// procedimento de transição esquerda-direita
void toRight() {

  loadPixels();

  // laços da coluna 0
  for (int i = 0; i < height; i++) {
    position = (i * width) + x; 
    pixels[position] = stone2.pixels[position];
  }

  if (x < col1) {
    x++;
  }

  // laços da coluna 1
  for (int i = 0; i < height; i++) {
    position = (i * width) + col1; 
    pixels[position] = stone2.pixels[position];
  }

  if (col1 < col2) {
    col1++;
  }

  // laços da coluna 2
  for (int i = 0; i < height; i++) {
    position = (i * width) + col2; 
    pixels[position] = stone2.pixels[position];
  }

  if (col2 < col3) {
    col2++;
  }

  // laços da coluna 3
  for (int i = 0; i < height; i++) {
    position = (i * width) + col3; 
    pixels[position] = stone2.pixels[position];
  }

  if (col3 < col4) {
    col3++;
  }

  // laços da coluna 4
  for (int i = 0; i < height; i++) {
    position = (i * width) + col4; 
    pixels[position] = stone2.pixels[position];
  }

  if (col4 < (width - 1)) {
    col4++;
  }

  updatePixels();
}

boolean isShown(PImage img) {
}
