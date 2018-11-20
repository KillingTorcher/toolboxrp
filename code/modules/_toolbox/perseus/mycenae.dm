/* closets*/

//enforcer closet
/obj/structure/closet/secure_closet/enforcer
	name = "Perseus Enforcer Equipment"
	req_access = list(ACCESS_PERSEUS_ENFORCER)
	icon = 'icons/oldschool/perseus.dmi'
	icon_state = "enforcer"
	PopulateContents()
		..()
		new /obj/item/clothing/shoes/combat(src)
		new /obj/item/clothing/suit/armor/lightarmor(src)
		new /obj/item/clothing/head/helmet/space/pershelmet(src)
		new /obj/item/clothing/mask/gas/perseus_voice(src)
		new /obj/item/device/radio/headset/perseus(src)
		new /obj/item/clothing/glasses/sunglasses(src)
		new	/obj/item/storage/box/flashbangs(src)
		new /obj/item/device/assembly/flash/handheld(src)
		new /obj/item/restraints/handcuffs(src)
		new /obj/item/tank/perseus(src)
		new /obj/item/clothing/gloves/specops(src)
		new /obj/item/shield/riot/perc(src)
		new /obj/item/storage/belt/security/perseus(src)
		new /obj/item/gun/energy/ep90(src)
		new /obj/item/stun_knife(src)
		new /obj/item/stock_parts/cell/magazine/ep90(src)

//commander closet
/obj/structure/closet/secure_closet/commander
	name = "Perseus Commander Equipment"
	req_access = list(ACCESS_PERSEUS_COMMANDER)
	icon = 'icons/oldschool/perseus.dmi'
	icon_state = "commander"
	PopulateContents()
		..()
		new /obj/item/clothing/under/perseus_fatigues(src)
		new /obj/item/clothing/suit/wintercoat/perseus(src)
		new /obj/item/reagent_containers/food/drinks/bottle/whiskey(src)
		new /obj/item/clothing/head/helmet/space/persberet(src)
		new /obj/item/clothing/shoes/combat(src)
		new /obj/item/clothing/under/space/skinsuit(src)
		new /obj/item/clothing/suit/armor/lightarmor(src)
		new /obj/item/clothing/mask/gas/perseus_voice(src)
		new /obj/item/clothing/glasses/sunglasses(src)
		new /obj/item/device/radio/headset/perseus(src)
		new /obj/item/ammo_box/magazine/fiveseven(src)
		new /obj/item/storage/box/flashbangs(src)
		//new /obj/item/device/portableteledisruptor/secondary(src)
		new /obj/item/device/assembly/flash/handheld(src)
		new /obj/item/restraints/handcuffs(src)
		new /obj/item/shield/riot/perc(src)
		new /obj/item/clothing/gloves/specops(src)
		new /obj/item/storage/belt/security/perseus(src)
		new /obj/item/gun/energy/ep90(src)
		new /obj/item/gun/ballistic/fiveseven(src)
		new /obj/item/stun_knife(src)

//mixed locker
/obj/structure/closet/perseus/mixed
	name = "Mixed Closet"

	PopulateContents()
		..()
		new /obj/item/clothing/suit/blackjacket(src)
		new /obj/item/clothing/suit/blackjacket(src)
		new /obj/item/clothing/suit/blackjacket(src)
		new /obj/item/clothing/suit/blackjacket(src)
		new /obj/item/clothing/suit/blackjacket(src)
		new /obj/item/clothing/suit/blackjacket(src)
		new /obj/item/clothing/suit/wintercoat/perseus(src)
		new /obj/item/clothing/suit/wintercoat/perseus(src)
		new /obj/item/clothing/suit/wintercoat/perseus(src)
		new /obj/item/clothing/suit/wintercoat/perseus(src)
		new /obj/item/clothing/suit/wintercoat/perseus(src)
		new /obj/item/clothing/suit/wintercoat/perseus(src)
		new /obj/item/storage/backpack/blackpack(src)
		new /obj/item/storage/backpack/blackpack(src)
		new /obj/item/storage/backpack/blackpack(src)
		new /obj/item/storage/backpack/blackpack(src)
		new /obj/item/storage/backpack/blackpack(src)
		//new /obj/item/storage/backpack/blacksatchel(src)
		//new /obj/item/storage/backpack/blacksatchel(src)
		new /obj/item/clothing/under/perseus_uniform(src)
		new /obj/item/clothing/under/perseus_uniform(src)
		new /obj/item/clothing/under/perseus_uniform(src)
		new /obj/item/clothing/under/perseus_uniform(src)
		new /obj/item/clothing/under/perseus_uniform(src)
		new /obj/item/clothing/under/perseus_uniform(src)
		//new /obj/item/weapon/storage/lockbox/perseusids(src)

