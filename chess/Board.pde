import java.util.ArrayList;
import java.util.HashMap;

class Board {
  int[][] board;
  int turn;


  final int None = 0;
  final int Pawn = 1;
  final int Knight = 2;
  final int Bishop = 3;
  final int Rook = 4;
  final int Queen = 5;
  final int King = 6;


  final int White = 8;
  final int Black = 16;

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

  Board() {
    turn = White;
    setupBoard();
  }

  void setupBoard() {
    board = new int[8][8];
    board[0][0] = Black | Rook;
    board[1][0] = Black | Knight;
    board[2][0] = Black | Bishop;
    board[3][0] = Black | Queen;
    board[4][0] = Black | King;
    board[5][0] = Black | Bishop;
    board[6][0] = Black | Knight;
    board[7][0] = Black | Rook;
    board[0][1] = Black | Pawn;
    board[1][1] = Black | Pawn;
    board[2][1] = Black | Pawn;
    board[3][1] = Black | Pawn;
    board[4][1] = Black | Pawn;
    board[5][1] = Black | Pawn;
    board[6][1] = Black | Pawn;
    board[7][1] = Black | Pawn;

    board[0][7] = White | Rook;
    board[1][7] = White | Knight;
    board[2][7] = White | Bishop;
    board[3][7] = White | Queen;
    board[4][7] = White | King;
    board[5][7] = White | Bishop;
    board[6][7] = White | Knight;
    board[7][7] = White | Rook;
    board[0][6] = White | Pawn;
    board[1][6] = White | Pawn;
    board[2][6] = White | Pawn;
    board[3][6] = White | Pawn;
    board[4][6] = White | Pawn;
    board[5][6] = White | Pawn;
    board[6][6] = White | Pawn;
    board[7][6] = White | Pawn;
  }
   void changeTurn() {
    turn = turn == White ? Black : White;
  }
  coordinate locateKing(int kingColour, int[][] board) {
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (board[i][j] == (kingColour | King)) {
        return new coordinate(i, j);
      }
    }
  }
  return new coordinate(-1, -1);
}
coordinate locateKing(int kingColour) {
  return locateKing(kingColour, board);
}
  boolean isCheck(int kingColour, int[][] board) {
  HashMap<coordinate, coordinate> pseudoLegalMoves = generatePseudoLegalMoves(otherColour(kingColour), board);
  coordinate kingLocation = locateKing(kingColour, board);
  for (coordinate c : pseudoLegalMoves.values()) {
    if (c.i == kingLocation.i && c.j == kingLocation.j) {
      return true;
    }
  }
  return false;
}
boolean isCheck(int kingColour) {
  return isCheck(kingColour, board);
}
HashMap<coordinate, coordinate> generateLegalMoves(int colour) {
  HashMap<coordinate, coordinate> pseudoLegalMoves = generatePseudoLegalMoves(colour);
  HashMap<coordinate, coordinate> legalMoves = new HashMap<>();
  
  for (coordinate from : pseudoLegalMoves.keySet()) {
    coordinate to = pseudoLegalMoves.get(from);
    int[][] newBoard = makeMove(board, from.i, from.j, to.i, to.j);
    if (!isCheck(colour, newBoard)) {
      legalMoves.put(from, to);
    }
  }
  return legalMoves;
}
HashMap<coordinate, coordinate> generatePseudoLegalMoves(int colour, int[][] board) {
  HashMap<coordinate, coordinate> moves = new HashMap<>();
  Piece[][] pieces = new Piece[8][8];

  for (int j = 0; j < 8; j++) {
    for (int i = 0; i < 8; i++) {
      int pieceAt = board[i][j];
      int pieceColour = pieceAt & 24;
      int pieceType = pieceAt & 7;

      if (pieceType == Pawn) {
        pieces[i][j] = new Pawn(pieceColour);
      } else if (pieceType == Knight) {
        pieces[i][j] = new Knight(pieceColour);
      } else if (pieceType == Bishop) {
        pieces[i][j] = new Bishop(pieceColour);
      } else if (pieceType == Rook) {
        pieces[i][j] = new Rook(pieceColour);
      } else if (pieceType == Queen) {
        pieces[i][j] = new Queen(pieceColour);
      } else if (pieceType == King) {
        pieces[i][j] = new King(pieceColour);
      }
    }
  }
  for (int j = 0; j < 8; j++) {
    for (int i = 0; i < 8; i++) {
      if (pieces[i][j] != null && pieces[i][j].colour == colour) {
        ArrayList<coordinate> pieceMoves = pieces[i][j].generateMoves(board, new coordinate(i, j));
        for (coordinate move : pieceMoves) {
          moves.put(new coordinate(i, j), move);
        }
      }
    }
  }
  return moves;
}
HashMap<coordinate, coordinate> generatePseudoLegalMoves(int colour) {
  return generatePseudoLegalMoves(colour, board);
}


  boolean emptySquare(int i, int j) {
    return board[i][j] == None;
  }
  int otherColour(int c) {
    return (c == White ? Black : White);
  }
  boolean enemyPiece(int i, int j, int friendly) {
    if (pieceColour(board[i][j]) != friendly && board[i][j] != None) {
      return true;
    }
    return false;
  }

  int[][] makeMove(int[][] b, int i1, int j1, int i2, int j2) {
    int[][] newBoard = new int[8][8];
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        newBoard[i][j] = b[i][j];
      }
    }
    if (newBoard[i1][j1] == (White | King)) {
      if (i1 == 4 && i2 == 6) {
        newBoard[7][7] = None;
        newBoard[5][7] = White | Rook;
      }
      if (i1 == 4 && i2 == 2) {
        newBoard[0][7] = None;
        newBoard[3][7] = White | Rook;
      }
    }
    if (newBoard[i1][j1] == (Black | King)) {
      if (i1 == 4 && i2 == 6) {
        newBoard[7][0] = None;
        newBoard[5][0] = Black | Rook;
      }
      if (i1 == 4 && i2 == 2) {
        newBoard[0][0] = None;
        newBoard[3][0] = Black | Rook;
      }
    }
    if (newBoard[i1][j1] == (White | Pawn) || newBoard[i1][j1] == (Black | Pawn)) {
      if (i1 != i2 && j1 != j2) {
        if (newBoard[i2][j2] == None) {
          newBoard[i2][j1] = None;
        }
      }
    }
    int temp = b[i1][j1];
    newBoard[i1][j1] = None;
    newBoard[i2][j2] = temp;

    return newBoard;
  }

  int pieceColour(int p) {
    return (p >> 3) * 8;
  }

  int selectedPiece(coordinate sq) {
    return board[sq.i][sq.j];
  }

  String checkForGameOver() {
    HashMap<coordinate, coordinate> moves = generateLegalMoves(turn);
    if (moves.size() == 0) {
      if (isCheck(turn)) {
        return "Checkmate";
      } else {
        return "Stalemate";
      }
    }
    return "";
  }
