% L3 is the concatenation of L1 and L2.
% list_append(?L1, ?L2, ?L3)
list_append([], L, L).
list_append([X | Xs], L, [X | R]) :-
    list_append(Xs, L, R).

% Verifies if Elem is a member of List.
% list_member(?Elem, ?List)
list_member(E, L) :-
    append(_, [E | _], L).

% Unifies Last with the last element of List.
% list_last(+List, ?Last)
list_last(L, E) :-
    append(_, [E], L).

% Unifies Elem with the Nth element of List.
% list_nth(?N, ?List, ?Elem)
list_nth(N, L, E) :-
    length(P, N),
    append(P, [E | _], L).

% Concatenates a list of lists.
% list_append(+ListOfLists, ?List)
list_append([], []).
list_append([L | Ls], R) :-
    append(L, Ri, R),
    list_append(Ls, Ri).

% Removes one occurence of Elem in List.
% list_del(+List, +Elem, ?Res)
list_del(L, E, R) :-
    append(P, [E | S], L),
    append(P, S, R).

% Succeeds if First and Second are elements of List,
% and First occurs before Second.
% list_before(?First, ?Second, ?List)
list_before(F, S, L) :-
    append(_, [F | T], L),
    append(_, [S | _], T).

% Replaces one occurence of X in List1 for a Y, resulting in List2.
% list_replace_one(+X, +Y, +List1, ?List2)
list_replace_one(X, Y, L, R) :-
    append(P, [X | S], L),
    append(P, [Y | S], R).

% Succeeds if X appears more than one time in List.
% list_repeated(+X, +List)
list_repeated(X, L) :-
    append(_, [X | S], L),
    append(_, [X | _], S).

% Extracts a slice of size Size from List1 starting at the index Index,
% resulting in List2.
% list_slice(+List1, +Index, +Size, ?List2)
list_slice(L, I, N, R) :-
    length(S, I),
    length(R, N),
    append(S, T, L),
    append(R, _, T).

% Rotates List1 N elements to the left, resulting in List2.
% Example: list_shift_rotate([a, b, c, d, e, f], 2, [c, d, e, f, a, b]).
% list_shift_rotate(+List1, +N, ?List2)
list_shift_rotate(L, N, R) :-
    length(P, N),
    append(P, S, L),
    append(S, P, R).
