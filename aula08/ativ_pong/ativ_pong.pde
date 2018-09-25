// posições X e Y iniciais da bola
int bolaX = width / 2;
int bolaY = height / 2;

// velocidade da bola nos eixos X e Y
int velX = 5;
int velY = 5;

// posição Y das barras dos jogadores
int bar1Y = 250;
int bar2Y = 250;

int score1, score2 = 0;

void setup() {
  size(800, 600);
}

void draw() {
  background(0);
  bar1();
  collision1();
  bar2();
  collision2();
  score();

  // desenhando a bola na tela e incrementando com as velocidades
  ellipse(bolaX, bolaY, 20, 20);
  bolaX += velX;
  bolaY += velY;
  
  // mostrando as pontuações na tela
  textSize(50);
  text(score1, 200, 50);
  text(score2, 600, 50);
}

// barra do lado esquerdo da tela (Jogador 1)
void bar1() {
  if (keyPressed == true) {
    if (key == 's') {
      bar2Y += 7;
    } else if (key == 'w') {
      bar2Y -= 7;
    }
  }

  if (bar2Y >= 500) {
    bar2Y = 500;
  }
  if (bar2Y <= 0) {
    bar2Y = 0;
  }

  rect(30, bar2Y, 20, 100);
}

// barra do lado direito da tela (Jogador 2)
void bar2() {
  if (keyPressed == true) {
    if (keyCode == DOWN) {
      bar1Y += 7;
    } else if (keyCode == UP) {
      bar1Y -= 7;
    }
  }

  if (bar1Y >= 500) {
    bar1Y = 500;
  }
  if (bar1Y <= 0) {
    bar1Y = 0;
  }  

  rect(750, bar1Y, 20, 100);
}

// colisão da barra esquerda
void collision1() {
  if ((((bolaX >= 740 ) && (bolaX <= 760)) && ((bolaY >= bar1Y) && (bolaY <= bar1Y + 100)))) {
    velX = -velX;
  }
}

// colisão da barra direita
void collision2() {
  if ((((bolaX <= 60 ) && (bolaX >= 30)) && ((bolaY >= bar2Y) && (bolaY <= bar2Y + 100)))) {
    velX = -velX;
  } 
  if (bolaY >= 590 || bolaY <= 10) {
    velY = -velY;
  }
}

// controlador da pontuação
void score() {
  if (bolaX >= 790) {
    score1++;
    bolaX = width / 2;
    bolaY = height / 2;
    velX = -velX;
  }

  if (bolaX <= 10) {
    score2++;
    bolaX = width / 2;
    bolaY = height / 2;
    velX = -velX;
  }
}
