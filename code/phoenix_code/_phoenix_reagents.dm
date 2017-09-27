/datum/reagent/cum
	name = "Cum"
	id = "cum"
	description = "Sperm from some animal. Useless for anything but insemination, really."
	reagent_state = LIQUID
	color = "#FFFFFF"
	nutriment_factor = 0.5 * REAGENTS_METABOLISM
	data = list("donor"=null,"viruses"=null,"donor_DNA"=null,"blood_type"=null,"resistances"=null,"trace_chem"=null,"mind"=null,"ckey"=null,"gender"=null,"real_name"=null)
/*
		var/name = "Reagent"
		var/id = "reagent"
		var/description = ""
		var/datum/reagents/holder = null
		var/reagent_state = SOLID
		var/list/data = null
		var/volume = 0
		var/nutriment_factor = 0
		var/custom_metabolism = REAGENTS_METABOLISM
		var/overdose = 0
		var/overdose_dam = 1
		//var/list/viruses = list()
		var/color = "#000000" // rgb: 0, 0, 0 (does not support alpha channels - yet!)
*/
/datum/reagent/cum/reaction_turf(turf/T, reac_volume)
	if(!istype(T))
		return
	if(reac_volume < 3)
		return
	var/obj/effect/decal/cleanable/cum/S = locate() in T
	if(!S)
		S = new(T)
	S.reagents.add_reagent("cum", reac_volume)
	if(data["blood_DNA"])
		S.blood_DNA[data["blood_DNA"]] = data["blood_type"]

//CUM >> CLEANABLE.
/obj/effect/decal/cleanable/cum
	name = "cum"
	desc = "It's pie cream from a cream pie. Or not..."
	density = 0
	layer = 2
	icon = 'code/phoenix_code/cum.dmi'
	blood_DNA = list()
	anchored = 1
	random_icon_states = list("cum1", "cum2", "cum3", "cum4")
/obj/effect/decal/cleanable/cum/New()
	..()
	dir = pick(1,2,4,8)
/datum/reagent/cum/reaction_turf(turf/T, reac_volume)
	if(istype(T, /turf/simulated))
		var/obj/effect/decal/cleanable/reagentdecal = new/obj/effect/decal/cleanable/cum(T)
		reagentdecal.reagents.add_reagent("cum", reac_volume)

/obj/effect/decal/cleanable/femcum
	name = "female ejaculate"
	desc = "It's.. a water? Oh.."
	density = 0
	layer = 2
	icon = 'code/phoenix_code/cum.dmi'
	blood_DNA = list()
	anchored = 1
	random_icon_states = list("femcum1", "femcum2", "femcum3", "femcum4")

/obj/effect/decal/cleanable/femcum/New()
	..()
	dir = pick(1,2,4,8)