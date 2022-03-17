class Airport{
    PVector pos;
    float s = 10;

    Airport(PVector pos_){
        pos = pos_.copy();
    }

    void show(){
        fill(255,255,0);
        ellipse(pos.x, pos.y, s, s);
    }
}