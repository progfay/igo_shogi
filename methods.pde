int convert2boardX(int _mouseX) {
  return (_mouseX - CELL_LEN*5) / CELL_LEN;
}

int convert2boardY(int _mouseY) {
  return (_mouseY - CELL_LEN) / CELL_LEN;
}

int convert2board(int _mouseX, int _mouseY) {
  return convert2boardX(_mouseX) * 9 + convert2boardY(_mouseY);
}