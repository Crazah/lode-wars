/*
	Outputs a json format profile every time the world shuts down
*/

#ifdef DEBUG
world
	New()
		Profile(PROFILE_START, "json")
		..()
	
	Del()
		fdel("DEBUG/profile.json")
		fdel("DEBUG/profile_average.json")
		text2file(Profile(PROFILE_REFRESH, "json"), "DEBUG/profile.json")
		text2file(Profile(PROFILE_REFRESH | PROFILE_AVERAGE, "json"), "DEBUG/profile_average.json")
		..()
#endif
