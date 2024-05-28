class King extends piece {
  King(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhiteKing : BlackKing;
  }

  ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y) {}
