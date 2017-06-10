final int CELL_LEN = 60;
Player player0, player1;
Board board;
int mode = 0;
IntList able = new IntList();

void settings() {
  size(CELL_LEN*19, CELL_LEN*11);
}

void setup() {
  textFont(createFont("Ricty Discord", 18, false));
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  player0 = new ShogiPlayer(0);
  player1 = new OseroPlayer(1);
  board = new Board(player0, player1);
}

void draw() {
  switch(mode) {
  case 0:
    board.draw();
    board.drawAble(able);
    //mode++;
    break;
  case 1:
    break;
  case 2:
    break;
  case 3:
    break;
  }
}

void mousePressed() {
  able = board.ableToSet(0, convert2boardX(mouseX), convert2boardY(mouseY));
  println(able);
}