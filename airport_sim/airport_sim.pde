int systemSize = 10;
float minSeparation;
Airport[] system;

void setup(){
    size(600, 600);
    minSeparation = width/10;
    system = new Airport[systemSize];
    initSystem();
    
    
}

void draw(){
    background(0);
    for(Airport a : system){
        a.show();
    }

}

void initSystem(){
    system[0] = new Airport(new PVector(random(width), random(height)));
    for(int i = 1; i < systemSize; i++){
        PVector p = findValidSpawnPoint(i);
        system[i] = new Airport(p);
    }
}

PVector findValidSpawnPoint(int ix){
    boolean isValid = false;
    PVector candidate;
    while(!isValid){
        candidate = new PVector(random(width), random(height));
        isValid = true;
        for(int i = 0; i < ix; i++){
            if(PVector.dist(candidate.pos, system[i].pos) < minSeparation){
                isValid = false;
                break;
            }
        }
    }
    return candidate;
}