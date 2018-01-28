class sidePane {

  int x, y;

  void display() {

    strokeWeight(2);
    stroke(216, 216, 216);
    fill(192, 192, 192);
    rect(861, 0, 1000, 598);
    image(penIcon, 880, 50);
    image(brushIcon, 880, 250);
    image(videoIcon, 880, 450);
    line(860, 200, 1000, 200);
    line(860, 400, 1000, 400);
  }
}

