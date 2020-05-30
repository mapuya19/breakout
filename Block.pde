class Block {
  float posX;
  float posY;
  color blockColor;
  boolean isHit = false;
  
  Block(float x, float y, color newColor) {
    posX = x;
    posY = y;
    blockColor = newColor;
  }

  void draw() {
    if(!isHit) {
      fill(blockColor);
      stroke(0);
      rect(posX, posY, blockWidth, blockHeight);
    }
  }

  // Check for collision
  void collide() {
    if(isHit) {
      return;
    }
    
    if(ball.getX() > posX - ballRadius &&
       ball.getX() < posX + blockWidth + ballRadius &&
       abs(ball.getY() - (posY - ballRadius)) < 3) {
      score++;
      isHit = true;
      ball.bounceUp();
    }
    
    if(ball.getX() > posX - ballRadius &&
       ball.getX() < posX + blockWidth + ballRadius &&
       abs(ball.getY() - (posY + blockHeight + ballRadius)) < 3) {
      score++;
      isHit = true;
      ball.bounceDown();
    }

    if(ball.getY() > posY - ballRadius &&
       ball.getY() < posY + blockHeight + ballRadius &&
       abs(ball.getX() - (posX - ballRadius)) < 3) {
      score++;
      isHit = true;
      ball.bounceLeft();
    }
       
    if(ball.getY() > posY - ballRadius &&
       ball.getY() < posY + blockHeight + ballRadius &&
       abs(ball.getX() - (posX + blockWidth + ballRadius)) < 3) {
      score++;
      isHit = true;
      ball.bounceRight();
    }
  }
}