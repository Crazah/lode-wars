
mob/verb/Say(t as text)
	Message(world, "[src]: [t]")


proc/Message(mob/hearer, msg)
	if(ismob(hearer))
		if(!hearer.client) return
		hearer.client.chatBox?.OutputMessage(msg)
	else
		for(var/mob/player in hearer)
			if(!player.client) continue
			player.client?.chatBox.OutputMessage(msg)