/obj/structure/closet/secure_closet/perseus_medical_wall
	name = "PercTech Medical Closet"
	req_access = list(ACCESS_PERSEUS_ENFORCER)
	icon = 'icons/oldschool/perseus.dmi'
	icon_state = "medical_wall"
	wall_mounted = 1

	PopulateContents()
		new /obj/item/storage/firstaid/o2(src)
		new /obj/item/storage/firstaid/toxin(src)
		new /obj/item/storage/firstaid/brute(src)
		new /obj/item/storage/firstaid/fire(src)
		new /obj/item/storage/firstaid/regular(src)
		new /obj/item/clothing/suit/straight_jacket(src)
		new /obj/item/clothing/suit/straight_jacket(src)
		new /obj/item/clothing/suit/straight_jacket(src)
		new /obj/item/clothing/mask/muzzle(src)
		new /obj/item/circular_saw(src)
		new /obj/item/retractor(src)
		new /obj/item/cautery(src)
		new /obj/item/hemostat(src)
		new /obj/item/scalpel(src)
		new /obj/item/surgical_drapes(src)
		new /obj/item/storage/firstaid/perseus(src)
		new /obj/item/gun/syringe(src)
		new /obj/item/gun/medbeam/perseus(src)

/obj/structure/closet/secure_closet/perseus_medical_wall/update_icon()//didnt want to modify another unnecessary file to make this work -falaskian
	cut_overlays()
	if(!opened)
		layer = OBJ_LAYER
		if(icon_door)
			add_overlay("[icon_door]_door")
		else
			add_overlay("[icon_state]_door")
		if(welded)
			add_overlay("welded")
		if(secure && !broken)
			 //this locker has its own unique lights which is the purpose of overriding this proc -falaskian
			if(locked)
				add_overlay("[initial(icon_state)]_locked")
			else
				add_overlay("[initial(icon_state)]_unlocked")

	else
		layer = BELOW_OBJ_LAYER
		if(icon_door_override)
			add_overlay("[icon_door]_open")
		else
			add_overlay("[icon_state]_open")

/obj/machinery/telecomms/relay/preset/perseus
	id = "Perseus Relay"
	autolinkers = list("relay")
	LateInitialize()
		. = ..()
		for(var/obj/machinery/telecomms/T in links)
			if(T == src)
				continue
			if(!(src in T.links))
				T.add_link(src)

/area/shuttle/perseus_mycenae
	name = "Perseus Ship: The Mycenae III"

/datum/map_template/ruin/space/mycenae
	name = "Perseus Ship: The Mycenae III"
	id = "mycenae"
	description = "Perseus staging ship"
	unpickable = TRUE
	always_place = FALSE
	placement_weight = 1
	cost = 0
	allow_duplicates = FALSE
	prefix = "_maps/toolbox/Mycenae3.dmm"

/var/global/Mycenae_In_Space = 0
/proc/Create_Mycenae()
	if(Mycenae_In_Space)
		return 1
	var/list/z_levels = SSmapping.levels_by_trait(ZTRAIT_SPACE_RUINS)
	var/datum/map_template/ruin/S = SSmapping.space_ruins_templates["Perseus Ship: The Mycenae III"]
	if(S && z_levels && z_levels.len)
		for(var/i=50,i>0,i--)
			if(S.try_to_place(pick(z_levels),/area/space))
				Mycenae_In_Space = 1
				return 1
	return 0

