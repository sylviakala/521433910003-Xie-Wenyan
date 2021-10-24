Line[] line1;
Line[] line2;

void setup() {
  size(400, 500);
  background(255);
  float[]arrx;
  arrx=new float[10];
  float[]arry;
  arry=new float[7];

  arrx[0]=0;
  arrx[9]=500;
  arry[0]=0;
  arry[6]=400;

  line1=new Line[10];
  for (int i=0; i<line1.length; i++) {
    float dd=random(height);
    line1[i]=new Line(0, dd, 400, dd);
    arrx[i]=dd;
  }
  line2=new Line[7];
  for (int j=0; j<line2.length; j++) {
    float bb=random(width);
    line2[j]=new Line(bb, 0, bb, 500);
    arry[j]=bb;
  }

  for (int i=0; i<line1.length; i++) {
    for (int j=i+1; j<line1.length-1; j++) {
      if (arrx[i]>arrx[j]) {
        float  minx=arrx[j];
        arrx[j]=arrx[i];
        arrx[i]=minx;
      }
    }
  }
  for (int m=0; m<line2.length; m++) {
    for (int n=m+1; n<line2.length-1; n++) {
      if (arry[m]>arry[n]) {
        float miny=arry[n];
        arry[n]=arry[m];
        arry[m]=miny;
      }
    }
  }

  for (int i=0; i<10; i++) {
    int x1=int(random(0, 9));
    int y1=int(random(0, 6));
    int x2=x1+1+int(random(9-x1));
    int y2=y1+1+int(random(6-y1));

    fill(random(100, 200));
    stroke(0);
    strokeWeight(3);
    rect(arry[y1],arrx[x1],arry[y2]-arry[y1],arrx[x1]-arrx[x2]);
    //if (x1<x2) {
    //  if (y1<y2) {rect(arry[y1],arrx[x1],arry[y2]-arry[y1],arrx[x2]-arrx[x1]);
    //  }else{rect(arry[y1],arrx[x2],arry[y2]-arry[y1])}
    //}
  }


  for (int i=0; i<line1.length; i++) {
    line1[i].display();
  }
  for (int j=0; j<line2.length; j++) {
    line2[j].display();
  }
}
