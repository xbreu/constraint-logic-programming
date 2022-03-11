% Succeeds if List is a list of integers is ascending order.
% is_ordered(+List)
is_ordered([]) :- !.
is_ordered([L | Ls]) :-
    is_ordered_(Ls, L).

is_ordered_([], _).
is_ordered_([L | Ls], A) :-
    A =< L,
    is_ordered_(Ls, L).

% Inserts Value in List1 mantaining its order, resulting in List2.
% insert_ordered(+Value, +List1, ?List2)
insert_ordered(Value, List1, List2) :-
    insert_ordered_(Value, List1, [], List2).

insert_ordered_(E, [], Acc, R) :- !,
    append(Acc, [E], R).
insert_ordered_(E, [L | Ls], Acc, R) :-
    E =< L, !,
    append(Acc, [E, L | Ls], R).
insert_ordered_(E, [L | Ls], Acc, R) :-
    append(Acc, [L], Acc_n),
    insert_ordered_(E, Ls, Acc_n, R).

% Sorts the list List using the insertion sort algorithm.
% insert_sort(+List, ?OrderedList)
insert_sort(List, OrderedList) :-
    insert_sort_(List, [], OrderedList).

insert_sort_([], Acc, Acc) :- !.
insert_sort_([L | Ls], Acc, R) :-
    insert_ordered(L, Acc, Acc_n),
    insert_sort_(Ls, Acc_n, R).
