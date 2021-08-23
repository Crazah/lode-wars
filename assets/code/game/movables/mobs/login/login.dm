/mob/Login()
	GenerateShadow()
	loc = FindBlankTile()


mob/proc/FindBlankTile()
	for(var/obj/outdoors/structures/bases/respawner/tile in world)
		return tile.loc