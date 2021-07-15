/* 
1. update the portrait art on one side of the screen and the new art piece on the other
2. Set up sliders for the number of sampling points
3. Set up sliders for the position of the sampling points
3. update boxes on the screen for the sampling points
4. Grab those pixels and recompose on the right side
*/
// TODO: Fix the position of the final image
//       Add Sliders for number of squares
//       Add Sliders for the gap between the squares
//       Add Sliders for the size of the squares --> change to CENTRE mode


PImage src;

int boxRows, boxCols, boxWidth;
int rightSideOffset;
int xOffset, yOffset;
PVector[][] boxCoords;

void settings(){
  src = loadImage("Susan and Bess.jpg");
  size(src.width*2,src.height);
}

void setup(){
    boxRows = 30;
    boxCols = 30;
    boxWidth = width/2/(boxRows*2+1);
    boxCoords = new PVector[boxRows][boxCols];
    rightSideOffset = width/2;
    updateBoxCoords();
    xOffset = 0;
    yOffset = 0;
    stroke(255);
    strokeWeight(5);
    noFill();
}

void draw(){
    background(0);
    image(src, 0, 0);
    drawRectangles();
    updateSampledImage();

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

void keyPressed() {
    if (key == CODED) {
        if (keyCode == LEFT) {
            xOffset -= 1;
        } else if (keyCode == RIGHT) {
            xOffset += 1;
        } else if (keyCode == UP) {
            yOffset -= 1;
        } else if (keyCode == DOWN){
            yOffset += 1;
        }
    }
    // On any keyPress, update the image
    updateBoxCoords();
}