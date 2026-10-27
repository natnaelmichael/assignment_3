% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Vladimirs Kalinins
%%%%% STUDENT ID: 501291214
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%
% Add the required statements in the q2_exams_solution section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q2_exams_solution
%%%%% Put the different components of your Q2 solution below

%%% Put the domains for your variables below
weekday(1). weekday(2). weekday(3). weekday(4). weekday(5).
dayname(1,monday). dayname(2,tuesday). dayname(3,wednesday). dayname(4,thursday). dayname(5,friday).

%%% Define any helper predicates here

roomOnDay(D, D, _, _, _, _, 101).
roomOnDay(D, _, D, _, _, _, 102).
roomOnDay(D, _, _, D, _, _, 103).
roomOnDay(D, _, _, _, D, _, 104).
roomOnDay(D, _, _, _, _, D, 105).

sizeOnDay(D, D, _, _, _, _, 20).
sizeOnDay(D, _, D, _, _, _, 25).
sizeOnDay(D, _, _, D, _, _, 30).
sizeOnDay(D, _, _, _, D, _, 35).
sizeOnDay(D, _, _, _, _, D, 40).

%%% Define solve below. Remember that solve should take in the list of
%%% variables to assign. See solve_and_print as defined below to better
%%% understand how it will be called.
%%% MAKE SURE TO BRIEFLY EXPLAIN THE MEANING OF YOUR VARIABLES IN A COMMENT

solve([biology,BD,BR,BS, calculus,CD,CR,CS, history,HD,HR,HS, literature,LD,LR,LS, physics,PD,PR,PS]) :-
    weekday(BD),
    weekday(HD), HD is BD+2,                            % 1: history 2 days after biology
    weekday(CD), CD is HD+1,                            % 1: calculus day after history
    weekday(PD), not PD=BD, not PD=HD, not PD=CD,
    PD < CD, not PD=1,                                  % 3: physics before calculus, not first
    weekday(LD), not LD=BD, not LD=HD, not LD=CD, not LD=PD,

    LR = 101,                                           % 4: literature in room 101
    DR105 is LD+4, weekday(DR105),                      % 2: room105 is 4 days after room101
    weekday(DR102), not DR102=LD, not DR102=DR105,
    DR103 is DR102+1, weekday(DR103), not DR103=LD, not DR103=DR105,  % 2: room102 day before room103
    weekday(DR104), not DR104=LD, not DR104=DR105, not DR104=DR102, not DR104=DR103,
    DR103 < DR104,                                      % 2: room103 earlier than room104

    PS = 35,                                            % 3: physics has 35 students
    DS40 is DR105,                                      % 5: largest class (40) is in room105
    DS20 is PD+1, weekday(DS20),                        % 5: smallest class (20) is day after physics
    weekday(DS25), not DS25=DS40, not DS25=DS20, not DS25=PD,
    weekday(DS30), not DS30=DS40, not DS30=DS20, not DS30=PD, not DS30=DS25,

    roomOnDay(BD, LD, DR102, DR103, DR104, DR105, BR),
    roomOnDay(CD, LD, DR102, DR103, DR104, DR105, CR),
    roomOnDay(HD, LD, DR102, DR103, DR104, DR105, HR),
    roomOnDay(PD, LD, DR102, DR103, DR104, DR105, PR),

    sizeOnDay(BD, DS20, DS25, DS30, PD, DS40, BS),
    sizeOnDay(CD, DS20, DS25, DS30, PD, DS40, CS),
    sizeOnDay(HD, DS20, DS25, DS30, PD, DS40, HS),
    sizeOnDay(LD, DS20, DS25, DS30, PD, DS40, LS),
    not LS=20.                                          % 4: literature does not have 20 students

%%% Define print_solution below. This should take in the list of variables 
%%% after they have been assigned values, and outputs the solution in a
%%% human readable form. See solve_and_print as defined below to better
%%% understand how it will be called.
%%% REMEMBER TO LOG YOUR FINAL OUTPUT AND RUNTIME IN q3_exams_session.txt

print_solution([]).
print_solution([Class, Day, Room, Size | Rest]) :-
    dayname(Day, DayName),
    write(Class), write(" exam on: "), write(DayName), write(", room: "), write(Room), write(", size: "), write(Size), nl,
    print_solution(Rest).

%%%%% SECTION: q2_solve_and_print
%%%%% The following calls the solve predicate, passes the variables to
%%%%% printSolution and outputs the time needed to solve the problem.
%%%%% This is the main way we will interact with your program.
%%%%% You can test it however you want though.
%%%%% DO NOT EDIT.

solve_and_print :- Start is cputime, solve(L), End is cputime, Time is End - Start,
    write("The problem was solved in "), write(Time), write(" seconds"), nl, nl,
    print_solution(L).
