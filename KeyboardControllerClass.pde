public class ActionPlayer {

  public void keypressed(int key) {
    switch(key) {
    case 37:
      snake.direction = ListDir.RIGHT;
      break;
    case 38:
      snake.direction = ListDir.DOWN;
      break;
    case 39:
      snake.direction = ListDir.LEFT;   
      break;
    case 40:
      snake.direction = ListDir.UP;
      break;
    }
  }
}