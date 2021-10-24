Button[ ] bt;
PFont f;

float speed=0;
float easing=0.7;
float btWidth=100;
float btHeight=50;
color brushColor=255;

void setup() {
  size (1000, 1000);
  background(255);
  bt=new Button[4];
  initiate();
  cursor(CROSS);

  f=loadFont("BookAntiqua-Bold-120.vlw");
  textFont(f, 120);
}
void initiate() {
  for (int i=0; i<bt.length; i++) {
    color[ ]cc={color(181, 91, 91), color(224, 186, 115), color(165, 198, 134), color(255)};
    bt[i]=new Button(50, 50+(btHeight+10)*i, btWidth, btHeight, cc[i]);
  }
}

void draw() {
  for (int i=0; i<bt.length; i++) {
    bt[i].showButton();
    if (bt[i].pickColor) {
      brushColor=bt[i].buttonColor;
      bt[i].pickColor=false;
    }
  }
  if (!bt[0].pickPen&&!bt[1].pickPen&&!bt[2].pickPen&&!bt[3].pickPen) {
    if (mousePressed) {
      strokeWeight(10);
      stroke(130, 90, 80);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  } else  if (bt[0].pickPen) {
    bt[1].pickPen=false;
    bt[2].pickPen=false;
    bt[3].pickPen=false;
    float distance = 100;
    float  spring = 100;
    float friction = 2;
    float size = 25;
    float diff = size/2;
    float  x =0, y =0, ax = 0, ay = 0, a =0, r =0, f = 0;
    float   oldR = r;
    boolean p=false;
    if (mousePressed) {
      float   mX = mouseX;
      float mY = mouseY;

      if (!p) {
        p = true;
        x = mX;
        y = mY;
      }
      ax += ( mX - x ) * spring;
      ay += ( mY - y ) * spring;
      ax *= friction;
      ay *= friction;
      a += sqrt( ax*ax + ay*ay ) - a;
      a *= 0.6;
      r = size - a;

      for (int j = 0; j < distance; j++ ) {
        float  oldX = x;
        float oldY = y;
        x += ax / distance;
        y += ay / distance;
        oldR += ( r - oldR ) / distance;
        if (oldR < 1) {
          oldR = 1;
        }
        strokeWeight( oldR+diff );
        stroke(brushColor);
        line( x, y, oldX, oldY );
        strokeWeight( oldR );
        line( x+diff*2, y+diff*2, oldX+diff*2, oldY+diff*2 );
        line( x-diff, y-diff, oldX-diff, oldY-diff );
      }
    } else {
      ax = ay =0;
      p=false;
    }
  } else if (bt[1].pickPen) {
    bt[0].pickPen=false;
    bt[2].pickPen=false;
    bt[3].pickPen=false;
    smooth();
    float target=dist(mouseX, mouseY, pmouseX, pmouseY);
    speed+=(target-speed)*easing;
    if (mousePressed) {
      stroke(brushColor);
      strokeWeight(speed/2);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  } else if (bt[2].pickPen) {
    bt[0].pickPen=false;
    bt[1].pickPen=false;
    bt[3].pickPen=false;
    float target=dist(mouseX, mouseY, pmouseX, pmouseY);
    speed+=(target-speed)*easing;
    if (mousePressed) {
      strokeWeight(5);
      stroke(brushColor);
      ellipse(mouseX, mouseY, speed/2, speed/2 );
    }
  } else if (bt[3].pickPen) {
    bt[0].pickPen=false;
    bt[1].pickPen=false;
    bt[2].pickPen=false;
    if (mousePressed) {
      noStroke();
      ellipse(mouseX, mouseY, 100, 100);
      fill(brushColor);
    }
  }

  if (keyPressed) {
    background(255);
  }


  textSize(30);
  fill(0);
  text("eraser", 60, 264);
}
