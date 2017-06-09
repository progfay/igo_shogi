class Shogi extends Piece {
  Shogi(Point _p, Feature _f, int _o) {
    super(_p, _f);
    this.owner = _o;
  }

  ArrayList<Point> ableToSet(Board _b, int _owner) {
    return this.feature.ableToMove(_b, this.pos, _owner);
  }

  void draw() {
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(PI*owner);
    fill(#DEB887);
    stroke(0);
    beginShape();
    vertex(-CELL_LEN*0.4, CELL_LEN*0.4);
    vertex( CELL_LEN*0.4, CELL_LEN*0.4);
    vertex( CELL_LEN*0.3, -CELL_LEN*0.3);
    vertex(            0, -CELL_LEN*0.4);
    vertex(-CELL_LEN*0.3, -CELL_LEN*0.3);
    endShape(CLOSE);
    textAlign(CENTER, CENTER);
    text(this.feature.name, 0, 0);
    popMatrix();
  }
}