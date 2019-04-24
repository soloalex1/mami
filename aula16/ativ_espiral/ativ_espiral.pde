float r = 100; 
float ang = 320;
float spin, x, y;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  norwaySpiral();
}

void norwaySpiral() {
  translate((width / 2), (height / 2));
  rotate(spin);
  
  for (int i = 0; i < 1000; i++) {
    float size = radians(i);

    x = polarX(100, 0.25, size);
    y = polarY(100, 0.25, size);
    
    noStroke();
    fill(255);
    ellipse((x * 0.7), (y * 0.7), 7, 7);
  }

  spin -= 0.05;
}

float polarX(float r, float ang, float size) {
  return ang * size * r * cos(size);
}

float polarY(float r, float ang, float size) {
  return ang * size * r * sin(size);
}
