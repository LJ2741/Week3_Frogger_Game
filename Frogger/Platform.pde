class Platform { 
  
  PVector pos,velocity;
  PImage img;
  
  Platform(float x,float y) {
    pos = new PVector(x,y);
    img = loadImage("data/Images/Platform.png");
    if (y == 260 || y == 516 || y == 772) {
      velocity = new PVector(2,0);
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
    if (pos.x < -250) {
      pos.x = displayWidth + 100;
    }
    
    if (pos.x > displayWidth + 250) {
      pos.x = -100;
    }
  }
    
}
