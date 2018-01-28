/*
Practicing classes this week.
*/

boolean playing = true;
Player player;
Ball ball;

/* Setting up. Had to load the Image in setup
otherwise it wouldn't show on CodeCircle. */
void setup() {
  player = new Player();
  ball = new Ball();
  size(400, 400);
  player.PlayerCursor = loadImage("bar.png");
}

void draw() {
  if (playing == true) {
  player.display();
  ball.display();
  ball.update();
  }
  else {
    gameOver();
  }
}

void gameOver() {
      background(0);
      textSize(40);
      fill(255);
      text("Game Over", 100, height/2);
}


