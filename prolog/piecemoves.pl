
:- consult(common).
:- consult(pieces).
:- consult(pos0).

/* pawn */
isValidForPiece(PIECE, CTARGET, RTARGET) :-
    pawn(PIECE),                
    white(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    RTARGET is RSOURCE + 1,
    CTARGET is CSOURCE.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    pawn(PIECE),                
    black(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    RTARGET is RSOURCE - 1,
    CTARGET is CSOURCE.

/* rook */
isValidForPiece(PIECE, CTARGET, RTARGET) :-
    rook(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE,
    isInRange(RTARGET, 1, 8).

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    rook(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    RSOURCE = RTARGET,
    isInRange(CTARGET, 1, 8).

/* knight */
isValidForPiece(PIECE, CTARGET, RTARGET) :-
    knight(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE + 1,
    RTARGET is RSOURCE + 2.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    knight(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE - 1,
    RTARGET is RSOURCE + 2.
   
isValidForPiece(PIECE, CTARGET, RTARGET) :-
    knight(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE + 1,
    RTARGET is RSOURCE - 2.   

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    knight(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE - 1,
    RTARGET is RSOURCE - 2.

/* bishop */
isValidForPiece(PIECE, CTARGET, RTARGET) :-
    bishop(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE + DIAG,
    RTARGET is RSOURCE + DIAG.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    bishop(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE + DIAG,
    RTARGET is RSOURCE - DIAG.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    bishop(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE - DIAG,
    RTARGET is RSOURCE - DIAG.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    bishop(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE - DIAG,
    RTARGET is RSOURCE + DIAG.

/* queen */
isValidForPiece(PIECE, CTARGET, RTARGET) :-
    queen(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE + DIAG,
    RTARGET is RSOURCE + DIAG.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    queen(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE + DIAG,
    RTARGET is RSOURCE - DIAG.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    queen(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE - DIAG,
    RTARGET is RSOURCE - DIAG.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    queen(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE - DIAG,
    RTARGET is RSOURCE + DIAG.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    queen(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE,
    isInRange(RTARGET, 1, 8).

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    queen(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    RSOURCE = RTARGET,
    isInRange(CTARGET, 1, 8).

/* king */
isValidForPiece(PIECE, CTARGET, RTARGET) :-
    king(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE + 1,
    RTARGET is RSOURCE.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    king(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE - 1,
    RTARGET is RSOURCE.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    king(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    RTARGET is RSOURCE + 1,
    CTARGET is CSOURCE.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    king(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    RTARGET is RSOURCE - 1,
    CTARGET is CSOURCE.
    
isValidForPiece(PIECE, CTARGET, RTARGET) :-
    king(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE + 1,
    RTARGET is RSOURCE + 1.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    king(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE + 1,
    RTARGET is RSOURCE - 1.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    king(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE - 1,
    RTARGET is RSOURCE - 1.

isValidForPiece(PIECE, CTARGET, RTARGET) :-
    king(PIECE),
    pos(PIECE, CSOURCE, RSOURCE),
    CTARGET is CSOURCE - 1,
    RTARGET is RSOURCE + 1.
    