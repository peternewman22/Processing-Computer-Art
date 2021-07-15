PVector[] pts;

void setup() {
  size(1080, 720);
  pts = new PVector[50];
  initPoints();

  stroke(255, 20);
  strokeWeight(1);
  noFill();
  background(0);
}

void draw() {

  push();
  translate(0, height/2);
  // update the points
  for (int i = 0; i < pts.length; i++) {
    PVector perturbation = new PVector(0, random(-10, 10));
    constrain(pts[i].y, -height/2, height/2);
    pts[i].add(perturbation);
  }

  // draw the lines
  beginShape();
  for (PVector p : pts) {
    vertex(p.x, p.y);
  }
  endShape();
  pop();
}

void initPoints() {
  for (int i = 0; i < pts.length; i++) {
    pts[i] = new PVector(i*width/pts.length, 0);
  }
}

void keyPressed() {
  if (keyCode == ' ') {
    background(0);
    initPoints();
  }
}
