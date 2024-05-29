class Rook extends piece {
  Rook(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhiteRook : BlackRook;
  }

<<<<<<< HEAD
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
=======
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
>>>>>>> b2e61dea588d077a332c3d7e220e7776d5827c5b
  }
