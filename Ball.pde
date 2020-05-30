class Ball {
  float posX;
  float posY;

  float velocityX;
  float velocityY;
  
  Ball(float x, float y) {
    posX = x;
    posY = y;

    velocityX = ballSpeed;
    velocityY = -ballSpeed;
  }
  
  void draw() {
    stroke(0);
    fill(255, 255, 255);
    ellipse(posX, posY, ballRadius * 2, ballRadius * 2);
  }

  void update() {
    posX += velocityX;
    posY += velocityY;
    
    if (posX < ballRadius) {
      bounceRight();
    }
    if (posX > width - ballRadius) {
      bounceLeft();
    }
    if (posY < ballRadius) {
      bounceDown();
    }

    if (posY > paddleY - ballRadius &&
       posX > paddle.getPosition() - ballRadius &&
       posX < paddle.getPosition() + paddleWidth + ballRadius) {
      bounceUp();
    }
  }

  void bounceUp()
  {
    velocityY = -abs(velocityY);
  }
  
  void bounceDown()
  {
    velocityY = abs(velocityY);
  }

  void bounceLeft()
  {
    velocityX = -abs(velocityX);
  }
  
  void bounceRight()
  {
    velocityX = abs(velocityX);
  }

  float getX() {
    return posX;
  }

  float getY() {
    return posY;
  }
}