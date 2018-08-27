class Fruit {
  
  int x,y;
  int scoref;
  
  Fruit() {
    x = int(random(0, width)); 
    y = int(random(0, height));
    x-=(x%BodyPart.SIZE);
    y-=(y%BodyPart.SIZE);
    scoref = 10;
  }
  
  void show() {
    fill(0);
    ellipseMode(CORNER);
    ellipse(x,y,BodyPart.SIZE,BodyPart.SIZE);
  }
  
  boolean checkSnake(Snake snake) {
    if(snake.body.get(0).x == this.x && snake.body.get(0).y == this.y) {
      score += this.scoref;
      snake.body.add(new BodyPart(snake.body.get(snake.body.size()-1).x, snake.body.get(snake.body.size()-1).y));
      System.out.println("Score: " + score);
      return true;
    }
    return false;
  }
}
