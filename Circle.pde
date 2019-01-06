class Circle {
  ArrayList<ArrayList<PVector>> circleSegments = new ArrayList<ArrayList<PVector>>();
  float size;
  int handleSize;

  Circle(float size, int segments) {
    this.size = size;
    this.handleSize = 10;
    PVector initialPoint = new PVector(0, -size);
    for (int segmentNo = 0; segmentNo < max(min(segments, 360), 1); segmentNo++) {
      ArrayList<PVector> segment = new ArrayList<PVector>();
      PVector cp1 = new PVector(0, 0);
      PVector cp2 = new PVector(0, 0);
      PVector p = initialPoint.copy().rotate(TWO_PI / segments * segmentNo);
      segment.add(cp1);
      segment.add(cp2);
      segment.add(p);
      circleSegments.add(segment);
    }
  }

  void display() {
    stroke(255, 0, 0, 144);
    for (ArrayList<PVector> segment : circleSegments) {
      ellipse(segment.get(0).x, segment.get(0).y, handleSize, handleSize);
      ellipse(segment.get(1).x, segment.get(1).y, handleSize, handleSize);
      line(segment.get(2).x, segment.get(2).y, segment.get(0).x, segment.get(0).y);
      line(segment.get(2).x, segment.get(2).y, segment.get(1).x, segment.get(1).y);
    }    

    ellipse(0, 0, 2, 2); //debug
    stroke(255, 0, 0, 144); //debug
    ellipse(0, 0, size * 2, size * 2); //debug
    stroke(0);
    noFill();
    beginShape();
    vertex(circleSegments.get(circleSegments.size() - 1).get(2).x, circleSegments.get(circleSegments.size() - 1).get(2).y);
    for (ArrayList<PVector> segment : circleSegments) {
      bezierVertex(b(segment.get(0).x), b(segment.get(0).y), b(segment.get(1).x), b(segment.get(1).y), segment.get(2).x, segment.get(2).y);
    }
    endShape();
  }

  float b(float scale) {
    return size * scale / 100f;
  }

  void mouseDragged_(float x, float y) {
    for (ArrayList<PVector> segment : circleSegments) {
      if (PVector.dist(segment.get(0), new PVector(x, y)) < 10) {
        segment.get(0).set(x, y);
        return;
      }
      if (PVector.dist(segment.get(1), new PVector(x, y)) < 10) {
        segment.get(1).set(x, y);
      }
    }
  }
}
//IDEA: start the controllpoints from their anchorpoints?
//IDEA: create a segment class
