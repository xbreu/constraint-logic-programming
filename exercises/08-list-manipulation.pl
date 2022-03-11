% Inverts the list List1.
% invert(+List1, ?List2)
invert(L, R) :-
    invert_(L, [], R).

invert_([], Acc, Acc).
invert_([L | Ls], Acc, R) :-
    invert_(Ls, [L | Acc], R).

% Removes one occurence of Elem in the list List1.
% del_one(+Elem, +List1, ?List2)
del_one(E, L, R) :-
    del_one_(E, L, [], R).

del_one_(_, [], Acc, Acc).
del_one_(E, [E | Ls], Acc, R) :- !,
    append(Acc, Ls, R).
del_one_(E, [L | Ls], Acc, R) :-
    append(Acc, [L], Acc_n),
    del_one_(E, Ls, Acc_n, R).

% Removes all the occurences of Elem in the list List1.
% del_all(+Elem, +List1, ?List2)
del_all(Elem, List1, List2) :-
    del_all_(Elem, List1, [], List2).

del_all_(_, [], Acc, Acc).
del_all_(E, [E | Ls], Acc, R) :- !,
    del_all_(E, Ls, Acc, R).
del_all_(E, [L | Ls], Acc, R) :-
    append(Acc, [L], Acc_n),
    del_all_(E, Ls, Acc_n, R).

% Removes all the occurences of elements of ListElems in List1.
% del_all_list(+ListElems, +List1, ?List2)
del_all_list(ListElems, List1, List2) :-
    del_all_list_(ListElems, List1, [], List2).

del_all_list_(_, [], Acc, Acc).
del_all_list_(Es, [E | Ls], Acc, R) :-
    member(E, Es), !,
    del_all_list_(Es, Ls, Acc, R).
del_all_list_(Es, [L | Ls], Acc, R) :-
    append(Acc, [L], Acc_n),
    del_all_list_(Es, Ls, Acc_n, R).

% Removes repeated elements from List1.
% del_dups(+List1, ?List2)
del_dups(List1, List2) :-
    del_dups_(List1, [], List2).

del_dups_([], Acc, Acc).
del_dups_([L | Ls], Acc, R) :-
    member(L, Acc), !,
    del_dups_(Ls, Acc, R).
del_dups_([L | Ls], Acc, R) :-
    append(Acc, [L], Acc_n),
    del_dups_(Ls, Acc_n, R).

% Succeeds if L2 is a permutation of L1.
% list_perm (+L1, +L2)
list_perm(L1, L2) :-
    sort(L1, _S),
    sort(L2, _S).

% Generates a list with Amount repetitions of Elem.
% replicate(+Amount, +Elem, ?List)
replicate(Amount, Elem, List) :-
    replicate_(Amount, Elem, [], List).

replicate_(0, _, Acc, Acc) :- !.
replicate_(N, E, Acc, R) :-
    N_n is N - 1,
    replicate_(N_n, E, [E | Acc], R).

% Adds Elem between each element of List1.
% intersperse(+Elem, +List1, ?List2)
intersperse(Elem, List1, List2) :-
    intersperse_(Elem, List1, [], List2).

intersperse_(_, [], Acc, Acc).
intersperse_(_, [L], Acc, R) :- !,
    append(Acc, [L], R).
intersperse_(E, [L | Ls], Acc, R) :-
    append(Acc, [L, E], Acc_n),
    intersperse_(E, Ls, Acc_n, R).

% Inserts Elem in List1 at the index Index.
% insert_elem(+Index, +List1, +Elem, ?List2)
insert_elem(Index, List1, Elem, List2) :-
    insert_elem_(Index, List1, Elem, [], List2).

insert_elem_(0, Ls, E, Acc, R) :- !,
    append(Acc, [E | Ls], R).
insert_elem_(N, [L | Ls], E, Acc, R) :-
    N_n is N - 1,
    append(Acc, [L], Acc_n),
    insert_elem_(N_n, Ls, E, Acc_n, R).

% Removes the element in the Index position of List1.
% delete_elem(+Index, +List1, ?Elem, ?List2)
delete_elem(Index, List1, Elem, List2) :-
    insert_elem(Index, List2, Elem, List1).

% Replaces the element Old at the index Index in List1 with New.
% replace(+List1, +Index, ?Old, +New, ?List2)
replace(List1, Index, Old, New, List2) :-
    delete_elem(Index, List1, Old, List3),
    insert_elem(Index, List3, New, List2).
