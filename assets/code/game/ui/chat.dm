#define MAX_MSG 30

ui/chat
	screen_loc = "CENTER"
	screenX = 25
	screenY = -130
	maptext_width = 170
	maptext_height = 150
	plane = UI_FOREGROUND_PLANE
	filters = list(filter(type="outline",size=1,color="#1a1a1e"),filter(type="drop_shadow",x=0,y=-1,size=0,color="#1a1a1e"))
	var/
		start = "<span class='chat'>"
		end = "</span>"
		list/messages = list()
		maxLines = 5
	proc/
		UpdateMessages()
			maptext = "[start][ListToString(messages,"\n")][end]"

		OutputMessage(msg)
			if(length(msg) > MAX_MSG)
				while(length(msg) > MAX_MSG)
					OutputMessage(copytext(msg, 1, MAX_MSG+1))
					msg = copytext(msg, MAX_MSG+1)

			if(messages.len >= maxLines)
				for(var/idx = 1, idx < maxLines, idx++)
					messages[idx] = messages[idx+1]
				messages[maxLines] = msg
			else
				messages += msg

			UpdateMessages()
	New()
		..()
		UpdateMessages()

