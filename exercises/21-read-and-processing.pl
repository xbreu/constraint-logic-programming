% Reads a file in the same format as the file data/read.in, which includes the
% dimension of its matrix and the data rows, that represent the values of the
% matrix.
% read_file(+File, -N, -Matrix)
read_file(File, N, M) :-
    see(File),
    read_number(N),
    (for(_, 1, N),
     foreach(List, M),
     param(N) do
        (for(_, 1, N),
         foreach(X, List) do
            read_number(X)
        )
    ),
    seen.

whitespace(10).
whitespace(32).

read_number(X) :-
    read_number_(0, X), !.

read_number_(A, A) :-
    peek_code(C),
    whitespace(C), !,
    get_code(_).
read_number_(A, X) :-
    get_code(C),
    An is A * 10 + C - 48,
    read_number_(An, X).
