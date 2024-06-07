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
void saveGameState() {
  gameStateHistory.add(new GameState(chessBoard.board, chessBoard.turn, whiteTime, blackTime,
                                    chessBoard.WKingMoved, chessBoard.BKingMoved, chessBoard.WQRookMoved, chessBoard.WKRookMoved,
                                    chessBoard.BQRookMoved, chessBoard.BKRookMoved, chessBoard.pMove1, chessBoard.pMove2,
                                    chessBoard.promotion, chessBoard.promotionPosition));
}
void undoMove() {
  if (gameStateHistory.size() > 0) {
    GameState previousState = gameStateHistory.remove(gameStateHistory.size() - 1);
    chessBoard.board = previousState.board;
    chessBoard.turn = previousState.turn;
    whiteTime = previousState.whiteTime;
    blackTime = previousState.blackTime;
    chessBoard.WKingMoved = previousState.WKingMoved;
    chessBoard.BKingMoved = previousState.BKingMoved;
    chessBoard.WQRookMoved = previousState.WQRookMoved;
    chessBoard.WKRookMoved = previousState.WKRookMoved;
    chessBoard.BQRookMoved = previousState.BQRookMoved;
    chessBoard.BKRookMoved = previousState.BKRookMoved;
    chessBoard.pMove1 = previousState.pMove1;
    chessBoard.pMove2 = previousState.pMove2;
    chessBoard.promotion = previousState.promotion;
    chessBoard.promotionPosition = previousState.promotionPosition;
    displayBoard();
  }
}
