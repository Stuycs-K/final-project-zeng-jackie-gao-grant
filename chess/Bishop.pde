class Bishop extends Piece {
  Bishop(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WBishop : BBishop;
  }

  ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y) {
    ArrayList<move> moves = new ArrayList<move>();
    for (int i = 1; i < 8; i++) {
      int newX = x + i;
      int newY = y + i;
      if (newX < 8 && newY < 8) {
        if (board[newX][newY] == null) {
          moves.add(new move(x, y, newX, newY));
        } else {
          if (board[newX][newY].pieceColor != pieceColor) moves.add(new move(x, y, newX, newY));
          break;
        }
      }
    }
    for (int i = 1; i < 8; i++) {
      int newX = x - i;
      int newY = y - i;
      if (newX >= 0 && newY >= 0) {
        if (board[newX][newY] == null) {
          moves.add(new move(x, y, newX, newY));
        } else {
          if (board[newX][newY].pieceColor != pieceColor) moves.add(new move(x, y, newX, newY));
          break;
        }
      }
    }
    for (int i = 1; i < 8; i++) {
      int newX = x + i;
      int newY = y - i;
      if (newX < 8 && newY >= 0) {
        if (board[newX][newY] == null) {
          moves.add(new move(x, y, newX, newY));
        } else {
          if (board[newX][newY].pieceColor != pieceColor) moves.add(new move(x, y, newX, newY));
          break;
        }
      }
    }
    for (int i = 1; i < 8; i++) {
      int newX = x - i;
      int newY = y + i;
      if (newX >= 0 && newY < 8) {
        if (board[newX][newY] == null) {
          moves.add(new move(x, y, newX, newY));
        } else {
          if (board[newX][newY].pieceColor != pieceColor) moves.add(new move(x, y, newX, newY));
          break;
        }
      }
    }
    return moves;
  }
}
