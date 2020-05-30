class Paddle {
  float posX;

  Paddle() {
    posX = width / 2 - paddleWidth / 2;
  }
  
  void draw() {
    stroke(0);
    fill(0, 153, 230);
    rect(posX, paddleY, paddleWidth, paddleHeight);
  }

  void update() {
    if (paddleLeft) {
      posX -= paddleSpeed;
    }

    if (paddleRight) {
      posX += paddleSpeed;
    }

    posX = constrain(posX, 0, width - paddleWidth);
  }

  float getPosition() {
    return posX;
  }
}