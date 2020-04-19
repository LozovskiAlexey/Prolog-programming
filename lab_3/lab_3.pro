domains 
	adress = adress(symbol City, symbol Street, integer HouseNum, integer FlatNum)
	
predicates
	nondeterm phonebook (symbol Surname, symbol PhoneNum, adress Adrr)
	nondeterm automobile(symbol Surname, symbol Brand, symbol Colour, integer Price)
	nondeterm investors (symbol Surname, symbol Bank,  symbol Acc_number, integer Value)
	
	nondeterm search_by(symbol Surname, symbol PhoneNum, symbol CarBrand, integer CarPrice)
	nondeterm search_by(symbol PhoneNum, symbol CarBrand)
	nondeterm search_by(symbol Surname, symbol City, symbol PhoneNum, symbol Street, symbol Bank)
	
clauses
	phonebook("Surname1", "0-000-111-222", adress("Moscow", "Unnatov", 14, 128)).
	phonebook("Surname1", "0-000-111-222", adress("Moscow", "Mishina", 1, 10)).
	phonebook("Surname1", "5-666-777-888", adress("St.Peterburg", "Unnatov", 14, 128)).
	phonebook("Surname2", "1-222-333-444", adress("Moscow", "8th March", 12, 153)).
	phonebook("Surname3", "3-444-555-666", adress("Moscow", "Mishina", 1, 10)).
	phonebook("Surname3", "3-444-555-666", adress("Moscow", "Volgogradskaya", 1, 10)).
	phonebook("Surname5", "9-999-000-111", adress("St.Peterburg", "Samarcand", 12, 153)).
	phonebook("Surname6", "0-111-222-333", adress("St.Peterburg", "Usievicha", 1, 10)).
	
	automobile("Surname1", "Ford",       "Black",  1600000).
	automobile("Surname1", "Volvo",       "Silver", 1300000).
	automobile("Surmane2", "Nissan",     "Green",  970000).
	automobile("Surname4", "Nissan",     "Yellow", 900000).
	automobile("Surname5", "Volkswagen", "Pink",   900000).
	automobile("Surname6", "Volvo",      "Red",    900000).
	
	investors("Surname1", "Sberbank", "0000 4444 3333 2222", 700000).
	investors("Surname1", "VTB",      "0000 4444 3333 2222", 700000).
	investors("Surname2", "Sberbank", "0000 2222 3333 2222", 200000).
	investors("Surname3", "VTB",      "0000 3333 3333 2222", 300000).
	investors("Surname4", "Sberbank", "0000 5555 3333 2222", 400000).
	
	search_by(Surname, PhoneNum, CarBrand, CarPrice) :-
			phonebook  (Surname, PhoneNum, _),
			automobile (Surname, CarBrand, _, CarPrice).
	
	search_by(PhoneNum, CarBrand) :-
			search_by(_, PhoneNum, CarBrand, _).	
		
	search_by(Surname, City, PhoneNum, Street, Bank) :-
			phonebook (Surname, PhoneNum, adress(City, Street, _, _)),
			investors (Surname, Bank, _, _).
	
goal
	% search_by(Surname, "0-000-111-222", CarBrand, CarPrice).
	% search_by("0-000-111-222", CarBrand).
	search_by("Surname1", "Moscow", PhoneNum, Street, Bank).
	