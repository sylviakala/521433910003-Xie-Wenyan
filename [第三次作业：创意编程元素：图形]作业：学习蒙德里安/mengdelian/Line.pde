class Line {
  float x1, x2, y1, y2;
  Line(float x1_, float y1_, float x2_, float y2_) {
    x1=x1_;
    x2=x2_;
    y1=y1_;
    y2=y2_;
  }
  void display() {
    line(x1, y1, x2, y2);
    strokeWeight(random(2, 4));
    stroke(0);
  }
}
