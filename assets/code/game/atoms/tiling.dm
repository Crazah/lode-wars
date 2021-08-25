atom/
	var/
		list/autoTileTypes
	proc/
		GetTileState(exclude)

			while(world.tick_usage > 90)
				sleep(world.tick_lag)

			for(var/direction in cardinals)
				for(var/atom/neighbor in get_step(src,direction))
					if(neighbor == exclude) continue
					if(!(neighbor.type in src.autoTileTypes)) continue
					if(neighbor != src) . |= direction

			. = "[.]"