ui
	parent_type = /obj
	icon = 'assets/art/ui/hud2.dmi'
	plane = UI_BACKDROP_PLANE
	layer = EFFECTS_LAYER
	mouse_opacity = false
	New()
		..()
		SetScreenPosition()

	var/
		screenX = 0
		screenY = 0
	proc/
		SetScreenPosition()
			transform = matrix(screenX, screenY, MATRIX_TRANSLATE)

//TO-DO: make this better
client/New()
	..()

	screen += chatBox

	//this is a super rough way to mock up the backsplash
	for(var/x = 0, x <= 12, x++)
		for(var/y = 0, y <= 12, y++)
			var/ui/component = new()
			component.icon_state = "[x],[y]"
			component.screen_loc = "[x+1],[y+3]:-2"
			screen += component