turf/outdoors/dense/
	water
		icon = 'assets/art/turfs/water.dmi'
		PostInit = 1
		autoTileTypes = list(/turf/outdoors/dense/water)
		var/
			isDeepWater = false

		MapInit()
			InitWater()
			new/obj/lights/ambient_light(src)


		// this is a very rough implementation of swimming, mostly just PoC
		Enter(atom/movable/mover)
			if(istype(mover,/mob/alien/))
				var/mob/alien/mob = mover
				if(mob.CanSwim()) mob.Submerge()
				else return 0
			return ..()

		Exit(atom/movable/mover, atom/newLoc)
			if(istype(mover,/mob/alien/))
				var/turf/outdoors/dense/water/newSurfaceLoc = newLoc
				if(!istype(newSurfaceLoc))
					var/mob/alien/mob = mover
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