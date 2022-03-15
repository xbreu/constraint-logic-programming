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

% Returns a list with all the teachers.
% teachers(-T)
teachers(T) :-
    setof(Teacher, Course^(
        teaches(Course, Teacher)
    ), T).

% Returns a list with all the students of teacher T.
% students_of(+T, -S)
students_of(T, S) :-
    setof(Student, Course^(
        teaches(Course, T),
        attends(Course, Student)
    ), S).

% Returns a list with all the teachers of student S.
% teachers_of(+S, -T)
teachers_of(S, T) :-
    setof(Teacher, Course^(
        attends(Course, S),
        teaches(Course, Teacher)
    ), T).

% Returns a list with all the courses attended by both students S1 and S2.
% common_courses(+S1, +S2, -C)
common_courses(S1, S2, C) :-
    setof(Course, (
        attends(Course, S1),
        attends(Course, S2)
    ), C).

% Returns a list with all the students that attend more than one course.
% more_than_one_course(-L)
more_than_one_course(L) :-
    setof(Person, C1^C2^(
        attends(C1, Person),
        attends(C2, Person),
        C1 \= C2
    ), L).

% Returns a list of all pairs of students that attend no courses together.
% strangers(-L)
% TODO

% Returns a list of all pairs of students that attend more than one course
% together.
% good_groups(-L)
% TODO

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
