PImage src;
PImage result;
color startColor, resultColor;
float r, g, b;


void setup() {
  size(550, 367);
  src = loadImage("img/mount-fuji.jpg");
  result = createImage(550, 367, RGB);
}

void draw() {
  image(result, 0, 0);
  //filtroRuido();
  //filtroCinza();
  //filtroVermelho();
  filtroAmarelo();
}

// filtros

// filtro de ruído
void filtroRuido() {
  for (int x = (width - 1); x >= 0; x--) {
    for (int y = (height - 1); y >= 0; y--) {
      int flag = (int)random(10);
      if (flag <= 3) {
        startColor = src.get(x, y);
        resultColor = color(random(255), random(255), random(255));
        result.set(x, y, resultColor);
      } else {
        startColor = src.get(x, y);
        r = red(startColor);
        g = green(startColor);
        b = blue(startColor);
        resultColor = color(r, g, b);
        result.set(x, y, resultColor);
      }
    }
  }
}

// filtro em tons de cinza
void filtroCinza() {
  for (int x = (width - 1); x >= 0; x--) {
    for (int y = (height - 1); y >= 0; y--) {
      startColor = src.get(x, y);
      r = 0.3 * red(startColor);
      g = 0.59 * green(startColor);
      b = 0.11 * blue(startColor);
      resultColor = color(r + g + b);
      result.set(x, y, resultColor);
    }
  }
}

// filtro de adição de vermelhos
void filtroVermelho() {
  for (int x = (width - 1); x >= 0; x--) {
    for (int y = (height - 1); y >= 0; y--) {
      startColor = src.get(x, y);
      r = red(startColor);
      resultColor = color(r, 0, 0);
      result.set(x, y, resultColor);
    }
  }
}

// filtro de adição de amarelos
void filtroAmarelo() {
  for (int x = (width - 1); x >= 0; x--) {
    for (int y = (height - 1); y >= 0; y--) {
      startColor = src.get(x, y);
      r = red(startColor);
      g = green(startColor);
      resultColor = color(r, g, 0);
      result.set(x, y, resultColor);
    }
  }
}
