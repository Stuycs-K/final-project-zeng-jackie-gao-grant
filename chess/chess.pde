int[][] board;

int[] lightSquareColour = {238,238,210,255};
int[] darkSquareColour = {117,150,86,255};
int[] lastMoveColour1 = {50, 255, 50, 40};
int[] lastMoveColour2 = {50, 255, 50, 60};
int[] selectedSquareColour = {0, 150, 255, 50};
int[] possibleMovesColour = {255, 0, 0, 60};

int squareSize = 100;


final int None = 0;
final int Pawn = 1;
final int Knight = 2;
final int Bishop = 3;
final int Rook = 4;
final int Queen = 5;
final int King = 6;

final int White = 8;
final int Black = 16;

int turn = White;

PImage WPawn;
PImage WKnight;
PImage WBishop;
PImage WRook;
PImage WQueen;
PImage WKing;

PImage BPawn;
PImage BKnight;
PImage BBishop;
PImage BRook;
PImage BQueen;
PImage BKing;


coordinate selectedSquare = null;


boolean WKingMoved = false;
boolean BKingMoved = false;
boolean WQRookMoved = false;
boolean WKRookMoved = false;
boolean BQRookMoved = false;
boolean BKRookMoved = false;

coordinate pMove1 = null;
coordinate pMove2 = null;

boolean promotion = false;
coordinate promotionPosition = null;

void setup() {
  WPawn = loadImage("WhitePawn.png");
  WKnight = loadImage("WhiteKnight.png");
  WBishop = loadImage("WhiteBishop.png");
  WRook = loadImage("WhiteRook.png");
  WQueen = loadImage("WhiteQueen.png");
  WKing = loadImage("WhiteKing.png");

  BPawn = loadImage("BlackPawn.png");
  BKnight = loadImage("BlackKnight.png");
  BBishop = loadImage("BlackBishop.png");
  BRook = loadImage("BlackRook.png");
  BQueen = loadImage("BlackQueen.png");
  BKing = loadImage("BlackKing.png");

  WPawn.resize(squareSize, squareSize);
  WKnight.resize(squareSize, squareSize);
  WBishop.resize(squareSize, squareSize);
  WRook.resize(squareSize, squareSize);
  WQueen.resize(squareSize, squareSize);
  WKing.resize(squareSize, squareSize);

  BPawn.resize(squareSize, squareSize);
  BKnight.resize(squareSize, squareSize);
  BBishop.resize(squareSize, squareSize);
  BRook.resize(squareSize, squareSize);
  BQueen.resize(squareSize, squareSize);
  BKing.resize(squareSize, squareSize);

  size(1000, 800);
  board = new int[8][8];
  setupBoard();

  displayBoard();
}

void changeTurn() {
  turn = turn == White ? Black : White;
}

void draw() {
  if(millis() < 5000)displayBoard();
}
void mousePressed() {
  if (promotion) {
    changeTurn();
    int choice = floor(mouseX / (width / 4));
    if (choice == 0) {
      board[promotionPosition.i][promotionPosition.j] = turn | Queen;
    }
    if (choice == 1) {
      board[promotionPosition.i][promotionPosition.j] = turn | Rook;
    }
    if (choice == 2) {
      board[promotionPosition.i][promotionPosition.j] = turn | Bishop;
    }
    if (choice == 3) {
      board[promotionPosition.i][promotionPosition.j] = turn | Knight;
    }
    changeTurn();
    promotion = false;
  } else {
    coordinate klc = locateKing(board, White);
    if (selectedSquare == null) {
      if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800) {
        selectedSquare = new coordinate(floor(mouseX / squareSize), floor(mouseY / squareSize));
      }
    } else {
      ArrayList<move> moves = movesFromSquare(board, selectedSquare, turn);
      for (move m : moves) {
        if (floor(mouseX / squareSize) == m.i2 && floor(mouseY / squareSize) == m.j2) {
          //make the move
          int[][] temp = makeUpdatingMove(board, m.i1, m.j1, m.i2, m.j2);
          board = temp;
          selectedSquare = null;
          changeTurn();
          displayBoard();
          break;
        }
      }
      selectedSquare = null;
    }
  }
  checkForGameOver(board, turn);
  displayBoard();
}
