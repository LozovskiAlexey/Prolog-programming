domains
	int = integer
predicates 
	nondeterm fact(int, int, int, int)
	nondeterm factorial(int, int)
	
	nondeterm fibonacci(int, int)
	nondeterm fib(int, int, int, int)
	
clauses
  	factorial(N,F)  :- fact(N,F,1,1).
  	fact(N,F,N,F)   :- !.
  	fact(N,F,TmpN,TmpF) :- NewN = TmpN + 1,
                               NewF = TmpF * NewN,
                               fact(N,F,NewN,NewF).
                         
        fibonacci(N, _):- N < 1, !, fail.
        fibonacci(N, Res):- fib(N, 1, 0, Res).
        fib(1, Res, _, Res) :- !.
        fib(N, Prev1, Prev2, Res) :- NewN = N - 1,
        			     NewPrev2 = Prev1, 
        			     NewPrev1 = Prev1 + Prev2,
        			     fib(NewN, NewPrev1, NewPrev2, Res). 
goal
	factorial(2, Res).
	% fibonacci(3, 2).
