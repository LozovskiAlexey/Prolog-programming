domains
	name = string
	info = info(string Leader, string Genre, integer Data, integer Rate)
predicates
	nondeterm tv_show(name, info)
	nondeterm movie(name, info)
	oscar(name)
	good_movie(name)
	nondeterm show_movies_shows(string Leader, name Names )
	nondeterm latest(string Leader)
clauses
	tv_show("show1", info("leader_1","drama", 1990, 3)).
	tv_show("show2", info("leader_2","comedy", 2019, 2)).
	tv_show("name3", info("leader_3","drama", 2015, 5)).
	
	movie("movie1", info("leader_1", "comedy", 2019, 9)).
	movie("movie2", info("leader_3", "comedy", 2012, 6)).
	movie("movie3", info("leader_2", "comedy", 2014, 7)).
	
	oscar("movie1").
	oscar("movie3").
	
	good_movie(Name):-movie(Name, info(_, _, _, Rate)), 
			  Rate > 7, 
			  oscar(Name).
			  
	latest(Name):-movie(Name, info(_, _, Data, _)),
		      Data > 2012.
	
	show_movies_shows(Leader, Names):-tv_show(Names, info(Leader,_,_,_));
				   movie(Names, info(Leader,_,_,_)).    
goal
	%tv_show("show1", info("leader_1","drama", 1990, 3)).
	%tv_show("movie1", info("leader_1", "comedy", 2019, 9)).
	
	%good_movie("movie3").
	%good_movie("movie1").
	
	%latest("movie1").
	%latest(Name).
	%latest("show2").
	
	show_movies_shows("leader_1", Names).