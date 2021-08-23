obj/outdoors/rocks
	wall
		icon_state = "15"
		density = 1

		MapInit()
			..()
			icon_state = GetTileState()

		proc/SetBedrock()
			color = list(0.3,0.3,0.3, 0.59,0.59,0.59, 0.11,0.11,0.11, 0,0,0)
			health = 15