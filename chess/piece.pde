abstract class Piece {
  int colour;
  int type;

  Piece(int colour, int type) {
    this.colour = colour;
    this.type = type;
  }

  abstract ArrayList<coordinate> generateMoves(int[][] board, coordinate pos);
}
