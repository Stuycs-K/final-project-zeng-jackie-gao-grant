class Pawn extends Piece {
  Pawn(int colour) {
    super(colour, chessBoard.Pawn);
  }

  @Override
  ArrayList<coordinate> generateMoves(int[][] board, coordinate pos) {
    ArrayList<coordinate> moves = new ArrayList<>();
    int direction = (colour == chessBoard.White) ? -1 : 1;

    // Normal move
    if (pos.j + direction >= 0 && pos.j + direction < 8 && board[pos.i][pos.j + direction] == chessBoard.None) {
      moves.add(new coordinate(pos.i, pos.j + direction));
      // Double move
      if ((pos.j == 6 && colour == chessBoard.White) || (pos.j == 1 && colour == chessBoard.Black)) {
        if (pos.j + 2 * direction >= 0 && pos.j + 2 * direction < 8 && board[pos.i][pos.j + 2 * direction] == chessBoard.None) {
          moves.add(new coordinate(pos.i, pos.j + 2 * direction));
        }
      }
    }
