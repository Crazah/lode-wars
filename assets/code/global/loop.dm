var/ticker = 0
proc/loop()
	set waitfor = false
	while(world)
		try
			ticker++
			if(!ticker % 600) SetRoundTimer(roundTimer-1)
			if(playersToUpdate?.len) MoveMobs()
		catch(var/exception/e)
			world.log << "[e] on [e.file]:[e.line]"
			continue
		sleep(world.tick_lag)