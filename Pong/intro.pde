void intro() {
  if (!theme.isPlaying()) {
    theme.rewind();
    theme.play();
  }

  textFont(Text);
  background(khaki);
  stroke(21, 244, 238);

  //intro screen background designs
  
  noStroke();
  fill(pink); //pink
  circle(100,230,100);
  
  fill(yellow); //yellow
  circle(200,60,100);

  fill(green); //green
  circle(700,230,100);
  
  
  fill(red); //red
  circle(460,110,100);
  
  
  fill(blue); //blue
  circle(300,540,100);
  
  
  fill(purple); //purple
  circle(680,520,100);
 
  
  //NEON
  textSize(130);
  fill(0);
  text("Paint", 230, 280);

  //PONG
  fill(255);
  text("Pong", 440, 280);

  //TACTILE BUTTONS
  fill(orange);
  rectButton(100, 350, 200, 100);
  rectButton(500, 350, 200, 100);

  fill(BrightBlue);
  textSize(30);
  text("SINGLE PLAYER", 150, 410);
  text("DOUBLE PLAYERS", 550, 410);
}

void introClicks() {
  if (mouseX > 500 && mouseX < 700 && mouseY > 350 && mouseY < 450) {
    mode = GAME;
    upkey = true;
    downkey = true;
    AI = false;
  }
  if (mouseX > 100 && mouseX < 300 && mouseY > 350 && mouseY < 450) {
    mode = GAME;
    upkey = false;
    downkey = false;
    AI = true;
  }
}
