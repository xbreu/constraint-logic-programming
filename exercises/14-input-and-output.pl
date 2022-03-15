:- use_module(library(between)).

% Prints the symbol S in the console N times.
% print_n(+S, +N)
print_n(_, 0) :- !.
print_n(S, N) :-
    Nn is N - 1,
    write(S),
    print_n(S, Nn).

% Prints the text Text with the padding indicated in Padding.
% | ?- print_text("Olá Mundo!", '* ', 4).
% * Olá Mundo *
% print_text(+Text, +Symbol, +Padding)
print_text(T, S, P) :-
    write(S),
    print_n(' ', P),
    write(T),
    print_n(' ', P),
    write(S).

% Prints the Text with the same format as the following example.
% | ?- print_banner("Olá Mundo!", '* ', 4).
% *******************
% *                 *
% *    Olá Mundo    *
% *                 *
% *******************
% print_banner(+Text, +Symbol, +Padding)
print_banner(T, S, P) :-
    atom_length(T, LT),
    L is LT + P * 2,
    BL is L + 2,
    print_n(S, BL),
    nl,
    write(S),
    print_n(' ', L),
    write(S),
    nl,
    print_text(T, S, P),
    nl,
    write(S),
    print_n(' ', L),
    write(S),
    nl,
    print_n(S, BL).

% Reads a number from standard input digit by digit.
% read_number(-X)
read_number(X) :-
    read_number_(0, X), !.

read_number_(A, A) :-
    peek_code(10), !,
    get_code(_).
read_number_(A, X) :-
    get_code(C),
    An is A * 10 + C - 48,
    read_number_(An, X).

% Asks for a number until it is between Min and Max.
% read_until_between(+Min, +Max, -Value)
read_until_between(Min, Max, V) :-
    repeat,
    read_number(V),
    between(Min, Max, V).

% Reads a string from standard input, character by character, returning it.
% read_string(-X)
read_string(S) :-
    read_string_([], S).

read_string_(A, A) :-
    peek_code(10), !,
    get_code(_).
read_string_(A, S) :-
    get_code(C),
    append(A, [C], An),
    read_string_(An, S).

% Asks for the needed arguments for a print_banner/3 call and makes the call
% with those arguments.
banner :-
    write('Text: '),
    read_string(T_),
    write('Symbol: '),
    read_string(S_),
    write('Padding: '),
    read_number(P),
    atom_codes(T, T_),
    atom_codes(S, S_),
    print_banner(T, S, P).

% Prints a list of text in a banner format, using the longest line to calculate
% the padding in all of them.
% print_multi_banner(+ListOfTexts, +Symbol, +Padding)
% TODO

% Prints a tree of size N, like the following example.
% | ?- oh_christmas_tree(5).
%     *
%    ***
%   *****
%  *******
% *********
%     *
% oh_christmas_tree(+N)
oh_christmas_tree(N) :-
    oh_christmas_tree_(N, 0).

oh_christmas_tree_(S, L) :-
    L >= S, !,
    P is S,
    print_n(' ', P),
    write('*').
oh_christmas_tree_(S, L) :-
    N is L * 2 + 1,
    P is S - L,
    print_n(' ', P),
    print_n('*', N),
    nl, !,
    Ln is L + 1,
    oh_christmas_tree_(S, Ln).

