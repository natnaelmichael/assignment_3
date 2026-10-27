% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%
% Add the required statements in the q1a_generate_and_test section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q1a_generate_and_test
%%%%% Put the different components of your Q1 solution below

%%% Put the domains for your variables below



%%% Define any helper predicates here



%%% Define solve below. Remember that solve should take in the list of
%%% variables to assign. See solve_and_print as defined below to better
%%% understand how it will be called.
%%% MAKE SURE TO BRIEFLY EXPLAIN THE MEANING OF YOUR VARIABLES IN A COMMENT



%%% Define print_solution below. This should take in the list of variables 
%%% after they have been assigned values, and outputs the solution in a
%%% human readable form. See solve_and_print as defined below to better
%%% understand how it will be called.
%%% REMEMBER TO LOG YOUR FINAL OUTPUT AND RUNTIME IN q1_puzzle_session.txt



%%%%% SECTION: q1a_solve_and_print
%%%%% The following calls the solve predicate, passes the variables to
%%%%% printSolution and outputs the time needed to solve the problem.
%%%%% This is the main way we will interact with your program.
%%%%% You can test it however you want though.
%%%%% DO NOT EDIT.

solve_and_print :- Start is cputime, solve(L), End is cputime, Time is End - Start,
    write("The problem was solved in "), write(Time), write(" seconds"), nl, nl,
    print_solution(L).

