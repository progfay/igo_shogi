class Board {
  Piece [][] board = new Piece [9][9];
  Player [] player = new Player [2];

  Board() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        this.board[i][j] = new Empty(0);
        initShogi(1);
        initOsero(0);
      }
    }
  }

  Piece get(int _x, int _y) {
    return this.board[_x][_y];
  }

  void set(int _x, int _y, Piece _piece) {
    this.board[_x][_y] = copy(_piece);
  }

  void set(int _x, int _y, Piece _piece, int _owner) {
    this.board[_x][_y] = copy(_piece, _owner);
  }

  void draw() {
    fill(#D3A775);
    rect(width/2, height/2, CELL_LEN*10, CELL_LEN*10);
    for (float i = 5.5; i < 14; i++) {
      for (float j = 1.5; j < 10; j++) {
        rect(i*CELL_LEN, j*CELL_LEN, CELL_LEN, CELL_LEN);
      }
    }
    rect(CELL_LEN*2.25, CELL_LEN*4, CELL_LEN*3, CELL_LEN*7);
    rect(CELL_LEN*16.75, CELL_LEN*7, CELL_LEN*3, CELL_LEN*7);
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        this.board[i][j].draw((i+5.5)*CELL_LEN, (j+1.5)*CELL_LEN, this.board[i][j].owner);
      }
    }
  }

  void initShogi(int _owner) {
    for (int i = 0; i < 9; i++) {
      this.board[i][6-4*_owner] = new Fu(_owner);
    }

    this.board[1+6*_owner][7-6*_owner] = new Kaku(_owner);
    this.board[7-6*_owner][7-6*_owner] = new Hisya(_owner);

    this.board[0][8-8*_owner] = new Kyou  (_owner);
    this.board[1][8-8*_owner] = new Kei   (_owner);
    this.board[2][8-8*_owner] = new Silver(_owner);
    this.board[3][8-8*_owner] = new Gold  (_owner);
    this.board[4][8-8*_owner] = new King  (_owner);
    this.board[5][8-8*_owner] = new Gold  (_owner);
    this.board[6][8-8*_owner] = new Silver(_owner);
    this.board[7][8-8*_owner] = new Kei   (_owner);
    this.board[8][8-8*_owner] = new Kyou  (_owner);
  }

  void initOsero(int _owner) {
    for (int i = 0; i < 9; i++) {
      this.board[i][6-4*_owner] = new Osero(_owner);
      this.board[i][8-8*_owner] = new Osero(_owner);
    }
    this.board[1+6*_owner][7-6*_owner] = new Osero(_owner);
    this.board[7-6*_owner][7-6*_owner] = new Osero(_owner);
    
    this.board[4][8-8*_owner] = new King(_owner);
  }
}