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
    if (!hasMoved) {
      if (pieceColor == White) {
        if (!WKRookMoved && board[5][7] == null && board[6][7] == null) {
          moves.add(new move(x, y, 6, 7));
        }
        if (!WQRookMoved && board[1][7] == null && board[2][7] == null && board[3][7] == null) {
          moves.add(new move(x, y, 2, 7));
        }
      } else {
        if (!BKRookMoved && board[5][0] == null && board[6][0] == null) {
          moves.add(new move(x, y, 6, 0));
        }
        if (!BQRookMoved && board[1][0] == null && board[2][0] == null && board[3][0] == null) {
          moves.add(new move(x, y, 2, 0));
        }
      }
    }
    return moves;
  }
  }
