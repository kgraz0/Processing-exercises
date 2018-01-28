sidePane sidepane; // to call different panels
bottomPane bottompane; // to call different panels
PImage drawingCursor, penIcon, eraserCursor, eraserIcon, brushCursor, brushIcon, videoIcon, saveIcon; // to change cursor when different screens are selected
int state = 1; 
color color1, color2, color3;
boolean erasing = false;


void setup() {
  size(1000, 700, P3D); //added P3D for future program additions
  sidepane = new sidePane(); // object created for sidePane class
  bottompane = new bottomPane(); // object created for bottomPane class
  drawingCursor = loadImage("penicon2.png"); // load the image into the variable
  penIcon = loadImage("penicon.png");
  brushCursor = loadImage("paintbrushicon2.png");
  brushIcon = loadImage("paintbrushicon.png");
  eraserCursor = loadImage("erasericon2.png");
  eraserIcon = loadImage("erasericon.png");
  videoIcon = loadImage("videoicon.png");
  saveIcon = loadImage("saveicon.png");
  penIcon.resize(100, 100);
  brushIcon.resize(100, 100);
  videoIcon.resize(100, 100); 
  eraserIcon.resize(50, 50); 
  saveIcon.resize(50, 50);
}

void draw() {
  sidepane.display();

  if (mouseX >= 0 && mouseY >= 0 && mouseX <= 859 && mouseY <= 600) {
    if (erasing == false && state == 1) {
      cursor(drawingCursor, 0, 0);
    } else if (erasing == true) {
      cursor(eraserCursor, 0, 0);
    } 
    if (erasing == false && state == 2) {
      cursor(brushCursor, 0, 0);
    }
  } else if (mouseX >= 860 || mouseY > 600) {
    cursor(CROSS);
  } 

  if (state == 1) {
    bottompane.display(2, 4, 5, 7);
  } else if (state == 2) {
    bottompane.display(10, 12, 17, 25);
  }
}

void mousePressed() {
  if (mouseX >= 860 && mouseY >= 0 && mouseX <= 1000 && mouseY <= 200) {
    state = 1;
    erasing = false;
  } else if (mouseX >= 860 && mouseY >= 201 && mouseX <= 1000 && mouseY <= 400) {
    state = 2;
    erasing = false;
  }

  if (mouseX >= 420 && mouseX <= 620 && mouseY >= 630 && mouseY <= 660 && state == 1) {
    erasing = false;
    bottompane.strokeW = 2;
  } else if (mouseX >= 420 && mouseX <= 620 && mouseY >= 661 && mouseY <= 690 && state == 1) {
    erasing = false;
    bottompane.strokeW = 4;
  } else if (mouseX >= 621 && mouseX <= 820 && mouseY >= 631 && mouseY <= 660 && state == 1) {
    erasing = false;
    bottompane.strokeW = 5;
  } else if (mouseX >= 621 && mouseX <= 820 && mouseY >= 661 && mouseY <= 690 && state == 1) {
    erasing = false;
    bottompane.strokeW = 7;
  } else if (mouseX >= 420 && mouseX <= 620 && mouseY >= 630 && mouseY <= 660 && state == 2) {
    erasing = false;
    bottompane.strokeW = 10;
  } else if (mouseX >= 420 && mouseX <= 620 && mouseY >= 661 && mouseY <= 690 && state == 2) {
    erasing = false;
    bottompane.strokeW = 12;
  } else if (mouseX >= 621 && mouseX <= 820 && mouseY >= 631 && mouseY <= 660 && state == 2) {
    erasing = false;
    bottompane.strokeW = 17;
  } else if (mouseX >= 621 && mouseX <= 820 && mouseY >= 661 && mouseY <= 690 && state == 2) {
    erasing = false;
    bottompane.strokeW = 25;
  }

  if (mouseX >= 910 && mouseY >= 630 && mouseX < 980 && mouseY <= 690 && state == 1
    || mouseX >= 910 && mouseY >= 630 && mouseX < 980 && mouseY <= 690 && state == 2) {
    PImage image  = get(0, 0, 859, 600);
    image.save("test.jpg");
    println("image saved");
  }
}

