proc/Generate(OpenSimplex2F/noise = new(0), offset_x = 0, offset_y = 0, scale = 1)
	set background = TRUE
	scale = rand(1,20)
	var/global/_id
	var/id = (_id = new/datum)
	var/list/turfs = new
	for(var/turf/outdoors/flooring/ground/turf in world)
		turfs += turf
	while(turfs.len)
		var/turf/turf = pick(turfs)
		turfs -= turf
		var/x = (turf.x - 1 + offset_x) / (world.maxx - 1) * scale
		var/y = (turf.y - 1 + offset_y) / (world.maxy - 1) * scale
		var/value = (1 + noise.Noise2(x, y)) / 2
		if(value > 0.35)
			if(!turf.contents.len) new/obj/outdoors/rocks/wall(turf)
		else if(value < 0.2) new/turf/outdoors/dense/water(locate(turf.x,turf.y,turf.z))
		if(world.tick_usage > 90)
			sleep(world.tick_lag)
			if(_id != id)
				return