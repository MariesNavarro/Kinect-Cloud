import processing.opengl.*;
Particle p;

public int  zoom = 640;
public int rotacion_Y = -15;
public int rotacion_X = 180;
public int eje_y = 300;
public int eje_x = 660;


Table table;

void setup() {
  size(1000, 600, OPENGL);
  table = loadTable("points2.csv", "header");
}

void draw() {
  background(0);
  translate(eje_x, eje_y, zoom);
  rotateX(radians(rotacion_X));
  rotateY(radians(rotacion_Y));
  for (TableRow row : table.rows()) {
    float x = row.getFloat("x");
    float y = row.getFloat("y");
    float z = row.getFloat("z");
    p = new Particle(new PVector(x, y, z));
    p.display();
  }
}

