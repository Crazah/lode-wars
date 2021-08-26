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