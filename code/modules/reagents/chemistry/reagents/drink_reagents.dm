

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////// DRINKS BELOW, Beer is up there though, along with cola. Cap'n Pete's Cuban Spiced Rum////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/reagent/consumable/orangejuice
	name = "Orange Juice"
	description = "Both delicious AND rich in Vitamin C, what more do you need?"
	color = "#E78108" // rgb: 231, 129, 8
	taste_description = "oranges"
	glass_icon_state = "glass_orange"
	glass_name = "glass of orange juice"
	glass_desc = "Vitamins! Yay!"

/datum/reagent/consumable/orangejuice/on_mob_life(mob/living/carbon/M)
	if(M.getOxyLoss() && prob(30))
		M.adjustOxyLoss(-1, 0)
		. = 1
	..()

/datum/reagent/consumable/tomatojuice
	name = "Tomato Juice"
	description = "Tomatoes made into juice. What a waste of big, juicy tomatoes, huh?"
	color = "#731008" // rgb: 115, 16, 8
	taste_description = "tomatoes"
	glass_icon_state = "glass_red"
	glass_name = "glass of tomato juice"
	glass_desc = "Are you sure this is tomato juice?"

/datum/reagent/consumable/tomatojuice/on_mob_life(mob/living/carbon/M)
	if(M.getFireLoss() && prob(20))
		M.heal_bodypart_damage(0,1, 0)
		. = 1
	..()

/datum/reagent/consumable/limejuice
	name = "Lime Juice"
	description = "The sweet-sour juice of limes."
	color = "#365E30" // rgb: 54, 94, 48
	taste_description = "unbearable sourness"
	glass_icon_state = "glass_green"
	glass_name = "glass of lime juice"
	glass_desc = "A glass of sweet-sour lime juice."

/datum/reagent/consumable/limejuice/on_mob_life(mob/living/carbon/M)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1*REM, 0)
		. = 1
	..()

/datum/reagent/consumable/carrotjuice
	name = "Carrot Juice"
	description = "It is just like a carrot but without crunching."
	color = "#973800" // rgb: 151, 56, 0
	taste_description = "carrots"
	glass_icon_state = "carrotjuice"
	glass_name = "glass of  carrot juice"
	glass_desc = "It's just like a carrot but without crunching."

/datum/reagent/consumable/carrotjuice/on_mob_life(mob/living/carbon/M)
	M.adjust_blurriness(-1)
	M.adjust_blindness(-1)
	switch(current_cycle)
		if(1 to 20)
			//nothing
		if(21 to INFINITY)
			if(prob(current_cycle-10))
				M.cure_nearsighted(list(EYE_DAMAGE))
	..()
	return

/datum/reagent/consumable/berryjuice
	name = "Berry Juice"
	description = "A delicious blend of several different kinds of berries."
	color = "#863333" // rgb: 134, 51, 51
	taste_description = "berries"
	glass_icon_state = "berryjuice"
	glass_name = "glass of berry juice"
	glass_desc = "Berry juice. Or maybe it's jam. Who cares?"

/datum/reagent/consumable/applejuice
	name = "Apple Juice"
	description = "The sweet juice of an apple, fit for all ages."
	color = "#ECFF56" // rgb: 236, 255, 86
	taste_description = "apples"

/datum/reagent/consumable/poisonberryjuice
	name = "Poison Berry Juice"
	description = "A tasty juice blended from various kinds of very deadly and toxic berries."
	color = "#863353" // rgb: 134, 51, 83
	taste_description = "berries"
	glass_icon_state = "poisonberryjuice"
	glass_name = "glass of berry juice"
	glass_desc = "Berry juice. Or maybe it's poison. Who cares?"

/datum/reagent/consumable/poisonberryjuice/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(1, 0)
	. = 1
	..()

/datum/reagent/consumable/watermelonjuice
	name = "Watermelon Juice"
	description = "Delicious juice made from watermelon."
	color = "#863333" // rgb: 134, 51, 51
	taste_description = "juicy watermelon"
	glass_icon_state = "glass_red"
	glass_name = "glass of watermelon juice"
	glass_desc = "A glass of watermelon juice."

