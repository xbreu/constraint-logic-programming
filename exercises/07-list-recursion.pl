% Determines the length of the list L.
list_size(L, N) :-
    list_size_go(L, 0, N).

list_size_go([], Acc, Acc) :- !.
list_size_go([_ | Xs], Acc, N) :-
    Acc_n is Acc + 1,
    list_size_go(Xs, Acc_n, N).

% Sums all of the elements of the list L.
list_sum(L, N) :-
    list_sum_go(L, 0, N).

list_sum_go([], Acc, Acc) :- !.
list_sum_go([X | Xs], Acc, N) :-
    Acc_n is Acc + X,
    list_sum_go(Xs, Acc_n, N).

% Multiplies all of the elements of the list L.
list_prod(L, N) :-
    list_prod_go(L, 1, N).

list_prod_go([], Acc, Acc) :- !.
list_prod_go([X | Xs], Acc, N) :-
    Acc_n is Acc * X,
    list_prod_go(Xs, Acc_n, N).

% Calculates the inner product of two vectors,
% represented as integer lists of the same length.
inner_product(L1, L2, N) :-
    inner_product_go(L1, L2, 0, N).

inner_product_go([], [], Acc, Acc) :- !.
inner_product_go([X | Xs], [Y | Ys], Acc, N) :-
    Acc_n is X * Y + Acc,
    inner_product_go(Xs, Ys, Acc_n, N).

% Counts the number of occurences of E in the list L.
count(E, L, N) :-
    count_go(E, L, 0, N).

count_go(_, [], Acc, Acc) :- !.
count_go(E, [X | Xs], Acc, N) :-
    E \= X, !,
    count_go(E, Xs, Acc, N).
count_go(E, [_ | Xs], Acc, N) :-
    Acc_n is Acc + 1,
    count_go(E, Xs, Acc_n, N).
