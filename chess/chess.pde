int[] lightSquareColour = {237, 174, 107};
int[] darkSquareColour = {122, 73, 21};
int[] lastMoveColour1 = {50, 255, 50, 40};
int[] lastMoveColour2 = {50, 255, 50, 60};
int[] selectedSquareColour = {0, 150, 255, 50};
int[] possibleMovesColour = {255, 0, 0, 60};

int squareSize = 100;


final int None = 0;
final int Pawn = 1;
final int Knight = 2;
final int Bishop = 3;
final int Rook = 4;
final int Queen = 5;
final int King = 6;

final int White = 8;
final int Black = 16;

int turn = White;

boolean WKingMoved = false, BKingMoved = false, WQRookMoved = false, WKRookMoved = false;
boolean BQRookMoved = false, BKRookMoved = false;
coordinate pMove1 = null, pMove2 = null;
boolean promotion = false;
coordinate promotionPosition = null;

Board board;

void setup() {
    size(1000, 800);
    board = new Board();
    board.setup();
    board.display();
}

void draw() {
    if (millis() < 5000) board.display();
}

void mousePressed() {
    if (promotion) {
        handlePromotion();
    } else {
        board.handleMousePressed(mouseX, mouseY);
    }
    board.checkForGameOver();
    board.display();
}

void handlePromotion() {
    int choice = floor(mouseX / (width / 4));
    if (choice == 0) {
        board.promotePiece(turn | Queen);
    } else if (choice == 1) {
        board.promotePiece(turn | Rook);
    } else if (choice == 2) {
        board.promotePiece(turn | Bishop);
    } else if (choice == 3) {
        board.promotePiece(turn | Knight);
    }
    promotion = false;
}
