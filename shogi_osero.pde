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
  default:
    break;
  }
}

void mousePressed() {
  switch(mode) {
  case 0:
  case 2:
    board.setAbleToSet(mode/2, convert2board(mouseX, mouseY));
    if (board.able.size() > 0) mode++;
    break;
  case 1:
  case 3:
    int setPos = convert2board(mouseX, mouseY);
    if (board.able.hasValue(setPos)) {
      board.movePiece(mode/2, setPos);
      board.selectClear();
      if (board.canAdvanced(mode/2, setPos)) {
        int selection = javax.swing.JOptionPane.showConfirmDialog(new javax.swing.JPanel(), "", "", 0);
        if (selection == 0) board.Advanced(setPos);
      }
      mode = ++mode % 4;
    } else {
      board.selectClear();
      mode--;
    }

    break;
  default:
    break;
  }
}