class particle {
  float Noise;
  PVector location;
  PVector velocity;
  float vel=25;
  float val=0.5;
  particle() {
    location=new PVector(random(width), random(height));
    velocity=new PVector(0, 0);
  }
  void update() {
    Noise=noise(location.x*val, location.y*val)*4*PI;
    velocity=PVector.fromAngle(Noise);
    velocity.setMag(vel);
    location.add(PVector.div(velocity, frameRate));
    display();
  }
  void display() {
    fill((Noise*25)%255,255,255);
    noStroke();
    ellipse(location.x, location.y, 2, 2);
  }
  void edges() {
    if (location.x<0) velocity.x*=-1;
    if (location.x>width) velocity.x*=-1;
    if (location.y<0) velocity.y*=-1;
    if (location.y>height) velocity.y*=-1;
  }
}
