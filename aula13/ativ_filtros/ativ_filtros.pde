PImage src;
PImage result;
color startColor, resultColor;
float r, g, b;


// tentando fazer uma sobreposição de filtros

void setup() {
  size(550, 367);
  src = loadImage("img/mount-fuji.jpg");
  result = createImage(550, 367, RGB);

//  result = filtroRuido(src);
//  //result = filtroCinza(result);
//  //result = filtroVermelho(result);
//  //result = filtroAmarelo(result);

//  image(result, 0, 0);
}

void draw() { 
  
  //filtroCinza();
  //filtroVermelho();
  //filtroAmarelo();
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


// filtro de ruído
PImage filtroRuido(PImage img) {
  for (int x = (width - 1); x >= 0; x--) {
    for (int y = (height - 1); y >= 0; y--) {
      int flag = (int)random(10);
      if (flag <= 3) {
        println("Flag:", flag);
        startColor = img.get(x, y);
        resultColor = color(random(255), random(255), random(255));
        img.set(x, y, resultColor);
      } else {
        startColor = img.get(x, y);
        r = red(startColor);
        g = green(startColor);
        b = blue(startColor);
        resultColor = color(r, g, b);
        img.set(x, y, resultColor);
      }
    }
  }
  return img;
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

// filtro em tons de cinza
PImage filtroCinza(PImage img) {
  for (int x = (width - 1); x >= 0; x--) {
    for (int y = (height - 1); y >= 0; y--) {
      startColor = img.get(x, y);
      r = 0.3 * red(startColor);
      g = 0.59 * green(startColor);
      b = 0.11 * blue(startColor);
      resultColor = color(r + g + b);
      img.set(x, y, resultColor);
    }
  }
  return img;
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

// filtro de adição de vermelhos
PImage filtroVermelho(PImage img) {
  for (int x = (width - 1); x >= 0; x--) {
    for (int y = (height - 1); y >= 0; y--) {
      startColor = img.get(x, y);
      r = red(startColor);
      resultColor = color(r, 0, 0);
      img.set(x, y, resultColor);
    }
  }
  return img;
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


// filtro de adição de amarelos
PImage filtroAmarelo(PImage img) {
  for (int x = (width - 1); x >= 0; x--) {
    for (int y = (height - 1); y >= 0; y--) {
      startColor = img.get(x, y);
      r = red(startColor);
      g = green(startColor);
      resultColor = color(r, g, 0);
      img.set(x, y, resultColor);
    }
  }
  return img;
}
