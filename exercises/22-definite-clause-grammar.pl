% Adapts the example found in 4.14 section of SICStus' manual to allow it to
% work with numbers with more than one digit, like the following example.
% | ?- phrase(expr(X), "12*11-24").
% X = 108 ? ;
% no

expr(Z) --> term(X), "+", expr(Y), {Z is X + Y}.
expr(Z) --> term(X), "-", expr(Y), {Z is X - Y}.
expr(X) --> term(X).

term(Z) --> number(X), "*", term(Y), {Z is X * Y}.
term(Z) --> number(X), "/", term(Y), {Z is X / Y}.
term(Z) --> number(Z).

number(X) --> number_digits(Ds), {string_number(Ds, X)}.

number_digits(X) --> digit(D), number_digits(Y), {append([D], Y, X)}.
number_digits([D]) --> digit(D).
digit(D) --> [C], {"0"=<C, C=<"9", D is C}.

string_number(S, N) :-
    string_number_(S, 0, N).

string_number_([], A, A) :- !.
string_number_([D | Ds], A, N) :-
    An is 10 * A + D - "0",
    string_number_(Ds, An, N).
