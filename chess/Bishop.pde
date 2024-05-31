class Bishop extends Piece {
  Bishop(int colour) {
    super(colour, chessBoard.Bishop);
  }

  @Override
  ArrayList<coordinate> generateMoves(int[][] board, coordinate pos) {
    ArrayList<coordinate> moves = new ArrayList<>();
    int[][] directions = {{1, 1}, {1, -1}, {-1, 1}, {-1, -1}};
    for (int[] dir : directions) {
      for (int dist = 1; dist < 8; dist++) {
        int newI = pos.i + dir[0] * dist;
        int newJ = pos.j + dir[1] * dist;
        if (newI >= 0 && newI < 8 && newJ >= 0 && newJ < 8) {
          if (board[newI][newJ] == chessBoard.None) {
            moves.add(new coordinate(newI, newJ));
          } else {
            if ((board[newI][newJ] & 24) != colour) {
              moves.add(new coordinate(newI, newJ));
            }
            break;
          }
        }
      }
    }
    return moves;
  }
}
