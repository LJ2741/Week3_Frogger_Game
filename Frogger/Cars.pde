class Cars {
  
  PVector pos,velocity;
  PImage img;
  
  Cars(int x,int y) {
    pos = new PVector(x,y);
    if (y == 1028 || y == 1284) {
      img = loadImage("data/Images/carFlipped.png");
      velocity = new PVector(-2,0);
    } else {
      img = loadImage("data/Images/car.png");
      velocity = new PVector(4,0);
    }
  }
  
  
  void display() {
    pos.add(velocity);
    image(img,pos.x,pos.y);
    movement();
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
