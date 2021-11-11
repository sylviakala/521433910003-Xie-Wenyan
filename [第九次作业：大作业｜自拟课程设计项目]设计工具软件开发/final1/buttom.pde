class Button {
  float posX, posY, buttonWidth, buttonHeight;
  boolean pickPen;
  String s;

  Button(String s_,float x, float y, float w, float h) {
  s=s_;
    posX=x;
    posY=y;
    buttonWidth=w;
    buttonHeight=h;
  }

  void showButton() {
    if (hover()) {
      stroke(0);
      strokeWeight(3);
    } else {
      stroke(170, 170, 170);
      strokeWeight(1);
    }

    if (mousePressed&&hover()) {
      pickPen=true;
    } 
    text(s,posX,posY-20);
    rect(posX,posY,buttonWidth,buttonHeight);
  }

  boolean hover() {
    if (mouseX<posX+buttonWidth&mouseX>posX&mouseY<posY+buttonHeight&mouseY>posY) {
      return true;
    } else {
      return false;
    }
  }
}
