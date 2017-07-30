

/* define pieces */
wr1.
wn1.
wb1.
wq.
wk.
wb2.
wn2.
wr2.
wp1.
wp2.
wp3.
wp4.
wp5.
wp6.
wp7.
wp8.
br1.
bn1.
bb1.
bq.
bk.
bb2.
bn2.
br2.
bp1.
bp2.
bp3.
bp4.
bp5.
bp6.
bp7.
bp8.

/* piece(wr1).
piece(wn1).
piece(wb1).
piece(wq).
piece(wk).
piece(wb2).
piece(wn2).
piece(wr2).
piece(wp1).
piece(wp2).
piece(wp3).
piece(wp4).
piece(wp5).
piece(wp6).
piece(wp7).
piece(wp8).
piece(br1).
piece(bn1).
piece(bb1).
piece(bq).
piece(bk).
piece(bb2).
piece(bn2).
piece(br2).
piece(bp1).
piece(bp2).
piece(bp3).
piece(bp4).
piece(bp5).
piece(bp6).
piece(bp7).
piece(bp8). */


pawn(wp1).
pawn(wp2).
pawn(wp3).
pawn(wp4).
pawn(wp5).
pawn(wp6).
pawn(wp7).
pawn(wp8).
rook(wr1).
rook(wr2).
knight(wn1).
knight(wn2).
bishop(wb1).
bishop(wb2).
queen(wq).
king(wk).

pawn(bp1).

white(wp1).
white(wp2).
white(wp3).
white(wp4).
white(wp5).
white(wp6).
white(wp7).
white(wp8).
white(wr1).
white(wr2).
white(wn1).
white(wn2).
white(wb1).
white(wb2).
white(wq).
white(wk).

black(bp1).

/* define weights */
weight(wn1, 3).
weight(wr1, 5).
weight(wb1, 3).
weight(wq, 9).
weight(wb2, 3).
weight(wn2, 3).
weight(wr2, 5).
weight(wp1, 1).
weight(wp2, 1).
weight(wp3, 1).
weight(wp4, 1).
weight(wp5, 1).
weight(wp6, 1).
weight(wp1, 1).
weight(wp1, 1).
weight(br1, 5).
weight(bn1, 3).
weight(bb1, 3).
weight(bq, 9).
weight(bb2, 3).
weight(bn2, 3).
weight(br2, 5).
weight(bp1, 1).
weight(bp2, 1).
weight(bp3, 1).
weight(bp4, 1).
weight(bp5, 1).
weight(bp6, 1).
weight(bp7, 1).
weight(bp8, 1).

/* define board */
onBoard(C, R) :-
    C >= 1,
    C =< 8,
    R >= 1,
    R =< 8.

/* pawn */
isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    pawn(PIECE),                
    white(PIECE),
    RTARGET is RSOURCE + 1,
    CTARGET is CSOURCE.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    pawn(PIECE),                
    black(PIECE),
    RTARGET is RSOURCE - 1,
    CTARGET is CSOURCE.

/* rook */
isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    rook(PIECE),
    CTARGET is CSOURCE,
    isInRange(RTARGET, 1, 8).

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    rook(PIECE),
    RSOURCE = RTARGET,
    isInRange(CTARGET, 1, 8).

/* knight */
isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    knight(PIECE),
    CTARGET is CSOURCE + 1,
    RTARGET is RSOURCE + 2.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    knight(PIECE),
    CTARGET is CSOURCE - 1,
    RTARGET is RSOURCE + 2.
   
isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    knight(PIECE),
    CTARGET is CSOURCE + 1,
    RTARGET is RSOURCE - 2.   

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    knight(PIECE),
    CTARGET is CSOURCE - 1,
    RTARGET is RSOURCE - 2.

/* bishop */
isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    bishop(PIECE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE + DIAG,
    RTARGET is RSOURCE + DIAG.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    bishop(PIECE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE + DIAG,
    RTARGET is RSOURCE - DIAG.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    bishop(PIECE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE - DIAG,
    RTARGET is RSOURCE - DIAG.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    bishop(PIECE),
    isInRange(DIAG, 1, 8),
    CTARGET is CSOURCE - DIAG,
    RTARGET is RSOURCE + DIAG.

/* queen */
isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    queen(PIECE),
    abs(CTARGET - CSOURCE) == abs(RTARGET - RSOURCE).

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    queen(PIECE),
    CSOURCE = CTARGET.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    queen(PIECE),
    RSOURCE = RTARGET.

/* king */
isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    king(PIECE),
    CTARGET is CSOURCE + 1,
    RTARGET is RSOURCE.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    king(PIECE),
    CTARGET is CSOURCE - 1,
    RTARGET is RSOURCE.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    king(PIECE),
    RTARGET is RSOURCE + 1,
    CTARGET is CSOURCE.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    king(PIECE),
    RTARGET is RSOURCE - 1,
    CTARGET is CSOURCE.
    
isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    king(PIECE),
    CTARGET is CSOURCE + 1,
    RTARGET is RSOURCE + 1.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    king(PIECE),
    CTARGET is CSOURCE + 1,
    RTARGET is RSOURCE - 1.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    king(PIECE),
    CTARGET is CSOURCE - 1,
    RTARGET is RSOURCE - 1.

isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    king(PIECE),
    CTARGET is CSOURCE - 1,
    RTARGET is RSOURCE + 1.
    

/* todo: en passant */

isInRange(Low, Low, High).
isInRange(Out, Low, High) :-
    NextLow is Low + 1,
    NextLow =< High,
    isInRange(Out, NextLow, High).

onBoard(CTARGET, RTARGET) :-
    isInRange(CTARGET, 1, 8),
    isInRange(RTARGET, 1, 8).
    
isValidMove(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET) :-
    isValidForPiece(PIECE, CSOURCE, RSOURCE, CTARGET, RTARGET),
    onBoard(CTARGET, RTARGET).
