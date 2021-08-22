shadow
	parent_type = /obj
	appearance_flags = PIXEL_SCALE | KEEP_APART | RESET_COLOR
	vis_flags = VIS_UNDERLAY | VIS_INHERIT_ICON_STATE | VIS_INHERIT_ID
	plane = SHADOWS_PLANE
	mouse_opacity = 0
	density = 0
	color = "black"

atom/movable/
	New()
		..()
		GenerateShadow()

	proc/
		GenerateShadow()

			var/icon/I = new/icon(icon,icon_state)
			var/matrix/originalMatrix = matrix(-1,0,0,0,1,0)
			shadow.appearance = src?.appearance
			shadow.icon = I
			shadow.maptext = null
			shadow.render_source = null
			shadow.color = "black"
			shadow.plane = SHADOWS_PLANE
			shadow.layer = FLOAT_LAYER-1

			shadow.appearance_flags = PIXEL_SCALE | KEEP_TOGETHER | RESET_COLOR | TILE_BOUND
			shadow.vis_flags = VIS_UNDERLAY | VIS_INHERIT_ICON_STATE | VIS_INHERIT_ID | VIS_INHERIT_DIR | VIS_INHERIT_LAYER

			if(!shadowOffsetY) shadowOffsetY = initial(shadowOffsetY) + initial(pixel_y)
			if(!shadowOffsetX) shadowOffsetX = initial(shadowOffsetX) + initial(pixel_y)
			var/matrix/newMatrix = turn(originalMatrix, 180)
			var/newHeightOffset = -I.Height()/1.2
			var/newWidthOffset = 0
			shadow.pixel_x = newWidthOffset + shadowOffsetX
			shadow.pixel_y = newHeightOffset + shadowOffsetY
			shadow.transform = newMatrix
			vis_contents += shadow