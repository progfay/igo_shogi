abstract class Piece {
  //@Duplicate
  Point    pos;
  Feature feature;
  int owner;
  
  Piece (Point _p, Feature _f) {
    this.pos = new Point(_p);
    this.feature = _f;
  }
  
  abstract ArrayList<Point> ableToSet(Board _b, int _owner);
  abstract void draw();
}