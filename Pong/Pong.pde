//kris zhao
//pong project
//1-1a

//library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;

AudioPlayer left, right, WINNER, wall, score, theme;

int mode;

PFont Text;

//Modes
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//AI
boolean AI;

//entity var
float leftx, lefty, leftd, rightx, righty, rightd;
float ballx, bally, balld;

//color var
color pink;
color yellow;
color green;
color red;
color blue;
color purple;
color khaki;
color orange;
color BrightBlue;
color BrightRed;

//keyboard var
boolean wkey, skey, upkey, downkey;

//scoring var
int leftsidescore, rightsidescore, timer;



void setup() {
  size(800, 600);
  mode = INTRO;

  leftx=0;
  lefty=height/2;
  leftd=200;

  rightx=width;
  righty=height/2;
  rightd=200;
  AI=true;

  //music and sound effects
  minim = new Minim(this);
  right=minim.loadFile("rightpaddle.wav");
  left=minim.loadFile("leftpaddle.wav");
  wall=minim.loadFile("wall.wav");
  score=minim.loadFile("score.wav");
  theme=minim.loadFile("theme.wav");
  WINNER=minim.loadFile("clapping.wav");

  //the ball
  ballx= width/2;
  bally=height/2;
  balld=50;
  timer=100;
  vx=3;
  vy=4;
  Text=createFont("Text.ttf", 200);

  //int keboard var
  wkey = skey = upkey = downkey = false;

  //int colors
  pink = #F79DF6;
  yellow = #FAEB79;
  green = #9DF7C0;
  red = #FF5858;
  blue = #9CBCFC;
  purple = #B59CFC;
  khaki = #EDE4C2;
  orange = #FA820A;
  BrightBlue = #126EFF;
  BrightRed = #FF1236;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode Error:" +mode);
  }
}

void rectButton (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+w) {
    strokeWeight(4);
    stroke(255);
  } else {
    stroke(1);
    strokeWeight(1);
  } rect(x, y, w, h);
}
