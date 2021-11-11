void eraser() {
  if (t2.pickPen==true) {
    if (mouseX>0&mouseX<1200&mouseY>0&mouseY<1200) {
      if (mousePressed) {
        float size=b1.value;
        noStroke();
        fill(255);
        ellipse(mouseX, mouseY, size, size);
      }
    }
  }
}
