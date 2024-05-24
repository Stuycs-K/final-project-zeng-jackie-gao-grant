class Pawn extends piece {
  Pawn(int pieceColor) {
    super(pieceColor);
  }

  PImage getImage() {
    return (pieceColor == White) ? WhitePawn : BlackPawn;
  }

  ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y) {
    ArrayList<move> moves = new ArrayList<move>();
    int direction = (pieceColor == White) ? -1 : 1;
    int startRow = (pieceColor == White) ? 6 : 1;
    
  }
}
