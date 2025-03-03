class Water {
  
  PVector pos,velocity;
  PImage img;
  
  
  Water(float x,float y) {
    img = loadImage("data/Images/Water.png");
    pos = new PVector(x,y);
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
