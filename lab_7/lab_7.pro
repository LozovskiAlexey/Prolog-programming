domains 
	int = integer
	
predicates 
	nondeterm max1a(int, int, int)
	nondeterm max1b(int, int, int)

	nondeterm max2a(int, int, int, int)
	nondeterm max2b(int, int, int, int)
	
clauses
	max1a(X, Y, X) :- X >= Y.
	max1a(X, Y, Y) :- X < Y.
	
	max1b(X, Y, X) :- X >= Y, !.
	max1b(_, Y, Y).
	
	max2a(X, Y, Z, X) :- X >= Z, X >= Y.
	max2a(X, Y, Z, Y) :- Y >= X, Y >= Z.
	max2a(X, Y, Z, Z) :- Z >= X, Z >= Y.
	
	max2b(X, Y, Z, X) :- X >= Y, X >= Z, !.
	max2b(_, Y, Z, Y) :- Y >= Z, !.
	max2b(_, _, Z, Z).
goal
	% max1a(5, 1, Res).
	% max1a(5, 6, Res).
	% max1b(5, 1, Res).
	% max1b(5, 6, Res).
	% max2a(5, 7, 1, Res).
	max2b(5, 7, 1, Res).