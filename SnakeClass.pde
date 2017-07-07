public class Snake {

  protected int xPos;
  protected int yPos;
  protected int baseValue;
  protected int bposx;
  protected int bposy;
  protected boolean blocisActive;
  protected int blocSize = 10;
  protected int snakeLength;

  private ListDir direction;
  protected ArrayList coordsX = new ArrayList();
  protected ArrayList coordsY = new ArrayList();
  protected ArrayList oldx = new ArrayList();
  protected ArrayList oldy = new ArrayList();

  public Snake(int x, int y, int b, int sl) {
    this.xPos = x;
    this.yPos = y;
    this.snakeLength = sl;
    this.baseValue = b;
    for (int i = 0; i<snakeLength; i++) {
      this.oldx.add(this.baseValue - (i * blocSize));
      this.oldy.add(0);
    }
  }

  public void moveUp(int x, int y) {
    this.isSnakeEataGoldenApple();
    if (this.direction == ListDir.UP) {
      this.yPos += (y * blocSize);
    } else if (this.direction == ListDir.DOWN) {
      this.yPos -= (y * blocSize);
    } else if (this.direction == ListDir.LEFT) { 
      this.xPos += (x * blocSize);
    } else if (this.direction == ListDir.RIGHT) {
      this.xPos -= (x * blocSize);
    } else {
      this.xPos += (x * blocSize);
    }
    this.refreshBloc();
    this.checkForUpdateBlocs();
  }

  protected void refreshBloc() {
    fill(#00CC33);
    for (int i = 0; i < this.snakeLength; i++) {
      if (i == 0) {
        this.coordsX.add(this.xPos);
        this.coordsY.add(this.yPos);
        rect(this.xPos, this.yPos, this.blocSize, this.blocSize);
      } else {
        followerBlocs(i);
      }
    }
    this.oldx.clear();
    this.oldy.clear();
    for (int i=0; i<snakeLength; i++) {
      this.oldx.add(this.coordsX.get(i));
      this.oldy.add(this.coordsY.get(i));
    }
    this.isSnakerColide();
    this.coordsY.clear();
    this.coordsX.clear();
  }

  private void followerBlocs(int i) {
    this.coordsX.add((int)oldx.get(i - 1));
    this.coordsY.add((int)oldy.get(i - 1));
    rect(this.getTheXValue(i), this.getTheYValue(i), this.blocSize, this.blocSize);
  }

  private int getTheXValue(int i) {
    //print(" | j'étaits : " + (int)this.oldx.get(i) + " et je recoit : " + (int)this.oldx.get(i-1));
    return (int)this.oldx.get((i - 1));
  }

  private int getTheYValue(int i) { 
    return (int)this.oldy.get(i-1);
  }

  private void addBlocs() {
    int x = (int)random(10, (width - 10));
    int y = (int)(random(10, (height - 10)));
    this.bposx = x - (x % 10);
    this.bposy = y - (y % 10);
    this.blocisActive = true;
    fill(#00FF00);
    rect(bposx, bposy, this.blocSize, this.blocSize);
  }

  private void checkForUpdateBlocs() {
    if (this.blocisActive == true) {
      rect(this.bposx, this.bposy, this.blocSize, this.blocSize);
    } else {
      this.addBlocs();
    }
  }

  private void isSnakeEataGoldenApple() {
    if (this.xPos == this.bposx && this.yPos == this.bposy) {
      this.blocisActive = false;
      this.snakeLength++;
    }
  }

  private void isSnakerColide() {
    for (int i = 1; i < this.snakeLength; i++) {
      int x = (int)this.coordsX.get(i);
      int y = (int)this.coordsY.get(i);
      //print( " x = " + x + " xpos : " + this.xPos);
      if (this.xPos == x && this.yPos == y) {
        snakeLength = 1;
      }
    }
    if (this.xPos >= width || this.yPos >= height || this.xPos == 0 || this.yPos == 0) {
      snakeLength = 1;
      this.xPos = 100;
      this.yPos = 10;
    }
  }
}