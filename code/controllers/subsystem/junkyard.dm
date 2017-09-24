//Used for all kinds of weather, ex. lavaland ash storms.
var/datum/subsystem/junkyard/SSjunkyard

/datum/subsystem/junkyard
	name = "Junkyard"
	flags = SS_NO_FIRE
	var/list/junk = list()
	var/junkyard_initialised = 0

/datum/subsystem/junkyard/Initialize(timeofday)
	..()

	NEW_SS_GLOBAL(SSjunkyard)

/datum/subsystem/junkyard/proc/populate_junkyard()
	var/list/turfs_to_init = block(locate(1, 1, 1), locate(world.maxx, world.maxy, world.maxz))
	for(var/thing in turfs_to_init)
		var/turf/T = thing
		if(istype(T, /turf/simulated/mineral/airfull/junkyard))
			T.surround_by_scrap()
		if(istype(T, /turf/simulated/floor/plating/ironsand/junkyard))
			T.surround_by_scrap()
		CHECK_TICK
	junkyard_initialised = 1