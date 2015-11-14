/*
  Obstacle Class
 These are the squares around the screen
 */
class obstacle {
  //variable of the shape and color
  int x, y, w, h;
  color fillColor = color(#FFFFFF);
  //Constructor
  obstacle(int _x, int _y, int _w, int _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
  //Render function
  void render() {
    rectMode(CENTER);
    fill(fillColor);
    rect(x, y, w, h);
  }
  //Select function
  void select(int i) {
    if ((mouseX>x-(w/2))&&(mouseX<x+(w/2))&&(mouseY>y-(h/2))&&(mouseY<y+(h/2))) {
      fillColor=color(#FAFF03);
    } else {
      fillColor=color(#FFFFFF);
    }
  }
  //Drag function
  void mouseDragged(int i) {
    if ((mouseX>x-(w/2))&&(mouseX<x+(w/2))&&(mouseY>(y-(h/2)))&&(mouseY<y+(h/2))) {
      x=mouseX;
      y=mouseY;
    }
  }
}