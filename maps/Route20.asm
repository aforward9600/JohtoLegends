	object_const_def ; object_event constants
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GUY
	const ROUTE20_COOLTRAINER_F

Route20_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .GlitchCity

.GlitchCity:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .GlitchCityOpens
	return

.GlitchCityOpens:
	changeblock 0, 2, $ab ; portal
	return

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerFTerra:
	trainer COOLTRAINERF, TERRA, EVENT_BEAT_COOLTRAINERF_TERRA, CooltrainerFTerraSeenText, CooltrainerFTerraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFTerraAfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSign:
	jumptext CinnabarGymSignText

SwimmerfNicoleSeenText:
	text "The w-w-ater's s-so"
	line "c-cold!"
	done

SwimmerfNicoleBeatenText:
	text "Brrrrrrr!"
	done

SwimmerfNicoleAfterBattleText:
	text "T-t-that's what I"
	line "g-get for swimming"

	para "n-near S-seafoam"
	line "Islands!"
	done

SwimmerfLoriSeenText:
	text "I feel so alive!"
	done

SwimmerfLoriBeatenText:
	text "Ah! I'm drowning!"
	done

SwimmerfLoriAfterBattleText:
	text "Whew! That was"
	line "close!"

	para "Always be cautious"
	line "in the ocean!"
	done

SwimmermCameronSeenText:
	text "I heard about a"
	line "Legendary #mon"

	para "in Seafoam Islands"
	line "but I'm not"
	cont "interested in it."

	para "It's not a"
	line "swimming #mon!"
	done

SwimmermCameronBeatenText:
	text "Gracious!"
	done

SwimmermCameronAfterBattleText:
	text "It's a bird, so it's"
	line "not interesting to"
	cont "me."
	done

CinnabarGymSignText:
	text "Seafoam Islands"

	para "The bitter cold"
	line "turns away all but"
	cont "the strongest."
	done

CooltrainerFTerraSeenText:
	text "Oh, hey!"

	para "You came out this"
	line "way to see me?"

	para "Oh, you didn't."

	para "Oh well. Want to"
	line "battle?"
	done

CooltrainerFTerraBeatenText:
	text "It probably would"
	line "Have been better"
	cont "if you hadn't come!"
	done

CooltrainerFTerraAfterBattleText:
	text "Well, since you're"
	line "here, you may as"
	cont "make yourself at"
	cont "home."
	done

Route20_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 38,  7, SEAFOAM_ISLAND_1F, 1
	warp_event  0,  2, GLITCH_CITY, 1
	warp_event 30,  5, SEAFOAM_ISLAND_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 37, 11, BGEVENT_READ, CinnabarGymSign

	db 4 ; object events
	object_event 52,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 45, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 22, 12, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
	object_event 13,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerCooltrainerFTerra, -1
