abstract class Piece {
  int owner;
  String name = "";
  Piece(int _o) {
    this.owner   = _o;
  }
  abstract void draw(float centerX, float centerY, int _owner);
}

class Shogi extends Piece {
  Shogi(int _o) {
    super(_o);
  }
  void draw(float centerX, float centerY, int _owner) {
    pushMatrix();
    translate(centerX, centerY);
    rotate(PI*_owner);
    fill(#DEB887);
    stroke(0);
    beginShape();
    vertex(-CELL_LEN*0.4, CELL_LEN*0.4);
    vertex( CELL_LEN*0.4, CELL_LEN*0.4);
    vertex( CELL_LEN*0.3, -CELL_LEN*0.3);
    vertex(            0, -CELL_LEN*0.4);
    vertex(-CELL_LEN*0.3, -CELL_LEN*0.3);
    endShape(CLOSE);
    fill(0);
    text(this.name, 0, 0);
    popMatrix();
  }
}

class Osero extends Piece {
  Osero(int _o) {
    super(_o);
  }
  void draw(float centerX, float centerY, int _owner) {
    fill(255);
    ellipse(centerX, centerY, CELL_LEN*0.8, CELL_LEN*0.8);
  }
}

class Empty extends Piece {
  Empty(int _o) {
    super(_o);
  }
  void draw(float centerX, float centerY, int _owner) {
  }
}

Piece copy(Piece origin) {
  Piece copy;
  if     (origin instanceof Shogi) copy = new Shogi(origin.owner);
  else if(origin instanceof Osero) copy = new Osero(origin.owner);
  else                             copy = new Empty(origin.owner);
  copy.name = new String(origin.name);
  return copy;
}

Piece copy(Piece origin, int _owner) {
  Piece copy;
  if     (origin instanceof Shogi) copy = new Shogi(_owner);
  else if(origin instanceof Osero) copy = new Osero(_owner);
  else                             copy = new Empty(_owner);
  copy.name = new String(origin.name);
  return copy;
}