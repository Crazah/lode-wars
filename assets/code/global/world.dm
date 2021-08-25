/*
	These are simple defaults for your project.
 */

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default
	turf = /turf/outdoors/flooring/ground
	view = 8		// show up to 6 tiles outward from center (13x13 view)
	New()
		world.log = file("DEBUG/debug.txt")
		..()
		loop()
