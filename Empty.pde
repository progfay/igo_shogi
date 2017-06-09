class Empty extends Piece {
  Empty(Point _p) {
    super(_p, new Feature());
  }
  
  ArrayList<Point> ableToSet(Board _b, int _owner) {
    return null;
  }
  void draw() {
  }
}