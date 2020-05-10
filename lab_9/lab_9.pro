domains 
	list = integer*
	
predicates
	len(list, integer)
	len(list, integer, integer)
	
	sum(list, integer)
	sum(list, integer, integer)
	
	sum_odd(list, integer)
	sum_odd(list, integer, integer)
	
clauses 
	len(List, Len) :- len(List, 0, Len).
	len([], Len, Len).
	len([_|T], TmpLen, Len) :- NewLen = TmpLen + 1,
			   	len(T, NewLen, Len).
			   	
	
	sum(List, Sum) :- sum(List, 0, Sum).
	sum([], Sum, Sum).
	sum([H|T], TmpSum, Sum) :- NewSum = TmpSum + H, 
				   sum(T, NewSum, Sum).	 
				   
	
	sum_odd(List, Sum) :- sum_odd(List, 0, Sum).
	sum_odd([], Sum, Sum).
	sum_odd([_|[]], TmpSum, Sum)  :- sum_odd([], TmpSum, Sum).
	sum_odd([_,H|T], TmpSum, Sum) :- NewSum = TmpSum + H, 
					 sum_odd(T, NewSum, Sum).
					 
goal 
%	len([], Len).
%	len([1, 2, 3, 4], Res).
%	sum([1, 2, 3], Sum).
%	sum_odd([1, 2, 3, 4], Sum).
%	sum_odd([1, 2, 3], Sum).
%	sum_odd([1], Sum).