PImage stone, stone2;
int position, x;

void setup() {
  size(550, 413);
  stone = loadImage("img/stonehenge.jpg");
  stone2 = loadImage("img/stonehenge2.jpg");
  image(stone2, 0, 0);
}

void draw() {
  loadPixels();

  for (int i = 0; i < height; i++) {
    position = (i * 550) + x; 
    pixels[position] = stone.pixels[position];
  }

  updatePixels();

  if (x < (width - 1)) {
    x++;
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    println("left");
  } else if (keyCode == RIGHT) {
    println("right");
  }
}
