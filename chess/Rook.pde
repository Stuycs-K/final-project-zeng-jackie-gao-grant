class Rook extends piece {
  Rook(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhiteRook : BlackRook;
  }

  ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y) {
    ArrayList<move> moves = new ArrayList<move>();
    int direction = (pieceColor == White) ? -8 : 8;
    int startRow = (pieceColor == White) ?  0 : 0;
    if (board[x][y + direction] == null) {
        moves.add(new move(x, y, x, y + direction));
        if (y == startRow && board[x][y + 2 * direction] == null) {
        moves.add(new move(x, y, x, y + 2 * direction));
      }
    }
    if (x > 0 && board[x - 1][y + direction] != null && board[x - 1][y + direction].pieceColor != pieceColor) {
      moves.add(new move(x, y, x - 1, y + direction));
    }
    if (x < 7 && board[x + 1][y + direction] != null && board[x + 1][y + direction].pieceColor != pieceColor) {
      moves.add(new move(x, y, x + 1, y + direction));
    }
    return moves;  
  }
