class GameState {
  int[][] board;
  int turn;
  int whiteTime;
  int blackTime;
  boolean WKingMoved;
  boolean BKingMoved;
  boolean WQRookMoved;
  boolean WKRookMoved;
  boolean BQRookMoved;
  boolean BKRookMoved;
  coordinate pMove1;
  coordinate pMove2;
  boolean promotion;
  coordinate promotionPosition;

  GameState(int[][] board, int turn, int whiteTime, int blackTime, boolean WKingMoved, boolean BKingMoved,
            boolean WQRookMoved, boolean WKRookMoved, boolean BQRookMoved, boolean BKRookMoved,
            coordinate pMove1, coordinate pMove2, boolean promotion, coordinate promotionPosition) {
    this.board = new int[8][8];
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        this.board[i][j] = board[i][j];
      }
    }
    this.turn = turn;
    this.whiteTime = whiteTime;
    this.blackTime = blackTime;
    this.WKingMoved = WKingMoved;
    this.BKingMoved = BKingMoved;
    this.WQRookMoved = WQRookMoved;
    this.WKRookMoved = WKRookMoved;
    this.BQRookMoved = BQRookMoved;
    this.BKRookMoved = BKRookMoved;
    this.pMove1 = pMove1 != null ? new coordinate(pMove1.i, pMove1.j) : null;
    this.pMove2 = pMove2 != null ? new coordinate(pMove2.i, pMove2.j) : null;
    this.promotion = promotion;
    this.promotionPosition = promotionPosition != null ? new coordinate(promotionPosition.i, promotionPosition.j) : null;
  }
}
