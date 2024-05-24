int[][] board;
int squareSize=10;
void setup() {
  //load piece images
  PImage WhitePawn = loadImage("WhitePawn.png");
  PImage WhiteKnight = loadImage("WhiteKnight.jpg");
  PImage WhiteBishop = loadImage("WhiteBishop.png");
  PImage WhiteRook = loadImage("WhiteRook.png");
  PImage WhiteQueen = loadImage("WhiteQueen.png");
  PImage WhiteKing = loadImage("WhiteKing.png");

  PImage BlackPawn = loadImage("BlackPawn.jpeg");
  PImage BlackKnight = loadImage("BlackNight.png");
  PImage BlackBishop = loadImage("BlackBishop.png");
  PImage BlackRook = loadImage("BlackRook.jpg");
  PImage BlackQueen = loadImage("BlackQueen.jpg");
  PImage BlackKing = loadImage("BlackKing.png");
  
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
  public setupBoard(){
    
  }
