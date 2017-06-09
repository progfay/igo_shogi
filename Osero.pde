class Osero extends Piece {
  Osero(Point _p, Feature _f) {
    super(_p, _f);
  }
  
  ArrayList<Point> ableToSet(Board _b, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    for(int i = 0; i < _b.board.length; i++) {
      for(int j = 0; j < _b.board[i].length; j++) {
        if(_b.get(new Point(i, j)) instanceof Empty) able.add(new Point(i, j));
      }
    }
    return able;
  }
  
  void draw() {
    fill(-1);
    stroke(0);
    ellipse(this.pos.x, this.pos.y, CELL_LEN*0.9, CELL_LEN*0.9);
  }
}