class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Particle(PVector l) {
    location = l.get();
    
    
    acceleration = new PVector(0, 0.05,0.01);
    velocity = new PVector(random(-100, 100), random(-200, 0), random(-500,500));
  }
  

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  
  void display() {
    stroke(255);
    point(location.x, location.y,location.z);
  }
}
