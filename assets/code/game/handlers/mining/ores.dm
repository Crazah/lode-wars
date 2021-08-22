ore
	parent_type = /obj
	var/
		value
		amount
		itemPath
	proc/
		GetTotalValue()
			return round(value * amount)

		RetrieveOre(mob/player)
			var/obj/items/ores/item = new itemPath()
			item.value = GetTotalValue()
			item.icon_state = GetIconState()
			item.AddToPlayerOrDrop(player)

		GetIconState()
			switch(amount)
				if(POOR_AMOUNT) return "poor"
				if(MEDIUM_AMOUNT) return "medium"
				if(RICH_AMOUNT) return "rich"


	New(amount)
		src.amount = amount
		icon_state = GetIconState()
		..()

	asbylite
		icon = 'assets/art/turfs/ore_asbylite.dmi'
		value = 1
		itemPath = /obj/items/ores/asbylite
	draxilite
		icon = 'assets/art/turfs/ore_draxilite.dmi'
		value = 2
		itemPath = /obj/items/ores/draxilite
	grezlorite
		icon = 'assets/art/turfs/ore_grezlorite.dmi'
		value = 3
		itemPath = /obj/items/ores/grezlorite
	hezerite
		icon = 'assets/art/turfs/ore_hezerite.dmi'
		value = 4
		itemPath = /obj/items/ores/hezerite
	kaburite
		icon = 'assets/art/turfs/ore_kaburite.dmi'
		value = 5
		itemPath = /obj/items/ores/kaburite
	necite
		icon = 'assets/art/turfs/ore_necite.dmi'
		value = 6
		itemPath = /obj/items/ores/necite
	petrite
		icon = 'assets/art/turfs/ore_petrite.dmi'
		value = 7
		itemPath = /obj/items/ores/petrite