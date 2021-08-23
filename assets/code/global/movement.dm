
proc/MoveMobs()
	for(var/mob/m in playersToUpdate)
		if(!m.movingDir) playersToUpdate -= m
		else
			step(m, m.movingDir)
			if(!m.client) playersToUpdate -= m

