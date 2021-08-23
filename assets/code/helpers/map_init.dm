/*
 Snippet by Ter13, link: http://www.byond.com/forum/post/2080183
*/

world
	New()
		..()
		Generate()
		MapInitialized()
var
	list/InitList = list()
	MapInitialized = 0

proc
	MapInitialized()
		if(!MapInitialized)
			MapInitialized = 1
			for(var/atom/o in InitList)
				o.MapInit()
			InitList = null

atom
	var/PostInit = 0 //set to 1 if you need to do post-initialization stuff.
	New()
		if(MapInitialized)
			PostInit&&MapInit()
		else if(PostInit)
			InitList[src] = 1
		..() //don't supercall unless you have other /atom/New() functions

	proc
		MapInit()
            //do map initialization stuff here