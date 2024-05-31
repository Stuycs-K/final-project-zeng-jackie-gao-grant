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
