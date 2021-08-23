turf/outdoors/dense/
	water
		icon = 'assets/art/turfs/water.dmi'
		PostInit = 1
		var/
			isDeepWater = false

		MapInit()
			InitWater()


		// this is a very rough implementation of swimming, mostly just PoC
		Enter(atom/movable/mover)
			if(ismob(mover))
				var/mob/mob = mover
				if(isDeepWater) mob.Submerge()
			return ..()

		Exit(atom/movable/mover, atom/newLoc)
			if(ismob(mover))
				var/turf/outdoors/dense/water/newSurfaceLoc = newLoc
				if(!istype(newSurfaceLoc) || !newSurfaceLoc.isDeepWater)
					var/mob/mob = mover
					mob.Surface()
			return ..()

		proc/
			InitWater()
				var/image/waves = new('assets/art/turfs/waves.dmi')
				waves.icon_state = GetTileState()
				if(isDeepWater) icon_state = "deep"
				overlays += waves

			SetDeepWater()
				isDeepWater = true

turf/Click()
	..()
	usr.loc = src