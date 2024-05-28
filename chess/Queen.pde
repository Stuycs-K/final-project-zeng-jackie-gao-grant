class Queen extends piece {
  Queen(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhiteQueen : BlackQueen;
  }

  ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y) {
