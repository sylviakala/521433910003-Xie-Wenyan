void eraser() {
  if (t2.pickPen==true) {
    if (mouseX>0&mouseX<1200&mouseY>0&mouseY<1200) {
      if (mousePressed) {
        float size=b1.value;
        strokeWeight(size);
        stroke(255, c4.value);
        line(pmouseX, pmouseY,mouseX,mouseY);
      }
    }
  }
}
