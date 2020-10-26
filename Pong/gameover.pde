void gameover() {
      if (!WINNER.isPlaying()) {
   WINNER.rewind();
    WINNER.play();
  }
  background(khaki);
 
  if (leftsidescore > rightsidescore) {
    fill(BrightBlue);
   
    //left side wins
    textSize(160);
    text("BLUE WON", 170, 300); 
    textSize(70);
    text("CLICK ANYWHERE TO GO BACK", 250, 500);
  
} else if (leftsidescore < rightsidescore) {
    fill(BrightRed);
   
    //rightside wins
    textSize(160);
    text("RED WON", 170, 300);
    textSize(70);
    text("CLICK ANYWHERE TO GO BACK", 250, 500);
  }
}

void gameoverClicks() {
  if (mouseX > 0 && mouseX < 600 && mouseY > 0 && mouseY < 800) {
    mode = INTRO;
  }
}
