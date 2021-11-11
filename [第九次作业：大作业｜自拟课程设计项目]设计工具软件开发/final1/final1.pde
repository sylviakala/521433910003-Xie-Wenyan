Block b1;
Block b2;
Block b3;
Block b4;
Block b5;

Block c1;
Block c2;
Block c3;
Block c4;

Button t1;
Button t2;

float x=0;
float y=0;
float ax=0;
float ay=0;
float f=0;
float r=0;
float a=0;

PFont font;

void setup() {
  size(1500, 1200);
  background(255);
  font=createFont("BritannicBold-128", 128);
  b1=new Block("Size", 1200, 1450, 200, 1, 100, 1240);
  b2=new Block("Spring", 1200, 1450, 300, 0.001, 1, 1300);
  b3=new Block("Friction", 1200, 1450, 400, 0.001, 1, 1300);
  b4=new Block("SpiltNum", 1200, 1450, 500, 1, 20, 1250);
  b5=new Block("diff", 1200, 1450, 600, 1, 2, 1350);

  c1=new Block("r", 1200, 1450, 750, 0, 255, 1200);
  c2=new Block("g", 1200, 1450, 850, 0, 255, 1200);
  c3=new Block("b", 1200, 1450, 950, 0, 255, 1200);
c4=new Block("alpha",1200,1450,1050,0,100,1450);
  //  Block(String nam, float l, float r, float bH,float min,float max)

  b1.initiate();
  b2.initiate();
  b3.initiate();
  b4.initiate();
  b5.initiate();

  c1.initiate();
  c2.initiate();
  c3.initiate();
  c4.initiate();

  t1=new Button("Brush", 1175, 115, 50, 30);
  t2=new Button("Eraser", 1300, 115, 50, 30);
  //   Button(float x, float y, float w, float h) {
}

void draw() {
  if (t1.hover()&mousePressed) {
    t1.pickPen=true;
    t2.pickPen=false;
  }
  if (t2.hover()&mousePressed) {
    t1.pickPen=false;
    t2.pickPen=true;
  }

  fill(0);
  textSize(55);
  text("CONTROL PANEL", 1110, 20);
  text("COLOR", 1110, 645);

  fill(90, 90, 90, 50);
  strokeWeight(1);
  rect(1100, 0, 500, 1200);
  textSize(18);
  b1.show();
  b2.show();
  b3.show();
  b4.show();
  b5.show();

  c1.show();
  c2.show();
  c3.show();
  c4.show();

  t1.showButton();
  t2.showButton();

rectangle();

  brush();
  eraser();
}

void rectangle() {
  fill(c1.value,c2.value,c3.value);
  stroke(0);
  strokeWeight(2);
  rect(1300,659,40,40);
}
