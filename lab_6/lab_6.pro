predicates 
	nondeterm grandparents(symbol Flag, symbol GrandMother, symbol GrandFather, symbol Child)
	nondeterm parents(symbol Mother, symbol Father, symbol Child)
	
clauses 		
	/* 4th generation */
	parents("Nancy", "Tom", "Kolya").
	parents("Nancy", "Tom", "Patricia").
	parents(" _ ", "Tom", "Will").
	
	/* 3rd generation */
	parents("Julia", "Howard", "Katty").
	parents("Julia", "Howard", "Josh").
	parents(" _ ", "Andrew", "Nadya").
	
	/* 2nd generation */
	parents("Nadya", "Kolya", "Dima").
	parents("Katty", "Will", "Sasha").
	parents("Nadya", "Josh", "Newt").
	
	/* 1st generation */
	parents("Sasha", "Newt", "Bella").
	parents("Sasha", "Dima", "Vadim").
	
	
	/* mother's line grandparents*/
	grandparents("Mother's", GrandMa, GrandPa, Child):- parents(Mother, _, Child), 
							    parents(GrandMa, GrandPa, Mother).
						            
	/* father's line grandparents*/
	grandparents("Father's", GrandMa, GrandPa, Child):- parents(_, Father, Child), 
							    parents(GrandMa, GrandPa, Father).
	
goal
	/*All the grandparents*/
	grandparents(_, GrandMa, GrandPa, "Newt").
	
	/*All the grandfathers*/
	% grandparents(_, _, GrandPa, "Vadim").
	
	/*All the grandmothers*/
	% grandparents(_, GrandMa, _, "Vadim").
	
	/*All the mother's grandmothers*/
	% grandparents("Mother's", GrandMa, _, "Vadim").
	
	/*All the mother's grandfathers*/
	% grandparents("Mother's", GrandMa, _, "Vadim").