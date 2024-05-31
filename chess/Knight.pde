class Knight extends Piece {
  Knight(int colour) {
    super(colour, chessBoard.Knight);
  }

  @Override
  ArrayList<coordinate> generateMoves(int[][] board, coordinate pos) {
    ArrayList<coordinate> moves = new ArrayList<>();
    int[][] offsets = {{-2, -1}, {-1, -2}, {1, -2}, {2, -1}, {2, 1}, {1, 2}, {-1, 2}, {-2, 1}};
    for (int[] offset : offsets) {
      int newI = pos.i + offset[0];
      int newJ = pos.j + offset[1];
      
    }
    return moves;
  }
}
