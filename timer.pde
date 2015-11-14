/*
 Timer Class
  This class count the time (control the grey background and increse the level
 */
class timer {
  long m=0;
  int limit=30;
  boolean reset=false;
  float timer=0;
  int level=1;
  timer(int _l) {
    m=millis();
    limit=_l;
  }
  //render function
  void render() {
    reset=false;
    timer=(millis()-m)/1000;
    rectMode(CORNER);
    fill(100);
    rect(0,map(timer,0,limit,0,height),width,height);
    rectMode(CENTER);
    if(timer>=limit){
        m=millis();
        //level++;
        reset=true;
    }
  }
}