// imagens original e resultante 
PImage src;
PImage result;

// cores inicial e resultante
color startColor, resultColor;

// variáveis de apoio para armazenar os valores dos canais RGB
float r, g, b;

void setup() {
  size(550, 367);
  src = loadImage("img/mount-fuji.jpg");
  result = createImage(550, 367, RGB);

  // sobrepondo os filtros recursivamente, pra manter o aspecto visual dos pixels
  // para verificar os outros resultados, comente o código nas linhas dos outros efeitos
  result = filtroRuido(src);
  result = filtroCinza(result);
  result = filtroVermelho(result);
  result = filtroAmarelo(result);

  image(result, 0, 0);
}

// filtro de ruído
// percorre os pixels, randomiza a flag e randomiza a cor do pixel

PImage filtroRuido(PImage img) {
  for (int x = (img.width - 1); x >= 0; x--) {
    for (int y = (img.height - 1); y >= 0; y--) {
      int flag = (int)random(1, 10);
      if (flag <= 3) {
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
PImage filtroCinza(PImage img) {
  for (int x = (img.width - 1); x >= 0; x--) {
    for (int y = (img.height - 1); y >= 0; y--) {
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
PImage filtroVermelho(PImage img) {
  for (int x = (img.width - 1); x >= 0; x--) {
    for (int y = (img.height - 1); y >= 0; y--) {
      startColor = img.get(x, y);
      r = red(startColor);
      resultColor = color(r, 0, 0);
      img.set(x, y, resultColor);
    }
  }
  return img;
}

// filtro de adição de amarelos
PImage filtroAmarelo(PImage img) {
  for (int x = (img.width - 1); x >= 0; x--) {
    for (int y = (img.height - 1); y >= 0; y--) {
      startColor = img.get(x, y);
      r = red(startColor);
      resultColor = color(r, r, 0);
      img.set(x, y, resultColor);
    }
  }
  return img;
}
