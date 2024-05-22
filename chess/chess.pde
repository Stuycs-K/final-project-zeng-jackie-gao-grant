int[][] board;

void setup() {
  //load piece images
  WhitePawn = loadImage("WhitePawn.png");
  WhiteKnight = loadImage("WhiteKnight.jpg");
  WhiteBishop = loadImage("WhiteBishop.png");
  WhiteRook = loadImage("WhiteRook.png");
  WhiteQueen = loadImage("WhiteQueen.png");
  WhiteKing = loadImage("WhiteKing.png");

  BlackPawn = loadImage("BlackPawn.jpeg");
  BlackKnight = loadImage("BlackNight.png");
  BlackBishop = loadImage("BlackBishop.png");
  BlackRook = loadImage("BlackRook.jpg");
  BlackQueen = loadImage("BlackQueen.jpg");
  BlackKing = loadImage("BlackKing.png");
  
  WhitePawn.resize(squareSize, squareSize);
  WhiteKnight.resize(squareSize, squareSize);
  WhiteBishop.resize(squareSize, squareSize);
  WhiteRook.resize(squareSize, squareSize);
  WhiteQueen.resize(squareSize, squareSize);
  WhiteKing.resize(squareSize, squareSize);

  BlackPawn.resize(squareSize, squareSize);
  BlackKnight.resize(squareSize, squareSize);
  BlackBishop.resize(squareSize, squareSize);
  BlackRook.resize(squareSize, squareSize);
  BlackQueen.resize(squareSize, squareSize);
  BlackKing.resize(squareSize, squareSize);

  size(1000, 800);
  board = new int[8][8];
  setupBoard();

  displayBoard();
}
test
