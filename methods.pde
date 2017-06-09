void drawField() {
  fill(#D3A775);
  rect(width/2, height/2, CELL_LEN*10, CELL_LEN*10);
  for (float i = 5.5; i < 14; i++) {
    for (float j = 1.5; j < 10; j++) {
      rect(i*CELL_LEN, j*CELL_LEN, CELL_LEN, CELL_LEN);
    }
  }
  rect(CELL_LEN*2.25, CELL_LEN*4, CELL_LEN*3, CELL_LEN*7);
  rect(CELL_LEN*16.75, CELL_LEN*7, CELL_LEN*3, CELL_LEN*7);
}