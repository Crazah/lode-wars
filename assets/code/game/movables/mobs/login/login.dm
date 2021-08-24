/mob/Login()
	GenerateShadow()
	loc = FindSpawner()
	InitPlanes()
	AddSeeInDarkLight()
	Message(world, "[src] logged in.")

mob/proc/FindSpawner()
	for(var/obj/outdoors/structures/bases/respawner/tile in world)
		return tile.loc