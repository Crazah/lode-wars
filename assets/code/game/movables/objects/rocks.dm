obj/outdoors/rocks
	wall
		plane = WALL_PLANE
		icon_state = "15"
		density = 1
		hasShadow = true
		autoTileTypes = list(/obj/outdoors/rocks/wall,/obj/outdoors/structures/bases/wall)

		MapInit()
			..()
			UpdateState()



		proc/
			SetBedrock()
				color = list(0.3,0.3,0.3, 0.59,0.59,0.59, 0.11,0.11,0.11, 0,0,0)
				initialColor = color
				health = 15

			UpdateState(exclude)
				icon_state = GetTileState(exclude)
				if(icon_state != "15") ShowOre()