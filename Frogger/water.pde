class Water {
  
  PVector pos,velocity;
  PImage img;
  
  
  Water(float x,float y) {
    img = loadImage("data/Images/Water.png");
    pos = new PVector(x,y);
    if (y == 289 || y == 289 + (64 * 2)) {
      velocity = new PVector(4,0);
    } else {
      velocity = new PVector(-2,0);
    }
  }
  
  
  
  void display() {
    pos.add(velocity);
    image(img,pos.x,pos.y);
    movement();
  }
  
  void movement() {
    if (pos.x < -65) {
      pos.x = width + 65;
    }
    
    if (pos.x > width + 65) {
      pos.x = -65;
    }
  }
  
  
}
