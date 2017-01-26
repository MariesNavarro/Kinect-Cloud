import processing.opengl.*;
import SimpleOpenNI.*;
import controlP5.*;
import unlekker.util.*;
import unlekker.modelbuilder.*;
import ec.util.*;
import java.text.SimpleDateFormat;
import java.util.Date;

SimpleOpenNI kinect;

ControlP5 control;
Accordion interfaz;

UGeometry model;
UVertexList vertexList;

public int calidad =2;
public int depth = 2000;

public int  zoom = 640;
public int rotacion_Y = -15;
public int rotacion_X = 180;
public int eje_y = 300;
public int eje_x = 660;

PrintWriter pointsTxt;
PrintWriter pointsCsv;

boolean toggleValue = false;
boolean write = false;
boolean scanning = false;

//Toggle
boolean toggleTXT = true;
boolean toggleCSV = true;
boolean toggleSTL = true;

void setup() {
  size(1024, 768, OPENGL);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  model = new UGeometry();
  vertexList = new UVertexList();

  //Interfaz
  gui();
}

void draw() {
  kinect.update();
  background(0);
  stroke(255); 

  pushMatrix();
  translate(eje_x, eje_y, zoom);
  rotateX(radians(rotacion_X));
  rotateY(radians(rotacion_Y));

  PVector [] depthPoints = kinect.depthMapRealWorld();

  if (scanning) {
    if (toggleSTL) {
    model.beginShape(TRIANGLES);
    }
  }

  if (write) {
    if (toggleTXT) {
      pointsTxt = createWriter("data/points"+frameCount+".txt");
    }
    if (toggleCSV) {
      pointsCsv = createWriter("data/points"+frameCount+".csv");
      //Header
      pointsCsv.println("x"+","+"y"+","+"z");
    }
  }


  for (int x =0; x <640 -calidad; x+=calidad) {
    for (int y = 0; y < 480 -calidad; y+=calidad) {
      if (scanning) {
        if (toggleSTL) {
          int nw = x + y * 640;
          int ne =(x + calidad) + y * 640;
          int sw = x + (y + calidad) * 640;
          int se = (x + calidad) + (y + calidad) *640;

          model.addFace(new UVec3(depthPoints[nw].x, depthPoints[nw].y, depthPoints[nw].z), 
          new UVec3(depthPoints[ne].x, depthPoints[ne].y, depthPoints[ne].z), 
          new UVec3(depthPoints[sw].x, depthPoints[sw].y, depthPoints[sw].z));

          model.addFace(new UVec3(depthPoints[ne].x, depthPoints[ne].y, depthPoints[ne].z), 
          new UVec3(depthPoints[se].x, depthPoints[se].y, depthPoints[se].z), 
          new UVec3(depthPoints[sw].x, depthPoints[sw].y, depthPoints[sw].z));
        }
      }
      PVector currentPoint = depthPoints[x + (y * 640)];
      if (currentPoint.z < depth) {
        point(currentPoint.x, currentPoint.y, currentPoint.z);
        if (write) {
          if (currentPoint.x <= -1 || currentPoint.x >= 1 && currentPoint.y <= -1 || currentPoint.y >= 1 && currentPoint.z <= -1 || currentPoint.z >= 1) {
            if (toggleTXT) {
              pointsTxt.println(currentPoint);
            }
            if (toggleCSV) {
              pointsCsv.println(currentPoint.x + "," + currentPoint.y + "," + currentPoint.z);
            }
          }
        }
      }
    }
  }  
  if (scanning) {
    if (toggleSTL) {
    model.endShape();
    SimpleDateFormat logFileFmt = 
      new SimpleDateFormat("'data/scan_'MMdd-HHmmss'.stl'");
    model.writeSTL(this, logFileFmt.format(new Date()));
    scanning = false;
    }
  } 

  if (write) {
    if (toggleTXT) {
      pointsTxt.flush();
      pointsTxt.close();
    }
    if (toggleCSV) {
      pointsCsv.flush();
      pointsCsv.close();
    }
    write = false;
  }
  popMatrix();
}

