proc/
	Generate()
		waterLevel = rand()
		GenerateLevel(waterLevel)

	GenerateLevel(waterLevel = 0.52, deepWaterThreshold = 0.08, bedRockThreshold = 0.7)
		set background = TRUE
		var/
			OpenSimplex2F/noise = new(0)
			scale = rand(4,8)
			global/_id
			id = (_id = new/datum)
			list/turfs = new

		for(var/turf/outdoors/flooring/ground/turf in world)
			turfs += turf
		while(turfs.len)
			var/turf/turf = pick(turfs)
			turfs -= turf
			if(turf.contents.len) continue
			var/x = (turf.x - 1) / (world.maxx - 1) * scale
			var/y = (turf.y - 1) / (world.maxy - 1) * scale
			var/value = (1 + noise.Noise2(x, y)) / 2
			if(value > waterLevel)
				var/obj/outdoors/rocks/wall/wall = new(turf)
				if(value > bedRockThreshold) wall.SetBedrock()
			else
				if(value < waterLevel)
					var/turf/outdoors/dense/water/water = new(locate(turf.x,turf.y,turf.z))
					if(value < deepWaterThreshold) water.SetDeepWater()
			if(world.tick_usage > 90)
				sleep(world.tick_lag)
				if(_id != id)
					return