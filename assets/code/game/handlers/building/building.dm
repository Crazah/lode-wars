turf/outdoors/
	Click()
		..()
		if(CanBuild(usr))
			BuildLamp(usr)

	proc/
		CanBuild(mob/player)
			return !density && !src.contents.len && get_dist(src,player)<=1

		BuildLamp(mob/player)
			set waitfor = 0
			player.dir = get_dir(player,src)
			flick("action",player)
			sleep(5)
			new/obj/outdoors/structures/bases/lamp/mining_lamp(src)