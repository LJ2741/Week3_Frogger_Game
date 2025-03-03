class Player {
  
  PVector pos,velocity;
  PImage img;
  boolean dead,on_platform;
  Player() {
    pos = new PVector(1100,1400);
    velocity = new PVector(0,0);
    img = loadImage("data/Images/Player.png");
    dead = false;
    on_platform = false;
  }
  
  void display() {
    if (dead == false) {
      pos.add(velocity);
      image(img,pos.x,pos.y);
      
      if (on_platform == false){
        velocity = new PVector(0,0);
      }
      
      if (pos.x < 0 || pos.x > displayWidth || pos.y < 0 || pos.y > displayHeight) {
        dead = true;
      }
    }

  }
    
    
}
  
  
