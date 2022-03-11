% -----------------------------------------------------------------------------
% Relationship modelling
% -----------------------------------------------------------------------------

male('Frank').
male('Jay').
male('Javier').
male('Barb').
male('Phil').
male('Mitchell').
male('Joe').
male('Manny').
male('Cameron').
male('Bo').
male('Dylan').
male('Luke').
male('Rexford').
male('Calhoun').
male('George').

female('Grace').
female('DeDe').
female('Gloria').
female('Merle').
female('Claire').
female('Pameron').
female('Haley').
female('Alex').
female('Lily').
female('Poppy').

parent('Grace', 'Phil').
parent('Frank', 'Phil').
parent('DeDe', 'Claire').
parent('Jay', 'Claire').
parent('DeDe', 'Mitchell').
parent('Jay', 'Mitchell').
parent('Jay', 'Joe').
parent('Gloria', 'Joe').
parent('Gloria', 'Manny').
parent('Javier', 'Manny').
parent('Barb', 'Cameron').
parent('Merle', 'Cameron').
parent('Barb', 'Pameron').
parent('Merle', 'Pameron').
parent('Phil', 'Haley').
parent('Claire', 'Haley').
parent('Phil', 'Alex').
parent('Claire', 'Alex').
parent('Phil', 'Luke').
parent('Claire', 'Luke').
parent('Mitchell', 'Lily').
parent('Cameron', 'Lily').
parent('Mitchell', 'Rexford').
parent('Cameron', 'Rexford').
parent('Pameron', 'Calhoun').
parent('Bo', 'Calhoun').
parent('Dylan', 'George').
parent('Haley', 'Poppy').
parent('Dylan', 'George').
parent('Haley', 'Poppy').

father(A, B) :-
    male(A),
    parent(A, B).

grandparent(A, B) :-
    parent(A, _C),
    parent(_C, B).

grandmother(A, B) :-
    female(A),
    grandparent(A, B).

siblings(A, B) :-
    A \= B,
    parent(_Y, A),
    parent(_X, A),
    _X \= _Y,
    parent(_Y, B),
    parent(_X, B).

halfSiblings(A, B) :-
    parent(_Y, A),
    parent(_Y, B).

cousins(A, B) :-
    parent(_PA, A),
    parent(_PB, B),
    siblings(_PA, _PB).

uncle(A, B) :-
    male(A),
    parent(_PB, B),
    siblings(A, _PB).

ancestor(A, D) :-
    parent(A, D).
ancestor(A, D) :-
    parent(A, _I),
    ancestor(_I, D).

descendant(A, D) :-
    ancestor(D, A).

% -----------------------------------------------------------------------------
% Questions and answers
% -----------------------------------------------------------------------------

% is Haley from the female sex?
% female('Haley').

% is Gil from the male sex?
% male('Gil').

% is Frank a progenitor of Phil?
% parent('Frank', 'Phil').

% Who are the parents of Claire?
% parent(X, 'Claire').

% Who are the children of Gloria?
% parent('Gloria', X).

% Who are the grandchildren of Jay?
% parent('Jay', _CS), parent(_CS, X).

% Who are the grandparents of Lily?
% parent(_PS, 'Lily'), parent(X, _PS).

% Does Alex have a child?
% parent('Alex', _).

% Who is a child of Jay but not of Gloria?
% parent('Jay', X), \+ parent('Gloria', X).

% Are Haley and Lily cousins?
% cousins('Haley', 'Lily').

% Who is the father of Luke?
% father(X, 'Luke').

% Who is an uncle of Lily?
% uncle(X, 'Lily').

% Who is a grandmother?
% grandmother(X, _).
