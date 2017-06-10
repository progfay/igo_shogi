abstract class Piece {
  int owner;
  String name = "";

  // -1 : Empty
  //  0 : Igo
  //  1 : King
  //  2 : Hisya
  //  3 : Dragon
  //  4 : Kaku
  //  5 : Hourse
  //  6 : Gold
  //  7 : Silver
  //  8 : Kei
  //  9 : Kyou
  // 10 : Fu
  int code;

  Piece(int _o) {
    this.owner   = _o;
  }
  abstract void draw(float centerX, float centerY, int _owner);
  
  String toString() {
    return this.name;
  }
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

class Igo extends Piece {
  Igo(int _o) {
    super(_o);
    this.code = 0;
  }
  void draw(float centerX, float centerY, int _owner) {
    fill(255*_owner);
    ellipse(centerX, centerY, CELL_LEN*0.8, CELL_LEN*0.8);
  }
}

class Empty extends Piece {
  Empty() {
    super(-1);
    this.code = -1;
  }
  void draw(float centerX, float centerY, int _owner) {
  }
}

Piece copy(Piece origin, int _owner) {
  Piece copy;
  if      (origin instanceof Shogi) copy = new Shogi(_owner);
  else if (origin instanceof Igo) copy = new Igo(_owner);
  else                             copy = new Empty();
  copy.name = new String(origin.name);
  copy.code = origin.code;
  return copy;
}