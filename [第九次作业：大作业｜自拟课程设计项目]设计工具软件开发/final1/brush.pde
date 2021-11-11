void brush() {
  if (t1.pickPen==true) {
    float size=b1.value;
    float spring=b2.value;
    float friction=b3.value;
    float distance=b4.value;
    float diff=b5.value;

    float  oldR = r;
    if (mouseX>0&mouseX<1200&mouseY>0&mouseY<1200) {
      if (mousePressed) {
        float   mX = mouseX;
        float  mY = mouseY;
        if (f!=1) {
          f = 1;
          x = mX;
          y = mY;
        }
        ax += ( mX - x ) * spring;
        ay += ( mY - y ) * spring;
        ax *= friction;
        ay *= friction;
        a += sqrt( ax*ax + ay*ay ) - a;
        a *= 0.6;
        r = size - a;

        for (int  i = 0; i < distance; ++i ) {
          float  oldX = x;
          float  oldY = y;
          x += ax / distance;
          y += ay / distance;
          oldR += ( r - oldR ) / distance;
          if (oldR < 1) oldR = 1;
          stroke(c1.value,c2.value,c3.value,c4.value);
          strokeWeight( oldR+diff );
          line( x, y, oldX, oldY );
          strokeWeight( oldR );
          line( x+diff*2, y+diff*2, oldX+diff*2, oldY+diff*2 );
          line( x-diff, y-diff, oldX-diff, oldY-diff );
        }
      } else {
        ax = ay = f = 0;
      }
    }
  }
}
