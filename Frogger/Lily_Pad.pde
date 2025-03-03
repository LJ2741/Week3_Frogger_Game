class LilyPad extends Platform {
  
  LilyPad(int x,int y) {
    super(x,y);
    img = loadImage("data/Images/LilyPad.png");
    pos = new PVector(x,y);
  }
  
  void display() {
    image(img,pos.x,pos.y);
  }
}
