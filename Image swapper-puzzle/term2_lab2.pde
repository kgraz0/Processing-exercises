
// This will store the images we load from file
PImage [][] images;
PImage tempPic;
int tempX, tempY, newPX, newPY;
int posX = 0;
int posY = 0;
boolean check = true;

void setup()
{
  size(400, 400);
  // this loads the folder "images" from 
  // inside your data folder (that is what
  // "dataPath" does).
  File file = new File(dataPath("ScrambledImages"));
  println(file);
  // an array of file names within that folder
  String [] files = file.list();
  println(files.length);

  // this part removes any files that are not 
  // jpg files
  // we loop through the array backwards 
  // (because we will be removing elements)
  for (int i = files.length-1; i >= 0; i--)
  {
    // find the extension of the file.
    // this is the final 4 characters of the filename
    // so we have to get the substring that goes from 
    // 4 charcters before the end to the end
    String extension = files[i].substring(files[i].length()-4, files[i].length());
    // check if the extension is "."
    if (!(extension.equals(".png")))
    {
      // remove the elment. 
      // we do this by getting the array of all elements before
      // the current element and the array of all elements
      // after the current one and then putting them together. 
      // (first we have to check if the current element is the last element
      // if so we do something a bit different)
      if (i+1 < files.length)
      {
        // get the parts before and after the current element
        // using the subset command (look if up if you don't 
        // understand this code)
        String [] firstPart = subset(files, 0, i);
        String [] secondPart = subset(files, i+1, files.length-i-1);
        // put these together using the concat command
        files = concat(firstPart, secondPart);
      } else 
      {
        // if the current element is the last 
        // element we can just use the subset of
        // elements before the current element. 
        files = subset(files, 0, i);
      }
    }
  }

  // create an array the same size as the 
  // array of files
  images = new PImage[files.length/4][files.length/4];
  println(images.length);
  // iterate through the array of files
  for (int i = 0; i < images.length; i++)
  {
    for (int j = 0; j < images[i].length; j++)
    {
      int fileIndex = images[1].length*i+j;
      if (fileIndex < files.length)
        images[i][j] = loadImage("ScrambledImages/"+files[fileIndex]);
    }
  }
}

void draw()

{
  // iterate through all the images
  // you need a nested loop to iterate 
  // over a 2D array
  for (int i = 0; i < images.length; i++)
  {
    for (int j = 0; j < images[i].length; j++)
    {
      // draw the image 
      // multiply i and j by 40 to space them out
      image(images[i][j], j*100, i*100, 100, 100);
    }
  }
}

void mousePressed()
  {
    // when mouse is first pressed it will store the positions of the mouse, then  it will divide it by 100 giving
    // new integer values that represent the position in the array where the picture is stored.
    // Then the pivture is stored in a temporary varable.
    
    if (check == true)
    {
      posX = mouseX;
      posY = mouseY;
      tempY = (posX/100);
      tempX = (posY/100);
      println(images[tempX][tempY]);
      println(tempX+" "+tempY);
      tempPic = images[tempX][tempY];
      check = false;
    }
    else if (check == false)
      {
        // this second statement gets the position in the array where the second picture is stored and the images are swaped
        // from new position to old position and from temp to old postion  
        newPY = mouseX/100;
        newPX = mouseY/100;
        images[tempX][tempY] = images[newPX][newPY];
        images[newPX][newPY] = tempPic;
        println(newPX+" "+newPY);
        check = true;
      }
    }
 

