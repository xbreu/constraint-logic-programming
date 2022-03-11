:- use_module(library(lists)).

% Lines is a list with the N first rows of the Pascal's triangle.
% pascal(+N, ?Lines)
pascal(0, []) :- !.
pascal(N, Lines) :-
    pascal_(N, [[1]], Lines).

pascal_(1, Acc, R) :- !,
    reverse(Acc, R).
pascal_(N, [A | As], R) :-
    Nn is N - 1,
    pascal_iter(A, An),
    pascal_(Nn, [An, A | As], R).

pascal_iter(L, R) :-
    append([0 | L], [0], S),
    pascal_iter_(S, [], R).

pascal_iter_([_], Acc, Acc) :- !.
pascal_iter_([L1, L2 | Ls], Acc, R) :-
    Ln is L1 + L2,
    pascal_iter_([L2 | Ls], [Ln | Acc], R).
