domains 
	human = symbol		% human name
	apartment = symbol	% place whrere he lives 
	city = symbol		% city where his apartment is situated
	number = symbol 	% telephone number 
predicates
	nondeterm lives(human, apartment)       % human is living in apartment
	nondeterm locates(apartment, city)      % apartment, located in city
	connected(number, apartment)            % number, connected to apartment
	nondeterm resides(human, city)          % human resides in city
	nondeterm moscow(human)		            % human resides in Moscow
	nondeterm belongs(number, city)         % number belongs to city
clauses
	lives("Ivanov S.V.", "Moscow Appartment").
	lives("Ivanich S.V.", "Moscow Appartment_1").
	lives("Ivanovich S.V.", "Moscow Appartment_2").
	lives("Komarov N.V.", "St.Petersburg Appartment_1").
	lives("Nasarov N.M.", "St.Petersburg Appartment_2").
	
	locates("Moscow Appartment", "Moscow").
	locates("Moscow Appartment_1", "Moscow").
	locates("Moscow Appartment_2", "Moscow").
	locates("St.Petersburg Appartment_1", "St.Petersburg").
	locates("St.Petersburg Appartment_2", "St.Petersburg").
	
	connected("111-222", "Moscow Appartment").
	connected("000-111", "Moscow Appartment_1").
	connected("000-222", "Moscow Appartment_2").
	connected("222-333", "St.Petersburg Appartment_1").
	connected("333-444", "St.Petersburg Appartment_2").
	
	resides(Human, City):-lives(Human, Apartment), locates(Apartment, City).  %human resides in city
	moscow(Human):-resides(Human, "Moscow").                                  %human resides in Moscow
	belongs(Number, City):-connected(Number, Appartment), locates(Apartment, City).
goal
	resides("Komarov N.V.", "Moscow").  %no
	moscow("Ivanich S.V.").             %yes
	moscow("Nasarov N.M.").             %no
	belongs("000-222", "Moscow").       %yes
	
	moscow(Who).	    %Who=Ivanov S.V.
					    %Who=Ivanich S.V.
					    %Who=Ivanovich S.V.