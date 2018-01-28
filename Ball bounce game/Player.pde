class Player {
  PImage PlayerCursor;
  float posY = 360;
  
  void display() {
  background(0);
  image(player.PlayerCursor, mouseX - 92, posY);
  
  }
}

