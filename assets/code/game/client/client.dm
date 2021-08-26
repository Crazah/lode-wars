client
	perspective = EDGE_PERSPECTIVE
	var/
		ui/chat/chatBox = new()

	New()
		var/mobType = pick(typesof(/mob/alien/) - /mob/alien/)
		mob = new mobType()
		..()