
// Variables for all tiles
Player player;
Water[][] water = new Water[25][5];
Platform[][] platforms = new Platform[7][5];
Street[][] streets = new Street[25][4];
Cars[][] cars = new Cars[8][4];
Grass[][] grass = new Grass[25][2];
LilyPad[] lilypads = new LilyPad[5];
Collision coll = new Collision();
// variables for timer and to change platforms
int platform_change = 5;
int savedTime = millis();
int totalTime = 30000;

void setup() {
  fullScreen();
  imageMode(CENTER);
  textAlign(CENTER);
  background(0);
  player = new Player(); // creates the player 
  SpawnTiles(); // spawns all tiles except lily pad tiles
  for (int i = 0; i < lilypads.length; i++){ // spawns all lily pad tiles, this is seperate to avoid them being reset
    lilypads[i] = new LilyPad(i * 128 * 4 + 220,134); 

  }
}


void draw() {
  background(0);
  // these functions display all tiles
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
  
  scoreDisplay();
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
    if (coll.col(player.pos,platforms[i][y].pos,100)) {
      player.on_platform = true;
      player.velocity = platforms[i][y].velocity;
    } else {
      player.on_platform = false;
    }
    
  }
  }
  // timer is reset, tiles are randomized, and the lily pad the player lands on changes if the player wins
  
  for (int i = 0; i < lilypads.length; i++) {
    if (coll.col(player.pos,lilypads[i].pos,100)) {
      player.on_platform = true;
      savedTime = millis();
      platform_change += 1;
      player.score += 200; // increases score if the player wins
      SpawnTiles();
      lilypads[i].img = loadImage("data/Images/LilyPadPlayer.png");
      player.pos = new PVector(1150,1410);
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
  
  
  // kils player of they hit a car
  for (int y = 0; y < 4; y++) { 
  for (int i = 0; i < cars.length; i++){
    if (coll.col(player.pos,cars[i][y].pos,70)) {
      player.dead = true;
    }  
  }
  }
  //kills the player if they land on the grass instead of the lily pads
  for (int y = 0; y < 2; y++) { 
  for (int i = 0; i < grass.length; i++){
    if (coll.col(player.pos,grass[i][y].pos,70) && player.on_platform == false) {
      player.dead = true;
    }  
  }
  }

}


// the function to spawn each set of tiles except for the lily pads
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
  
  
  for (int y = 0; y < 2; y++) { 
  for (int i = 0; i < grass.length; i++){
    grass[i][y] = new Grass(i * 128,y * 128 + 4);

  }
  } 
}
// a timer function that kills the player if they take too long
void timer() {
  int passedTime = millis() - savedTime;
  textSize(75);
  text("Time: " + str(totalTime/1000 - passedTime/1000),270,55);
  if (passedTime > totalTime) {
    player.dead = true;
  }
}

void scoreDisplay() {
  textAlign(CENTER);
  text("Score: " + str(player.score),1235,55);
  textAlign(RIGHT);
  text("highscore: " + str(player.highscore),displayWidth,55);
}
  
  