/datum/reagent/consumable/lemonjuice
	name = "Lemon Juice"
	description = "This juice is VERY sour."
	color = "#dbe45c" // rgb: 175, 175, 0
	taste_description = "sourness"
	glass_icon_state  = "lemonglass"
	glass_name = "glass of lemon juice"
	glass_desc = "Sour..."

/datum/reagent/consumable/banana
	name = "Banana Juice"
	description = "The raw essence of a banana. HONK"
	color = "#dbce57" // rgb: 175, 175, 0
	taste_description = "banana"
	glass_icon_state = "banana"
	glass_name = "glass of banana juice"
	glass_desc = "The raw essence of a banana. HONK."

/datum/reagent/consumable/banana/on_mob_life(mob/living/carbon/M)
	var/obj/item/organ/liver/liver = M.getorganslot(ORGAN_SLOT_LIVER)
	if((liver && HAS_TRAIT(liver, TRAIT_COMEDY_METABOLISM)) || ismonkey(M))
		M.heal_bodypart_damage(brute = 1, burn = 1)
		. = TRUE
	..()

/datum/reagent/consumable/nothing
	name = "Nothing"
	description = "Absolutely nothing."
	taste_description = "nothing"
	glass_icon_state = "nothing"
	glass_name = "nothing"
	glass_desc = "Absolutely nothing."
	shot_glass_icon_state = "shotglass"

/datum/reagent/consumable/nothing/on_mob_life(mob/living/carbon/M)
	if(ishuman(M) && M.mind?.miming)
		M.silent = max(M.silent, MIMEDRINK_SILENCE_DURATION)
		M.heal_bodypart_damage(1,1)
		. = 1
	..()

/datum/reagent/consumable/laughter
	name = "Laughter"
	description = "Some say that this is the best medicine, but recent studies have proven that to be untrue."
	metabolization_rate = INFINITY
	color = "#FF4DD2"
	taste_description = "laughter"

/datum/reagent/consumable/laughter/on_mob_life(mob/living/carbon/M)
	M.emote("laugh")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "chemical_laughter", /datum/mood_event/chemical_laughter)
	..()

/datum/reagent/consumable/superlaughter
	name = "Super Laughter"
	description = "Funny until you're the one laughing."
	metabolization_rate = 1.5 * REAGENTS_METABOLISM
	color = "#FF4DD2"
	taste_description = "laughter"

/datum/reagent/consumable/superlaughter/on_mob_life(mob/living/carbon/M)
	if(prob(30))
		M.visible_message("<span class='danger'>[M] bursts out into a fit of uncontrollable laughter!</span>", "<span class='userdanger'>You burst out in a fit of uncontrollable laughter!</span>")
		M.Stun(5)
		SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "chemical_laughter", /datum/mood_event/chemical_superlaughter)
	..()

/datum/reagent/consumable/potato_juice
	name = "Potato Juice"
	description = "Juice of the potato. Bleh."
	nutriment_factor = 2 * REAGENTS_METABOLISM
	color = "#302000" // rgb: 48, 32, 0
	taste_description = "irish sadness"
	glass_icon_state = "glass_brown"
	glass_name = "glass of potato juice"
	glass_desc = "Bleh..."

/datum/reagent/consumable/grapejuice
	name = "Grape Juice"
	description = "The juice of a bunch of grapes. Guaranteed non-alcoholic."
	color = "#290029" // dark purple
	taste_description = "grape soda"

/datum/reagent/consumable/milk
	name = "Milk"
	description = "An opaque white liquid produced by the mammary glands of mammals."
	color = "#DFDFDF" // rgb: 223, 223, 223
	taste_description = "milk"
	glass_icon_state = "glass_white"
	glass_name = "glass of milk"
	glass_desc = "White and nutritious goodness!"

	// Milk is good for humans, but bad for plants. The sugars cannot be used by plants, and the milk fat harms growth. Not shrooms though. I can't deal with this now...
/datum/reagent/consumable/milk/on_hydroponics_apply(obj/item/seeds/myseed, datum/reagents/chems, obj/machinery/hydroponics/mytray, mob/user)
	. = ..()
	if(chems.has_reagent(type, 1))
		mytray.adjustWater(round(chems.get_reagent_amount(type) * 0.3))
		if(myseed)
			myseed.adjust_potency(-chems.get_reagent_amount(type) * 0.5)

