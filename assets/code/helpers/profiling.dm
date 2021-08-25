/*
	Outputs a json format profile every time the world shuts down
*/

#ifdef DEBUG
world
	New()
		..()
		Profile(PROFILE_START, "json")
	
	Del()
		fdel("Data/profile.txt")
		fdel("Data/profile_average.txt")
		text2file(Profile(PROFILE_REFRESH, "json"), "Data/profile.txt")
		text2file(Profile(PROFILE_REFRESH | PROFILE_AVERAGE, "json"), "Data/profile_average.txt")
		..()
#endif
