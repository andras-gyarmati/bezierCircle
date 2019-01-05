PVector p, p1, p2, p3;
int size;

void setup() {
  size(1000, 1000);
  strokeWeight(1);
}

void draw() {
  background(243);
  translate(width / 2, height / 2);
  size = 500;
  p = new PVector(0, -size);
  p1 = p.copy();
  p2 = p.copy().rotate(PI/3*2);
  p3 = p.copy().rotate(PI/3*2*2);
  
  ellipse(0, 0, 2, 2);
  stroke(255, 0, 0);
  ellipse(0, 0, size * 2, size * 2);
  stroke(0);
  noFill();
  beginShape();
  vertex(p1.x, p1.y);
  bezierVertex(b(75), b(-100), b(125), b(-20), p2.x, p2.y);
  bezierVertex(b(58), b(107), b(-37), b(125), p3.x, p3.y);
  bezierVertex(b(-121), b(-8), b(-86), b(-98), p1.x, p1.y);
  endShape();
}

float b(float scale) {
  return size * scale / 100;
}
