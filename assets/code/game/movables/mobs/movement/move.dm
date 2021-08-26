mob/verb/
	MoveKey(dir as num,state as num)
		set instant = 1, hidden = 1
		if(state)
			if(!keyDown["[dir]"]) keyDown["[dir]"] = dir
			MoveDirection(dir)
		else
			keyDown -= "[dir]"
			if(movingDir==dir)
				if(keyDown.len) movingDir = keyDown[keyDown[keyDown.len]]
				else movingDir = 0
mob
	proc/MoveDirection(dir)
		if(!playersToUpdate[src]) playersToUpdate[src] = null
		src.movingDir = dir
