obj/outdoors/rocks
	wall
		icon_state = "15"
		density = 1

		/*
			Autotiling for walls
		*/
		proc/Tile()

			var/list/turf/adjacentTiles[4]
			for(var/direction in list(1,2,4,8))
				for(var/obj/outdoors/rocks/wall in GetStep(src,direction))
					if(wall != src) adjacentTiles[num2dir(direction)] = wall

			var/hasTop = adjacentTiles["NORTH"]
			var/hasBottom = adjacentTiles["SOUTH"]
			var/hasRight = adjacentTiles["EAST"]
			var/hasLeft = adjacentTiles["WEST"]

			// this is pretty rough, but it helped me conceptualize it

			if(!hasTop && !hasBottom && !hasLeft && !hasRight) icon_state = "0"
			if(hasTop && !hasBottom && !hasLeft && !hasRight) icon_state = "1"
			if(!hasTop && hasBottom && !hasLeft && !hasRight) icon_state = "2"
			if(hasTop && hasBottom && !hasLeft && !hasRight) icon_state = "3"
			if(!hasTop && !hasBottom && !hasLeft && hasRight) icon_state = "4"
			if(hasTop && !hasBottom && !hasLeft && hasRight) icon_state = "5"
			if(!hasTop && hasBottom && !hasLeft && hasRight) icon_state = "6"
			if(hasTop && hasBottom && !hasLeft && hasRight) icon_state = "7"
			if(!hasTop && !hasBottom && hasLeft && !hasRight) icon_state = "8"
			if(hasTop && !hasBottom && hasLeft && !hasRight) icon_state = "9"
			if(!hasTop && hasBottom && hasLeft && !hasRight) icon_state = "10"
			if(hasTop && hasBottom && hasLeft && !hasRight) icon_state = "11"
			if(!hasTop && !hasBottom && hasLeft && hasRight) icon_state = "12"
			if(hasTop && !hasBottom && hasLeft && hasRight) icon_state = "13"
			if(!hasTop && hasBottom && hasLeft && hasRight) icon_state = "14"

			//looks better to have lone rocks be see through, not as choppy
			if(icon_state != "0") opacity = 1

		New()
			..()
			spawn() Tile()