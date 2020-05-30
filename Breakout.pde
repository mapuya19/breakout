Ball ball;
Paddle paddle;
ArrayList<Block> blocks;

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
float paddleSpeed = 7;

boolean paddleLeft;
boolean paddleRight;

float ballRadius = 5;
float ballSpeed = 6;

void settings() {
  size(580, 700);
}

void setup() {
  background(0, 0, 0);
  
  ball = new Ball(width / 2, paddleY - ballRadius);
  paddle = new Paddle();
  blocks = new ArrayList<Block>(columnCount);

  float blockTop = 80;
  
  for(int row = 0; row < rowCount; row++) {
    float blockLeft = 10;

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
  
  ball.update();
  paddle.update();

  for(Block block : blocks) {
    block.draw();
    block.collide();
  }

  if(ball.getY() >= height) {
    textMode(CENTER);
    fill(255, 255, 255);
    text("You lose!", width / 2, height / 2);
    noLoop();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      paddleLeft = true;
    }

    if (keyCode == RIGHT) {
      paddleRight = true;
    }
  }
}

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