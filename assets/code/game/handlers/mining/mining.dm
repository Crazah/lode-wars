obj/outdoors/rocks
	wall
		var/
			durability = 1
			ore/ore
			initialColor

		Cross(atom/movable/bumper)
			if(istype(bumper,/mob/alien/))
				. = ..()
				if(!.) Mine(bumper, 1)
			else ..()
		MapInit()
			..()
			spawn(5) AddOre()

		proc/
			AddOre()
				ore = GetOre()

			HideOre()
				vis_contents -= ore

			ShowOre()
				vis_contents += ore


			GetOre()
				var/oreType = pick(ASBYLITE_PROB;/ore/asbylite, DRAXILITE_PROB;/ore/draxilite, GREZLORITE_PROB;/ore/grezlorite,\
									HEZERITE_PROB;/ore/hezerite, KABURITE_PROB;/ore/kaburite, NECITE_PROB;/ore/necite, PETRITE_PROB;/ore/petrite, EMPTY_PROB;null)
				if(!oreType) return
				var/amount = pick(POOR_PROB;POOR_AMOUNT, MEDIUM_PROB;MEDIUM_AMOUNT, RICH_PROB;RICH_AMOUNT)
				return new oreType (amount)

			Mine(mob/alien/player, damage)
				set waitfor = 0
				if(player.isMining) return
				player.isMining = true
				player.icon_state = "action"
				MiningAnimation()
				sleep((50 - player.digging) * durability)
				player.icon_state = ""
				Destroy(player)
				player.isMining = false

			MiningAnimation()

				animate(src, transform = matrix(1.1,0,-0.5,0,1,0), color = gradient(initialColor, "#ddd", 0.2), time = 2, loop = -1)
				animate(transform = matrix(), color = initialColor, time = 2)

			CrumbleAnimation()
				flick("crumble",src)
				sleep(3)

			UpdateSurroundingTiles(turf/tile)
				for(var/obj/outdoors/rocks/wall/wall in range(1,tile))
					wall.UpdateState(src)

			Destroy(mob/miner)
				CrumbleAnimation()
				if(ore) ore.RetrieveOre(src.loc)
				UpdateSurroundingTiles(src.loc)
				src.loc = null
