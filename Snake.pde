enum direction {
    LEFT, RIGHT, UP, DOWN;
}
  
class Snake {
  
  ArrayList<BodyPart> body;
  boolean dirRelease = true;
  direction dir = direction.UP;
  
  Snake() {
    body = new ArrayList();
    body.add(new BodyPart(int(width/2), int(height/2)));
    body.add(new BodyPart(int(width/2), int(height/2 + BodyPart.SIZE)));
    body.add(new BodyPart(int(width/2), int(height/2 + BodyPart.SIZE*2)));
  }
  
  void show() {
    for(BodyPart p: body) {
      p.show();
    }
  }
  
  void update() {
    if(frameCount%5 == 0) {
      body.remove(body.size()-1);
      if (dir == direction.LEFT) {
        body.add(0, new BodyPart(body.get(0).x -BodyPart.SIZE, body.get(0).y));
      } else if (dir == direction.RIGHT) {
        body.add(0, new BodyPart(body.get(0).x +BodyPart.SIZE, body.get(0).y));
      } else if (dir == direction.UP) {
        body.add(0, new BodyPart(body.get(0).x, body.get(0).y -BodyPart.SIZE));
      } else if (dir == direction.DOWN) {
        body.add(0, new BodyPart(body.get(0).x, body.get(0).y +BodyPart.SIZE));
      }
     //System.out.println(body.get(0).x + " " + body.get(0).y);
     dirRelease = true;
    }
    checkCollisions();
  }
  
  void updateDir(int keycode) {
     switch (keycode) {
      case DOWN:
        if (snake.dir != direction.UP && dirRelease) {
          snake.dir = direction.DOWN;
          dirRelease = false;
        }
        break;
     case UP:
       if (snake.dir != direction.DOWN && dirRelease) {
          snake.dir = direction.UP;
          dirRelease = false;
       }
        break;
     case RIGHT:
       if (snake.dir != direction.LEFT && dirRelease) {
          snake.dir = direction.RIGHT;
          dirRelease = false;
       }
       break;
     case LEFT:
       if (snake.dir != direction.RIGHT && dirRelease) {
          snake.dir = direction.LEFT;
          dirRelease = false;
       }
        break;
    }
  }
  
  void checkCollisions() {
    for(int i = 1; i < body.size(); i++) {
      if(body.get(0).x == body.get(i).x && body.get(0).y == body.get(i).y) {
        gameLost = true;
        System.out.println("lost wonsz");
      }
    }
    
    if (body.get(0).x < 0) {
      gameLost = true;
      System.out.println("lost X<0");
    }
    if (body.get(0).x > width - BodyPart.SIZE) {
      gameLost = true;
      System.out.println("lost X>W");
    }
    if (body.get(0).y < 0) {
      gameLost = true;
      System.out.println("lost Y<0");
    }
    if (body.get(0).y >height - BodyPart.SIZE) {
      gameLost = true;
      System.out.println("lost Y>H");
    }
  }
}
