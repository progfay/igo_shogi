int CELL_LEN = 60;

class Board {
  Piece [][] board = new Piece [9] [9];
  
  Board() {
    for(int i = 0; i < 9; i++) {
      for(int j = 0; j < 9; j++) {
        this.board[i][j] = new Empty(new Point(i, j));
      }
    }
  }
  
  Piece get(Point _p) {
    return this.board[_p.x][_p.y];
  }
}