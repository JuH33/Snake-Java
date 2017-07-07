Snake snake = new Snake(100, 10, 100, 3);
ActionPlayer player = new ActionPlayer();
enum ListDir { UP, DOWN, LEFT, RIGHT };
int snakeSpeed = 1;

void setup() {
  snake.addBlocs();
  size(900, 900);
  frameRate(25);
  noStroke();
}

void draw() {
  background(#DADAE1);
  snake.moveUp(snakeSpeed, snakeSpeed);
}

void keyPressed() {
  player.keypressed(keyCode);
}