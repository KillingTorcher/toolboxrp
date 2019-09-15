/obj/item/cartridge/virus/clown
	var/bananapoints = 10 // honk
	var/canrefill = 1 // controls if you can get more banana points
	var/list/buydatums = list()
	var/list/clown_buyables = list(
	/obj/item/reagent_containers/food/snacks/grown/banana = 1,
	/obj/item/reagent_containers/food/snacks/pie/cream = 2,
	/obj/item/reagent_containers/food/drinks/soda_cans/canned_laughter = 2,
	/obj/item/bikehorn = 2,
	/obj/item/storage/crayons = 3,
	/obj/item/storage/box/snappops = 3,
	/obj/item/device/flashlight/lamp/bananalamp = 4,
	/obj/item/reagent_containers/hypospray/stealthinjector/itchingpowder = 4,
	/obj/item/banhammer = 5,
	/obj/item/device/megaphone/clown = 6,
	/obj/item/stack/sheet/mineral/bananium/five = 30 // honk!!
	)
	
/obj/item/stack/sheet/mineral/bananium/five
	amount = 5
	
/datum/data/clownstore_item
	var/item_name = "generic item"
	var/item_path = null
	var/cost = 0

/obj/item/cartridge/virus/clown/examine(mob/user)
	..()
	if (canrefill)
		to_chat(user, "<span class='notice'>There is a tiny, banana-shaped slot on its side.</span>")

/obj/item/cartridge/virus/clown/Initialize()
	for(var/path in clown_buyables)
		var/cost = clown_buyables[path]
		var/atom/temp = path
		if(isnull(cost))
			cost = 1
		var/datum/data/clownstore_item/C = new /datum/data/clownstore_item
		C.item_name = initial(temp.name)
		C.item_path = path
		C.cost = cost
		buydatums += C

/obj/item/cartridge/virus/clown/generate_menu(mob/user)
	if(!host_pda)
		return
	if (host_pda.mode == 55 && (access & CART_CLOWN))
		menu = "<h3><font color='#66ff66'>Honk Store!!</font></h3>"
		menu += "<P><font color='#66ff66'><B>Banana Points: [bananapoints]</B></font></P>"
		for(var/typepath in buydatums)
			var/datum/data/clownstore_item/CS = typepath
			var/cost = CS.cost
			if (isnull(cost))
				cost = 1
			menu += "<font color='#66ff66'><A href='?src=\ref[src];buy=[REF(CS)]'>[CS.item_name]</A> Cost: [cost]</font><br>"
		if (menu == "")
			menu = "<B>MENU EMPTY</B>"
		return menu
	else
		..()

/obj/item/cartridge/virus/clown/Topic(href, href_list)
	if(host_pda)
		if(href_list["buy"] && (access & CART_CLOWN))
			var/datum/data/clownstore_item/CS = locate(href_list["buy"])
			if(bananapoints >= CS.cost)
				bananapoints -= CS.cost
				var/atom/A = new CS.item_path(get_turf(usr))
				if(ishuman(usr) && istype(A,/obj/item))
					var/mob/living/carbon/human/H = usr
					if (H.put_in_hands(A))
						to_chat(H, "[A] materializes into your hands!")
					else
						to_chat(usr, "[A] materializes onto the floor.")
				else
					to_chat(usr, "[A] materializes onto the floor.")
			else
				to_chat(usr,"Not enough banana points.")
	..()

/obj/item/cartridge/virus/clown/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/reagent_containers/food/snacks/grown/banana) && canrefill)
		to_chat(usr, "You fit [I] into the banana-shaped slot on the side of the cartridge.")
		bananapoints += 1
		qdel(I)
		return
	..()
	/* // redacted for not fucking working
/obj/item/device/pda/attackby(obj/item/C, mob/user, params)
	if(istype(C,/obj/item/reagent_containers/food/snacks/grown/banana) && cartridge && istype(cartridge,/obj/item/cartridge/virus/clown))
		SendSignal(COMSIG_PARENT_ATTACKBY, cartridge, user, params)
		return
	else
		..()
*/

