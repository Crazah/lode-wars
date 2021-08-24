

obj/screen_objects/
	hasShadow = false
	blend_mode = BLEND_OVERLAY
	backdrop
		icon = 'assets/art/effects/screen.dmi'
		icon_state = "black"
		plane = LIGHTING_PLANE
		layer = BACKGROUND_LAYER+21

		lighting_backdrop
			plane = LIGHTING_PLANE
			icon_state = "white"
			lit
				layer = BACKGROUND_LAYER+21
				color = "black"
			unlit
				layer = BACKGROUND_LAYER+20

	plane_master
		screen_loc = "CENTER"
		appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR
		mouse_opacity = false
		blend_mode = BLEND_OVERLAY
		floor_plane
			plane = FLOOR_PLANE
			render_target = "floor_plane"

		wall_plane
			plane = WALL_PLANE
			render_target = "wall_plane"
			filters=list(filter(type="drop_shadow",x = 0, y = -6, size = 6, color = "#04080FAA"))

		movable_plane
			plane = MOVABLE_PLANE
			render_target = "movable_plane"

		lighting_plane
			plane = LIGHTING_PLANE
			render_target = "lights"
			color = list(null, null, null, "#0000", "#000f")
			blend_mode = BLEND_MULTIPLY
			Backdrop(client/C)

				overlays += new/obj/screen_objects/backdrop/lighting_backdrop/lit
				overlays += new/obj/screen_objects/backdrop/lighting_backdrop/unlit
				UpdateView(C)

		New(client/C)
			C.screen += src
			Backdrop(C)

		proc/Backdrop(client/C)

		proc/UpdateView(client/C)
			var/vx,vy
			var/obj/screen_objects/backdrop/O = new
			var/list/L = overlays.Copy()
			O.appearance = L[1]
			if(isnum(C.view)) vx = vy = (2*C.view) + 2
			else
				L = splittext(C.view, "x")
				vx = L[1] + 1
				vy = L[2] + 1
			O.transform = matrix(vx, 0, 0, 0, vy, 0)
			overlays = list(O)