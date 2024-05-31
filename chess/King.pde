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
     if (colour == chessBoard.White && !chessBoard.WKingMoved) {
      if (!chessBoard.WKRookMoved && board[5][7] == chessBoard.None && board[6][7] == chessBoard.None) {
        if (!chessBoard.isCheck(chessBoard.White) && !chessBoard.isCheck(chessBoard.White)) {
          moves.add(new coordinate(6, 7));
        }
      }
      if (!chessBoard.WQRookMoved && board[1][7] == chessBoard.None && board[2][7] == chessBoard.None && board[3][7] == chessBoard.None) {
        if (!chessBoard.isCheck(chessBoard.White) && !chessBoard.isCheck(chessBoard.White)) {
          moves.add(new coordinate(2, 7));
        }
      }
    }

    if (colour == chessBoard.Black && !chessBoard.BKingMoved) {
      if (!chessBoard.BKRookMoved && board[5][0] == chessBoard.None && board[6][0] == chessBoard.None) {
        if (!chessBoard.isCheck(chessBoard.Black) && !chessBoard.isCheck(chessBoard.Black)) {
          moves.add(new coordinate(6, 0));
        }
      }
      if (!chessBoard.BQRookMoved && board[1][0] == chessBoard.None && board[2][0] == chessBoard.None && board[3][0] == chessBoard.None) {
        if (!chessBoard.isCheck(chessBoard.Black) && !chessBoard.isCheck(chessBoard.Black)) {
          moves.add(new coordinate(2, 0));
        }
      }
    }

    return moves;
  }
}
