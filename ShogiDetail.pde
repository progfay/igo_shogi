class King extends Shogi {
  King(int _o) {
    super(_o);
    this.name = (_o == 0 ? "玉\n将" : "王\n将");
  }
}

class Hisya extends Shogi {
  Hisya(int _o) {
    super(_o);
    this.name = "飛\n車";
  }
}

class Kaku extends Shogi {
  Kaku(int _o) {
    super(_o);
    this.name = "角\n行";
  }
}

class Gold extends Shogi {
  Gold(int _o) {
    super(_o);
    this.name = "金\n将";
  }
}

class Silver extends Shogi {
  Silver(int _o) {
    super(_o);
    this.name = "銀\n将";
  }
}

class Kei extends Shogi {
  Kei(int _o) {
    super(_o);
    this.name = "桂\n馬";
  }
}

class Kyou extends Shogi {
  Kyou(int _o) {
    super(_o);
    this.name = "香\n車";
  }
}

class Fu extends Shogi {
  Fu(int _o) {
    super(_o);
    this.name = "歩\n兵";
  }
}

class Dragon extends Shogi {
  Dragon(int _o) {
    super(_o);
    this.name = "龍";
  }
}

class Hourse extends Shogi {
  Hourse(int _o) {
    super(_o);
    this.name = "馬";
  }
}

class AdSilver extends Gold {
  AdSilver(int _o) {
    super(_o);
    this.name = "成\n銀";
  }
}

class AdKei extends Gold {
  AdKei(int _o) {
    super(_o);
    this.name = "成\n桂";
  }
}

class AdKyou extends Gold {
  AdKyou(int _o) {
    super(_o);
    this.name = "成\n香";
  }
}

class To extends Gold {
  To(int _o) {
    super(_o);
    this.name = "と";
  }
}