factorial(0, 1) :- !.
factorial(N, F) :-
    M is N - 1,
    factorial(M, Fi),
    F is N * Fi.

somaRec([], 0) :- !.
somaRec([N | Ns], S) :-
    somaRec(Ns, Si),
    S is N + Si.

fibonacci(0, 0) :- !.
fibonacci(1, 1) :- !.
fibonacci(N, F) :-
    M is N - 1,
    L is N - 2,
    fibonacci(M, Fi1),
    fibonacci(L, Fi2),
    F is Fi1 + Fi2.

isPrimeGo(_, 1) :- !.
isPrimeGo(N, D) :-
    0 is N rem D,
    !, fail.
isPrimeGo(N, D) :-
    Dn is D - 1,
    isPrimeGo(N, Dn).

isPrime(1) :- !.
isPrime(2) :- !.
isPrime(N) :-
    M is N - 1,
    isPrimeGo(N, M).

