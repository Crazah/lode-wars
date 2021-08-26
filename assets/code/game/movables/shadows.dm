shadow
	parent_type = /obj
	appearance_flags = PIXEL_SCALE | KEEP_TOGETHER | RESET_COLOR | TILE_BOUND | RESET_TRANSFORM
	vis_flags = VIS_UNDERLAY | VIS_INHERIT_ICON_STATE | VIS_INHERIT_ID | VIS_INHERIT_DIR | VIS_INHERIT_LAYER
	plane = SHADOWS_PLANE
	mouse_opacity = 0
	density = 0
	color = "black"

atom/movable/
	MapInit()
		..()
		GenerateShadow()

	proc/
		GenerateShadow()
			if(!hasShadow) return
			var/icon/I = new/icon(icon)
			var/matrix/originalMatrix = matrix(1,0,0,0,-1,0)
			shadow = new()
			shadow.appearance = src.appearance
			shadow.alpha = 50
			shadow.icon = I
			shadow.maptext = initial(shadow.maptext)
			shadow.render_source = initial(shadow.render_source)
			shadow.color = initial(shadow.color)
			shadow.layer = FLOAT_LAYER-2
			shadow.mouse_opacity = initial(shadow.mouse_opacity)
			shadow.appearance_flags = initial(shadow.appearance_flags)
			shadow.vis_flags = initial(shadow.vis_flags)

			if(!shadowOffsetY) shadowOffsetY = initial(shadowOffsetY) + initial(pixel_y)
			if(!shadowOffsetX) shadowOffsetX = initial(shadowOffsetX) + initial(pixel_y)

			var/newHeightOffset = -I.Height()/1.2
			var/newWidthOffset = 0

			shadow.pixel_x = newWidthOffset + shadowOffsetX
			shadow.pixel_y = newHeightOffset + shadowOffsetY
			shadow.transform = originalMatrix

			vis_contents += shadow