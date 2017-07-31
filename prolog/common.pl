
isInRange(Low, Low, High).
isInRange(Out, Low, High) :-
    NextLow is Low + 1,
    NextLow =< High,
    isInRange(Out, NextLow, High).