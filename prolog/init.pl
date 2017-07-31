
:- consult(piecemoves).

/* define board */
onBoard(CTARGET, RTARGET) :-
    isInRange(CTARGET, 1, 8),
    isInRange(RTARGET, 1, 8).

/* pawn */
isValidNoCollision(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    pawn(PIECE),                
    white(PIECE),
    pos(COLPIECE, CTARGET, RTARGET),
    COLPIECE == false.
    
isValidMove(PIECE, CTARGET, RTARGET) :-
    isValidForPiece(PIECE, CTARGET, RTARGET),
    onBoard(CTARGET, RTARGET).
