/mob/living/carbon
	gender = MALE
	blocks_emissive = EMISSIVE_BLOCK_UNIQUE
	buckle_flags = CAN_BE_BUCKLED|BUCKLE_PREVENTS_PULL
	///Contains icon generation and language information, set during New().
	var/datum/species/species
	///The amount of life ticks that have processed on this mob.
	var/life_tick = 0
	///when this is set, the mob isn't affected by shock or pain. life should decrease this by 1 every tick
	var/analgesic = 0
	///Whether or not the mob is handcuffed
	var/obj/item/restraints/handcuffs/handcuffed

	///Tracks whether our most recent breath has failed, for messages and HUD feedback.
	var/breath_failing = FALSE

	var/list/internal_organs = list()
	///Overall drunkenness - check handle_status_effects() in life.dm for effects
	var/drunkenness = 0

	var/rotate_on_lying = TRUE

	var/traumatic_shock = 0
	var/shock_stage = 0

	///Causes breathing to fail and generate oxyloss instead of recover it, even outside crit.
	var/losebreath = 0
	var/nutrition = NUTRITION_WELLFED

	var/obj/item/back //Human //todo move to human level
	var/obj/item/tank/internal = null//Human //todo move to human level

	var/blood_type
	blood_volume = BLOOD_VOLUME_NORMAL

	// halucination vars
	var/hal_screwyhud = SCREWYHUD_NONE
	var/next_hallucination = 0

	/// % Chance of exploding on death, incremented by total damage taken if not initially zero.
	var/gib_chance = 0
	///list of abilities this mob has access to
	var/list/datum/action/ability/mob_abilities = list()
	///Currently selected ability
	var/datum/action/ability/activable/selected_ability
	///carbon overlay layers
	var/list/overlays_standing[TOTAL_LAYERS]

/mob/living/carbon/proc/transfer_identity(mob/living/carbon/destination)
	if(!istype(destination))
		return
	destination.blood_type = blood_type

///Kick the player from this mob, replace it by a more competent ai
/mob/living/carbon/proc/replace_by_ai()
	return
