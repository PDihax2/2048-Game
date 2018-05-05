Board board = new Board(5); //Creating the board
int delay = 0;
void setup() {
 textAlign(CENTER, CENTER);//to write the numbers cenetered
 textSize(24);
 size(801, 801);//window dimensions
 background(120);//backgroud color
 //board.setRandom();//strart placing a 2 or a 4 in a random cell
 //board.setRandom();
 //board.setRandom();
 //board.setRandom();
 //board.setRandom();
 
 
 board.cells[4][1] = 2;
 board.cells[0][1] = 2;
 board.cells[3][1] = 2;
 board.cells[2][1] = 2;
}

void draw() {
 background(120);
 board.show(); //drawing the board
 delay++;
}

void keyPressed() {
 if (delay > 1000) {
   board.move(keyCode); //recieving the keys
 }
}
