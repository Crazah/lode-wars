obj/outdoors/structures/bases/doors
	density = 1
	appearance_flags = PIXEL_SCALE
	plane = WALL_PLANE
	Cross(atom/movable/mover)
		if(ismob(mover))
			Open()
		return ..()

	Uncross(atom/movable/mover)
		if(ismob(mover))
			Close()
		return ..()

	proc/
		Open()
			animate(src,transform = matrix(1,0,0,0,0,16), time = 2)
			density = 0

		Close()
			animate(src, transform = matrix(), time = 2)
			density = 1

	door
		icon_state = "door"
		hasShadow = true