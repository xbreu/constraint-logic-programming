% -----------------------------------------------------------------------------
% Database modelling
% -----------------------------------------------------------------------------

occupation(technician, eleuterio).
occupation(technician, juvenaldo).
occupation(analyst, leonilde).
occupation(analyst, marciliano).
occupation(engineer, osvaldo).
occupation(engineer, porfirio).
occupation(engineer, reginaldo).
occupation(supervisor, sisnando).
occupation(chief_supervisor, gertrudes).
occupation(exec_secretary, felismina).
occupation(director, asdrubal).

headed_by(technician, engineer).
headed_by(engineer, supervisor).
headed_by(analyst, supervisor).
headed_by(supervisor, chief_supervisor).
headed_by(chief_supervisor, director).
headed_by(exec_secretary, director).

% Indicates that B has an occupation superior to that of O.
superior(O, B) :-
    headed_by(O, B).
superior(O, B) :-
    headed_by(O, _Y),
    superior(_Y, B).

% -----------------------------------------------------------------------------
% Questions and answers
% -----------------------------------------------------------------------------

% X is the boss of Y.
% occupation(_O1, X), occupation(_O2, Y), headed_by(_O2, _O1).

% X and Y are headed by people from the same occupation.
% occupation(_O1, X), occupation(_O2, Y), headed_by(_O1, _B), headed_by(_O2, _B).

% Which occupations are not responsible for other ones?
% headed_by(O, _), \+ headed_by(_, O).

% Who are the people headed by nobody?
% headed_by(_, _O), \+ headed_by(_O, _), occupation(_O, P).
