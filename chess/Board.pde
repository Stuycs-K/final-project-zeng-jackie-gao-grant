class Board {
    int[][] board;
    coordinate selectedSquare;
    PImage WPawn, WKnight, WBishop, WRook, WQueen, WKing;
    PImage BPawn, BKnight, BBishop, BRook, BQueen, BKing;

    Board() {
        board = new int[8][8];
        loadPieceImages();
    }

    void setup() {
        board = new int[8][8];
        setupPieces();
        selectedSquare = null;
    }
void setupPieces() {
        for (int i = 0; i < 8; i++) {
            board[i][1] = Black | Pawn;
            board[i][6] = White | Pawn;
        }
        board[0][0] = board[7][0] = Black | Rook;
        board[1][0] = board[6][0] = Black | Knight;
        board[2][0] = board[5][0] = Black | Bishop;
        board[3][0] = Black | Queen;
        board[4][0] = Black | King;

        board[0][7] = board[7][7] = White | Rook;
        board[1][7] = board[6][7] = White | Knight;
        board[2][7] = board[5][7] = White | Bishop;
        board[3][7] = White | Queen;
        board[4][7] = White | King;
    }
