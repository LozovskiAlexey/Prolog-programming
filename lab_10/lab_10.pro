domains
	list = integer*
	
predicates
	add(list, list, integer)
	odd(list, list)
	delete_all(list, list, integer)
	set(list, list)
	
clauses	
	add([],[], _).
	add([H|T], [H|T2], El) :- write(T2), H > El, add(T, T2, El), !. 
	add([_|T], T2, EL) :- add(T, T2, El).
	
	odd([], []).
	odd([_,H|T],[H|T2]) :- odd(T, T2), !.
	odd([_|[]], T2) :- odd([], T2).
	
	delete_all([], [], _).
	delete_all([El|T],T2, El) :- delete_all(T, T2, El), !.
	delete_all([H|T], [H|T2], El):- delete_all(T, T2, El).
	
	set([], []).
	set([H|T],[H|T1]) :- delete_all(T, T2, H),
			     set(T2, T1).
  
goal
	add([6, 1, 5, 0, -3, 3, 8], Result, 1).
%	add([1, 2, 3, 4], Result, 5).

%	odd([1, 2, 3, 4, 5], List).
%	odd([1], List).
%	odd([1, 2], List).

%	delete_all([1, 2, 3, 2, 4], List, 2).
%	delete_all([1, 2, 3, 4, 5], List, 6).

%	set([1, 2, 2, 3, 4, 5, 2, 2, 3], Set).
%	set([1, 2, 3, 4], Set).