/datum/reagent/consumable/milk/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
		. = 1
	if(holder.has_reagent(/datum/reagent/consumable/capsaicin))
		holder.remove_reagent(/datum/reagent/consumable/capsaicin, 2)
	..()

/datum/reagent/consumable/soymilk
	name = "Soy Milk"
	description = "An opaque white liquid made from soybeans."
	color = "#DFDFC7" // rgb: 223, 223, 199
	taste_description = "soy milk"
	glass_icon_state = "glass_white"
	glass_name = "glass of soy milk"
	glass_desc = "White and nutritious soy goodness!"

/datum/reagent/consumable/soymilk/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
		. = 1
	..()

/datum/reagent/consumable/cream
	name = "Cream"
	description = "The fatty, still liquid part of milk. Why don't you mix this with sum scotch, eh?"
	color = "#DFD7AF" // rgb: 223, 215, 175
	taste_description = "creamy milk"
	glass_icon_state  = "glass_white"
	glass_name = "glass of cream"
	glass_desc = "Ewwww..."

/datum/reagent/consumable/cream/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
		. = 1
	..()

/datum/reagent/consumable/coffee
	name = "Coffee"
	description = "Coffee is a brewed drink prepared from roasted seeds, commonly called coffee beans, of the coffee plant."
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	overdose_threshold = 80
	taste_description = "bitterness"
	glass_icon_state = "glass_brown"
	glass_name = "glass of coffee"
	glass_desc = "Don't drop it, or you'll send scalding liquid and glass shards everywhere."

/datum/reagent/consumable/coffee/overdose_process(mob/living/M)
	M.Jitter(5)
	..()

/datum/reagent/consumable/coffee/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40)
	//310.15 is the normal bodytemp.
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	if(holder.has_reagent(/datum/reagent/consumable/frostoil))
		holder.remove_reagent(/datum/reagent/consumable/frostoil, 5)
	..()
	. = 1

/datum/reagent/consumable/tea
	name = "Tea"
	description = "Tasty black tea, it has antioxidants, it's good for you!"
	color = "#101000" // rgb: 16, 16, 0
	nutriment_factor = 0
	taste_description = "tart black tea"
	glass_icon_state = "teaglass"
	glass_name = "glass of tea"
	glass_desc = "Drinking it from here would not seem right."

/datum/reagent/consumable/tea/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	..()
	. = 1

/datum/reagent/consumable/lemonade
	name = "Lemonade"
	description = "Sweet, tangy lemonade. Good for the soul."
	color = "#FFE978"
	quality = DRINK_NICE
	taste_description = "sunshine and summertime"
	glass_icon_state = "lemonpitcher"
	glass_name = "pitcher of lemonade"
	glass_desc = "This drink leaves you feeling nostalgic for some reason."

/datum/reagent/consumable/tea/arnold_palmer
	name = "Arnold Palmer"
	description = "Encourages the patient to go golfing."
	color = "#FFB766"
	quality = DRINK_NICE
	nutriment_factor = 2
	taste_description = "bitter tea"
	glass_icon_state = "arnold_palmer"
	glass_name = "Arnold Palmer"
	glass_desc = "You feel like taking a few golf swings after a few swigs of this."

/datum/reagent/consumable/tea/arnold_palmer/on_mob_life(mob/living/carbon/M)
	if(prob(5))
		to_chat(M, "<span class='notice'>[pick("You remember to square your shoulders.","You remember to keep your head down.","You can't decide between squaring your shoulders and keeping your head down.","You remember to relax.","You think about how someday you'll get two strokes off your golf game.")]</span>")
	..()
	. = 1

/datum/reagent/consumable/icecoffee
	name = "Iced Coffee"
	description = "Coffee and ice, refreshing and cool."
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "bitter coldness"
	glass_icon_state = "icedcoffeeglass"
	glass_name = "iced coffee"
	glass_desc = "A drink to perk you up and refresh you!"

/datum/reagent/consumable/icecoffee/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	M.Jitter(5)
	..()
	. = 1

