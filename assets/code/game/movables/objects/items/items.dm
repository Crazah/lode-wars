obj/items/
	var/
		value = 1
		weight = 1
	proc/
		PickUp(mob/alien/player, msg = true)
			if(src in player.contents) return
			if(get_dist(player,src)>1) return
			if(!player.CanHoldItem(src))
				Message(player,"You are too overburdened to carry this.")
				return
			src.loc = player
			if(msg) Message(viewers(player),"[player] picks up [src]")

		Drop(mob/player, msg = true)
			if(!(src in player.contents)) return
			src.loc = player.loc
			if(msg) Message(viewers(player),"[player] drops [src]")

		AddToPlayerOrDrop(mob/alien/player)
			if(!player.CanHoldItem(src)) src.loc = player.loc
			else player.contents += src
	Click()
		..()
		PickUp(usr, false)
