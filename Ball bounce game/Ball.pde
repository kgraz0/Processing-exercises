class Ball {
  float PositionX = width/2;
  float PositionY = height/2;
  float SpeedX = 1;
  float SpeedY = 2;
  float speed = 1;
  int Score = 0;

  void display() {
    fill(0, 160, 0);
    strokeWeight(3);
    stroke(255);
    ellipse(PositionX, PositionY, 30, 30);
    fill(255);
    textSize(20);
    text("Score:" + Score, 50, 50);
  }

  void update() { 
    PositionX += SpeedX;
    PositionY += SpeedY;

    if (PositionX < 0 || PositionX > width && playing == true)
      SpeedX = - SpeedX;

    if (PositionY < 0 || PositionY > height && playing == true)
      SpeedY = - SpeedY;
    
    if (PositionX >= mouseX - 92 && PositionX <= mouseX + 92 && PositionY == player.posY && playing == true) {
      SpeedY = - SpeedY;
      Score += 1;
    }
    if (PositionY > height && playing == true) {
      playing = false;
       gameOver();
  }
  }
}
