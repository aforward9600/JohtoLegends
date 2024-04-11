	object_const_def ; object_event constants
	const FEDHIDEOUTB2F_SURGE
	const FEDHIDEOUTB2F_BIKER
	const FEDHIDEOUTB2F_FLINT
	const FEDHIDEOUTB2F_ROUGHNECK
	const FEDHIDEOUTB2F_DELINQUENT
	const FEDHIDEOUTB2F_ROUGHNECK2

FedHideoutB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FedHideoutB2FSurge:
	faceplayer
	opentext
	writetext FedHideoutB2FSurgeText
	waitbutton
	closetext
	turnobject FEDHIDEOUTB2F_SURGE, DOWN
	end

FedHideoutB2FBiker:
	faceplayer
	opentext
	writetext FedHideoutB2FBikerText
	waitbutton
	closetext
	turnobject FEDHIDEOUTB2F_BIKER, UP
	end

FedHideoutB2FFlint:
	faceplayer
	opentext
	writetext FedHideoutB2FFlintText
	waitbutton
	closetext
	turnobject FEDHIDEOUTB2F_FLINT, RIGHT
	end

FedHideoutB2FRoughneck:
	faceplayer
	opentext
	writetext FedHideoutB2FRoughneckText
	waitbutton
	closetext
	turnobject FEDHIDEOUTB2F_ROUGHNECK, LEFT
	end

TrainerDelinquentJillian:
	trainer DELINQUENT, JILLIAN, EVENT_BEAT_DELINQUENT_JILLIAN, DelinquentJillianSeenText, DelinquentJillianBeatText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentJillianAfterText
	waitbutton
	closetext
	end

TrainerRoughneckCameron:
	trainer ROUGHNECK, CAMERON_2, EVENT_BEAT_ROUGHNECK_CAMERON, RoughneckCameronSeenText, RoughneckCameronBeatText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckCameronAfterText
	waitbutton
	closetext
	end

FedHideoutB2FSurgeText:
	text "Surge: I've fought"
	line "Rattata with more"
	cont "bite than these"
	cont "guys!"

	para "Not much of a"
	line "challenge for a"
	cont "soldier!"
	done

FedHideoutB2FBikerText:
	text "I didn't sign up"
	line "to fight soldiers!"

	para "Someone get me out"
	line "of here!"
	done

FedHideoutB2FFlintText:
	text "Flint: I'm doing"
	line "this to save my"
	cont "family!"

	para "There's nothing I"
	line "can't do!"
	done

FedHideoutB2FRoughneckText:
	text "We searched all"
	line "over Petwer City"
	cont "for this guy!"

	para "Now he shows up!"
	done

DelinquentJillianSeenText:
	text "Intruder alert!"
	done

DelinquentJillianBeatText:
	text "Jillian down!"
	done

DelinquentJillianAfterText:
	text "Jillian needs time"
	line "to rest."
	done

RoughneckCameronSeenText:
	text "It's just one of"
	line "those days…"
	done

RoughneckCameronBeatText:
	text "One of those days"
	line "alright…"
	done

RoughneckCameronAfterText:
	text "I think our base"
	line "of operations is"
	cont "a lost cause at"
	cont "this point…"
	done

FedHideoutB2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 27,  2, FED_HIDEOUT_B1F, 2
	warp_event 21, 16, FED_HIDEOUT_B1F, 5
	warp_event 24, 13, FED_HIDEOUT_ELEVATOR, 1
	warp_event 25, 13, FED_HIDEOUT_ELEVATOR, 2
	warp_event 21,  2, FED_HIDEOUT_B3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  2, 16, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideoutB2FSurge, EVENT_FED_HIDEOUT_NPCS
	object_event  2, 17, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, FedHideoutB2FBiker, EVENT_FED_HIDEOUT_NPCS
	object_event 20, 18, SPRITE_FLINT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, FedHideoutB2FFlint, EVENT_FED_HIDEOUT_NPCS
	object_event 21, 18, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideoutB2FRoughneck, EVENT_FED_HIDEOUT_NPCS
	object_event 21,  6, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerDelinquentJillian, EVENT_FED_HIDEOUT_NPCS
	object_event 17, 14, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerRoughneckCameron, EVENT_FED_HIDEOUT_NPCS
