
Circle c;

void setup() {
  size(1000, 1000);
  strokeWeight(1);
}

void draw() {
  background(243);
  translate(width / 2, height / 2);

  c = new Circle(468, 3);
  c.display();
}

void mouseDragged() {
}
