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