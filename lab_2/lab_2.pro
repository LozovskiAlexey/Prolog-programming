domains 
	name = string
	human = human(string FirstName, string LastNaame, integer Age, string City)
	info = info(name University, string Group, string Direction)
predicates
	nondeterm university(name)
	nondeterm school(name)
	nondeterm college(name)
	
	nondeterm student(human)
	nondeterm study(human, info)
	
	nondeterm universities
	nondeterm hse_students
clauses
	university("BMSTU").
	university("HSE").
	university("MSU").
	school("School 1289").
	college("Technical College 4").
	
	study( human("Tolya",  "Terentiev", 21, "Moscow"), info("HSE", "171", "CSF") ).
	study( human("Kolya",  "Polyakov",  18, "Moscow"), info("HSE", "171", "CSF") ).
	study( human("Artyom", "Cobanov",   21, "Moscow"), info("HSE", "172", "CSF") ).
	study( human("Artyom", "Cobanov",   21, "Moscow"), info("BMSTU", "172", "CSF") ).
	study( human("Sergey", "Samoylov",  25, "Moscow"), info("HSE", "171", "CSF") ).
	
	study( human("Tolya",  "Terentiev", 21, "Moscow"),  info("BMSTU", "171", "CSS") ).
	study( human("Kolya",  "Polyakov",  18, "Moscow"),  info("MSU", "171", "CSC") ).
	study( human("Artyom", "Cobanov",   21, "Moscow"),  info("Technical College 4", "171", "CC") ).
	study( human("Sergey", "Samoylof",  25, "Moscow"),  info("Technical College 4", "171", "CC") ).
	
	student(human(Name, LastName, _, _)):- study(human(Name, LastName, _, _), info(University, _, _)),
					       university(University),
	                                       write(Name, " ",LastName, " is student\n").   
	universities :- university(Name),
			write(Name, " is University.\n"),
			fail.
	hse_students :- study(human(Name, LastName, _, _), info("HSE", "171", _)),
			write(Name, LastName, " studies at hse\n"),
			fail.

goal
	% study(Human, info("HSE",_, _)).
	% university("Technical College 4").
	% study(Human, info(_, _, "CSF")).
	% study(human(Name, LastName, Age, _), _), Age > 21.
	
	% universities.
	% student(human("Sergey", "Samoylof", 25, "Moscow")).	
	% hse_students.