domains 
	adress           = adress(symbol City, symbol Street, integer HouseNum, integer FlatNum)
	
	ownership        = automobile(symbol Name, integer Price, symbol Colour);
			   arrea(symbol Name, integer Price, symbol Size);
			   water_transport(symbol Name, integer Price);
			   building(symbol Name, integer Price)
		    
	person           = person(symbol FirstName, symbol LastName)
	
predicates	
	nondeterm investors (person, symbol Bank,  symbol Acc_number, integer Value)
	nondeterm phonebook (person, symbol PhoneNum, adress Adrr)
	
	nondeterm type(symbol, ownership)
	nondeterm price(integer, ownership)
	
	nondeterm owns(person, ownership)
	nondeterm owns(person, symbol, integer)
	
	nondeterm count_prices(person, integer)
clauses
	phonebook(person("Name1", "Surname1"), "0-000-111-222", adress("Moscow", "Unnatov", 14, 128)).
	phonebook(person("Name1", "Surname1"), "0-000-111-222", adress("Moscow", "Mishina", 1, 10)).
	phonebook(person("Name1", "Surname1"), "5-666-777-888", adress("St.Peterburg", "Unnatov", 14, 128)).
	phonebook(person("Name2", "Surname2"), "1-222-333-444", adress("Moscow", "8th March", 12, 153)).
	phonebook(person("Name3", "Surname3"), "3-444-555-666", adress("Moscow", "Mishina", 1, 10)).
	phonebook(person("Name3", "Surname3"), "3-444-555-666", adress("Moscow", "Volgogradskaya", 1, 10)).
	
	investors(person("Name1", "Surname1"), "Sberbank", "0000 4444 3333 2222", 700000).
	investors(person("Name1", "Surname1"), "VTB",      "0000 4444 3333 2222", 700000).
	investors(person("Name2", "Surname2"), "Sberbank", "0000 2222 3333 2222", 200000).
	investors(person("Name3", "Surname3"), "VTB",      "0000 3333 3333 2222", 300000).
	
	type(Name, automobile(CarName, _, _))     	 :-Name=CarName, !.
	type(Name, arrea(ArreaName, _, _))        	 :-Name=ArreaName, !.
	type(Name, water_transport(TrName, _))    	 :-Name=TrName, !.
	type(Name, building(BName, _))                   :-Name=Bname, !. 
	
	price(Price, automobile(_, CarPrice, _))         :-Price=CarPrice, !.
	price(Price, arrea(_, ArreaPrice, _))            :-Price=ArreaPrice, !.
	price(Price, water_transport(_, TransportPrice)) :-Price=TransportPrice, !.
	price(Price, building(_, BPrice))	         :-Price=BPrice, !.
			       
	owns(person("Name1", "Surname1"), automobile("Car", 2000000, "Black")).
	owns(person("Name1", "Surname1"), arrea("Arrea", 1200000, "Black")).
	owns(person("Name1", "Surname1"), water_transport("Ship", 23)).
	owns(person("Name2", "Surname2"), automobile("Car", 2300000, "Red")).
	owns(person("Name2", "Surname2"), building("House", 1203212)).
	
	owns(Person, Name, Price)  :-  owns(Person, Ownership), 
				       type(Name, Ownership),
				       price(Price, Ownership).
	
	count_prices(Person, Sum) :-   owns(Person, Name, Price),
				       owns(Person, Name1, Price1),
				       Name<>Name1, 
				       owns(Person, Name2, Price2),
				       Name1<>Name2, 
				       Name <>Name2,
				       owns(Person, Name3, Price3),
				       Name<>Name3,
				       Name1<>Name3, 
				       Name2<>Name3,
				       Sum = Price+Price1+Price2+Price3, !.
	
	count_prices(Person, Sum) :-   owns(Person, Name, Price),
				       owns(Person, Name1, Price1),
				       Name<>Name1, 
				       owns(Person, Name2, Price2),
				       Name1<>Name2, 
				       Name <>Name2,
				       Sum = Price+Price1+Price2, !.
				       
	count_prices(Person, Sum) :-   owns(Person, Name, Price),
				       owns(Person, Name1, Price1),
				       Name<>Name1, 
				       Sum = Price+Price1, !.
				       
	count_prices(Person, Sum) :-   owns(Person, _, Sum), !.
	
goal 
	% owns(person("Name2", "Surname2"), Name, _).
	% owns(person("Name1", "Surname1"), Name, Price).
	count_prices(person("Name1", "Surname1"), Sum).
	
	
	
	

	