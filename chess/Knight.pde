class Knight extends piece {
  Knight(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhiteKnight : BlackKnight;
  }

  ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y) {
    
  }
