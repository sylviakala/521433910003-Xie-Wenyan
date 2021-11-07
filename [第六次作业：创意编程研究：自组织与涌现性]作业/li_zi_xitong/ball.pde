class Ball {
  float posX, posY, R;
  //int col=(int)random(colors.length);
  boolean growing=true;
  boolean m;
  float speedx=random(-1,1);
  float speedy=random(1,-1);

  Ball(float x, float y) {
    posX=x;
    posY=y;
    R=0.8;
  }

  void grow() {
    if (growing) {
      R+=0.1;
    }
  }

  void display1() {
    //   strokeWeight(2);
    int col=(int)random(colors.length);
    fill(colors[col]);
    ellipse(posX, posY, R*2, R*2);
  }

  void display2() {
    noStroke();
    int col=(int)random(colors.length);
    fill(colors[col]);
    ellipse(posX, posY, R, R);
  }

  void move() {
    posX=posX+speedx;
    posY=posY+speedy;
  }
}
