/mob/Login()
	name = src.key
	GenerateShadow()
	loc = FindSpawner()
	InitPlanes()
	AddSeeInDarkLight()
	Message(world, "[src] logged in.")
	Message(src, "Water: [num2text(waterLevel*100,2)]%.")

mob/proc/FindSpawner()
	for(var/obj/outdoors/structures/bases/respawner/tile in world)
		return tile.loc