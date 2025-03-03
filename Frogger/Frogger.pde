Player player;
Water[][] water = new Water[25][5];
Platform[][] platforms = new Platform[7][5];
SideWalk[][] sidewalks = new SideWalk[25][5];
Street[][] streets = new Street[25][5];
Collision coll = new Collision();

void setup() {
  fullScreen();
  imageMode(CENTER);
  background(0);
  player = new Player();
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < sidewalks.length; i++){
    sidewalks[i][y] = new SideWalk(i * 128,y * 128 * 2 + 900);

  }
  }
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < streets.length; i++){
    streets[i][y] = new Street(i * 128,y * 128 * 2 + 1025);

  }
  }
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < water.length; i++){
    water[i][y] = new Water(i * 128,y * 128 + 260);

  }
  }
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < platforms.length; i++){
    platforms[i][y] = new Platform(i * 128 * 3,y * 128 + 260);

  }
  } 
}


void draw() {
  background(0);
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < sidewalks.length; i++){
    sidewalks[i][y].display();
    streets[i][y].display();

  }
  }
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < water.length; i++){
    water[i][y].display();
  }
  }
  
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < platforms.length; i++){
    platforms[i][y].display();
    
  }
  }
  
  collison();
  player.display();
}

void keyPressed() {
    if (key == 'a') {
      player.pos.x -= 50;
    
    } else if (key == 'w') {
      player.pos.y -= 125;
    
    } else if (key == 'd') {
      player.pos.x += 50;
    
    } else if (key == 's') {
      player.pos.y += 125;
    }
}

void collison() {
  

  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < platforms.length; i++){
    if (coll.col(player.pos,platforms[i][y].pos,100)) {
      player.on_platform = true;
      player.velocity = platforms[i][y].velocity;
    } else {
      player.on_platform = false;
    }
    
  }
  }
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < water.length; i++){
    if (coll.col(player.pos,water[i][y].pos,30) && player.on_platform == false && player.velocity.x == 0) {
      player.dead = true;
    }  
  }
  }

}
  
  
