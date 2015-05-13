:- module(botter, [
	%% start/0,
	isRole/1,
	findPropositions/1,
	findActions/2,
	findInits/1,
	findFirstLegal/3,
	findAllLegal/3,
	findNext/4,
	findReward/3,
	isTerminal/2
]).
:- use_module(db).

%% TODO remove this!!!
:- style_check(-singleton).

%% operator declarations
:- op(950,xfy,&).
:- op(500,fy,~).

%% operator definitions
&(X, Y) :-
 	call(X), call(Y).

~(X) :-
 	not(call(X)).

%% writeLine to stream Out
writeLine(_,[]).
writeLine(Out,[Ln|L]) :-
	write(Out,Ln),
	nl(Out),
	writeLine(Out,L),
	!.

%% write list of lines L into file File
writeFile(File,L) :-
	open(File,write,Out),
	writeLine(Out,L),
	close(Out).

%% readLine from stream In and return list of lines L
readLine(In,[Ta|T]) :-
	read_term(In,Ta,[]),
	( Ta == end_of_file -> !; readLine(In,T) ).

%% readFile File and returns list of lines L
readFile(File,L) :-
	open(File,read,In),
	readLine(In,L),
	close(In).

setInitialState :-
	forall(db:base(T), assertz(db:true(T))).

clearCurrentState :-
	retractall(db:true(_)).

%% returns a sequence of roles.
isRole(Role) :- db:role(Role).

%% returns a sequence of propositions.
findPropositions(Game) :- true.

%% returns a sequence of actions for a specified role.
findActions(Role,Game) :- true.

%%  returns a sequence of all propositions that are true in the initial state.
findInits(Game) :- true.

%% returns the first action that is legal for the specified role in the specified state.
findFirstLegal(Role,State,Game) :- true.

%% returns a sequence of all actions that are legal for the specified role in the specified state.
findAllLegal(Role,State,Game) :- true.

%% returns a sequence of all propositions that are true in the state that results from the specified roles performing the specified move in the specified state.
findNext(Roles,Move,State,Game) :- true.

%% returns the goal value for the specified role in the specified state.
findReward(Role,State,Game) :- true.

%% returns a boolean indicating whether the specified state is terminal.
isTerminal(State,Game) :- true.
