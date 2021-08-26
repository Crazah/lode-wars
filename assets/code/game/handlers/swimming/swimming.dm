/*
* Very rough implemention, can be expanded later.
*/
mob/alien/proc/
	Submerge()
		if(isSwimming) return
		isSwimming = true
		icon_state = "swim"
	Surface()
		if(!isSwimming) return
		isSwimming = false
		icon_state = ""

	CanSwim()
		if(istype(src,/mob/alien/mobbel/)) return 1
		return 0