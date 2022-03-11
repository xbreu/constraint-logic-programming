:- use_module(library(lists)).
:- consult('06-recursion.pl').

% Unifies List with the list that includes all the numbers between 1 and N.
% list_to(+N, ?List)
list_to(N, List) :-
    list_from_to(0, N, List).

% Unifies List with a list with all the numbers between Inf and Sup.
% list_from_to(+Inf, +Sup, ?List)
list_from_to(Inf, Sup, List) :-
    list_from_to_step(Inf, 1, Sup, List).

% Unifies List with a list with all the numbers between Inf and Sup.
% using steps of size Step.
% list_from_to_step(+Inf, +Step, +Sup, ?List)
list_from_to_step(Inf, Step, Sup, List) :-
    Inf > Sup, !,
    Fix is ((Inf mod Step) - (Sup mod Step)) mod Step,
    Sup_n is Sup + Fix,
    list_from_to_step_(Sup_n, Step, Inf, [], List).
list_from_to_step(Inf, Step, Sup, List) :-
    list_from_to_step_(Inf, Step, Sup, [], List_i),
    reverse(List_i, List).

list_from_to_step_(I, _, S, Acc, Acc) :-
    I > S, !.
list_from_to_step_(I, Step, S, Acc, R) :-
    N is I + Step,
    list_from_to_step_(N, Step, S, [I | Acc], R).

% Unifies List with a list containing all the primes smaller of equal to N.
% primes(+N, ?List)
primes(N, List) :-
    primes_(N, [], List).

primes_(0, Acc, Acc) :- !.
primes_(N, Acc, R) :-
    isPrime(N), !,
    N_n is N - 1,
    primes_(N_n, [N | Acc], R).
primes_(N, Acc, R) :-
    N_n is N - 1,
    primes_(N_n, Acc, R).

% Unifies List with a list of all the Fibonacci numbers from order 0 to N.
% fibs(+N, ?List)
fibs(N, List) :-
    fibs_(N, 0, 1, [], List).

fibs_(-1, _, _, Acc, R) :- !,
    reverse(Acc, R).
fibs_(N, F1, F2, Acc, R) :-
    N_n is N - 1,
    F3 is F1 + F2,
    fibs_(N_n, F2, F3, [F1 | Acc], R).
