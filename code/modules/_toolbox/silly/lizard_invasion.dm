/*
Ashligger hostile mob, spawns with random colors and name.
*/
/mob/living/simple_animal/hostile/ashligger
	name = "Ash Lizard"
	icon = 'icons/mob/human.dmi'
	maxHealth = 100
	health = 100
	melee_damage_lower = 12
	melee_damage_type = "brute"
	melee_damage_upper = 12
	attack_sound = 'sound/weapons/bladeslice.ogg'
	attacktext = "attacks"
	gold_core_spawnable = 1
	var/named = 0 //should it spawn with a normal lizard name?
	var/isred = 0 //Changing this to 1 will encourage the skin color to be more red, otherwise it will try to be green.
	var/skincolor
	var/held_weapon = /obj/item/twohanded/spear
	var/held_weapon_hand_icon = 'icons/mob/inhands/weapons/polearms_lefthand.dmi'
	var/held_weapon_hand_icon_state = "spearglass1"

/mob/living/simple_animal/hostile/ashligger/Initialize()
	. = ..()
	//randomizing skin color
	if(named)
		name = lizard_name(MALE)
	var/thered
	var/thegreen
	if(isred)//degen wanted red as an option
		thered = rand(128,200)
		thegreen = rand(0,100)
	else
		thered = rand(0,100)
		thegreen = rand(128,200)
	if(!skincolor)
		skincolor = rgb(thered,thegreen,rand(50,200))
	skincolor = sanitize_hexcolor(skincolor)
	var/image/I
	//making limbs
	var/list/overlayslist = list()
	var/list/bodyparts = list(
	"lizard_r_arm" = 4.2,
	"lizard_l_arm" = 4.2,
	"lizard_r_hand" = 4.2,
	"lizard_l_hand" = 4.2,
	"lizard_r_leg" = 4.2,
	"lizard_l_leg" = 4.2,
	"lizard_head_m" = 4.1,
	"lizard_chest_m" = 4.0)
	for(var/text in bodyparts)
		I = new()
		I.icon = 'icons/mob/human_parts_greyscale.dmi'
		I.icon_state = text
		I.color = "#[skincolor]"
		I.layer = bodyparts[text]
		overlayslist += I
	//Making lizard parts
	var/list/body_part_states = list("m_body_markings_ltiger_ADJ" = 4.3,
	"m_tail_spikes_FRONT" = 4.5,
	"m_tail_spikes_BEHIND" = 3.9,
	"m_snout_roundlight_FRONT" = 4.5,
	"m_snout_roundlight_ADJ"= 4.3,
	"m_horns_curled_ADJ"= 4.3,
	"m_frills_aqua_ADJ" = 4.3,
	"m_spines_longmeme_ADJ" = 4.3,
	"m_spines_longmeme_BEHIND" = 3.9)
	for(var/state in body_part_states)
		I = new()
		I.icon = 'icons/mob/mutant_bodyparts.dmi'
		I.icon_state = state
		I.color = "#[skincolor]"
		I.layer = 4.3
		overlayslist += I
	//making clothing
	I = new()
	I.icon = 'icons/mob/head.dmi'
	I.icon_state = "gladiator"
	I.layer = 4.4
	overlayslist += I
	I = new()
	I.icon = 'icons/mob/uniform.dmi'
	I.icon_state = "gladiator"
	I.layer = 4.4
	overlayslist += I
	//create weapon icon
	I = new()
	I.icon = held_weapon_hand_icon
	I.icon_state = held_weapon_hand_icon_state
	I.layer = 4.6
	overlayslist += I
	add_overlay(overlayslist)

/mob/living/simple_animal/hostile/ashligger/death()
	. = ..()
	var/mob/living/carbon/human/H = new(loc)
	H.set_species(/datum/species/lizard, icon_update=1)
	H.dna.features["body_markings"] = "Light Tiger Body"
	H.dna.features["tail_lizard"] = "Spikes"
	H.dna.features["snout"] = "Round + Light"
	H.dna.features["horns"] = "Curled"
	H.dna.features["frills"] = "Aquatic"
	H.dna.features["spines"] = "Long + Membrane"
	H.dna.features["mcolor"] = skincolor
	H.name = name
	H.real_name = name
	H.equip_to_slot_or_del(new /obj/item/clothing/under/gladiator/ash_walker (), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/gladiator(), slot_head)
	H.regenerate_icons()
	//drop weapon on death
	new held_weapon(loc)
	H.death()
	qdel(src)

/mob/living/simple_animal/hostile/ashligger/red
	isred = 1

/mob/living/simple_animal/hostile/ashligger/named
	named = 1

/mob/living/simple_animal/hostile/ashligger/named/red
	isred = 1
