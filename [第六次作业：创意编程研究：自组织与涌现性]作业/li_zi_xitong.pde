PImage img;
ArrayList<Ball>balls;
ArrayList<PVector>spot;
int[]colors={color(5, 100, 255), color(30, 50, 170), color(130, 175, 255)};
boolean m=false;

void setup() {
  size(800, 800);
  balls =new ArrayList<Ball>();
  spot=new ArrayList<PVector>();
  img=loadImage("HAVE A GOOD DAY.png");
  frameRate(10);

  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {
      int index=i+j*img.width;
      color c=img.pixels[index];
      float b=brightness(c);
      if (b>1) {
        spot.add(new PVector(i, j));
      }
    }
  }
}

void draw() {
  rect(0,0,800,800);
  fill(0,20);
  for (int i=0; i<10; i++) {
    newBall();
  }
  background(0);
  println("l");
  for (Ball b : balls) {
    if (b.growing) {
      for (Ball other : balls) {
        if (b!=other) {
          float dis=dist(b.posX, b.posY, other.posX, other.posY);
          if (dis-0.1<b.R+other.R) {
            println("k");
            b.growing=false;
            other.growing=false;
            break;
          }
        }
      }
    }
    println("b");
    b.grow();
    b.display1();
    b.display2();
    if (m!=false) {
      b.move();
    }
  }
}

void mousePressed() {
  m=true;
}


void newBall() {
  println("m");
  PVector spo=spot.get(int(random(spot.size())));
  float x=spo.x;
  float y=spo.y;
  boolean valid=true;
  for (Ball b : balls) {
    float d =dist (x, y, b.posX, b.posY);
    if (d<b.R) {
      valid=false;
      break;
    }
  }
  if (valid) {
    balls.add(new Ball(x, y));
  }
}
