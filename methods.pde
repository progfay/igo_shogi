int convert2board(int _mouseX, int _mouseY) {
  // mouse on board 0~80
  if (CELL_LEN*5 < _mouseX && _mouseX < CELL_LEN*14 && CELL_LEN < _mouseY && _mouseY < CELL_LEN*10) {
    return (_mouseX - CELL_LEN*5) / CELL_LEN * 9 + (_mouseY - CELL_LEN) / CELL_LEN;
  }
  
  // mouse on player0's possessions 100~120
  if (CELL_LEN*15.25 < _mouseX && _mouseX < CELL_LEN*18.25 && CELL_LEN*3.5 < _mouseY && _mouseY < CELL_LEN*10.5) {
    return 120 - int((_mouseX - CELL_LEN*15.25)) / CELL_LEN - int(_mouseY - CELL_LEN*3.5) / CELL_LEN * 3;
  }
  
  // mouse on player1's possessions 130~150
  if (CELL_LEN*0.75 < _mouseX && _mouseX < CELL_LEN*3.75 && CELL_LEN*0.5 < _mouseY && _mouseY < CELL_LEN*7.5) {
    return 130 + int((_mouseX - CELL_LEN*0.75)) / CELL_LEN + int(_mouseY - CELL_LEN*0.5) / CELL_LEN * 3;
  }
  
  // another place, return -1
  return -1;
}