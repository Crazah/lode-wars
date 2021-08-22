proc/
	GetStep(atom/ref,dir,dist=1)
		var/
			list/tileList = list()
			xaa = ref.x
			yaa = ref.y
		while(dist--)
			switch(dir)
				if(NORTH) yaa += 1
				if(SOUTH) yaa -= 1
				if(EAST) xaa += 1
				if(WEST) xaa -= 1
			var/turf/t = locate(xaa,yaa,ref.z)
			if(t && istype(t)) tileList.Add(t.contents, t)
		return tileList

	num2dir(num)
		switch(num)
			if(1) return "NORTH"
			if(2) return "SOUTH"
			if(8) return "WEST"
			if(4) return "EAST"