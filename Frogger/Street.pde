class Street extends Platform {

  
  
  Street(int x,int y) {
    super(x,y);
    img = loadImage("data/Images/Streets.png");
    pos = new PVector(x,y);
    velocity = new PVector(0,0);
  }
  
  
  void display() {
    image(img,pos.x,pos.y);
  }
}
    
  
