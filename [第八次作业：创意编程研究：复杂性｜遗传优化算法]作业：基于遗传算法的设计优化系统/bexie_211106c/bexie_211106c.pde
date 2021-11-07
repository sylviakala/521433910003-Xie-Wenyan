PFont font;
PShape s;
float rc=0, gc=0, bc=0;

Population population;
Button button;

void setup() {
  size(1000, 720);
  colorMode(RGB, 1.0);
  font = createFont("微软雅黑", 24);
  s = loadShape("1244.svg");
  s.disableStyle();
  int popmax = 6;
  float mutationRate = 0.05;  // A pretty high mutation rate here, our population is rather small we need to enforce variety
  // Create a population with a target phrase, mutation rate, and population max
  population = new Population(mutationRate, popmax);
  // A simple button class
  button = new Button(width/2-80, height-100, 160, 20, "重新生成新版配色");
}

void draw() {
  background(1.0);
  // Display the pallettes
  population.display();
  population.rollover(mouseX, mouseY);
  // Display some text
  textAlign(CENTER);
  fill(0);
  text("Generation #:" + population.getGenerations(), width/2, height-60);

  // Display the button
  button.display();
  button.rollover(mouseX, mouseY);
  rgb();
}

// If the button is clicked, evolve next generation
void mousePressed() {
  if (button.clicked(mouseX, mouseY)) {
    population.selection();
    population.reproduction();
  }
}

void mouseReleased() {
  button.released();
}

void rgb() {
  fill(210, 0, 0);
  rect(40, 296, 150, 40);
  fill(0, 210, 0);
  rect(40, 371, 150, 40);
  fill(0, 0, 210);
  rect(40, 446, 150, 40);

  if (mousePressed) {
    if (mouseX>=40 & mouseX<=190) {
      if (mouseY>=296 & mouseY<=336) {
        rc = map(mouseX, 40, 190, 0, 1.0);
        fill(rc, 0, 0, 10);
        strokeWeight(1);
        noStroke();
        //stroke(255,100);
        ellipse(mouseX, 316, 45, 45);
      } else if (mouseY>=371 & mouseY<=411) {
        gc = map(mouseX, 40, 190, 0, 1.0);
        fill(0, gc, 0, 10);
        strokeWeight(1);
        noStroke();
        ellipse(mouseX, 391, 45, 45);
      } else if (mouseY>=446 & mouseY<=486) {
        bc = map(mouseX, 40, 190, 0, 1.0);
        fill(0, 0, bc, 10);
        strokeWeight(1);
        noStroke();
        ellipse(mouseX, 466, 45, 45);
      }
    }
    fill(255);
    noStroke();
    rect(0, 499, 1000, 110);
    fill(180);
    noStroke();
    rect(230, 514, 720, 100);
  }
     fill(rc, gc, bc);
    noStroke();
    ellipse(108, 130, 175, 175);
}
