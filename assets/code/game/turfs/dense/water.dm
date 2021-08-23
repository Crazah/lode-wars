turf/outdoors/dense/
	water
		icon = 'assets/art/turfs/water.dmi'
		density = 1
		PostInit = 1
		MapInit()
			AddWaves()

		proc/AddWaves()
			var/image/waves = new(icon)
			waves.icon_state = GetTileState()
			overlays += waves