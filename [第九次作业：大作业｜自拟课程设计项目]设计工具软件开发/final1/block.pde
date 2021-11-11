class Block {
  float rLmt;
  float lLmt;
  float Leng;
  float bHeight;

  int blockSize=50;
  float curPos;
  float initiatecurPos;

  float value;
  float minValue;
  float maxValue;
  String name;
  Block(String nam, float l, float r, float bH, float min, float max, float initiatecurPos_) {
    rLmt=r;
    lLmt=l;
    Leng=r-l;
    name=nam;
    bHeight=bH;

    minValue=min;
    maxValue=max;
    initiatecurPos=initiatecurPos_;
  }

  void show() {
    pushStyle();
    strokeWeight(10);
    stroke(170,170,170);
    line(lLmt, bHeight, rLmt, bHeight);
    popStyle();
    fill(0);
    text(name, lLmt-60, bHeight);
    textAlign(RIGHT, TOP);
    fill(0);
    text(minValue, lLmt, bHeight-30);
    textAlign(LEFT, TOP);
    fill(0);
    text(maxValue, rLmt, bHeight-30);
    if (mousePressed&mouseX<=rLmt&mouseX>=lLmt&mouseY<bHeight+blockSize/2&mouseY>bHeight-blockSize/2) {
      curPos=mouseX;
      fill(120, 120, 120);
      stroke(0);
      rect(curPos, bHeight-blockSize/2, blockSize, blockSize);
      value=calculativeValue();
    } else {
      fill(0);
      stroke(0);
      rect(curPos, bHeight-blockSize/2, blockSize, blockSize);
    }
    fill(0);
    text(value, rLmt+5, bHeight);
  }

  float calculativeValue() {
    return  map( (curPos-lLmt), 0, rLmt-lLmt, minValue, maxValue);
  }

  void  initiate() {
    curPos=initiatecurPos;
    value=calculativeValue();
  }
}
