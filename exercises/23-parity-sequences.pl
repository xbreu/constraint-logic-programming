:- use_module(library(clpfd)).
:- use_module(library(lists)).

seq(Vars) :-
    Vars = [A, B, C, D, E],
    domain(Vars, 1, 9),
    all_distinct(Vars),
    C #< 3,
    A mod 2 #= Parity1,
    B mod 2 #= Parity2,
    C mod 2 #= Parity1,
    D mod 2 #= Parity2,
    E mod 2 #= Parity1,
    labeling([],Vars).

seqn(Vars, N) :-
    length(Vars, N),
    domain(Vars, 1, 9),
    limit_repetitions(Vars),
    limit_parity(Vars),
    limit_middle_number(Vars),
    labeling([],Vars).

limit_repetitions(Vars) :-
    limit_repetitions(Vars, Vars).

limit_repetitions([], _) :- !.
limit_repetitions([X | Xs], List) :-
    exactly(X, List, N),
    N #< 3,
    limit_repetitions(Xs, List).

limit_parity(Vars) :-
    Parity1 #\= Parity2,
    limit_parity(Vars, Parity1-Parity2).

limit_parity([], _) :- !.
limit_parity([X | Xs], Parity1-Parity2) :-
    X mod 2 #= Parity1,
    limit_parity(Xs, Parity2-Parity1).

limit_middle_number(Vars) :-
    length(Vars, N),
    Index is ceiling(N / 2),
    nth1(Index, Vars, Middle),
    head(Vars, First),
    last(Vars, Last),
    Middle #> First,
    Middle #> Last.

exactly(_, [], 0) :- !.
exactly(X, [Y|L], N) :-
    X #= Y #<=> B,
    N #= M + B,
    exactly(X, L, M).
