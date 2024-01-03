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
	text "I feel so much"
	line "lighter in water."
	done

SwimmerfNicoleBeatenText:
	text "Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "Swimming exercises"
	line "your full body."

	para "It's really good"
	line "for you."
	done

SwimmerfLoriSeenText:
	text "What an impressive"
	line "collection of GYM"

	para "BADGES. We should"
	line "battle!"
	done

SwimmerfLoriBeatenText:
	text "No!"
	done

SwimmerfLoriAfterBattleText:
	text "SURF is no longer"
	line "the only HM move"
	cont "you use in water."
	done

SwimmermCameronSeenText:
	text "I guess it's im-"
	line "possible to swim"

	para "all the way to"
	line "JOHTO."
	done

SwimmermCameronBeatenText:
	text "Aiyah!"
	done

SwimmermCameronAfterBattleText:
	text "Besides the sea, I"
	line "can also swim in"
	cont "ponds and rivers."
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
