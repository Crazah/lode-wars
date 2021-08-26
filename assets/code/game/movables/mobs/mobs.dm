mob/
	shadowOffsetY = 19
	hasShadow = true
	var/
		list/keyDown = list()
		obj/light/light
		image/see_dark_light/darklight
		movingDir = null

	//TODO: replace with HUD
	Stat()
		statpanel("Backpack",src.contents)