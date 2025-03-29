class Player {
  
  PVector pos,velocity;
  PImage img;
  boolean dead,on_platform;
  int highscore = 0;
  int score = 0;
  JSONObject json;
  Player() {
    pos = new PVector(width/2 + 32,740);
    velocity = new PVector(0,0);
    img = loadImage("data/Images/PlayerUp.png");
    dead = false;
    on_platform = false;
    json = loadJSONObject("data/highscore.JSON");
    highscore = json.getInt("highscore");
  }
  
  void display() {
    if (dead == false) {
      pos.add(velocity);
      image(img,pos.x,pos.y);
      
      if (player.pos.x < 0 || player.pos.x > width || player.pos.y < 0 || player.pos.y > height) {
        playerDeath();
      }
      
      if (on_platform == false){
        velocity = new PVector(0,0);
      } 
      
    } else {
      setHighscore();
    }
    

  }
  
  void movement() {
    if (key == 'a') {
      pos.x -= 64;
      player.img = loadImage("data/Images/PlayerLeft.png");

    } else if (key == 'w') {
      pos.y -= 64;
      img = loadImage("data/Images/PlayerUp.png");
    
    } else if (key == 'd') {
      pos.x += 64;
      img = loadImage("data/Images/PlayerRight.png");
    
    } else if (key == 's') {
      pos.y += 64;
      img = loadImage("data/Images/PlayerDown.png");
      
    }
    
  }
  
  void setHighscore() {
  highscore = score;
  json = loadJSONObject("data/highscore.JSON");
  json.setInt("highscore",highscore);
  saveJSONObject(json,"data/highscore.JSON");
  }
}
  
  
