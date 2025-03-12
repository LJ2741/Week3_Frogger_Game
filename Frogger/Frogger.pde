
// Variables for all tiles
Player player;
Water[][] water = new Water[18][5];
Platform[][] platforms = new Platform[7][5];
Street[][] streets = new Street[17][3];
Cars[][] cars = new Cars[4][3];
Grass[][] grass = new Grass[25][4];
LilyPad[] lilypads = new LilyPad[5];
Collision coll = new Collision();
// variables for timer and to change platforms
int platform_change = round(random(1,7));
int savedTime = millis();
int totalTime = 45000;
int lilypads_left; // keeps count of remaining lilypads
int level = 1;
void setup() {
  size(1000,800);
  textSize(40);
  imageMode(CENTER);
  textAlign(CENTER);
  background(0);
  player = new Player(); // creates the player 
  SpawnTiles(); // spawns all tiles except lily pad tiles
  for (int i = 0; i < lilypads.length; i++){ // spawns all lily pad tiles, this is seperate to avoid them being reset
    lilypads[i] = new LilyPad(i * 64 * 3 + 120,162); 

  }
}


void draw() {
  background(0);
  // these functions display all tiles
  for (int y = 0; y < 3; y++) { 
  for (int i = 0; i < streets.length; i++){
    streets[i][y].display();
  }
  }
  
  for (int y = 0; y < 3; y++) { 
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
  
  for (int y = 0; y < 4; y++) { 
  for (int i = 0; i < grass.length; i++){
    grass[i][y].display();
    
  }
  }
  
  for (int i = 0; i < lilypads.length; i++) {
    lilypads[i].display();
  }
  
  scoreDisplay();
  levelTracking();
  timer();
  collison();
  player.display();
}
// allows to player to only move when a button is pressed and then release to make them slower
void keyReleased() {
    player.movement();
}

void collison() {
  
  // this prevents the player from dying if they land on a platform
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < platforms.length; i++){
    if (coll.col(player.pos,platforms[i][y].pos,40)) {
      player.on_platform = true;
      player.velocity = platforms[i][y].velocity;
    } else {
      player.on_platform = false;
    }
    
  }
  }
  // timer is reset, tiles are randomized, and the lily pad the player lands on changes if the player wins
  
  for (int i = 0; i < lilypads.length; i++) {
    if (coll.col(player.pos,lilypads[i].pos,30)) {
      player.on_platform = true;
      savedTime = millis();
      platform_change += 1;
      lilypads_left += 1;
      player.score += 200; // increases score if the player wins
      SpawnTiles(); // respawns all tiles
      lilypads[i].pos = new PVector(0,-1000); // removes used lilypads
      player.pos = new PVector(width/2 + 32,740);
    } else {
      player.on_platform = false; 
    }
  }
  // kills the player if they are on water
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < water.length; i++){
    if (coll.col(player.pos,water[i][y].pos,30) && player.on_platform == false && player.velocity.x == 0) {
      player.dead = true;
    }  
  }
  }
  
  
  // kills player of they hit a car
  for (int y = 0; y < 3; y++) { 
  for (int i = 0; i < cars.length; i++){
    if (coll.col(player.pos,cars[i][y].pos,20)) {
      player.dead = true;
    }  
  }
  }
  // kills the player if they land on the grass instead of the lily pads
  for (int y = 0; y < 4; y++) { 
  for (int i = 0; i < grass.length; i++){
    if (coll.col(player.pos,grass[i][y].pos,30) && player.on_platform == false) {
      player.dead = true;
    }  
  }
  }

}


// the function to spawn each set of tiles except for the lily pads
void SpawnTiles() {
  for (int y = 0; y < 3; y++) { 
  for (int i = 0; i < cars.length; i++){
    cars[i][y] = new Cars(i * 64 * round(random(1,10)),y * 64 + 550);

  }
  }
  
  for (int y = 0; y < 3; y++) { 
  for (int i = 0; i < streets.length; i++){
    streets[i][y] = new Street(i * 64 + 20,y * 64 + 550);
    
  }
  }
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < water.length; i++){
    water[i][y] = new Water(i * 64 - 10,y * 64 + 225);

  }
  }
  
  for (int y = 0; y < 5; y++) { 
  for (int i = 0; i < platforms.length; i++){
    platforms[i][y] = new Platform(i * 64 * platform_change,y * 64 + 225);
    platforms[i][y].velocity.mult(1 + (level/10));
  }
  } 
  
  
  for (int y = 0; y < 4; y++) { 
  for (int i = 0; i < grass.length; i++){
    grass[i][y] = new Grass(i * 64,y * 64 - 30);

  }
  } 
}
// a timer function that kills the player if they take too long
void timer() {
  int passedTime = millis() - savedTime;
  text("Time: " + str(totalTime/1000 - passedTime/1000),170,30);
  if (passedTime > totalTime) {
    player.dead = true;
  }
}

void scoreDisplay() {
  textAlign(CENTER);
  text("Score: " + str(player.score),width/2,30);
  textAlign(RIGHT);
  text("Highscore: " + str(player.highscore),width,30);
  text("Level: " + str(level),width - 30,height - 30);
}

void levelTracking() {
  if (lilypads_left == 5) {
    lilypads_left = 0;
    level += 1;
  }
}
  
  
