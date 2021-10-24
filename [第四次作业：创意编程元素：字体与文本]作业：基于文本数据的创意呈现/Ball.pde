class Ball {
  float bX, bY, bD;
  color c=int(random(100, 200));
  float speed ;
  Ball(float bX_, float bY_, float bD_) {
    bX=bX_;
    bY=bY_;
    bD=bD_;
    speed=2;
  }
  void display() {
    noStroke();
    fill(c);
    ellipse(bX,bY,bD,bD);
  }
}
