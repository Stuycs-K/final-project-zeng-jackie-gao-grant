class Rook extends piece {
  Rook(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhiteRook : BlackRook;
  }

  ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y) {
