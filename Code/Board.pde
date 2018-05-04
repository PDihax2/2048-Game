class Board {
  int size;
  int[][] cells;
  boolean is_full = false;
  
  Board(int s) {
    size = s;
    cells = new int[s][s];
    for(int[] i : cells) {
      for(int j : i) {
        j = 0;
      }
    }
  }
  
  void setRandom() {
    int x = floor(random(0, size));
    int y = floor(random(0, size));
    while(cells[x][y] != 0) {
      x = floor(random(0, size));
      y = floor(random(0, size));
    }
    
    cells[x][y] = (random(1) < 0.85) ? 2 : 4;
  }
  
  void show() {
  stroke(187,173,160);
  strokeWeight(15);
  for(int i = 0; i < size; i++) {
    for(int j = 0; j < size; j++) {
      switch(cells[i][j]) {
        case 0: fill(205, 192, 180); break;
        case 2: fill(238, 228, 218); break;
        case 4: fill(237, 224, 200); break;
        default: fill(255); break;
      }
      rect(i * width/size, j * height/size, width/size, height/size);
      fill(0);
      text(cells[i][j], i * width/(size) + width/(2*size), j * height/(size) + height/(2*size));
    }
  }
    
  }
  
  void move(int dir) {
    //LEFT  37
    //UP    38
    //RIGHT 39
    //DOWN  40
    
    int[][] newCells = new int[size][size];
    switch(dir) {
      case 37:for (int i = 0; i < size; i++) {
                for (int j = 0; j < size; j++) {
                  if (cells[i][j] != 0 && i != 0) {
                    int val = cells[i][j], x;
                    for(x = i; x > 0; x--) {
                      if (cells[x-1][j] != 0) {
                         break;
                      }
                    }
                    println("x: " + x + " y: " + j);
                    cells[i][j] = 0;
                    newCells[x][j] = val;
                  }
                }
              }
              break;
    }
  cells = newCells;
  }
}
