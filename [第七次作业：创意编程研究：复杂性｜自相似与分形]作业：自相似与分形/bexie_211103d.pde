Stars[]  sta;
Blackholes[] bla;
float r;
boolean p=false;

void setup() {
  size(800, 800);
  background(0);
  //strokeWeight(3);
  colorMode(HSB, 540);
  sta=new Stars[int(2e2)];
  bla=new Blackholes[4];

  initiateStars();
  initiateBlackholes();
  frameRate(10);
}

void initiateStars() {
  for (int i=0; i<sta.length; i++) {
    sta[i]=new Stars(cos(i)*300, sin(i)*300, i%360);
  }
}

void initiateBlackholes() {
  for (int i=0; i<bla.length; i++) {
    bla[i]=new Blackholes(random(-200, 200), random(-200, 200));
  }
}

void draw() {
  translate(width/2, height/2);
  //rect(-400,-400,800,800);
  //noStroke();
  //fill(255,255,255,20);

  for (Stars s : sta) {
    float direction=0;
    for (Blackholes b : bla) {
      direction+=atan2(b.y-s.y, b.x-s.x)*2;
    }
    rotate(r);
    strokeWeight(3);
  //  if (p==false) {
      stroke(s.c, 250, 300);
  //  }
    if (mousePressed) {
      stroke(400,400,200);
    }
    line(s.x, s.y, s.x+=cos(direction)*3, s.y+=sin(direction)*3);
  }
  r+=PI/2;
//  mousePressed();
}
