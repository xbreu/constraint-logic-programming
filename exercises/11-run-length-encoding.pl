:- use_module(library(lists)).

% Calculates the run-length compression of the List1,
% resulting in List2, made out of pairs.
% rle(+List1, ?List2)
rle(List1, List2) :-
    rle_(List1, [], List2).

rle_([], Acc, R) :- !,
    reverse(Acc, R).
rle_([X | Xs], [X-N | As], R) :- !,
    Nn is N + 1,
    rle_(Xs, [X-Nn | As], R).
rle_([X | Xs], Acc, R) :-
    rle_(Xs, [X-1 | Acc], R).

% Decompress the list List1 in run-length format.
% un_rle(+List1, ?List2)
un_rle(List1, List2) :-
    un_rle_(List1, [], List2).

un_rle_([], Acc, R) :- !,
    reverse(Acc, R).
un_rle_([_-0 | Xs], Acc, R) :- !,
    un_rle_(Xs, Acc, R).
un_rle_([X-N | Xs], Acc, R) :-
    Nn is N - 1,
    un_rle_([X-Nn | Xs], [X | Acc], R).
