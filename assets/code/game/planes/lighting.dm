image/see_dark_light
	plane = LIGHTING_PLANE
	color = "#559f"
	appearance_flags = RESET_ALPHA | KEEP_APART | RESET_COLOR
	blend_mode = BLEND_ADD
	icon = 'assets/art/effects/lighting.dmi'
	mouse_opacity = 0
	var/size
	proc/SetSize(lightSize)
		if(size == lightSize) return
		size = lightSize
		var/matrix/m = matrix()
		m.Scale(lightSize)
		animate(src, transform = m, time = 4)

mob/proc/
	InitPlanes()
		if(!client) return
		new/obj/screen_objects/plane_master/wall_plane(client)
		new/obj/screen_objects/plane_master/floor_plane(client)
		new/obj/screen_objects/plane_master/movable_plane(client)
		new/obj/screen_objects/plane_master/lighting_plane(client)
		new/obj/screen_objects/plane_master/ui_plane(client)

	AddSeeInDarkLight()
		if(!darklight)
			darklight = new(loc=src)
			darklight.SetSize(5)
		src << darklight