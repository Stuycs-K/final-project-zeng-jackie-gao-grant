abstract class piece {
  int color;
  boolean hasMoved;

  Piece(int color) {
    this.color = color;
    this.hasMoved = false;
  }

  abstract PImage getImage();

  abstract ArrayList<move> getPossibleMoves(Piece[][] board, int x, int y);
}
