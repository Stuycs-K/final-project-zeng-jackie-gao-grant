int[] lightSquareColour = {238, 238, 210, 255};
int[] darkSquareColour = {117, 150, 86, 255};
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

// Timer variables
int whiteTime;
int blackTime;
int lastMoveTime;
boolean gameOver = false;
boolean demonstrationMode = false;  // Flag for demonstration mode

ArrayList<GameState> gameStateHistory = new ArrayList<>();

boolean inMenu = true;
int[] timeOptions = {300000, 600000, 900000}; // 5, 10, 15 minutes in milliseconds
String[] timeOptionLabels = {"5 minutes", "10 minutes", "15 minutes"};
int selectedTimeIndex = 1; // Default to 10 minutes

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
  displayMenu();
}

void draw() {
  if (inMenu) {
    displayMenu();
  } else {
    if (!gameOver || demonstrationMode) {  // Skip game over checks in demonstration mode
      int currentTime = millis();
      int elapsedTime = currentTime - lastMoveTime;
      
      if (chessBoard.turn == chessBoard.White) {
        whiteTime -= elapsedTime;
      } else {
        blackTime -= elapsedTime;
      }

      lastMoveTime = currentTime;

      if (whiteTime <= 0 || blackTime <= 0) {
        gameOver = true;
        displayBoard();
      } else {
        displayBoard();
        displayTimers();
      }
    } else {
      displayGameOver();
    }
  }
}

void mousePressed() {
  if (inMenu) {
    for (int i = 0; i < timeOptions.length; i++) {
      if (mouseX > 400 && mouseX < 600 && mouseY > 200 + i * 100 && mouseY < 250 + i * 100) {
        selectedTimeIndex = i;
      }
    }
    if (mouseX > 400 && mouseX < 600 && mouseY > 600 && mouseY < 650) {
      whiteTime = timeOptions[selectedTimeIndex];
      blackTime = timeOptions[selectedTimeIndex];
      lastMoveTime = millis();
      inMenu = false;
    }
  } else {
    if (!gameOver || demonstrationMode) {  // Skip game over checks in demonstration mode
      if (chessBoard.promotion) {
        chessBoard.changeTurn();
        int choice = floor(mouseX / (width / 4));
        if (choice == 0) {
          chessBoard.board[chessBoard.promotionPosition.i][chessBoard.promotionPosition.j] = chessBoard.turn | chessBoard.Queen;
        }
        if (choice == 1) {
          chessBoard.board[chessBoard.promotionPosition.i][chessBoard.promotionPosition.j] = chessBoard.turn | chessBoard.Rook;
        }
        if (choice == 2) {
          chessBoard.board[chessBoard.promotionPosition.i][chessBoard.promotionPosition.j] = chessBoard.turn | chessBoard.Bishop;
        }
        if (choice == 3) {
          chessBoard.board[chessBoard.promotionPosition.i][chessBoard.promotionPosition.j] = chessBoard.turn | chessBoard.Knight;
        }
        chessBoard.changeTurn();
        chessBoard.promotion = false;
      } else {
        coordinate klc = chessBoard.locateKing(chessBoard.White);
        if (selectedSquare == null) {
          if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800) {
            selectedSquare = new coordinate(floor(mouseX / squareSize), floor(mouseY / squareSize));
          }
        } else {
          ArrayList<move> moves = movesFromSquare(chessBoard.board, selectedSquare, chessBoard.turn);
          for (move m : moves) {
            if (floor(mouseX / squareSize) == m.i2 && floor(mouseY / squareSize) == m.j2) {
              int[][] temp = chessBoard.makeUpdatingMove(chessBoard.board, m.i1, m.j1, m.i2, m.j2);
              chessBoard.board = temp;
              selectedSquare = null;
              chessBoard.changeTurn();
              lastMoveTime = millis(); // Update the last move time
              displayBoard();
              break;
            }
          }
          selectedSquare = null;
        }
      }
      chessBoard.checkForGameOver();
      displayBoard();
    }
  }
}

