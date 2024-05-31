import java.util.ArrayList;
import java.util.HashMap;

class Board {
  int[][] board;
  int turn;

  // last 3 bits indicate type
  final int None = 0;
  final int Pawn = 1;
  final int Knight = 2;
  final int Bishop = 3;
  final int Rook = 4;
  final int Queen = 5;
  final int King = 6;

  // first 2 bits indicate colour
  final int White = 8;
  final int Black = 16;

  boolean WKingMoved = false;
  boolean BKingMoved = false;
  boolean WQRookMoved = false; // white queenside rook
  boolean WKRookMoved = false; // white kingside rook
  boolean BQRookMoved = false; // black queenside rook
  boolean BKRookMoved = false; // black kingside rook

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
