atom/proc/
	GetTileState(exclude)

		var/list/turf/adjacentTiles[4]
		for(var/direction in list(1,2,4,8))
			for(var/atom/neighbor in GetStep(src,direction))
				if(neighbor.type != src.type) continue
				if(neighbor == exclude) continue
				if(neighbor != src) adjacentTiles[num2dir(direction)] = neighbor

		var/hasTop = adjacentTiles["NORTH"]
		var/hasBottom = adjacentTiles["SOUTH"]
		var/hasRight = adjacentTiles["EAST"]
		var/hasLeft = adjacentTiles["WEST"]

		// this is pretty rough, but it helped me conceptualize it

		if(!hasTop && !hasBottom && !hasLeft && !hasRight) return "0"
		if(hasTop && !hasBottom && !hasLeft && !hasRight) return "1"
		if(!hasTop && hasBottom && !hasLeft && !hasRight) return "2"
		if(hasTop && hasBottom && !hasLeft && !hasRight) return "3"
		if(!hasTop && !hasBottom && !hasLeft && hasRight) return "4"
		if(hasTop && !hasBottom && !hasLeft && hasRight) return "5"
		if(!hasTop && hasBottom && !hasLeft && hasRight) return "6"
		if(hasTop && hasBottom && !hasLeft && hasRight) return "7"
		if(!hasTop && !hasBottom && hasLeft && !hasRight) return "8"
		if(hasTop && !hasBottom && hasLeft && !hasRight) return "9"
		if(!hasTop && hasBottom && hasLeft && !hasRight) return "10"
		if(hasTop && hasBottom && hasLeft && !hasRight) return "11"
		if(!hasTop && !hasBottom && hasLeft && hasRight) return "12"
		if(hasTop && !hasBottom && hasLeft && hasRight) return "13"
		if(!hasTop && hasBottom && hasLeft && hasRight) return "14"
		return "15"