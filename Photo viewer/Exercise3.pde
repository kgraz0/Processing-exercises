/*
Sources:
Inception: http://cdn.collider.com/wp-content/uploads/Inception-movie-poster-2.jpg
Rush Hour 3: http://2.bp.blogspot.com/-_2u7Q8RpCPA/UOUOO6-3TqI/AAAAAAAAA1I/hjawso_DJo8/s1600/Rush+Hour+3+-+2007+sljat.blogspot_com++2.jpg
Limitless: http://pencurimovie.cc/wp-content/uploads/2014/02/Limitless-UK-poster.jpg
Skyfall: http://www.007.com/wp-content/uploads/2012/05/SKY_DIGI_ONLN_TSR_1SHT_1_0514_RGB_300_1.jpg
Back to the Future: http://images5.fanpop.com/image/polls/1042000/1042136_1338502936438_full.jpg
Spiderman: http://cdn.collider.com/wp-content/uploads/amazing-spider-man-movie-poster.jpg
Saving Private Ryan: http://i.jeded.com/i/saving-private-ryan.19598.jpg
Ghostbusters: https://cdn.amctheatres.com/Media/Default/BlogPost/movie-news/Ghostbusters%20Poster.jpg
Iron Man: http://cdn.collider.com/wp-content/uploads/iron-man-3-international-poster.jpg
Scream: http://cdn.collider.com/wp-content/uploads/scream-4-movie-poster-03-large.jpg
Godzilla: http://www.heyuguys.com/images/2014/02/GZA_1SHT_MAIN_ONLINE_INTL.jpeg
Dark Knight: http://www.impawards.com/2008/dark_knight_ver12_xlg.html
*/

File file;
String [] files;
PImage [] imgs;
int picNumber = 0;
int timePassed = millis();
int timeLimit = 500;
boolean running = false;
String startStop = "STOP";
int startStopX = 113;

void setup() {
  size(300, 504);
  file = new File(dataPath(sketchPath() +"/data"));
  files = file.list();
  imgs = new PImage[files.length];
}


void draw() {
  background(255, 0, 0);
  for(int i = files.length-1; i >= 0; i--) {
     String extension = files[i].substring(files[i].length()-4, files[i].length());
     if(!(extension.equals(".png"))) {
       if(i+1 < files.length) {
         String [] firstPart = subset(files, 0, i);
         String [] secondPart = subset(files, i+1, files.length-i-1);
         files = concat(firstPart, secondPart);
       } 
       else {
         files = subset(files, 0, i);
       }}}
       
    // getting the images from data folder and loading them onto the screen
  for(int i = 0; i < 12; i++) {
    imgs[i] = loadImage(sketchPath()+"/data/"+files[i]);
    image(imgs[picNumber], 0, 0);
    }
    
    // drawing the rectangles for the controls
    fill(255);
    rect(0, 444, 100, 60);
    rect(100, 444, 100, 60);
    rect(200, 444, 100, 60);
    
    // writing the controls at the bottom
    fill(255, 0, 0);
    text("PREV", 13, 485);
    text(startStop, startStopX, 485);
    text("NEXT", 213, 485);
    textSize(30);
    
    
    int timeStart = millis() - timePassed;
    // program is launched, start slideshow
    if (!running && timeStart > timeLimit) {
     picNumber++;
     timePassed = millis();
    }
    
    // if the slideshow reaches the last image in array, go back to first and loop again
    if(picNumber>imgs.length-1) {
      picNumber = 0;
    }
}

void mouseClicked() {
  
   int timeStart = millis() - timePassed;
  // if the stop button is clicked, stop the program
  if (running == false && mouseX > 100 && mouseY > 444 && mouseX < 200 && mouseY < 504) {
    running = true;
    startStop = "GO";
    startStopX = 128;
  }
  // if prev button is clicked, go back by one image
  else if (running == true && mouseX > 0 && mouseY > 444 && mouseX < 100 && mouseY < 504) {
    picNumber -= 1;
  }
  // if next button is clicked, go forward by one image
  else if (running == true && mouseX > 200 && mouseY > 444 && mouseX < 300 && mouseY < 504) {
    picNumber += 1;
  }
  // if last image in array is reached and the next button is clicked again, it will change it to first image
  if(running == true && picNumber > 11) {
    picNumber = 0;
  }
  // if first image in array is reached and the prev button is clicked again, it will change it to last image
  else if(running == true && picNumber < 0) {
    picNumber = 11;
  }
  if(running == true && timeStart > timeLimit && mouseX > 100 && mouseY > 444 && mouseX < 200 && mouseY < 504) {
    running = !running;
    startStop = "STOP";
    startStopX = 113;
  } 
}