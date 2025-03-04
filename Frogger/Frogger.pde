Player player;
Water[][] water = new Water[25][5];
Platform[][] platforms = new Platform[7][5];
Street[][] streets = new Street[25][4];
Cars[][] cars = new Cars[8][4];
Grass[][] grass = new Grass[25][2];
LilyPad[] lilypads = new LilyPad[5];
Collision coll = new Collision();
int platform_change = 5;


void setup() {
  fullScreen();
  imageMode(CENTER);
  background(0);
  player = new Player();
  SpawnTiles();
}


void draw() {
  background(0);
  
  
  for (int y = 0; y < 4; y++) { 
  for (int i = 0; i < streets.length; i++){
    streets[i][y].display();
  }
  }
  
  for (int y = 0; y < 4; y++) { 
  for (int i = 0; i < cars.length; i++){
    cars[i][y].display();

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
  
  for (int y = 0; y < 2; y++) { 
  for (int i = 0; i < grass.length; i++){
    grass[i][y].display();
    
  }
  }
  
  for (int i = 0; i < lilypads.length; i++) {
    lilypads[i].display();
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
  
  for (int i = 0; i < lilypads.length; i++) {
    if (coll.col(player.pos,lilypads[i].pos,100)) {
      player.on_platform = true;
      platform_change += 1;
      SpawnTiles();
      lilypads[i].img = loadImage("data/Images/LilyPadPlayer.png");
      player.pos = new PVector(1100,1400);
    } else {
      player.on_platform = false; 
    }
  }
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < water.length; i++){
    if (coll.col(player.pos,water[i][y].pos,30) && player.on_platform == false && player.velocity.x == 0) {
      player.dead = true;
    }  
  }
  }
  
  
  
  for (int y = 0; y < 4; y++) { 
  for (int i = 0; i < cars.length; i++){
    if (coll.col(player.pos,cars[i][y].pos,70)) {
      player.dead = true;
    }  
  }
  }
  
  for (int y = 0; y < 2; y++) { 
  for (int i = 0; i < grass.length; i++){
    if (coll.col(player.pos,grass[i][y].pos,70) && player.on_platform == false) {
      player.dead = true;
    }  
  }
  }

}



void SpawnTiles() {
  for (int y = 0; y < 4; y++) { 
  for (int i = 0; i < cars.length; i++){
    cars[i][y] = new Cars(i * 128 * round(random(1,5)),y * 128 + 900);

  }
  }
  
  for (int y = 0; y < 4; y++) { 
  for (int i = 0; i < streets.length; i++){
    streets[i][y] = new Street(i * 128,y * 128 + 900);
    
  }
  }
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < water.length; i++){
    water[i][y] = new Water(i * 128,y * 128 + 260);

  }
  }
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < platforms.length; i++){
    platforms[i][y] = new Platform(i * 128 * platform_change,y * 128 + 260);

  }
  } 

  for (int i = 0; i < lilypads.length; i++){
    lilypads[i] = new LilyPad(i * 128 * 4 + 220,134);

  }
  
  
  for (int y = 0; y < 2; y++) { 
  for (int i = 0; i < grass.length; i++){
    grass[i][y] = new Grass(i * 128,y * 128 + 4);

  }
  } 
}
  
  
