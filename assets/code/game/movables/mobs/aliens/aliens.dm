#define MOVE_DELAY (max(6 - (speed/3),1.8))

mob/alien/
	var/

		isMining = false
		maxWeight = 30
		isSwimming = false


		strength = 0
		attack = 0
		speed = 0
		dexterity = 0
		intelligence = 0
		aim = 0
		defense = 0
		digging = 0

	proc/
		CanHoldItem(obj/items/item)
			if(GetCurrentWeight() + item.weight > maxWeight) return false
			return true

		GetCurrentWeight()
			var/weight = 0
			for(var/obj/items/item in contents)
				weight += item.weight
			return weight


	Move(atom/newLoc)
		if(isMining) return 0
		if(nextMove > world.time) return 0
		glide_size = TILE_WIDTH / max(MOVE_DELAY,TICK_LAG) * TICK_LAG
		. = ..()
		if(.) nextMove = world.time + MOVE_DELAY