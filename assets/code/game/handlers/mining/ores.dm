ore
	parent_type = /obj
	appearance_flags = PIXEL_SCALE
	var/
		value
		amount
		itemPath
	proc/
		GetTotalValue()
			return round(value * amount)

		RetrieveOre(turf/tile)
			var/obj/items/ores/item = new itemPath()
			item.value = GetTotalValue()
			item.icon_state = GetIconState()
			item.loc = tile

		GetIconState()
			switch(amount)
				if(POOR_AMOUNT) return "poor"
				if(MEDIUM_AMOUNT) return "medium"
				if(RICH_AMOUNT) return "rich"

		EffectAnimation()
			..()


	New(amount)
		src.amount = amount
		icon_state = GetIconState()
		..()
		EffectAnimation()

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

		//ahhh radioactive!
		EffectAnimation()
			..()
			filters = list(filter(type="bloom",threshold=rgb(254,254,254),size = 2, offset = 1))
			animate(filters[1],size = 3, offset = 2,time = 10, loop = -1)
			animate(size = 2, offset = 1,time = 10)
	necite
		icon = 'assets/art/turfs/ore_necite.dmi'
		value = 6
		itemPath = /obj/items/ores/necite
	petrite
		icon = 'assets/art/turfs/ore_petrite.dmi'
		value = 7
		itemPath = /obj/items/ores/petrite