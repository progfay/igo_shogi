class Point {
  int x;
  int y;

  Point(int _x, int _y) {
    this.x = _x;
    this.y = _y;
  }
  
  Point(Point origin) {
    this.x = origin.x;
    this.y = origin.y;
  }

  @Override
    String toString() {
    return "(" + this.x + ", " + this.y + ")";
  }
  
  void move(int dx, int dy, int _owner) {
    this.x += dx * (_owner == 1 ? -1 : 0);
    this.y += dy * (_owner == 1 ? -1 : 0);
  }
}