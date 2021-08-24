/mob/Login()
	GenerateShadow()
	loc = FindSpawner()
	InitPlanes()
	AddSeeInDarkLight()

mob/proc/FindSpawner()
	for(var/obj/outdoors/structures/bases/respawner/tile in world)
		return tile.loc