/*
Black Background
 Two patterns - concentric circles
 - sin wave rect pattern
 */
float gap = 2;
float diam = 20;
int cols = 5;
float res;


void setup() {
  size(750, 750);
  res = width/cols;
  stroke(255);
  noFill();
}

void draw() {
  background(0);
  for (int col = 0; col < cols + 1; col++) {
    for (int row = 0; row < cols + 1; row++) {
       drawCircles(col*res, row*res);
    }
  }
}

void drawCircles(float x, float y) {
  for (int i = 0; i < 5; i++) {
    int weight = i + 1;
    strokeWeight(weight);
    ellipse(x, y, diam + 2*i*(gap + weight), diam + 2*i*(gap + weight));
  }
}