int[][] makeUpdatingMove(int[][] b, int i1, int j1, int i2, int j2) {
    int[][] temp = makeMove(b, i1, j1, i2, j2);
    if (selectedPiece(new coordinate(i1, j1)) == (White | King)) {
      WKingMoved = true;
    }
    if (selectedPiece(new coordinate(i1, j1)) == (Black | King)) {
      BKingMoved = true;
    }
    if (selectedPiece(new coordinate(i1, j1)) == (White | Rook) && i1 == 0) {
      WQRookMoved = true;
    }
    if (selectedPiece(new coordinate(i1, j1)) == (White | Rook) && i1 == 7) {
      WKRookMoved = true;
    }
    if (selectedPiece(new coordinate(i1, j1)) == (Black | Rook) && i1 == 0) {
      BQRookMoved = true;
    }
    if (selectedPiece(new coordinate(i1, j1)) == (Black | Rook) && i1 == 7) {
      BKRookMoved = true;
    }
    pMove1 = new coordinate(i1, j1);
    pMove2 = new coordinate(i2, j2);

    if (j2 == (turn == White ? 0 : 7) && (selectedPiece(new coordinate(i1, j1)) == (White | Pawn) || selectedPiece(new coordinate(i1, j1)) == (Black | Pawn))) {
      promotion = true;
      promotionPosition = new coordinate(i2, j2);
    }
    return temp;
  }
}
