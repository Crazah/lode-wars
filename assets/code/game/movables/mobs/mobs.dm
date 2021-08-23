mob
	icon = 'assets/art/mobs/jezzer.dmi'
	shadowOffsetY = 19
	var/
		isMining = false
		maxWeight = 30
		isSwimming = false
		list/keyDown = list()
		movingDir = null
	proc/
		CanHoldItem(obj/items/item)
			if(GetCurrentWeight() + item.weight > maxWeight) return false
			return true

		GetCurrentWeight()
			var/weight = 0
			for(var/obj/items/item in contents)
				weight += item.weight
			return weight

	//TODO: replace with HUD
	Stat()
		statpanel("inventory",src.contents)