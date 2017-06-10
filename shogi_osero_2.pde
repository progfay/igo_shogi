final int CELL_LEN = 60;

void settings() {
  size(CELL_LEN*19, CELL_LEN*11);
}

void setup() {
  textFont(createFont("Ricty Discord", 18, false));
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  Board board = new Board();
  board.draw();
}