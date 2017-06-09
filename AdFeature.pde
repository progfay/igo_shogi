class Dragon extends Feature {
  Dragon() {
    this.name = "龍";
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    able.addAll((new Hisya()).ableToMove(_b, _pos, _owner));
    Point candidate = new Point(_pos);
    candidate.move(1, -1, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    candidate.move(0, 2, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    candidate.move(-2, 0, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    candidate.move(0, -2, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    return able;
  }
}

class Horse extends Feature {
  Horse() {
    this.name = "馬";
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    able.addAll((new Kaku()).ableToMove(_b, _pos, _owner));
    Point candidate = new Point(_pos);
    candidate.move(0, -1, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    candidate.move(1, 1, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    candidate.move(-1, 1, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    candidate.move(-1, -1, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    return able;
  }
}

class AdSilver extends Gold {
  AdSilver() {
    this.name = "成\n銀";
  }
}

class AdKeima extends Gold {
  AdKeima() {
    this.name = "成\n桂";
  }
}

class AdKyou extends Gold {
  AdKyou() {
    this.name = "成\n香";
  }
}

class To extends Gold {
  To() {
    this.name = "と";
  }
}