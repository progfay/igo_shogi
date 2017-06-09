class King extends Feature {
  King() {
    this.name = "玉\n将";
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    Point candidate = new Point(_pos);
    candidate.move(-1, -2, _owner);
    for(int i = 0; i < 3; i++) {
      candidate.move(0, 1, _owner);
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    }
    candidate.move(1, 0, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    candidate.move(1, 1, _owner);
    for(int i = 0; i < 3; i++) {
      candidate.move(0, -1, _owner);
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    }
    candidate.move(-1, 0, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    return able;
  }
}

class Hisya extends Feature {
  Hisya() {
    this.name = "飛\n車";
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    Point candidate = new Point(_pos);
    Piece state;
    while(true) {
      candidate.move(0, -1, _owner);
      if(!contain(candidate)) break;
      state = _b.get(candidate);
      if(state instanceof Shogi && state.owner != _owner) {
        able.add(new Point(candidate));
        break;
      }
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
      else break;
    }
    candidate = new Point(_pos);
    while(true) {
      candidate.move(0, 1, _owner);
      if(!contain(candidate)) break;
      state = _b.get(candidate);
      if(state instanceof Shogi && state.owner != _owner) {
        able.add(new Point(candidate));
        break;
      }
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
      else break;
    }
    candidate = new Point(_pos);
    while(true) {
      candidate.move(-1, 0, _owner);
      if(!contain(candidate)) break;
      state = _b.get(candidate);
      if(state instanceof Shogi && state.owner != _owner) {
        able.add(new Point(candidate));
        break;
      }
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
      else break;
    }
    candidate = new Point(_pos);
    while(true) {
      candidate.move(1, 0, _owner);
      if(!contain(candidate)) break;
      state = _b.get(candidate);
      if(state instanceof Shogi && state.owner != _owner) {
        able.add(new Point(candidate));
        break;
      }
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
      else break;
    }
    return able;
  }
}

class Kaku extends Feature {
  Kaku() {
    this.name = "角\n行";
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    Point candidate = new Point(_pos);
    Piece state;
    while(true) {
      candidate.move(-1, -1, _owner);
      if(!contain(candidate)) break;
      state = _b.get(candidate);
      if(state instanceof Shogi && state.owner != _owner) {
        able.add(new Point(candidate));
        break;
      }
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
      else break;
    }
    candidate = new Point(_pos);
    while(true) {
      candidate.move(-1, 1, _owner);
      if(!contain(candidate)) break;
      state = _b.get(candidate);
      if(state instanceof Shogi && state.owner != _owner) {
        able.add(new Point(candidate));
        break;
      }
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
      else break;
    }
    candidate = new Point(_pos);
    while(true) {
      candidate.move(1, -1, _owner);
      if(!contain(candidate)) break;
      state = _b.get(candidate);
      if(state instanceof Shogi && state.owner != _owner) {
        able.add(new Point(candidate));
        break;
      }
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
      else break;
    }
    candidate = new Point(_pos);
    while(true) {
      candidate.move(1, 1, _owner);
      if(!contain(candidate)) break;
      state = _b.get(candidate);
      if(state instanceof Shogi && state.owner != _owner) {
        able.add(new Point(candidate));
        break;
      }
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
      else break;
    }
    return able;
  }
}

class Gold extends Feature {
  Gold() {
    this.name = "金\n将";
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    Point candidate = new Point(_pos);
    candidate.move(-1, -2, _owner);
    for(int i = 0; i < 3; i++) {
      candidate.move(0, 1, _owner);
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    }
    candidate.move(2, 1, _owner);
    for(int i = 0; i < 3; i++) {
      candidate.move(0, -1, _owner);
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    }
    candidate.move(-1, 0, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    return able;
  }
}

class Silver extends Feature {
  Silver() {
    this.name = "銀\n将";
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    Point candidate = new Point(_pos);
    candidate.move(0, -1, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    candidate.move(1, 0, _owner);
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

class Keima extends Feature {
  Keima() {
    this.name = "桂\n馬";
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    Point candidate = new Point(_pos);
    candidate.move(-1, -2, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    candidate.move(2, 0, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    return able;
  }
}

class Kyou extends Feature {
  Kyou() {
    this.name = "香\n車";
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    Point candidate = new Point(_pos);
    Piece state;
    while(true) {
      candidate.move(0, -1, _owner);
      if(!contain(candidate)) break;
      state = _b.get(candidate);
      if(state instanceof Shogi && state.owner != _owner) {
        able.add(new Point(candidate));
        break;
      }
      if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
      else break;
    }
    return able;
  }
}

class Fu extends Feature {
  Fu() {
    this.name = "歩";
  }
  ArrayList<Point> ableToMove(Board _b, Point _pos, int _owner) {
    ArrayList<Point> able = new ArrayList<Point>();
    Point candidate = new Point(_pos);
    _pos.move(0, -1, _owner);
    if(this.canTakeShogi(_b, candidate, _owner)) able.add(new Point(candidate));
    return able;
  }
}