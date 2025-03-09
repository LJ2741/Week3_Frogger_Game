class Player {
  
  PVector pos,velocity;
  PImage img;
  boolean dead,on_platform;
  int highscore = 0;
  int score = 0;
  JSONObject json;
  Player() {
    pos = new PVector(1150,1410);
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
      
      if (on_platform == false){
        velocity = new PVector(0,0);
      }
      
      if (pos.x < 0 || pos.x > displayWidth || pos.y < 0 || pos.y > displayHeight) {
        dead = true;
      }
    } else {
      setHighscore();
    }

  }
  
  void movement() {
    if (key == 'a') {
      pos.x -= 128;
      player.img = loadImage("data/Images/PlayerLeft.png");

    } else if (key == 'w') {
      pos.y -= 128;
      img = loadImage("data/Images/PlayerUp.png");
    
    } else if (key == 'd') {
      pos.x += 128;
      img = loadImage("data/Images/PlayerRight.png");
    
    } else if (key == 's') {
      pos.y += 128;
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
  
  
