class Pawn extends piece {
  Pawn(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhitePawn : BlackPawn;
  }

  
}
