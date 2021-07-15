import controlP5.*;

/* 
1. update the portrait art on one side of the screen and the new art piece on the other
2. Set up sliders for the number of sampling points
3. Set up sliders for the position of the sampling points
3. update boxes on the screen for the sampling points
4. Grab those pixels and recompose on the right side
*/

PImage src;
ControlP5 cp5;
Slider boxWidthSlider, boxRowSlider, boxColSlider, boxSpacingSlider, xOffsetSlider, yOffsetSlider, rowSlider, colSlider;

int boxRows, boxCols, boxWidth, boxSpacing, xOffset, yOffset;

PVector[][] boxCoords;
String filePath;

  


void settings(){
  //selectInput("Please select an image","fileSelected");
  src = loadImage("GeorgeWashington.jpg");
  size(src.width*2,src.height);
}

void setup(){
    boxRows = 15;
    boxCols = 15;
    boxCoords = new PVector[boxRows][boxCols];
    updateBoxCoords();
    stroke(255);
    strokeWeight(5);
    noFill();
    cp5 = new ControlP5(this);
    
    //boxWidth
    boxWidthSlider = cp5.addSlider("boxWidth")
      .setPosition(50, height-50)
      .setSize(200,20)
      .setRange(0, width/2/(boxRows + 1))
      .setValue(width/2/(boxRows*2 + 1));
    //xOffset
    xOffsetSlider = cp5.addSlider("xOffset")
      .setPosition(50,height-70)
      .setSize(200,20)
      .setRange(0,width/2)
      .setValue(0);
    //yOffset
    yOffsetSlider = cp5.addSlider("yOffset")
      .setPosition(50,height-90)
      .setSize(200,20)
      .setRange(0,height/2)
      .setValue(0);
    //Spacing --> to be translated to a percentage of boxWidth
    boxSpacingSlider = cp5.addSlider("boxSpacing")
      .setPosition(50,height-110)
      .setSize(500,20)
      .setRange(0,500)
      .setValue(200);
    //Number of Rows
    rowSlider = cp5.addSlider("boxRows")
      .setPosition(50,height-150)
      .setSize(200,20)
      .setRange(0,50)
      .setValue(10);
    //Number of Columns
    colSlider = cp5.addSlider("boxCols")
      .setPosition(50,height-130)
      .setSize(200,20)
      .setRange(0,50)
      .setValue(10);
      
    updateVariables();
}

void draw(){
    background(0);
    image(src, 0, 0);
    updateVariables();
    drawRectangles();
    updateSampledImage();

}

void updateVariables(){
  boxRows = int(boxRowSlider.getValue());
  boxCols = int(boxColSlider.getValue());
  boxWidth = int(boxWidthSlider.getValue());
  xOffset = int(xOffsetSlider.getValue());
  yOffset = int(yOffsetSlider.getValue());
  boxSpacing = int(boxSpacingSlider.getValue());
  

}


void updateBoxCoords(){
    for(int i = 0; i < boxRows; i++){
        for(int j = 0; j < boxCols; j++){
            boxCoords[i][j] = new PVector((2*i+1)*boxWidth + xOffset,(2*j+1)*boxWidth + yOffset);
        }
    }
}

void drawRectangles(){
    stroke(255);
    strokeWeight(1);
    noFill();
    for(int i = 0; i < boxRows; i++){
        for(int j = 0; j < boxCols; j++){
            PVector box = boxCoords[i][j];
            rect(box.x, box.y, boxWidth, boxWidth);
        }
    }
}

void updateSampledImage(){
    // this goes through the list of coordinates and copies that box onto the right side of the screen
    for(int i = 0; i < boxRows; i++){
        for(int j = 0; j < boxCols; j++){
            PVector box = boxCoords[i][j];
            copy(src,int(box.x), int(box.y),boxWidth,boxWidth, int(box.x) + width/2 - i*boxWidth, int(box.y) - j*boxWidth, boxWidth, boxWidth);
        }
    }
}

//void fileSelected(File selection) {
//  if (selection == null) {
//    println("Window was closed or the user hit cancel.");
//  } else {
//    println("User selected " + selection.getAbsolutePath());
//  }
//}
