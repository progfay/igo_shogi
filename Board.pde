class Board {
  Piece [][] board = new Piece [9][9];
  Player [] player = new Player [2];

  Board(Player player0, Player player1) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        this.board[i][j] = new Empty();
      }
    }
    this.player[0] = player0;
    this.player[1] = player1;
    for (int id = 0; id < 2; id++) {
      int _owner = player[id].owner_ID;
      if (player[id] instanceof ShogiPlayer) {
        //for (int i = 0; i < 9; i++) {
        //  this.board[i][6-4*_owner] = new Fu(_owner);
        //}
        this.board[1+6*_owner][7-6*_owner] = new Kaku  (_owner);
        this.board[7-6*_owner][7-6*_owner] = new Hisya (_owner);
        this.board[0]         [8-8*_owner] = new Kyou  (_owner);
        this.board[1]         [8-8*_owner] = new Kei   (_owner);
        this.board[2]         [8-8*_owner] = new Silver(_owner);
        this.board[3]         [8-8*_owner] = new Gold  (_owner);
        this.board[4]         [8-8*_owner] = new King  (_owner);
        this.board[5]         [8-8*_owner] = new Gold  (_owner);
        this.board[6]         [8-8*_owner] = new Silver(_owner);
        this.board[7]         [8-8*_owner] = new Kei   (_owner);
        this.board[8]         [8-8*_owner] = new Kyou  (_owner);
      } else {
        for (int i = 0; i < 9; i++) {
          this.board[i][6-4*_owner] = new Osero(_owner);
          this.board[i][8-8*_owner] = new Osero(_owner);
        }
        this.board[1+6*_owner][7-6*_owner] = new Osero(_owner);
        this.board[7-6*_owner][7-6*_owner] = new Osero(_owner);
        this.board[4]         [8-8*_owner] = new King (_owner);
      }
    }
  }

  Piece get(int _x, int _y) {
    return this.board[_x][_y];
  }

  void set(int _x, int _y, Piece _piece) {
    this.board[_x][_y] = copy(_piece);
  }

  // @Duplicate
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
    rect(CELL_LEN* 2.25, CELL_LEN*4, CELL_LEN*3, CELL_LEN*7);
    rect(CELL_LEN*16.75, CELL_LEN*7, CELL_LEN*3, CELL_LEN*7);
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        this.board[i][j].draw((i+5.5)*CELL_LEN, (j+1.5)*CELL_LEN, this.board[i][j].owner);
      }
    }
  }

  void drawAble(IntList able) {
    fill(255, 0, 0, 50);
    for (int i : able) {
      if (i == -1) continue;
      rect((i/9+5.5)*CELL_LEN, (i%9+1.5)*CELL_LEN, CELL_LEN, CELL_LEN);
    }
  }

  IntList ableToSet(int _owner, int _x, int _y) {
    if (this.player[_owner] instanceof OseroPlayer) return this.emptyList();
    IntList able = new IntList();
    Piece move = this.get(_x, _y);
    if (move.owner != _owner) return able;
    int _code = move.code;
    switch(_code) {
    case 1:  // King
      able.append(isAbleToSet(_owner, _x, _y, -1, -1));
      able.append(isAbleToSet(_owner, _x, _y, -1, 0));
      able.append(isAbleToSet(_owner, _x, _y, -1, 1));
      able.append(isAbleToSet(_owner, _x, _y, 0, -1));
      able.append(isAbleToSet(_owner, _x, _y, 0, 1));
      able.append(isAbleToSet(_owner, _x, _y, 1, -1));
      able.append(isAbleToSet(_owner, _x, _y, 1, 0));
      able.append(isAbleToSet(_owner, _x, _y, 1, 1));
      break;
    case 2:  // Hisya
    case 3:  // Dragon
      for (int i = 1; i < 9; i++) {
        able.append(isAbleToSet(_owner, _x, _y, -i, 0));
        if (!canContinueToMove(_owner, _x, _y, -i, 0)) break;
      }
      for (int i = 1; i < 9; i++) {
        able.append(isAbleToSet(_owner, _x, _y, i, 0));
        if (!canContinueToMove(_owner, _x, _y, i, 0)) break;
      }
      for (int i = 1; i < 9; i++) {
        able.append(isAbleToSet(_owner, _x, _y, 0, -i));
        if (!canContinueToMove(_owner, _x, _y, 0, -i)) break;
      }
      for (int i = 1; i < 9; i++) {
        able.append(isAbleToSet(_owner, _x, _y, 0, i));
        if (!canContinueToMove(_owner, _x, _y, 0, i)) break;
      }
      if (_code == 2) break;
      able.append(isAbleToSet(_owner, _x, _y, -1, -1));
      able.append(isAbleToSet(_owner, _x, _y, -1, 1));
      able.append(isAbleToSet(_owner, _x, _y, 1, -1));
      able.append(isAbleToSet(_owner, _x, _y, 1, 1));
      break;
    case 4:  // Kaku
    case 5:  // Hourse
      for (int i = 1; i < 9; i++) {
        able.append(isAbleToSet(_owner, _x, _y, -i, -i));
        if (!canContinueToMove(_owner, _x, _y, -i, -i)) break;
      }
      for (int i = 1; i < 9; i++) {
        able.append(isAbleToSet(_owner, _x, _y, -i, i));
        if (!canContinueToMove(_owner, _x, _y, -i, i)) break;
      }
      for (int i = 1; i < 9; i++) {
        able.append(isAbleToSet(_owner, _x, _y, i, -i));
        if (!canContinueToMove(_owner, _x, _y, i, -i)) break;
      }
      for (int i = 1; i < 9; i++) {
        able.append(isAbleToSet(_owner, _x, _y, i, i));
        if (!canContinueToMove(_owner, _x, _y, i, i)) break;
      }
      if (_code == 4) break;
      able.append(isAbleToSet(_owner, _x, _y, 0, -1));
      able.append(isAbleToSet(_owner, _x, _y, 0, 1));
      able.append(isAbleToSet(_owner, _x, _y, -1, 0));
      able.append(isAbleToSet(_owner, _x, _y, 1, 0));
      break;
    case 6:  // Gold
      able.append(isAbleToSet(_owner, _x, _y, -1, -1));
      able.append(isAbleToSet(_owner, _x, _y, -1, 0));
      able.append(isAbleToSet(_owner, _x, _y, 0, -1));
      able.append(isAbleToSet(_owner, _x, _y, 0, 1));
      able.append(isAbleToSet(_owner, _x, _y, 1, -1));
      able.append(isAbleToSet(_owner, _x, _y, 1, 0));
      break;
    case 7:  // Silver
      able.append(isAbleToSet(_owner, _x, _y, -1, -1));
      able.append(isAbleToSet(_owner, _x, _y, -1, 1));
      able.append(isAbleToSet(_owner, _x, _y, 0, -1));
      able.append(isAbleToSet(_owner, _x, _y, 1, -1));
      able.append(isAbleToSet(_owner, _x, _y, 1, 1));
      break;
    case 8:  // Kei
      able.append(isAbleToSet(_owner, _x, _y, -1, -2));
      able.append(isAbleToSet(_owner, _x, _y, 1, -2));
      break;
    case 9:  // Kyou
      for (int i = 1; i < 9; i++) {
        able.append(isAbleToSet(_owner, _x, _y, 0, -i));
        if (!canContinueToMove(_owner, _x, _y, 0, -i)) break;
      }
      break;
    case 10: // Fu
      able.append(isAbleToSet(_owner, _x, _y, 0, -1));
      break;
    default:
      break;
    }
    return able;
  }

  int isAbleToSet(int _owner, int _x, int _y, int  _dx, int _dy) {
    int x = _x + (_owner == 0 ? _dx : -_dx);
    int y = _y + (_owner == 0 ? _dy : -_dy);
    println(_x, _y, _dx, _dy);
    println(x, y);
    if (x < 0 || 8 < x || y < 0 || 8 < y) return -1;
    Piece installed = this.get(x, y);
    if (installed instanceof Shogi && installed.owner == _owner) return -1;
    return x*9+y;
  }

  boolean canContinueToMove(int _owner, int _x, int _y, int  _dx, int _dy) {
    int x = _x + (_owner == 0 ? _dx : -_dx);
    int y = _y + (_owner == 0 ? _dy : -_dy);
    if (x < 0 || 8 < x || y < 0 || 8 < y) return false;
    Piece installed = this.get(x, y);
    if (installed instanceof Empty) return true;
    return false;
  }

  IntList emptyList() {
    IntList emptyList = new IntList();
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (this.get(i, j) instanceof Empty) emptyList.append(i*9+j);
      }
    }
    return emptyList;
  }
}