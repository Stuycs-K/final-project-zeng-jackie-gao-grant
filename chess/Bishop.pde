class Bishop extends piece {
  Bishop(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhiteBishop : BlackBishop;
  }

  ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y) {}
