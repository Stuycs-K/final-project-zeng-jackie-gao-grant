abstract class piece {
  int pieceColor;
  boolean hasMoved;

  public void Piece(int pieceColor) {
    this.pieceColor = pieceColor;
    this.hasMoved = false;
  }

  abstract PImage getImage();

  abstract ArrayList<move> getPossibleMoves(piece[][] board, int x, int y);
}
