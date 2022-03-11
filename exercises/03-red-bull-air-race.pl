% -----------------------------------------------------------------------------
% Database modelling
% -----------------------------------------------------------------------------

pilot('Lamb').
pilot('Besenyei').
pilot('Chambliss').
pilot('MacLean').
pilot('Mangold').
pilot('Jones').
pilot('Bonhomme').

runsFor('Breitling', 'Lamb').
runsFor('Red Bull', 'Besenyei').
runsFor('Red Bull', 'Chambliss').
runsFor('Mediterranean', 'MacLean').
runsFor('Cobra', 'Mangold').
runsFor('Matador', 'Jones').
runsFor('Matador', 'Bonhomme').

planeOf('Lamb', 'MX2').
planeOf('Besenyei', 'Edge540').
planeOf('Chambliss', 'Edge540').
planeOf('MacLean', 'Edge540').
planeOf('Mangold', 'Edge540').
planeOf('Jones', 'Edge540').
planeOf('Bonhomme', 'Edge540').

circuit('Istanbul').
circuit('Budapest').
circuit('Porto').

championIn('Porto', 'Jones').
championIn('Budapest', 'Mangold').
championIn('Istanbul', 'Mangold').

numberOfGates('Istanbul', 9).
numberOfGates('Budapest', 6).
numberOfGates('Porto', 5).

% A team wins a race if one of its pilots wins it.
winnerTeamIn(L, T) :-
    championIn(L, P),
    runsFor(T, P).

% -----------------------------------------------------------------------------
% Questions and answers
% -----------------------------------------------------------------------------

% Who won the Porto race?
% championIn('Porto', P).

% Which team won in Porto?
% championIn('Porto', _P), runsFor(T, _P).

% Which circuits have more than 8 gates?
% numberOfGates(C, _G), _G > 8.

% Which pilots do not pilot a Edge540 plane?
% planeOf(P, _P), _P \= 'Edge540'.

% Which pilots won in more than one circuit?
% championIn(_P1, P), championIn(_P2, P), _P1 \= _P2.
