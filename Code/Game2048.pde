Board board = new Board(5);

void setup() {
 textAlign(CENTER, CENTER);
 textSize(24);
 size(801, 801);
 background(120);
 board.setRandom();
}

void draw() {
 background(120);
 board.show();
}

void keyPressed() {
 board.move(keyCode); 
}
