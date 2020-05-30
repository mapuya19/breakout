// Global Objects & Variables
Ball ball;
Paddle paddle;
ArrayList<Block> blocks;
Score scoreBoard;

PFont f;

int rowCount = 8;
int columnCount = 14;
int blockCount = rowCount * columnCount;

float blockWidth  = 40;
float blockHeight = 15;

color blockColor1 = color(204, 0, 0);
color blockColor2 = color(255, 128, 0);
color blockColor3 = color(0, 204, 0);
color blockColor4 = color(255, 255, 60);

float paddleWidth = 40;
float paddleHeight = 10;
float paddleY = 680;
float paddleSpeed = 7; // Set paddle speed (should be +1 faster than ballSpeed)

boolean paddleLeft;
boolean paddleRight;

float ballRadius = 5;
float ballSpeed = 6; // Set ball speed

int score;
float scoreX = width / 2;
float scoreY = 60;

// Set window size
void settings() {
  size(580, 700);
}

void setup() {
  background(0, 0, 0);
  
  ball = new Ball(width / 2, paddleY - ballRadius); // Ball starts at center of window above paddle
  paddle = new Paddle();
  blocks = new ArrayList<Block>(columnCount);
  scoreBoard = new Score();
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  score = 0;

  float blockTop = 80; // Blocks' distance from top of window
  
  // Create blocks in ArrayList
  for(int row = 0; row < rowCount; row++) {
    float blockLeft = 10; // Blocks' distance from the left of window

    if (row == 0 || row == 1) {
      for(int column = 0; column < columnCount; column++) {
        blocks.add(new Block(blockLeft, blockTop, blockColor1));
        blockLeft += blockWidth;
      }
    }

    if (row == 2 || row == 3) {
      for(int column = 0; column < columnCount; column++) {
        blocks.add(new Block(blockLeft, blockTop, blockColor2));
        blockLeft += blockWidth;
      }
    }

    if (row == 4 || row == 5) {
      for(int column = 0; column < columnCount; column++) {
        blocks.add(new Block(blockLeft, blockTop, blockColor3));
        blockLeft += blockWidth;
      }
    }

    if (row == 6 || row == 7) {
      for(int column = 0; column < columnCount; column++) {
        blocks.add(new Block(blockLeft, blockTop, blockColor4));
        blockLeft += blockWidth;
      }
    }

    blockTop += blockHeight;
  }
}

void draw() {
  background(0, 0, 0);

  ball.draw();
  paddle.draw();
  scoreBoard.draw();

  ball.update();
  paddle.update();
  scoreBoard.update();

  for(Block block : blocks) {
    block.draw();
    block.collide();
  }

  // End game or restart game
  if(ball.getY() >= height) {
    textFont(f,16);
    fill(255, 255, 255);
    textAlign(CENTER, BOTTOM);
    text("You lose! Press DOWN to restart.", width / 2, height / 2);
    noLoop();
  }
}

// Check if LEFT, RIGHT, or DOWN arrow keys are pressed
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      paddleLeft = true;
    }

    if (keyCode == RIGHT) {
      paddleRight = true;
    } 
  }

  if (key == CODED && keyCode  == DOWN) {
      loop(); // For some reason, calling any sort of function that resumes draw() moves Score text partially off window
      setup();
  }
}

// Check if LEFT or RIGHT arrow keys are released
void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
        paddleLeft = false;
    }

    if (keyCode == RIGHT) {
        paddleRight = false;
    }
  }
}