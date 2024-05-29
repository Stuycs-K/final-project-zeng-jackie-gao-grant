class King extends piece {
  King(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhiteKing : BlackKing;
  }

  ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y) {
    ArrayList<move> moves = new ArrayList<move>();
    int[][] deltas = {{1, 0}, {0, 1}, {-1, 0}, {0, -1}, {1, 1}, {1, -1}, {-1, 1}, {-1, -1}};
    for (int[] delta : deltas) {
      int newX = x + delta[0];
      int newY = y + delta[1];
      if (newX >= 0 && newX < 8 && newY >= 0 && newY < 8) {
        if (board[newX][newY] == null || board[newX][newY].pieceColor != pieceColor) {
          moves.add(new move(x, y, newX, newY));
        }
      }
    }
    return moves;
  }
  }
