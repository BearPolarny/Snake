
Snake snake;
ArrayList<Fruit> fruits;
int score;
boolean gameLost;
void setup() {
  size(640, 640);
  frameRate(60);
  snake = new Snake();
  fruits = new ArrayList();
  fruits.add(new Fruit());
  fruits.add(new Fruit());
  fruits.add(new Fruit());
}

void draw(){
  
  if (!gameLost){
    background(9, 139, 44);
    snake.show();
    snake.update();
    for (int i = fruits.size()-1; i>=0; i--) {
      fruits.get(i).show();  
      if(fruits.get(i).checkSnake(snake)) {
        fruits.remove(i);
        fruits.add(new Fruit());
      }
     }
  }   
}

void keyPressed() {
   snake.updateDir(keyCode);
}
