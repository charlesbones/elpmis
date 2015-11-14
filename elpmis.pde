/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * Charles Bones wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Poul-Henning Kamp
 * ----------------------------------------------------------------------------
 */
 
 //Libraries
import ddf.minim.*;
//Sound Objects
Minim minim;
AudioPlayer beepCollision, beepWin;
//Obstacles
ArrayList<obstacle> obList=new ArrayList<obstacle>();
//Ball Object
ball b;
//Score Object
score s;
//Timer
timer t;
//Welcome Screen
welcome w;
//Font for the level
PFont fontLevel;
void setup() {
  size(800, 400);
  noStroke();
  //Fill the arrayList with the obstacles
  for (int i=0; i<5; i++) {
    obList.add(new obstacle(int(random(100, width-100)), int(random(10, height-100)), int(random(30, 100)), int(random(30, 100))));
  }
  //ball object
  b=new ball(20, random(20, height-20));
  //score object
  s=new score(int(random(400, width-100)), int(random(100, height-100)), 50, 50);
  //timer object
  t=new timer(30);
  //welcome object
  w=new welcome();

  //Sound
  minim = new Minim(this);
  beepCollision = minim.loadFile("beepCollision.mp3");
  beepWin= minim.loadFile("beepWin.mp3");

  //Font level
  fontLevel=loadFont("HelveticaNeue-Bold-48.vlw");
}  
void draw() {
  background(0);
  //When the main game begins let's render all the elements
  if (w.start) {
    //In case someone press 'r' we will restart the game
    if (w.restart) {
      obList.clear();
      for (int i=0; i<5; i++) {
        obList.add(new obstacle(int(random(100, width-100)), int(random(10, height-100)), int(random(30, 100)), int(random(30, 100))));
      }
      b=new ball(20, random(20, height-20));
      s=new score(int(random(400, width-100)), int(random(100, height-100)), 50, 50);
      w.restart=false;
      t.level=1;
    }
    //if the time ends the level will restart again
    if (t.reset) {
      for (int i=0; i<obList.size(); i++) {
        obList.get(i).x=int(random(100, width-100));
        obList.get(i).y=int(random(10, height-10));
      }
      b=new ball(20, random(20, height-20));
      s=new score(int(random(400, width-100)), int(random(100, height-100)), 50, 50);
    }
    //if you WIN!!! 
    if (s.win) {
      //reset the timer
      t.m=millis();
      //add new element to the ArrayList of the obstacles
      obList.add(new obstacle(int(random(100, width-100)), int(random(10, height-10)), int(random(30, 100)), int(random(30, 100))));
      //Change the obstacle positions
      for (int i=0; i<obList.size(); i++) {
        obList.get(i).x=int(random(100, width-100));
        obList.get(i).y=int(random(10, height-10));
      }
      //Change the ball position
      b=new ball(20, random(20, height-20));
      //Change the "score" shape position
      s=new score(int(random(400, width-100)), int(random(100, height-100)), 50, 50);
      //add one to the level variable
      t.level++;
      //bye bye
      s.win=false;
    }
    //Render the timer
    t.render();
    //Render the score
    s.render();
    s.update(b.x, b.y, b.w, b.h);
    //Check the positions of the ball agains the obstacles
    for (int i=0; i<obList.size(); i++) {
      b.update(obList.get(i).x, obList.get(i).y, obList.get(i).w, obList.get(i).h, i);
      //render the obstacles
      obList.get(i).render();
      //highlight the selected obstacle
      obList.get(i).select(i);
    }
    //render the ball
    b.render();
    //render the level text placed at the bottom right corner
    fill(255);
    textFont(fontLevel);
    text("Level: "+t.level, width-180, height-10);
  } else {
    //render the win screen
    w.render();
  }
}
void mouseDragged() {
  //Drag function for the obstacles
  for (int i = 0; i < obList.size(); i++) {
    obList.get(i).mouseDragged(i);
  }
}
void keyPressed() {
  //Press to start
  w.keyPressed();
}