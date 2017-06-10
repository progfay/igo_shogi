class King extends Shogi {
  King(int _o) {
    super(_o);
    this.name = (_o == 0 ? "玉\n将" : "王\n将");
    this.code = 1;
  }
}

class Hisya extends Shogi {
  Hisya(int _o) {
    super(_o);
    this.name = "飛\n車";
    this.code = 2;
  }
}

class Dragon extends Shogi {
  Dragon(int _o) {
    super(_o);
    this.name = "龍";
    this.code = 3;
  }
}

class Kaku extends Shogi {
  Kaku(int _o) {
    super(_o);
    this.name = "角\n行";
    this.code = 4;
  }
}

class Hourse extends Shogi {
  Hourse(int _o) {
    super(_o);
    this.name = "馬";
    this.code = 5;
  }
}

class Gold extends Shogi {
  Gold(int _o) {
    super(_o);
    this.name = "金\n将";
    this.code = 6;
  }
}

class Silver extends Shogi {
  Silver(int _o) {
    super(_o);
    this.name = "銀\n将";
    this.code = 7;
  }
}

class AdSilver extends Gold {
  AdSilver(int _o) {
    super(_o);
    this.name = "成\n銀";
    this.code = 6;
  }
}

class Kei extends Shogi {
  Kei(int _o) {
    super(_o);
    this.name = "桂\n馬";
    this.code = 8;
  }
}

class AdKei extends Gold {
  AdKei(int _o) {
    super(_o);
    this.name = "成\n桂";
    this.code = 6;
  }
}

class Kyou extends Shogi {
  Kyou(int _o) {
    super(_o);
    this.name = "香\n車";
    this.code = 9;
  }
}

class AdKyou extends Gold {
  AdKyou(int _o) {
    super(_o);
    this.name = "成\n香";
    this.code = 6;
  }
}

class Fu extends Shogi {
  Fu(int _o) {
    super(_o);
    this.name = "歩\n兵";
    this.code = 10;
  }
}

class To extends Gold {
  To(int _o) {
    super(_o);
    this.name = "と";
    this.code = 6;
  }
}