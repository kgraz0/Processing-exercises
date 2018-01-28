class bottomPane {

  int x, y;
  color colour1 = 0, colour2 = 0, colour3 = 0;
  int strokeW = 5;

  void display(int stroke1, int stroke2, int stroke3, int stroke4) {

    noStroke();
    fill(128, 128, 128);
    rect(0, 600, 1000, 100);
    textSize(20);
    fill(255, 255, 255);
    text("Colour selection", 108, 625);
    text("Thickness selection", 530, 625);
    drawColours(0, 0, 0, 50, 630);
    drawColours(255, 0, 0, 80, 630);
    drawColours(0, 255, 0, 110, 630);
    drawColours(0, 0, 255, 140, 630);
    drawColours(0, 128, 255, 170, 630);
    drawColours(0, 102, 0, 200, 630);
    drawColours(255, 0, 127, 230, 630);
    drawColours(96, 96, 96, 260, 630);
    drawColours(255, 255, 0, 290, 630);
    drawColours(255, 204, 153, 320, 630);
    drawColours(204, 102, 0, 50, 660);
    drawColours(255, 204, 204, 80, 660);
    drawColours(50, 50, 50, 110, 660);
    drawColours(0, 25, 51, 140, 660);
    drawColours(102, 102, 0, 170, 660);
    drawColours(102, 0, 0, 200, 660);
    drawColours(255, 153, 204, 230, 660);
    drawColours(153, 255, 255, 260, 660);
    drawColours(102, 0, 204, 290, 660);
    drawColours(204, 255, 229, 320, 660);

    stroke(color1, color2, color3);
    strokeWeight(stroke1);
    line(450, 643, 590, 643);
    strokeWeight(stroke2);
    line(450, 675, 590, 675);
    strokeWeight(stroke3);
    line(650, 643, 800, 643);
    strokeWeight(stroke4);
    line(650, 675, 800, 675);
    noFill();
    strokeWeight(2);
    stroke(92, 92, 92);
    rect(420, 630, 200, 30);
    rect(420, 660, 200, 30);
    rect(620, 630, 200, 30);
    rect(620, 660, 200, 30); 

    textSize(18);
    fill(255, 255, 255);
    text("Erase", 843, 625);
    text("Save", 925, 625);
    stroke(92, 92, 92);
    fill(128, 128, 128);
    rect(830, 630, 70, 60);
    rect(910, 630, 70, 60); 
    image(eraserIcon, 840, 635);
    image(saveIcon, 920, 635);

    if (mousePressed && mouseX >= 830 && mouseX <= 900 && mouseY >= 630 && mouseY <= 690 && state == 1 && erasing == false 
      || mousePressed && mouseX >= 830 && mouseX <= 900 && mouseY >= 630 && mouseY <= 690 && state == 2 && erasing == false) {
      erasing = true;
    } 

    if (mousePressed && mouseX >= 0 && mouseY >= 0 && mouseX <= 859 && mouseY <= 600) {
      selectColour();
    }

    changeColour(50, 79, 630, 660, 0, 0, 0);
    changeColour(80, 109, 630, 660, 255, 0, 0);
    changeColour(110, 139, 630, 660, 0, 255, 0);
    changeColour(140, 169, 630, 660, 0, 0, 255);
    changeColour(170, 199, 630, 660, 0, 128, 255);
    changeColour(200, 229, 630, 660, 0, 102, 0);
    changeColour(230, 259, 630, 660, 255, 0, 127);
    changeColour(260, 289, 630, 660, 96, 96, 96);
    changeColour(290, 319, 630, 660, 255, 255, 0);
    changeColour(320, 349, 630, 660, 255, 204, 153);
    changeColour(50, 79, 661, 690, 204, 102, 0);
    changeColour(80, 109, 661, 690, 255, 204, 204);
    changeColour(110, 139, 661, 690, 50, 50, 50);
    changeColour(140, 169, 661, 690, 0, 25, 51);
    changeColour(170, 199, 661, 690, 102, 102, 0);
    changeColour(200, 229, 661, 690, 102, 0, 0);
    changeColour(230, 259, 661, 690, 255, 153, 204);
    changeColour(260, 289, 661, 690, 153, 255, 255);
    changeColour(290, 319, 661, 690, 102, 0, 204);
    changeColour(320, 349, 661, 690, 204, 255, 229);
  }

  void changeColour(int xGRT, int xLES, int yGRT, int yLES, color col1, color col2, color col3) {
    if (mousePressed && mouseX >= xGRT && mouseX <= xLES && mouseY >= yGRT && mouseY <= yLES) {
      erasing = false;
      color1 = col1; 
      color2 = col2; 
      color3 = col3;
    }
  }

  void drawColours(int sCol1, int sCol2, int sCol3, int recPosX, int recPosY) {
    strokeWeight(2);
    stroke(92, 92, 92); 
    fill(sCol1, sCol2, sCol3);
    rect(recPosX, recPosY, 30, 30);
  }

  void selectColour() {
    strokeWeight(strokeW);
    stroke(color1, color2, color3);

    if (erasing == false) {
      point(mouseX, mouseY);
    } else if (erasing == true) {
      noStroke();
      fill(205, 205, 205);
      rect(mouseX, mouseY, -20, -20);
    }
  }
}

