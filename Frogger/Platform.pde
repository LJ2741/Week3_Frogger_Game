class Platform { 
  
  PVector pos,velocity;
  PImage img;
  Platform(float x,float y) {
    pos = new PVector(x,y);
    img = loadImage("data/Images/Platform.png");
    if (y == 289 || y == 289 + (64 * 2)) {
      velocity = new PVector(4,0);
    } else {
      velocity = new PVector(-2,0);
    }
  }
  
  
  void display() {
    pos.add(velocity);
    movement();
    image(img,pos.x,pos.y);
    
  }
  
  void movement() {
    if (pos.x < -250) {
      pos.x = width + 100;
    }
    
    if (pos.x > width + 250) {
      pos.x = -100;
    }
  }
      
}
