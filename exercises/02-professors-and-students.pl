% -----------------------------------------------------------------------------
% Database modelling
% -----------------------------------------------------------------------------

teaches('Algorithms', 'Adalberto').
teaches('Databases', 'Bernardete').
teaches('Compilators', 'Capitolino').
teaches('Statistics', 'Diogenes').
teaches('Networks', 'Ermelinda').

attends('Algorithms', 'Alberto').
attends('Algorithms', 'Bruna').
attends('Algorithms', 'Cristina').
attends('Algorithms', 'Diogo').
attends('Algorithms', 'Eduarda').
attends('Databases', 'Antonio').
attends('Databases', 'Bruno').
attends('Databases', 'Cristina').
attends('Databases', 'Duarte').
attends('Databases', 'Eduardo').
attends('Compilators', 'Alberto').
attends('Compilators', 'Bernardo').
attends('Compilators', 'Clara').
attends('Compilators', 'Diana').
attends('Compilators', 'Eurico').
attends('Statistics', 'Antonio').
attends('Statistics', 'Bruna').
attends('Statistics', 'Claudio').
attends('Statistics', 'Duarte').
attends('Statistics', 'Eva').
attends('Networks', 'Alvaro').
attends('Networks', 'Beatriz').
attends('Networks', 'Claudio').
attends('Networks', 'Diana').
attends('Networks', 'Eduardo').

studentOf(T, S) :-
    teaches(_C, T),
    attends(_C, S).

allStudents(T, Ss) :-
    bagof(S, studentOf(T, S), Ss).

allTeachers(S, Ts) :-
    bagof(T, studentOf(T, S), Ts).

studentOfAll(_, []).
studentOfAll(S, [T | Ts]) :-
    studentOf(T, S),
    studentOfAll(S, Ts).

colleagues(S1, S2) :-
    attends(_C, S1),
    attends(_C, S2).

attendsMoreThanOneCourse(S) :-
    attends(_C1, S),
    attends(_C2, S),
    _C1 \= _C2.

% -----------------------------------------------------------------------------
% Questions and answers
% -----------------------------------------------------------------------------

% What are the courses that Diógenes teaches?
% teaches(X, 'Diogenes').

% Is Felismina the teacher of any course?
% teaches(_, 'Felismina').

% What are the couses attended by Cláudio?
% attends(X, 'Claudio').

% Does Dalmindo attend any course?
% attends(_, 'Dalmindo').

% Does Bernardete teach Eduarda?
% studentOf('Bernardete', 'Eduarda').

% Do Álvaro and Alberto have a course in common?
% colleagues('Alvaro', 'Alberto').
