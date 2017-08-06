
:- consult(piecemoves).

/* define board */
onBoard(CTARGET, RTARGET) :-
    isInRange(CTARGET, 1, 8),
    isInRange(RTARGET, 1, 8).

/* white pawn 1 move forward */
isValidNoCollision(PIECE, CTARGET, RTARGET) :-
    pawn(PIECE),
    white(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    SPACE is RSOURCE + 1,
    RTARGET == SPACE,
    not(pos(_, CTARGET, RTARGET)).

/* white pawn 2 moves forward */
isValidNoCollision(PIECE, CTARGET, RTARGET) :-
    pawn(PIECE),
    white(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    SPACE is RSOURCE + 2,
    MID is RSOURCE + 1,
    RTARGET == SPACE,
    not(pos(_, CTARGET, RTARGET)),
    not(pos(_, CTARGET, MID)).

isValidNoCollision(PIECE, CTARGET, RTARGET) :-
    knight(PIECE),
    not(pos(COLPIECE, CTARGET, RTARGET)).
    
isValidNoCollision(PIECE, CTARGET, RTARGET) :-
    king(PIECE),
    not(pos(COLPIECE, CTARGET, RTARGET)).

isValidMove(PIECE, CTARGET, RTARGET) :-
    isValidForPiece(PIECE, CTARGET, RTARGET),
    isValidNoCollision(PIECE, CTARGET, RTARGET),
    onBoard(CTARGET, RTARGET).
