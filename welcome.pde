class welcome {
  boolean start=false;
  boolean restart=false;
  PFont fontTittle;

  welcome() {
    fontTittle=loadFont("HelveticaNeue-Bold-100.vlw");
  }
  void render() {
    fill(100);
    rectMode(CORNER);
    rect(0, 0, width, height);
    fill(255);
    textFont(fontTittle);
    textSize(100);
    text("elpmis", 10, height-30);
  }
  void keyPressed() {
    if (keyCode==ENTER) {
      start=true;
    }
    if(key=='r'){
        restart=true;
        start=false;
    }
  }
}