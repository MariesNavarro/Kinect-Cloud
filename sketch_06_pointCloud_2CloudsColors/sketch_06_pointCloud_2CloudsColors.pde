import processing.opengl.*;
import SimpleOpenNI.*;

SimpleOpenNI kinect;

void setup(){
  size(1024,768, OPENGL);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
}

void draw(){
  background(0);
  kinect.update();
  
  translate(width/2,height/2,-500);
  rotate(radians(180));
  
  //stroke(48,240,19);
  //stroke(19,240,227);
  //stroke(139,27,141);
  //depth data as 3D points insted of a simple array we store on a PVector array 
  PVector[] depthPoints1 = kinect.depthMapRealWorld();
  for(int i = 0; i <depthPoints1.length; i+=3){
    PVector currentPoint = depthPoints1[i];
    //draw the point
    stroke(19,240,227);
    point(currentPoint.x, currentPoint.y, currentPoint.z);

  }
  
  PVector[] depthPoints2 = kinect.depthMapRealWorld();
  for(int i = 0; i <depthPoints2.length; i+=3){
    PVector currentPoint = depthPoints2[i];
    //draw the point
    stroke(229,241,26);
    point(currentPoint.x + 10, currentPoint.y +10, currentPoint.z + 10);

  }
}




