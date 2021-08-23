proc/Generate(OpenSimplex2F/noise = new(0), offset_x = 0, offset_y = 0)
	set background = TRUE
	var/scale = generator("num", 5, 8).Rand()
	var/global/_id
	var/id = (_id = new/datum)
	var/list/turfs = new
	for(var/turf/outdoors/flooring/ground/turf in world)
		turfs += turf
	while(turfs.len)
		var/turf/turf = pick(turfs)
		turfs -= turf
		if(turf.contents.len) continue
		var/x = (turf.x - 1 + offset_x) / (world.maxx - 1) * scale
		var/y = (turf.y - 1 + offset_y) / (world.maxy - 1) * scale
		var/value = (1 + noise.Noise2(x, y)) / 2
		if(value > 0.2)
			var/obj/outdoors/rocks/wall/wall = new(turf)
			if(value > 0.7) wall.SetBedrock()
		else
			if(value < 0.15)
				var/turf/outdoors/dense/water/water = new(locate(turf.x,turf.y,turf.z))
				if(value < 0.08) water.SetDeepWater()
		if(world.tick_usage > 90)
			sleep(world.tick_lag)
			if(_id != id)
				return