/*
**Prison Shuttle
*/

/datum/map_template/shuttle/perseus
	port_id = "perseus_transfer"
	can_be_bought = FALSE
	suffix = "basic"

/area/shuttle/perseus_transfer
	name = "Prison Transfer Shuttle"
	blob_allowed = FALSE

/obj/item/circuitboard/computer/perseus_shuttle
	name = "Prison Shuttle (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/perseus_shuttle

/obj/machinery/computer/shuttle/perseus_shuttle
	name = "prison shuttle console"
	desc = "Used to call and send the prison ship shuttle."
	circuit = /obj/item/circuitboard/computer/perseus_shuttle
	shuttleId = "perseus_transfer"
	possible_destinations = "perseus_transfer_home;perseus_transfer_away"
	req_access = list(ACCESS_BRIG)
	var/locked = 1
	var/emagrestorationtime = 30

/obj/machinery/computer/shuttle/perseus_shuttle/ui_interact(mob/user)
	var/area/A = get_area(src)
	var/dat = ""
	var/isperseus = check_perseus(user)
	var/list/options = params2list(possible_destinations)
	var/obj/docking_port/mobile/M = SSshuttle.getShuttle(shuttleId)
	if(!Mycenae_In_Space || (locked && (!istype(A,/area/shuttle/perseus_mycenae)) && (!isperseus) && (!(obj_flags & EMAGGED))))
		dat += "<B>Shuttle Locked</B><br>"
	else
		if(isperseus)
			dat += "<B>Lock Status:</B> [locked ? "Locked" : "Unlocked"]<A href='?src=[REF(src)];togglelock=1'>Toggle</A><br><br>"
		dat += "Status: [M ? M.getStatusText() : "*Missing*"]<br><br>"
		if(M)
			var/destination_found
			for(var/obj/docking_port/stationary/S in SSshuttle.stationary)
				if(!options.Find(S.id))
					continue
				if(!M.check_dock(S, silent=TRUE))
					continue
				destination_found = 1
				dat += "<A href='?src=[REF(src)];move=[S.id]'>Send to [S.name]</A><br>"
			if(!destination_found)
				dat += "<B>Shuttle Locked</B><br>"
				if(admin_controlled)
					dat += "Authorized personnel only<br>"
					dat += "<A href='?src=[REF(src)];request=1]'>Request Authorization</A><br>"
		dat += "<a href='?src=[REF(user)];mach_close=computer'>Close</a>"

	var/datum/browser/popup = new(user, "computer", M ? M.name : "shuttle", 300, 200)
	popup.set_content("<center>[dat]</center>")
	popup.set_title_image(usr.browse_rsc_icon(src.icon, src.icon_state))
	popup.open()


/obj/machinery/computer/shuttle/perseus_shuttle/Topic(href, href_list)
	if(..())
		return
	if(!allowed(usr))
		to_chat(usr, "<span class='danger'>Access denied.</span>")
		return
	usr.set_machine(src)
	src.add_fingerprint(usr)
	if(href_list["togglelock"])
		var/lockedstatus = locked
		for(var/obj/machinery/computer/shuttle/perseus_shuttle/P in world)
			P.locked = !lockedstatus

/obj/machinery/computer/shuttle/perseus_shuttle/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	req_access = list()
	obj_flags |= EMAGGED
	to_chat(user, "<span class='notice'>You scramble the consoles ID checking system.</span>")
	spawn(emagrestorationtime*10)
		req_access = initial(req_access)
		obj_flags &= ~EMAGGED
		visible_message("<div class='warning'>The [src]'s recovers from electrical interference</div>")

/obj/docking_port/stationary/perseusstation
	name = "Prison Shuttle Dock"
	roundstart_template = "perseus_transfer_basic"
	id = "perseus_transfer_home"
	height = 4
	width = 6
	dheight = 0
	dwidth = 3

/area/prison_shuttle_sat
	name = "Prison Shuttle Satellite"