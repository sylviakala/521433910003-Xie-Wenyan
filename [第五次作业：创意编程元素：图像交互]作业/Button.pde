class Button {
  float posX, posY, buttonWidth, buttonHeight;
  color buttonColor;
  boolean pickColor,pickPen;

  Button(float x, float y, float w, float h, color c) {
    posX=x;
    posY=y;
    buttonWidth=w;
    buttonHeight=h;
    buttonColor=c;
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
      pickColor=true;
      pickPen=true;
      fill(buttonColor);
    } else {
      fill(buttonColor);
    }
    rect(posX, posY, buttonWidth, buttonHeight);
  }



  boolean hover() {
    if (mouseX<posX+buttonWidth&&mouseX>posX&&mouseY<posY+buttonHeight&&mouseY>posY) {
      return true;
    } else {
      return false;
    }
  }
}
