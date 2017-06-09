class Feature {
  String name = "";
  Feature() {
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    return null;
  }

  boolean canTakeShogi(Board _b, Point _p, int _owner) {
    if (!contain(_p)) return false;
    Piece state = _b.get(_p);
    if (state instanceof Shogi && state.owner == _owner) return false;
    return true;
  }
}

boolean contain(Point _p) {
  if(_p.x < 0 || 8 < _p.x) return false;
  if(_p.y < 0 || 8 < _p.y) return false;
  return true;
}