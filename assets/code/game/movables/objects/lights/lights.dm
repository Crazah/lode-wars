
obj/lights/
	icon = 'assets/art/effects/screen.dmi'
	icon_state = "light"
	mouse_opacity = 0
	appearance_flags = RESET_ALPHA | KEEP_APART | RESET_COLOR
	plane = LIGHTING_PLANE
	var/
		lightType = /light/
		light/light
	proc/
		AddLights()
			AddLight(lightType)
			..()
		AddLight(lightType)
			vis_contents += new lightType (loc)


	small_light
		lightType = /light/small

	ambient_light
		lightType = /light/ambient

	white_light
		lightType = /light/white_light/

	mining_light
		lightType = /light/mining_light/

	respawner_light
		lightType = /light/respawner_light

	New()
		..()
		AddLights()

light
	parent_type = /obj
	icon = 'assets/art/effects/lighting.dmi'
	plane = LIGHTING_PLANE
	color = "#333f"
	mouse_opacity = 0
	alpha = 45
	blend_mode = BLEND_ADD

	var/
		size = 6
		initialSize
		secondSize

	proc/SetupLight()
		transform = initialSize = matrix(size, size, MATRIX_SCALE)
		..()

	New()
		..()
		SetupLight()

	small
		size =3.2
		color = "#777f"
		alpha = 100

	ambient
		size = 5
		color = "#001f"
		alpha = 200

	white_light
		size = 3.6
		color = "#666f"
		alpha = 255

	mining_light
		size = 8
		color = "#666f"
		alpha = 255

	respawner_light
		plane = LIGHTING_PLANE
		color = LIGHTING_MACHINE_GLOW

		size = 15
		SetupLight()
			..()
			secondSize = matrix(size-1, size-1, MATRIX_SCALE)

			animate(src, transform = secondSize, time = 15, loop = -1)
			animate(transform = initialSize, time = 15, loop = -1)
