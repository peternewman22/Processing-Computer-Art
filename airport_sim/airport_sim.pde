int systemSize = 1;
Airport[] system;

void setup(){
    size(600, 600);
    system = new Airport[systemSize];
    system[0] = new Airport(width/2, height/2);
}

void draw(){
    background(0);
    for(a : system){
        a.show();
    }

}