class BodyPart {
  int x,y;
  public final static int SIZE = 20;
  int[] colours = {int(random(256)),int(random(256)),int(random(256))};
  BodyPart(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void show() {
    //rectMode(CENTER);
    fill(colours[0],colours[1],colours[2]);
    stroke(255);
    rect(x, y, SIZE, SIZE);
  }
}
