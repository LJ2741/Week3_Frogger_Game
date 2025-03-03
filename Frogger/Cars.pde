class Cars {
  
  PVector pos,velocity;
  PImage img;
  
  Cars(int x,int y) {
    pos = new PVector(x,y);
    velocity = new PVector(4,0);
    img = loadImage("data/Images/car.png");
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
