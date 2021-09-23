import com.hamoid.*;

int n=4000;
int m=550;
float rotation_gradient=PI/1.5*n;
float widthheightratio=0.5;
float sizediff=0.025;
float majoraxisminlen=10;
float majoraxislen;
star[] stars;
particle[] particles;
VideoExport videoExport;
void setup() {
  fullScreen();
  colorMode(HSB);
  stars=new star[n];
  for (int i=0; i<stars.length; i++) {
    majoraxislen=majoraxisminlen*i*sizediff;
    stars[i]=new star(majoraxislen, widthheightratio);
  }
  particles=new particle[m];
  for (int j=0; j<particles.length; j++) {
    particles[j]=new particle();
  }
  videoExport = new VideoExport(this, "Spiral_galaxy.mp4");
  videoExport.setQuality(95, 128);
  videoExport.setFrameRate(60);  
  videoExport.startMovie();
}
void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  for (int i=0; i<stars.length; i++) {
    rotate(rotation_gradient);
    stars[i].display();
    stars[i].update();
  }
  popMatrix();
  for (int j=0; j<particles.length; j++) {
    particles[j].update();
    particles[j].edges();
  }
  videoExport.saveFrame();
}
void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
} 
