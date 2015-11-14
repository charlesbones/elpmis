/*
Ball Class 
This is the main character of the game
*/
class ball {
  //variable of the shape and the direction
  int w, h;
  float x;
  float y;
  int dirX=1;
  int dirY=1;
  float xS=0.5;
  float yS=0.5;
  //check if the ball crash against something
  boolean crash=false;
  //Constructor
  ball(float _x, float _y) {
    x=_x;
    y=_y;
    w=20;
    h=20;
  }
  //Render function
  void render() {
    fill(#0AFFB7);
    ellipse(x, y, w, h);
  }
  //collision check function
  void update(float tX, float tY, int tW, int tH, int i) {
    x=x+xS*dirX;
    y=y+yS*dirY;
    if (x+(w/2)<0+w||x-(w/2)>width-w) {
      dirX*=-1;
    }
    if (y+(h/2)<0+h||y-(h/2)>height-h) {
      dirY*=-1;
    }
    if (x+(w/2)>tX-(tW/2)&&x-(w/2)<tX+(tW/2)&&y+(h/2)>tY-(tH/2)&&y-(h/2)<tY+(tH/2)) {
      obList.get(i).fillColor=color(255, 0, 0);
      dirX*=-1;
      dirY*=-1;
      beepCollision.rewind();
      beepCollision.play();
    }
  }
}