class King extends Piece {
  King(int colour) {
    super(colour, chessBoard.King);
  }

  @Override
  ArrayList<coordinate> generateMoves(int[][] board, coordinate pos) {
    ArrayList<coordinate> moves = new ArrayList<>();
    int[][] offsets = {{1, 0}, {0, 1}, {-1, 0}, {0, -1}, {1, 1}, {1, -1}, {-1, 1}, {-1, -1}};
    for (int[] offset : offsets) {
      int newI = pos.i + offset[0];
      int newJ = pos.j + offset[1];
      if (newI >= 0 && newI < 8 && newJ >= 0 && newJ < 8) {
        if (board[newI][newJ] == chessBoard.None || (board[newI][newJ] & 24) != colour) {
          moves.add(new coordinate(newI, newJ));
        }
      }
    }
