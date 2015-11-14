/*
  Score Class
  This is the pulsing blue circle 
 */
class score {
  int x, y, w, h;
  boolean win=false;
  float diameter=50;
  float angle=0;
  score(int _x, int _y, int _w, int _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
  //render function
  void render() {
    float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;
    float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
    float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/2;
    fill(10, 204, 255, 50);

    ellipse(x, y, d1, d1);
    ellipse(x, y, d2, d2);
    ellipse(x, y, d3, d3);
    angle += 0.02;
  }
  //collision detection
  void update(float tX, float tY, int tW, int tH) {
    if (x+(w/2)>tX-(tW/2)&&x-(w/2)<tX+(tW/2)&&y+(h/2)>tY-(tH/2)&&y-(h/2)<tY+(tH/2)) {
      println("you win!!!");
      beepWin.rewind();
      beepWin.play();
      win=true;
    }
  }
}