/datum/reagent/consumable/icetea
	name = "Iced Tea"
	description = "No relation to a certain rap artist/actor."
	color = "#104038" // rgb: 16, 64, 56
	nutriment_factor = 0
	taste_description = "sweet tea"
	glass_icon_state = "icedteaglass"
	glass_name = "iced tea"
	glass_desc = "All natural, antioxidant-rich flavour sensation."

/datum/reagent/consumable/icetea/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.AdjustSleeping(-40)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()
	. = 1

/datum/reagent/consumable/space_cola
	name = "Cola"
	description = "A refreshing beverage."
	color = "#100800" // rgb: 16, 8, 0
	taste_description = "cola"
	glass_icon_state  = "glass_brown"
	glass_name = "glass of Space Cola"
	glass_desc = "A glass of refreshing Space Cola."

/datum/reagent/consumable/space_cola/on_mob_life(mob/living/carbon/M)
	M.drowsyness = max(0,M.drowsyness-5)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/grey_bull
	name = "Grey Bull"
	description = "Grey Bull, it gives you gloves!"
	color = "#EEFF00" // rgb: 238, 255, 0
	quality = DRINK_VERYGOOD
	taste_description = "carbonated oil"
	glass_icon_state = "grey_bull_glass"
	glass_name = "glass of Grey Bull"
	glass_desc = "Surprisingly it isn't grey."

/datum/reagent/consumable/grey_bull/on_mob_metabolize(mob/living/L)
	..()
	ADD_TRAIT(L, TRAIT_SHOCKIMMUNE, type)

/datum/reagent/consumable/grey_bull/on_mob_end_metabolize(mob/living/L)
	REMOVE_TRAIT(L, TRAIT_SHOCKIMMUNE, type)
	..()

/datum/reagent/consumable/grey_bull/on_mob_life(mob/living/carbon/M)
	M.Jitter(20)
	M.dizziness +=1
	M.drowsyness = 0
	M.AdjustSleeping(-40)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/spacemountainwind
	name = "SM Wind"
	description = "Blows right through you like a space wind."
	color = "#102000" // rgb: 16, 32, 0
	taste_description = "sweet citrus soda"
	glass_icon_state = "Space_mountain_wind_glass"
	glass_name = "glass of Space Mountain Wind"
	glass_desc = "Space Mountain Wind. As you know, there are no mountains in space, only wind."

/datum/reagent/consumable/spacemountainwind/on_mob_life(mob/living/carbon/M)
	M.drowsyness = max(0,M.drowsyness-7)
	M.AdjustSleeping(-20)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	M.Jitter(5)
	..()
	. = 1

/datum/reagent/consumable/dr_gibb
	name = "Dr. Gibb"
	description = "A delicious blend of 42 different flavours."
	color = "#102000" // rgb: 16, 32, 0
	taste_description = "cherry soda" // FALSE ADVERTISING
	glass_icon_state = "dr_gibb_glass"
	glass_name = "glass of Dr. Gibb"
	glass_desc = "Dr. Gibb. Not as dangerous as the glass_name might imply."

/datum/reagent/consumable/dr_gibb/on_mob_life(mob/living/carbon/M)
	M.drowsyness = max(0,M.drowsyness-6)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/space_up
	name = "Space-Up"
	description = "Tastes like a hull breach in your mouth."
	color = "#00FF00" // rgb: 0, 255, 0
	taste_description = "cherry soda"
	glass_icon_state = "space-up_glass"
	glass_name = "glass of Space-Up"
	glass_desc = "Space-up. It helps you keep your cool."


/datum/reagent/consumable/space_up/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-8 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/lemon_lime
	name = "Lemon Lime"
	description = "A tangy substance made of 0.5% natural citrus!"
	color = "#8CFF00" // rgb: 135, 255, 0
	taste_description = "tangy lime and lemon soda"
	glass_icon_state = "glass_yellow"
	glass_name = "glass of lemon-lime"
	glass_desc = "You're pretty certain a real fruit has never actually touched this."


/datum/reagent/consumable/lemon_lime/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-8 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()


/datum/reagent/consumable/pwr_game
	name = "Pwr Game"
	description = "The only drink with the PWR that true gamers crave."
	color = "#9385bf" // rgb: 58, 52, 75
	taste_description = "sweet and salty tang"
	glass_icon_state = "glass_red"
	glass_name = "glass of Pwr Game"
	glass_desc = "Goes well with a Vlad's salad."

