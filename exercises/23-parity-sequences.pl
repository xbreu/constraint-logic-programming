:- use_module(library(clpfd)).
:- use_module(library(lists)).

% Generates a sequence of five numbers, that can take any value between 1 and
% 9, with the following constraints:
% - There can be no two even or odd numbers in sequence;
% - The number in the center of the sequence must be 1 or 2;
% - The list cannot have repeated values.
%
% This can be seen in the following example:
% ?- seq(Vars).
% Vars = [3,2,1,4,5] ?
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
    labeling([ff],Vars).

% This is a variation of seq, but the list has a length of N, with the
% following restrictions:
% - N needs to be an odd number that is multiple of three;
% - Each number can take a value between 1 and 9;
% - A number can only appear, at maximum, three times in the list;
% - There can be no two even or odd numbers in sequence;
% - The number in the middle of the list must be greater than the first and
%   last elements of it.
%
% This can be seen in the following example:
% ?- seqn(Vars, 9).
% Vars = [1,2,9,4,9,4,9,6,3] ?
seqn(Vars, N) :-
    length(Vars, N),
    domain(Vars, 1, 9),
    limit_repetitions(Vars),
    limit_parity(Vars),
    limit_middle_number(Vars),
    labeling([ff],Vars).

limit_repetitions(Vars) :-
    limit_repetitions(Vars, Vars).

limit_repetitions([], _) :- !.
limit_repetitions([X | Xs], List) :-
    exactly(X, List, N),
    N #<= 3,
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
