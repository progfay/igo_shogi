class Player {
  int owner_ID;
  ArrayList<Piece> possession;

  Player(int _id) {
    this.owner_ID = _id;
    this.possession = new ArrayList<Piece>();
  }
}

class ShogiPlayer extends Player {
  ShogiPlayer(int _id) {
    super(_id);
  }
}

class OseroPlayer extends Player {
  OseroPlayer(int _id) {
    super(_id);
  }
}