/datum/reagent/consumable/pwr_game/expose_mob(mob/living/exposed_mob, methods=TOUCH, reac_volume)
	. = ..()
	if(exposed_mob?.mind?.get_skill_level(/datum/skill/gaming) >= SKILL_LEVEL_LEGENDARY && (methods & INGEST) && !HAS_TRAIT(exposed_mob, TRAIT_GAMERGOD))
		ADD_TRAIT(exposed_mob, TRAIT_GAMERGOD, "pwr_game")
		to_chat(exposed_mob, "<span class='nicegreen'>As you imbibe the Pwr Game, your gamer third eye opens... \
		You feel as though a great secret of the universe has been made known to you...</span>")

/datum/reagent/consumable/pwr_game/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-8 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	if(prob(10))
		M.mind?.adjust_experience(/datum/skill/gaming, 5)
	..()

/datum/reagent/consumable/shamblers
	name = "Shambler's Juice"
	description = "~Shake me up some of that Shambler's Juice!~"
	color = "#f00060" // rgb: 94, 0, 38
	taste_description = "carbonated metallic soda"
	glass_icon_state = "glass_red"
	glass_name = "glass of Shambler's juice"
	glass_desc = "Mmm mm, shambly."

/datum/reagent/consumable/shamblers/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-8 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()
/datum/reagent/consumable/sodawater
	name = "Soda Water"
	description = "A can of club soda. Why not make a scotch and soda?"
	color = "#619494" // rgb: 97, 148, 148
	taste_description = "carbonated water"
	glass_icon_state = "glass_clear"
	glass_name = "glass of soda water"
	glass_desc = "Soda water. Why not make a scotch and soda?"


	// A variety of nutrients are dissolved in club soda, without sugar.
	// These nutrients include carbon, oxygen, hydrogen, phosphorous, potassium, sulfur and sodium, all of which are needed for healthy plant growth.
/datum/reagent/consumable/sodawater/on_hydroponics_apply(obj/item/seeds/myseed, datum/reagents/chems, obj/machinery/hydroponics/mytray, mob/user)
	. = ..()
	if(chems.has_reagent(type, 1))
		mytray.adjustWater(round(chems.get_reagent_amount(type) * 1))
		mytray.adjustHealth(round(chems.get_reagent_amount(type) * 0.1))

/datum/reagent/consumable/sodawater/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/tonic
	name = "Tonic Water"
	description = "It tastes strange but at least the quinine keeps the Space Malaria at bay."
	color = "#0064C8" // rgb: 0, 100, 200
	taste_description = "tart and fresh"
	glass_icon_state = "glass_clear"
	glass_name = "glass of tonic water"
	glass_desc = "Quinine tastes funny, but at least it'll keep that Space Malaria away."

/datum/reagent/consumable/tonic/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()
	. = 1

/datum/reagent/consumable/monkey_energy
	name = "Monkey Energy"
	description = "The only drink that will make you unleash the ape."
	color = "#f39b03" // rgb: 243, 155, 3
	overdose_threshold = 60
	taste_description = "barbecue and nostalgia"
	glass_icon_state = "monkey_energy_glass"
	glass_name = "glass of Monkey Energy"
	glass_desc = "You can unleash the ape, but without the pop of the can?"

/datum/reagent/consumable/monkey_energy/on_mob_life(mob/living/carbon/M)
	M.Jitter(20)
	M.dizziness +=1
	M.drowsyness = 0
	M.AdjustSleeping(-40)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/monkey_energy/on_mob_metabolize(mob/living/L)
	..()
	if(ismonkey(L))
		L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/monkey_energy)

/datum/reagent/consumable/monkey_energy/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/monkey_energy)
	..()

/datum/reagent/consumable/monkey_energy/overdose_process(mob/living/M)
	if(prob(15))
		M.say(pick_list_replacements(BOOMER_FILE, "boomer"), forced = /datum/reagent/consumable/monkey_energy)
	..()

