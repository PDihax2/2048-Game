class Board {
  int size; //size of the board
  int[][] cells; //the matrix
  boolean is_full = false; //a flag to know if it is full
  
  Board(int s) { //constructor 
    size = s;
    cells = new int[s][s];
    for(int[] i : cells) { //Initializing the all the board in 0
      for(int j : i) {
        j = 0;
      }
    }
  }
  
  void setRandom() { //place a random 2 or 4 in a random empty cell
    int x = floor(random(0, size));
    int y = floor(random(0, size));
    while(cells[x][y] != 0) { //search till it finds an empty cell
      x = floor(random(0, size));
      y = floor(random(0, size));
    }
    
    cells[x][y] = (random(1) < 0.85) ? 2 : 4; //choose between a 2 (85%) or a 4 (15%)
  }
  
  void show() { //drawing the board
  stroke(187,173,160);//color of the background
  strokeWeight(15);
  for(int i = 0; i < size; i++) {
    for(int j = 0; j < size; j++) {
      switch(cells[i][j]) { //color of the 2s, 4s, 8s, etc...
        case 0: fill(205, 192, 180); break;
        case 2: fill(238, 228, 218); break;
        case 4: fill(237, 224, 200); break;
        default: fill(255); break;
      }
      rect(i * width/size, j * height/size, width/size, height/size); //position where the rectangle is drawn
      if (cells[i][j] != 0) {
        fill(0); //color of the text
        text(cells[i][j], i * width/(size) + width/(2*size), j * height/(size) + height/(2*size)); //writing the cell's value
      }    
    }
  }
    
  }
  
  void move(int dir) { //function where the magic occurs
    //LEFT  37
    //UP    38
    //RIGHT 39
    //DOWN  40
    boolean movement = false;
    int[][] newCells = new int[size][size];
    switch(dir) {
      case 37:for (int i = 0; i < size; i++) { //left
                for (int j = 0; j < size; j++) {
                  if (cells[i][j] != 0 && i != 0) {
                    println(i + " " + j + " no es 0");
                    int x;
                    for (x = i; x > 0; x--) {
                      if (cells[x-1][j] == 0) {
                        println("es cero la posicion " + x);
                        continue;
                      } else if (cells[x-1][j] == cells[i][j]){
                        combine(i, j, x-1, j);
                      } else {
                        break;
                      }
                    }
                    println("x = " + x);
                    if (x != i) {
                      swap(i,j,x,j);
                    }
                  }
                }
              }
    }
  }
  
  void swap(int a, int b,int c, int d) {
    int aux = cells[a][b];
    cells[a][b] = cells[c][d];
    cells[c][d] = aux;
  }
  
  void combine(int a, int b, int c, int d) {
    cells[a][b] += cells[c][d];
    cells[c][d] = 0;
  }
}
