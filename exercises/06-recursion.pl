% Calculates the factorial of a number N.
factorial(0, 1) :- !.
factorial(N, F) :-
    M is N - 1,
    factorial(M, Fi),
    F is N * Fi.

% A recursive version of the calculation of the sum of numbers between 0 and N.
recSum(0, 0) :- !.
recSum(N, S) :-
    Nn is N - 1,
    recSum(Nn, Si),
    S is Si + N.

% Calculates the Nth fibonacci number.
fibonacci(0, 0) :- !.
fibonacci(1, 1) :- !.
fibonacci(N, F) :-
    M is N - 1,
    L is N - 2,
    fibonacci(M, Fi1),
    fibonacci(L, Fi2),
    F is Fi1 + Fi2.

% Determines if a number N is prime.
isPrime(1) :- !, fail.
isPrime(2) :- !.
isPrime(N) :-
    M is N - 1,
    isPrimeGo(N, M).

isPrimeGo(_, 1) :- !.
isPrimeGo(N, D) :-
    0 is N rem D,
    !, fail.
isPrimeGo(N, D) :-
    Dn is D - 1,
    isPrimeGo(N, Dn).