ArrayList<move> movesFromSquare(int[][] b, coordinate sq, int whoseTurn) {
  ArrayList<move> moves = new ArrayList<move>();
  HashMap<coordinate, coordinate> plm = chessBoard.generateLegalMoves(whoseTurn);
  for (coordinate c : plm.keySet()) {
    coordinate v1 = c;
    coordinate v2 = plm.get(c);
    if (v1.i == sq.i && v1.j == sq.j) moves.add(new move(v1.i, v1.j, v2.i, v2.j));
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

  if (!demonstrationMode) {  // Skip game over message in demonstration mode
    String gameOverMessage = chessBoard.checkForGameOver();
    if (!gameOverMessage.isEmpty()) {
      gameOver = true;
    }

    textSize(30);
    strokeWeight(3);
    stroke(0);
    fill(255);
    text(gameOverMessage, 890, height / 2 + 30);
  }

  if (chessBoard.turn == chessBoard.White) {
    text("White to move", 900, 700);
  } else {
    text("Black to move", 900, 100);
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

  displayCheckCondition();
}

void displayCheckCondition() {
  fill(255, 0, 0);
  textSize(25);
  if (chessBoard.isCheck(chessBoard.White)) {
    text("White is in check!", 900, 600);
  } else if (chessBoard.isCheck(chessBoard.Black)) {
    text("Black is in check!", 900, 150);
  }
}

void displayTimers() {
  fill(255);
  textSize(20);
  text("White: " + formatTime(whiteTime), 880, 650);
  text("Black: " + formatTime(blackTime), 880, 50);
}

String formatTime(int millis) {
  int seconds = millis / 1000;
  int minutes = seconds / 60;
  seconds %= 60;
  return nf(minutes, 2) + ":" + nf(seconds, 2);
}

void displayGameOver() {
  if (whiteTime <= 0 || blackTime <= 0) {
    fill(255, 0, 0);
    textSize(20);
    text("Time's up! " + (whiteTime <= 0 ? "Black wins!" : "White wins!"), 900, height / 2);
  } else {
    fill(255, 0, 0);
    textSize(20);
    text("Game Over: " + (chessBoard.turn == chessBoard.White ? "Black wins!" : "White wins!"), 900, height / 2);
  }
}

void displayMenu() {
  background(0);
  fill(255);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("Select Time Per Player", width / 2, 100);
  
  for (int i = 0; i < timeOptions.length; i++) {
    if (i == selectedTimeIndex) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    rect(400, 200 + i * 100, 200, 50);
    fill(0);
    text(timeOptionLabels[i], 500, 225 + i * 100);
  }

  fill(0, 255, 0);
  rect(400, 600, 200, 50);
  fill(0);
  text("Start Game", 500, 625);
}
void saveGameState() {
  gameStateHistory.add(new GameState(chessBoard.board, chessBoard.turn, whiteTime, blackTime,
                                    chessBoard.WKingMoved, chessBoard.BKingMoved, chessBoard.WQRookMoved, chessBoard.WKRookMoved,
                                    chessBoard.BQRookMoved, chessBoard.BKRookMoved, chessBoard.pMove1, chessBoard.pMove2,
                                    chessBoard.promotion, chessBoard.promotionPosition));
}
void undoMove() {
  if (gameStateHistory.size() > 0) {
    GameState previousState = gameStateHistory.remove(gameStateHistory.size() - 1);
    chessBoard.board = previousState.board;
    chessBoard.turn = previousState.turn;
    whiteTime = previousState.whiteTime;
    blackTime = previousState.blackTime;
    chessBoard.WKingMoved = previousState.WKingMoved;
    chessBoard.BKingMoved = previousState.BKingMoved;
    chessBoard.WQRookMoved = previousState.WQRookMoved;
    chessBoard.WKRookMoved = previousState.WKRookMoved;
    chessBoard.BQRookMoved = previousState.BQRookMoved;
    chessBoard.BKRookMoved = previousState.BKRookMoved;
    chessBoard.pMove1 = previousState.pMove1;
    chessBoard.pMove2 = previousState.pMove2;
    chessBoard.promotion = previousState.promotion;
    chessBoard.promotionPosition = previousState.promotionPosition;
    displayBoard();
  }
}
void keyPressed() {
  if (key == 'u' || key == 'U') {
    undoMove();
  } else if (key == 'Q' || key == 'q') {
    createSinglePieceBoard(chessBoard.White | chessBoard.Queen, chessBoard.Black | chessBoard.Queen);
  } else if (key == 'N' || key == 'n') {
    createSinglePieceBoard(chessBoard.White | chessBoard.Knight, chessBoard.Black | chessBoard.Knight);
  } else if (key == 'R' || key == 'r') {
    createSinglePieceBoard(chessBoard.White | chessBoard.Rook, chessBoard.Black | chessBoard.Rook);
  } else if (key == 'B' || key == 'b') {
    createSinglePieceBoard(chessBoard.White | chessBoard.Bishop, chessBoard.Black | chessBoard.Bishop);
  } else if (key == 'K' || key == 'k') {
    createSinglePieceBoard(chessBoard.White | chessBoard.King, chessBoard.Black | chessBoard.King);
  }
}

void createSinglePieceBoard(int whitePiece, int blackPiece) {
  chessBoard.board = new int[8][8];
  chessBoard.board[3][3] = whitePiece;
  chessBoard.board[4][4] = blackPiece;
  demonstrationMode = true;  // Enable demonstration mode
  gameOver = false;  // Ensure the game is not over
  chessBoard.turn = whitePiece & 24;  // Set turn to the color of the piece
  displayBoard();
}
