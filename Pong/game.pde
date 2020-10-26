float vx, vy;

//background music
void game() {
  background(khaki);
  if (!theme.isPlaying()) {
    theme.rewind();
    theme.play();
  }


  //Middle line
  strokeWeight(4);
  stroke(0);
  line(width/2, 0, width/2, height);

  //paddles
  strokeWeight(0);
  stroke(21, 244, 238);
  fill(BrightBlue);
  circle(leftx, lefty, leftd);
  fill(BrightRed);
  stroke(74, 50, 100);
  circle(rightx, righty, rightd);

  //scoreboard
  textSize(70);
  fill(BrightBlue);
  text (leftsidescore, width/4, 100);
  fill(BrightRed);
  text(rightsidescore, 3*width/4, 100);
  timer=timer-1;


  //edges
  if (righty < 100) {
    righty = 100;
  } 
  if (lefty < 100) {
    lefty = 100;
  } 
  if (righty > 500) {
    righty = 500;
  } 
  if (lefty > 500) {
    lefty = 500;
  }

  //paddles moving

  if (wkey == true) lefty = lefty - 6;
  if (skey == true) lefty = lefty + 6;
  if (AI == false) {
    if (upkey == true) righty = righty - 6;
    if (downkey == true) righty = righty + 6;
  } else if (AI == true) {
    if (ballx > 450) { 
      if (bally < 300) {
        if (righty < 130) {  
          righty = righty - 0;
        } else if (bally < 300) { 
          righty = righty - 6;
        }
      }
      if (bally > 300) {
        if (righty > 540) { 
          righty = righty - 0;
        } else if (bally > 300) { 
          righty = righty + 6;
        }
      }
    }
  }

  //the ball
  fill(green);
  circle(ballx, bally, balld);

  if (timer < 0) {
    bally = bally + vy;
    ballx = ballx + vx;
  } 
  if (bally > 590) {
    ballx = width/2;
    bally = height/2;
    timer = 100;
    vx = 3;
    vy = random(-5, 5);
  }
  if (bally < 10) {
    timer = 100;
    ballx = width/2;
    bally = height/2;
    vx = 3;
    vy = random(-5, 5);
  }

  //bounce
  if (bally >= height - balld/2 || bally <= 0 + balld/2) {
    wall.rewind();
    wall.play();
    vy = vy * - 1;
  } 
  if (dist(leftx, lefty, ballx, bally) <= leftd/2 + balld/2) {
    left.rewind();
    left.play();
    vx = (ballx-leftx)/random(8, 22);
    vy = (bally-lefty)/random(8, 22);
  } 
  if (dist(rightx, righty, ballx, bally) <= rightd/2 + balld/2) {
    right.rewind();
    right.play();
    vx = (ballx-rightx)/random(8, 22);
    vy = (bally-righty)/random(8, 22);
  }

  //score
  if (ballx < 0) {
    score.rewind();
    score.play();
    rightsidescore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    vx = 3;
    vy = random(-5, 5);
  }
  if (ballx > 800) {
    score.rewind();
    score.play();
    leftsidescore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    vx = 3;
    vy = random(-5, 5);
  }
  if (leftsidescore > 2) {
    mode = GAMEOVER;
  } 
  if (rightsidescore > 2) {
    mode = GAMEOVER;
  }
}



void gameClicks () {
  if (dist(mouseX, mouseY, 0, 0) < 800) {
    mode= PAUSE;
  }
}
