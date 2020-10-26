void pause() {
  fill(0);
  textSize(100);
  text("YOU ARE NOT DONE YET", 150, 220);

}
void pauseClicks() {
  if (dist(mouseX, mouseY, 0, 0) <800) {
    mode=GAME;
  }
}
