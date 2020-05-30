class Score {

  // Empty default constructor; can be updated later for more specific use cases
  Score() {
    
  }

  void draw() {
    textFont(f,16);
    fill(255, 255, 255);
  }

  void update() {
    text("Score: " + score, scoreX, scoreY);
  }
}