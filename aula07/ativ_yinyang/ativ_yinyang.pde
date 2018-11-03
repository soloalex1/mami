float modulo = 500;

void setup() {
  size(1080, 720);
}

void draw() {
  background(200, 200, 13);
  yinYang(modulo);
}

void yinYang(float mod) {
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(width / 2, height / 2, mod, mod); // elipse principal
  fill(255);
  arc(width / 2, height / 2, mod, mod, HALF_PI, PI + HALF_PI); // arco
  fill(0);
  ellipse(width / 2, (height / 2) - (mod/4), mod / 2, mod / 2); // elipse preta de cima
  fill(255);
  ellipse(width / 2, (height / 2) + (mod/4), mod / 2, mod / 2); // elipse branca de baixo
  fill(0);
  ellipse(width / 2, (height / 2) + (mod/4), mod / 8, mod / 8); // elipse preta de dentro
  fill(255);
  ellipse(width / 2, (height / 2) - (mod/4), mod / 8, mod / 8); // elipse branca de dentro
}

void keyReleased(){
  modulo = modulo / 2;
}
