import processing.opengl.*;
import peasy.*;
PeasyCam cam;

int profundidad = 50;
int skip = 10;

PrintWriter puntos;
boolean escribe = false;

void setup() {
  size(600, 600, OPENGL); 
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw() {
  background(255);
  stroke(255, 0, 0);
  rotateX(-.5);
  rotateY(-.5);

  if(escribe){
    puntos = createWriter("data/puntos.csv");
  }
  pushMatrix();
  translate(-200,100,-500);
  for (int x = 0; x <200; x+=skip) {
    for (int y = 0; y <200; y+=skip) {
      for (int z = 0; z < 200; z+=skip) {
        PVector currentPoint = new PVector(x,y,z);
        point(currentPoint.x, currentPoint.y, currentPoint.z);
        if(escribe){
          puntos.println(str(currentPoint.x) + "," + str(currentPoint.y) + "," + str(currentPoint.z));
        }
      }
    }
  }
  popMatrix();
  if(escribe){
    puntos.flush();
    puntos.close();
    escribe = false;
  }
}

void keyPressed(){
  if(key ==' '){
  escribe = true;
  }
}
