class Grass extends Platform {
  
  Grass(int x,int y) {
    super(x,y);
    img = loadImage("data/Images/Grass.png");
    pos = new PVector(x,y);
  }
  
  void display() {
    image(img,pos.x,pos.y);
  }
  
  
}
  
  
    
