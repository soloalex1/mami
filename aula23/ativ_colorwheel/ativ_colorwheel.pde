float ang = 0;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  strokeWeight(3);
  if (degrees(ang) <= 360) {
    criaCirculo();
  }
}

// funções de coordenadas polares para X e Y
float coordPolarX(float raio, float angulo) {
  return raio * cos(angulo);
}

float coordPolarY(float raio, float angulo) {
  return raio * sin(angulo);
}

void criaCirculo() {
  if (ang <= TWO_PI) {
    stroke(degrees(ang), 100, 100);
  }

  if (ang > TWO_PI) {
    ang = 0;
  }

  line((width / 2), (height / 2), coordPolarX(150, ang) + (width / 2), coordPolarY(150, ang) + (height / 2));
  ang+= 0.01;
}
