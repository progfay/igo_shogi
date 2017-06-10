final int CELL_LEN = 60;
Player player0, player1;
Board board;
int mode = 0;

void settings() {
  size(CELL_LEN*19, CELL_LEN*11);
}

void setup() {
  textFont(createFont("Ricty Discord", 18, false));
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  player0 = new ShogiPlayer(0);
  player1 = new ShogiPlayer(1);
  board = new Board(player0, player1);
}

void draw() {
  switch(mode) {
  case 0:
  case 2:
    board.draw();
    break;
  case 1:
  case 3:
    board.draw();
    board.drawAble();
    break;
  }
}

void mousePressed() {
  println(convert2board(mouseX, mouseY));
  switch(mode) {
  case 0:
  case 2:
    board.setAbleToSet(mode/2, convert2board(mouseX, mouseY));
    if (board.able.size() > 0) mode++;
    break;
  case 1:
  case 3:
    if (board.able.hasValue(convert2board(mouseX, mouseY))) {
      board.movePiece(mode/2, convert2board(mouseX, mouseY));
      println("move");
      board.selectClear();
      mode = ++mode % 4;
    } else {
      board.selectClear();
      mode--;
    }
    break;
  }
}