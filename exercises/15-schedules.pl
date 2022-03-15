:- consult('14-input-and-output.pl').

% class(Course, ClassType, DayOfWeek, Time, Duration)
class(pfl, t, '1 Seg', 11, 1).
class(pfl, t, '4 Qui', 10, 1).
class(pfl, tp, '2 Ter', 10.5, 2).
class(lbaw, t, '1 Seg', 8, 2).
class(lbaw, tp, '3 Qua', 10.5, 2).
class(ltw, t, '1 Seg', 10, 1).
class(ltw, t, '4 Qui', 11, 1).
class(ltw, tp, '5 Sex', 8.5, 2).
class(fsi, t, '1 Seg', 12, 1).
class(fsi, t, '4 Qui', 12, 1).
class(fsi, tp, '3 Qua', 8.5, 2).
class(rc, t, '4 Qui', 8, 2).
class(rc, tp, '5 Sex', 10.5, 2).

weekday_translation('1 Seg', seg).
weekday_translation('2 Ter', ter).
weekday_translation('3 Qua', qua).
weekday_translation('4 Qui', qui).
weekday_translation('5 Sex', sex).

% Succeeds if there is a class from each course that happens in the same day.
% same_day(+C1, +C2)
same_day(C1, C2) :-
    class(C1, _, D, _, _),
    class(C2, _, D, _, _).

% Receives a day of the week and returns all courses that have a class that
% day.
% daily_courses(+Day, -Courses)
daily_courses(Day, Courses) :-
    findall(Course, (
        class(Course, _, Day, _, _)
    ), Courses).

% Returns a list with all classes that take less than 2 hours.
% short_classes(-L)
short_classes(L) :-
    findall(Course-Day/Hour, (
        class(Course, _, _Day, Hour, Dur),
        Dur < 2,
        weekday_translation(_Day, Day)
    ), L).

% Receives a course and returns a list with all its classes.
% course_classes(+Course, -Classes)
course_classes(Course, Classes) :-
    findall(Day/Hour-Type, (
        class(Course, Type, _Day, Hour, _),
        weekday_translation(_Day, Day)
    ), Classes).

% Returns a list of all the courses.
% courses(-L)
courses(L) :-
    setof(Course, Type^Day^Hour^Dur^(
        class(Course, Type, Day, Hour, Dur)
    ), L).

% Prints in the console every class, ordered by the time of occurence in the
% week.
schedule :-
    findall(Day-Hour-class(Course, Type, Day, Hour, Dur), (
        class(Course, Type, Day, Hour, Dur)
    ), Classes),
    keysort(Classes, Sorted),
    print_classes(Sorted).

print_classes([]).
print_classes([_-_-class(Course, Type, _Day, Hour, Dur) | Cs]) :-
    weekday_translation(_Day, Day),
    write(Day),
    write(' '),
    write(Hour),
    write(' '),
    write(Dur),
    write(' '),
    write(Course),
    write(' '),
    write(Type),
    nl,
    print_classes(Cs).

% Asks for a day and an hour and indicates if one of the classes begins or is
% happening at that hour, printing the class, starting hour and duration.
find_class :-
    write('Day: '),
    read_string(S_),
    atom_codes(D_, S_),
    weekday_translation(D, D_),
    write('Hour: '),
    read_number(N),
    class(Course, _, D, Time, Duration),
    N >= Time,
    N =< Time + Duration,
    write(Course),
    write(' '),
    write(Time),
    write(' '),
    write(Duration),
    nl.
