int[] lightSquareColour = {238,238,210,255};
int[] darkSquareColour = {117,150,86,255};
int[] lastMoveColour1 = {50, 255, 50, 40};
int[] lastMoveColour2 = {50, 255, 50, 60};
int[] selectedSquareColour = {0, 150, 255, 50};
int[] possibleMovesColour = {255, 0, 0, 60};

int squareSize = 100;

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

Board chessBoard;

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
  chessBoard = new Board();
  displayBoard();
}

void draw() {
  if (millis() < 5000) displayBoard();
}




ArrayList<move> movesFromSquare(int[][] b, coordinate sq, int whoseTurn) {
  ArrayList<move> moves = new ArrayList<move>();
  HashMap<coordinate, coordinate> plm = chessBoard.generateLegalMoves(whoseTurn);
  for (coordinate c : plm.keySet()) {
    coordinate v1 = c;
    coordinate v2 = plm.get(c);
    if (v1.i == sq.i && v1.j == sq.j)moves.add(new move(v1.i, v1.j, v2.i, v2.j));
  }

  return moves;
}

void displayBoard() {
  background(70);
  fill(lightSquareColour[0], lightSquareColour[1], lightSquareColour[2]);
  noStroke();
  rect(0, 0, 800, 800);
  for (int j = 0; j < 8; j++) {
    for (int i = 0; i < 8; i++) {
      if (i % 2 == 0) {
        if (j % 2 != 0) {
          fill(darkSquareColour[0], darkSquareColour[1], darkSquareColour[2]);
          rect(i * squareSize, j * squareSize, squareSize, squareSize);
        }
      } else {
        if (j % 2 == 0) {
          fill(darkSquareColour[0], darkSquareColour[1], darkSquareColour[2]);
          rect(i * squareSize, j * squareSize, squareSize, squareSize);
        }
      }
      boolean highlighted = false;
      if (chessBoard.pMove1 != null) {
        if (chessBoard.pMove1.i == i && chessBoard.pMove1.j == j) {
          fill(lastMoveColour1[0], lastMoveColour1[1], lastMoveColour1[2], lastMoveColour1[3]);
          rect(chessBoard.pMove1.i * squareSize, chessBoard.pMove1.j * squareSize, squareSize, squareSize);
          highlighted = true;
        }
        if (chessBoard.pMove2 != null) {
          if (chessBoard.pMove2.i == i && chessBoard.pMove2.j == j) {
            fill(lastMoveColour2[0], lastMoveColour2[1], lastMoveColour2[2], lastMoveColour2[3]);
            rect(chessBoard.pMove2.i * squareSize, chessBoard.pMove2.j * squareSize, squareSize, squareSize);
            highlighted = true;
          }
        }
      }
      if (!highlighted) {
        if (i % 2 == 0) {
          if (j % 2 != 0) {
            fill(darkSquareColour[0], darkSquareColour[1], darkSquareColour[2]);
            rect(i * squareSize, j * squareSize, squareSize, squareSize);
          }
        } else {
          if (j % 2 == 0) {
            fill(darkSquareColour[0], darkSquareColour[1], darkSquareColour[2]);
            rect(i * squareSize, j * squareSize, squareSize, squareSize);
          }
        }
      }
      PImage pieceImg = null;
      if (chessBoard.board[i][j] == (chessBoard.White | chessBoard.Pawn)) {
        pieceImg = WPawn;
      } else if (chessBoard.board[i][j] == (chessBoard.White | chessBoard.Knight)) {
        pieceImg = WKnight;
      } else if (chessBoard.board[i][j] == (chessBoard.White | chessBoard.Bishop)) {
        pieceImg = WBishop;
      } else if (chessBoard.board[i][j] == (chessBoard.White | chessBoard.Rook)) {
        pieceImg = WRook;
      } else if (chessBoard.board[i][j] == (chessBoard.White | chessBoard.Queen)) {
        pieceImg = WQueen;
      } else if (chessBoard.board[i][j] == (chessBoard.White | chessBoard.King)) {
        pieceImg = WKing;
      } else if (chessBoard.board[i][j] == (chessBoard.Black | chessBoard.Pawn)) {
        pieceImg = BPawn;
      } else if (chessBoard.board[i][j] == (chessBoard.Black | chessBoard.Knight)) {
        pieceImg = BKnight;
      } else if (chessBoard.board[i][j] == (chessBoard.Black | chessBoard.Bishop)) {
        pieceImg = BBishop;
      } else if (chessBoard.board[i][j] == (chessBoard.Black | chessBoard.Rook)) {
        pieceImg = BRook;
      } else if (chessBoard.board[i][j] == (chessBoard.Black | chessBoard.Queen)) {
        pieceImg = BQueen;
      } else if (chessBoard.board[i][j] == (chessBoard.Black | chessBoard.King)) {
        pieceImg = BKing;
      }
      if (pieceImg != null) {
        imageMode(CENTER);
        image(pieceImg, (i + 0.5) * squareSize, (j + 0.5) * squareSize, squareSize, squareSize);
      }
    }
  }

  if (selectedSquare != null) {
    fill(selectedSquareColour[0], selectedSquareColour[1], selectedSquareColour[2], selectedSquareColour[3]);
    noStroke();
    rect(selectedSquare.i * squareSize, selectedSquare.j * squareSize, squareSize, squareSize);

    if (chessBoard.selectedPiece(selectedSquare) != chessBoard.None) {
      ArrayList<move> moves = movesFromSquare(chessBoard.board, selectedSquare, chessBoard.turn);
      for (move m : moves) {
        noStroke();
        fill(possibleMovesColour[0], possibleMovesColour[1], possibleMovesColour[2], possibleMovesColour[3]);
        rect(m.i2 * squareSize, m.j2 * squareSize, squareSize, squareSize);
      }
    }
  }

  String gameOver = chessBoard.checkForGameOver();
  textSize(30);
  strokeWeight(3);
  stroke(0);
  fill(255);
  text(gameOver, 810, height / 2);

  if (chessBoard.turn == chessBoard.White) {
    text("White to move", 810, 700);
  }

  if (chessBoard.turn == chessBoard.Black) {
    text("Black to move", 810, 100);
  }

  if (chessBoard.promotion) {
    chessBoard.changeTurn();
    noStroke();
    fill(50, 40);
    rect(0, 0, width, height);
    if (chessBoard.turn == chessBoard.White) {
      imageMode(CENTER);
      image(WQueen, 0.125 * width, height / 2);
      image(WRook, 0.375 * width, height / 2);
      image(WBishop, 0.625 * width, height / 2);
      image(WKnight, 0.875 * width, height / 2);
    }
    if (chessBoard.turn == chessBoard.Black) {
      imageMode(CENTER);
      image(BQueen, 0.125 * width, height / 2);
      image(BRook, 0.375 * width, height / 2);
      image(BBishop, 0.625 * width, height / 2);
      image(BKnight, 0.875 * width, height / 2);
    }
    chessBoard.changeTurn();
  }
}
