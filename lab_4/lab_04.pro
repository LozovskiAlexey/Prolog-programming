domains 
	adress = adress(symbol City, symbol Street, integer HouseNum, integer FlatNum)
	
predicates
	nondeterm phonebook (symbol Surname, symbol PhoneNum, adress Adrr)
	nondeterm automobile(symbol Surname, symbol Brand, symbol Colour, integer Price)
	nondeterm investors (symbol Surname, symbol Bank,  symbol Acc_number, integer Value)
	
	nondeterm search_by(symbol CarBrand, symbol CarColour, symbol Surname, symbol City, symbol PhoneNum, symbol Bank)
	
clauses
	phonebook("Surname1", "0-000-111-222", adress("Moscow", "Unnatov", 14, 128)).
	phonebook("Surname1", "5-666-777-888", adress("St.Peterburg", "Nevskiy", 14, 128)).
	phonebook("Surname2", "1-222-333-444", adress("Moscow", "8th March", 12, 153)).
	phonebook("Surname3", "3-444-555-666", adress("Moscow", "Mishina", 1, 10)).
	phonebook("Surname3", "3-555-444-222", adress("Moscow", "Volgogradskaya", 1, 10)).
	phonebook("Surname4", "9-000-111-111", adress("St.Peterburg", "Nevskiy", 1, 10)).
	
	/*3 drivers, 1 doesn't have investments*/
	automobile("Surname1", "Ford",  "Black",  1600000).
	automobile("Surname2", "Ford",  "Black",  1600000).
	automobile("Surname3", "Ford",  "Black",  1600000).
	
	/*1 driver*/
	automobile("Surname4", "Volvo",      "Silver", 1300000).

	/*no drivers, doesn't have investments*/
	automobile("Surname3", "Nissan",     "Red",    1300000).
	
	investors("Surname1", "Sberbank",   "0000 4444 3333 2222", 700000).
	investors("Surname2", "Sberbank",   "0000 2222 3333 2222", 200000).
	investors("Surname4", "MoscowBank", "0000 3333 3333 2222", 300000).
	investors("Surname4", "VTB",        "0000 4444 3333 2222", 700000).
	
	/*searches for surname, city, phone, bank*/
	search_by(CarBrand, CarColour, Surname, City, PhoneNum, Bank) :-	
			automobile(Surname, CarBrand, CarColour, _),
			phonebook(Surname, PhoneNum, adress(City, _, _, _)),
			investors(Surname, Bank, _, _).

goal
	% search_by("Ford", "Black", Surname, City, PhoneNum, Bank).
	% search_by("Volvo", "Silver", Surname, City, PhoneNum, Bank).
	search_by("Nissan", "Red", Surname, City, PhoneNum, Bank).	


