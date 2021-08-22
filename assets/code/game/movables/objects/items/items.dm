obj/items/
	var/
		value = 1
		weight = 1
	proc/
		PickUp(mob/player, msg = true)
			if(src in player.contents) return
			if(!player.CanHoldItem(src))
				player << "You are too overburdened to carry this."
				return
			player.contents += src
			if(msg) viewers(player) << "[player] picks up [src]"

		Drop(mob/player, msg = true)
			if(!(src in player.contents)) return
			player.contents += src
			if(msg) viewers(player) << "[player] drops [src]"

		AddToPlayerOrDrop(mob/player)
			if(!player.CanHoldItem(src)) src.loc = player.loc
			else player.contents += src

