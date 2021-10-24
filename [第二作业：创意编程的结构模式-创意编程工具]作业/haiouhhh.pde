PFont f;
float speedX=5;
float bD=12;

void setup() {
  size(1000, 1000);
  background(22, 18, 15);
  smooth();
  f=loadFont("ShowcardGothic-Reg-48.vlw");
  textFont(f, 48);
}
void draw() {
  //word
  smooth();
  textSize(145);
  float c1=map(mouseX, 0, width, 40, 200);
  float c2=map(mouseY, 0, height, 30, 160);
  float c3=map(mouseY, 0, width, 100, 200);
  fill(c1, c2, c3);
  background(22, 18, 15);
  text("ARE YOU OK?", bD, 163);
  bD=bD+speedX;
  if (bD>=width) {
    bD=-width;
  }

  //OUTLINE
  smooth();
  fill(230, 199, 116);
  stroke(242, 180, 118);
  strokeWeight(10);
  beginShape();
  vertex(-496, 931);
  bezierVertex(672, -478, 1264, 333, 806, 1202);
  endShape(OPEN);

  //eyebrows1
  stroke(72, 61, 61);
  strokeWeight(70);
  line(462, 290, 667, 308);
  //eyebrows2
  stroke(72, 61, 61);
  strokeWeight(70);
  line(778, 398, 848, 570);

  //EYE1

  noStroke();
  fill(245, 230, 234);
  ellipse(544, 433, 250, 250);
  //EYE2
  noStroke();
  fill(245, 230, 234);
  ellipse(704, 542, 256, 256);

  //eyeball1
  float rot1;
  float rot2;
  rot1=map(mouseX, 0, width, 494, 553);
  rot2=map(mouseY, 0, height, 377, 465);
  noStroke();
  fill(72, 61, 61);
  ellipse(rot1, rot2, 150, 150);
  //eyeball2
  float rot3;
  float rot4;
  rot3=map(mouseX, 0, width, 699, 766);
  rot4=map(mouseY, 0, height, 546, 597);
  noStroke();
  fill(72, 61, 61);
  ellipse(rot3, rot4, 161, 162);

  //mouse1
  noStroke();
  fill(245, 146, 110);
  beginShape();
  vertex(428, 519);
  bezierVertex(465, 523, 608, 518, 632, 676);
  endShape(CLOSE);
  //mouse2
  noStroke();
  fill(224, 119, 82);
  beginShape();
  vertex(427, 527);
  bezierVertex(341, 561, 608, 786, 632, 687);
  endShape(CLOSE);

  //a part of body
  strokeWeight(10);
  stroke(242, 180, 118);
  fill(246, 225, 183);
  beginShape();
  vertex(-415, 834);
  bezierVertex(200, 475, 801, 644, 517, 1403);
  endShape(OPEN);

  //flush1
  noStroke();
  fill(226, 144, 152);
  ellipse(362, 414, 139, 139);
  //flush2
  noStroke();
  fill(226, 144, 152);
  ellipse(748, 726, 139, 139);
}
