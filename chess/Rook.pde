class Rook extends piece {
  Rook(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhiteRook : BlackRook;
  }

    ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y) {
    ArrayList<move> moves = new ArrayList<move>();
    for (int i = x + 1; i < 8; i++) {
      if (board[i][y] == null) {
        moves.add(new move(x, y, i, y));
      } else {
        if (board[i][y].pieceColor != pieceColor)
        moves.add(new move(x, y, i, y));
        break;
      }
    }
    for (int i = x - 1; i >= 0; i--) {
      if (board[i][y] == null) {
        moves.add(new move(x, y, i, y));
      } else {
        if (board[i][y].pieceColor != pieceColor) moves.add(new move(x, y, i, y));
        break;
      }
    }
    for (int j = y + 1; j < 8; j++) {
      if (board[x][j] == null) {
        moves.add(new move(x, y, x, j));
      } else {
        if (board[x][j].pieceColor != pieceColor) moves.add(new move(x, y, x, j));
        break;
      }
    }
    for (int j = y - 1; j >= 0; j--) {
      if (board[x][j] == null) {
        moves.add(new move(x, y, x, j));
      } else {
        if (board[x][j].pieceColor != pieceColor) moves.add(new move(x, y, x, j));
        break;
      }
    }
    return moves;
  }
}
