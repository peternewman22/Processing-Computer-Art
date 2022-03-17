class airport{
    PVector pos;
    float s = 10;

    airport(float x, float y){
        pos = new PVector(x,y);
    }

    show(){
        fill(255,0,255);
        ellipse(pos.x, pos.y, s, s);
    }
}