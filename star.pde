class star {
  float majorAxis;
  float minorAxis;
  float theta;
  float delta=0.01;

  star(float majorAxislen, float widthheightratio) {
    majorAxis=majorAxislen;
    minorAxis=majorAxislen*widthheightratio;
    theta=random(2*PI);
  }
  void display() {
    float x=(majorAxis/2)*cos(theta);
    float y=(minorAxis/2)*sin(theta);
    fill((theta*20)%255,255,255);
    noStroke();
    ellipse(x, y, 3, 3);
  }
  void update() {
    theta+=delta;
  }
}
