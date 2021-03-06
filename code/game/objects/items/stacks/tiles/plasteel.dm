/obj/item/stack/tile/plasteel
	name = "floor tile"
	singular_name = "floor tile"
	desc = "Those could not work as a pretty decent throwing weapon."
	icon_state = "tile"
	w_class = 3.0
	force = 6.0
	m_amt = 937.5
	throwforce = 5.0
	throw_speed = 5
	throw_range = 3
	flags = CONDUCT
	max_amount = 60

/obj/item/stack/tile/plasteel/New()
	..()
	src.pixel_x = rand(1, 14)
	src.pixel_y = rand(1, 14)

/*
/obj/item/stack/tile/plasteel/attack_self(mob/user)
	if (usr.stat)
		return
	var/T = user.loc
	if (!( istype(T, /turf) ))
		to_chat(user, "\red You must be on the ground!")
		return
	if (!( istype(T, /turf/space) ))
		to_chat(user, "\red You cannot build on or repair this turf!")
		return
	src.build(T)
	src.add_fingerprint(user)
	use(1)
	return
*/

/obj/item/stack/tile/plasteel/proc/build(turf/S)
	if (istype(S,/turf/space))
		S.ChangeTurf(/turf/simulated/floor/plating/airless)
	else
		S.ChangeTurf(/turf/simulated/floor/plating)
//	var/turf/simulated/floor/W = S.ReplaceWithFloor()
//	W.make_plating()
	return