/datum/reagent/consumable/ice
	name = "Ice"
	description = "Frozen water, your dentist wouldn't like you chewing this."
	reagent_state = SOLID
	color = "#619494" // rgb: 97, 148, 148
	taste_description = "ice"
	glass_icon_state = "iceglass"
	glass_name = "glass of ice"
	glass_desc = "Generally, you're supposed to put something else in there too..."

/datum/reagent/consumable/ice/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/cafe_latte
	name = "Cafe Latte"
	description = "A nice, strong and tasty beverage while you are reading."
	color = "#664300" // rgb: 102, 67, 0
	quality = DRINK_NICE
	taste_description = "bitter cream"
	glass_icon_state = "cafe_latte"
	glass_name = "cafe latte"
	glass_desc = "A nice, strong and refreshing beverage while you're reading."

/datum/reagent/consumable/cafe_latte/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.SetSleeping(0)
	M.adjust_bodytemperature(5 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	M.Jitter(5)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	..()
	. = 1

/datum/reagent/consumable/pumpkinjuice
	name = "Pumpkin Juice"
	description = "Juiced from real pumpkin."
	color = "#FFA500"
	taste_description = "pumpkin"

/datum/reagent/consumable/blumpkinjuice
	name = "Blumpkin Juice"
	description = "Juiced from real blumpkin."
	color = "#00BFFF"
	taste_description = "a mouthful of pool water"

/datum/reagent/consumable/triple_citrus
	name = "Triple Citrus"
	description = "A solution."
	color = "#EEFF00"
	quality = DRINK_NICE
	taste_description = "extreme bitterness"
	glass_icon_state = "triplecitrus" //needs own sprite mine are trash //your sprite is great tho
	glass_name = "glass of triple citrus"
	glass_desc = "A mixture of citrus juices. Tangy, yet smooth."

/datum/reagent/consumable/grape_soda
	name = "Grape soda"
	description = "Beloved by children and teetotalers."
	color = "#E6CDFF"
	taste_description = "grape soda"
	glass_name = "glass of grape juice"
	glass_desc = "It's grape (soda)!"

/datum/reagent/consumable/grape_soda/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/milk/chocolate_milk
	name = "Chocolate Milk"
	description = "Milk for cool kids."
	color = "#7D4E29"
	quality = DRINK_NICE
	taste_description = "chocolate milk"

/datum/reagent/consumable/hot_coco
	name = "Hot Coco"
	description = "Made with love! And coco beans."
	nutriment_factor = 3 * REAGENTS_METABOLISM
	color = "#403010" // rgb: 64, 48, 16
	taste_description = "creamy chocolate"
	glass_icon_state  = "chocolateglass"
	glass_name = "glass of hot coco"
	glass_desc = "A favorite winter drink to warm you up."

/datum/reagent/consumable/hot_coco/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(5 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/hot_coco/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
		. = 1
	if(holder.has_reagent(/datum/reagent/consumable/capsaicin))
		holder.remove_reagent(/datum/reagent/consumable/capsaicin, 2)
	..()

/datum/reagent/consumable/menthol
	name = "Menthol"
	description = "Alleviates coughing symptoms one might have."
	color = "#80AF9C"
	taste_description = "mint"
	glass_icon_state = "glass_green"
	glass_name = "glass of menthol"
	glass_desc = "Tastes naturally minty, and imparts a very mild numbing sensation."

/datum/reagent/consumable/menthol/on_mob_life(mob/living/L)
	L.apply_status_effect(/datum/status_effect/throat_soothed)
	..()

/datum/reagent/consumable/grenadine
	name = "Grenadine"
	description = "Not cherry flavored!"
	color = "#EA1D26"
	taste_description = "sweet pomegranates"
	glass_name = "glass of grenadine"
	glass_desc = "Delicious flavored syrup."

/datum/reagent/consumable/parsnipjuice
	name = "Parsnip Juice"
	description = "Why..."
	color = "#FFA500"
	taste_description = "parsnip"
	glass_name = "glass of parsnip juice"

/datum/reagent/consumable/pineapplejuice
	name = "Pineapple Juice"
	description = "Tart, tropical, and hotly debated."
	color = "#F7D435"
	taste_description = "pineapple"
	glass_name = "glass of pineapple juice"
	glass_desc = "Tart, tropical, and hotly debated."

/datum/reagent/consumable/peachjuice //Intended to be extremely rare due to being the limiting ingredients in the blazaam drink
	name = "Peach Juice"
	description = "Just peachy."
	color = "#E78108"
	taste_description = "peaches"
	glass_name = "glass of peach juice"

/datum/reagent/consumable/cream_soda
	name = "Cream Soda"
	description = "A classic space-American vanilla flavored soft drink."
	color = "#dcb137"
	quality = DRINK_VERYGOOD
	taste_description = "fizzy vanilla"
	glass_icon_state = "cream_soda"
	glass_name = "Cream Soda"
	glass_desc = "A classic space-American vanilla flavored soft drink."

/datum/reagent/consumable/cream_soda/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, M.get_body_temp_normal())
	..()

/datum/reagent/consumable/sol_dry
	name = "Sol Dry"
	description = "A soothing, mellow drink made from ginger."
	color = "#f7d26a"
	quality = DRINK_NICE
	taste_description = "sweet ginger spice"
	glass_name = "Sol Dry"
	glass_desc = "A soothing, mellow drink made from ginger."

/datum/reagent/consumable/sol_dry/on_mob_life(mob/living/carbon/M)
	M.adjust_disgust(-5)
	..()

/datum/reagent/consumable/red_queen
	name = "Red Queen"
	description = "DRINK ME."
	color = "#e6ddc3"
	quality = DRINK_GOOD
	taste_description = "wonder"
	glass_icon_state = "red_queen"
	glass_name = "Red Queen"
	glass_desc = "DRINK ME."
	var/current_size = RESIZE_DEFAULT_SIZE

/datum/reagent/consumable/red_queen/on_mob_life(mob/living/carbon/H)
	if(prob(75))
		return ..()
	var/newsize = pick(0.5, 0.75, 1, 1.50, 2)
	newsize *= RESIZE_DEFAULT_SIZE
	H.resize = newsize/current_size
	current_size = newsize
	H.update_transform()
	if(prob(40))
		H.emote("sneeze")
	..()

/datum/reagent/consumable/red_queen/on_mob_end_metabolize(mob/living/M)
	M.resize = RESIZE_DEFAULT_SIZE/current_size
	current_size = RESIZE_DEFAULT_SIZE
	M.update_transform()
	..()

/datum/reagent/consumable/bungojuice
	name = "Bungo Juice"
	color = "#F9E43D"
	description = "Exotic! You feel like you are on vacation already."
	taste_description = "succulent bungo"
	glass_icon_state = "glass_yellow"
	glass_name = "glass of bungo juice"
	glass_desc = "Exotic! You feel like you are on vacation already."

/datum/reagent/consumable/prunomix
	name = "pruno mixture"
	color = "#E78108"
	description = "Fruit, sugar, yeast, and water pulped together into a pungent slurry."
	taste_description = "garbage"
	glass_icon_state = "glass_orange"
	glass_name = "glass of pruno mixture"
	glass_desc = "Fruit, sugar, yeast, and water pulped together into a pungent slurry."

/datum/reagent/consumable/aloejuice
	name = "Aloe Juice"
	color = "#A3C48B"
	description = "A healthy and refreshing juice."
	taste_description = "vegetable"
	glass_icon_state = "glass_yellow"
	glass_name = "glass of aloe juice"
	glass_desc = "A healthy and refreshing juice."

/datum/reagent/consumable/aloejuice/on_mob_life(mob/living/M)
	if(M.getToxLoss() && prob(30))
		M.adjustToxLoss(-1, 0)
	..()
	. = TRUE

/datum/reagent/consumable/lean
	name = "Lean"
	description = "The drank that makes you go wheezy."
	color = "#DE55ED"
	quality = DRINK_NICE
	taste_description = "purple and a hint of opioid."
	glass_icon_state = "lean"
	glass_name = "Lean"
	glass_desc = "A drink that makes your life less miserable."

/datum/reagent/consumable/lean/on_mob_life(mob/living/carbon/M)
	if(M.slurring < 3)
		M.slurring+= 2
	if(M.druggy < 3)
		M.adjust_drugginess(1)
	if(M.drowsyness < 3)
		M.drowsyness++
	return ..()

