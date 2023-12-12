	object_const_def ; object_event constants
	const FEDHIDEOUT1F_ROUGHNECK1
	const FEDHIDEOUT1F_DELINQUENT
	const FEDHIDEOUT1F_ERIKA
	const FEDHIDEOUT1F_ROUGHNECK2
	const FEDHIDEOUT1F_BIKER

FedHideout1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FedHideout1FRoughneck1:
	pause 5
	showemote EMOTE_SILENCE, FEDHIDEOUT1F_ROUGHNECK1, 15
	pause 5
	opentext
	writetext FedHideout1FRoughneck1Text
	waitbutton
	closetext
	setevent EVENT_FED_HIDEOUT_GIOVANNI
	setevent EVENT_FED_HIDEOUT_PLAYER
	end

FedHideout1FDelinquent:
	jumptextfaceplayer FedHideout1FDelinquentText

FedHideout1FErika:
	faceplayer
	opentext
	writetext FedHideout1FErikaText
	waitbutton
	closetext
	turnobject FEDHIDEOUT1F_ERIKA, RIGHT
	end

FedHideout1FRoughneck2:
	faceplayer
	opentext
	writetext FedHideout1FRoughneck2Text
	waitbutton
	closetext
	turnobject FEDHIDEOUT1F_ROUGHNECK2, LEFT
	end

TrainerBikerSpike:
	trainer BIKER, SPIKE, EVENT_BEAT_BIKER_SPIKE, BikerSpikeSeenText, BikerSpikeBeatenText, 0, .Script

.Script:
	setevent EVENT_FED_HIDEOUT_GIOVANNI
	setevent EVENT_FED_HIDEOUT_PLAYER
	endifjustbattled
	opentext
	writetext BikerSpikeAfterText
	waitbutton
	closetext
	end

FedHideout1FRoughneck1Text:
	text "Looks like he was"
	line "knocked out…"

	para "Oh well!"
	done

FedHideout1FDelinquentText:
	text "Shhh!"

	para "A bunch of thugs"
	line "broke in and are"
	cont "trouncing us!"

	para "I'm just trying to"
	line "hide!"
	done

FedHideout1FErikaText:
	text "Erika: Yawn…"

	para "…Oh, hi <PLAYER>…"

	para "…How have you been"
	line "lately?"

	para "Me? I'm just doing"
	line "my part to help"
	cont "end this conflict…"

	para "…Thank you for"
	line "asking…"
	done

FedHideout1FRoughneck2Text:
	text "Argh!"

	para "Why is this darn"
	line "gardener so hard"
	cont "to beat?"

	para "She's not even"
	line "paying attention!"
	done

BikerSpikeSeenText:
	text "Those other guys"
	line "might have beaten"
	cont "me, but you're not"
	cont "getting past me!"
	done

BikerSpikeBeatenText:
	text "You're definitely"
	line "getting past me!"
	done

BikerSpikeAfterText:
	text "This isn't good…"

	para "The boss will be"
	line "furious…"
	done

FedHideout1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 14, 13, CELADON_CITY, 6
	warp_event 15, 13, CELADON_CITY, 6
	warp_event 17,  2, FED_HIDEOUT_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 13, 12, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideout1FRoughneck1, EVENT_FED_HIDEOUT_NPCS
	object_event 17,  8, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FedHideout1FDelinquent, EVENT_FED_HIDEOUT_NPCS
	object_event  8,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FedHideout1FErika, EVENT_FED_HIDEOUT_NPCS
	object_event  9,  3, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideout1FRoughneck2, EVENT_FED_HIDEOUT_NPCS
	object_event 14,  3, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBikerSpike, EVENT_FED_HIDEOUT_NPCS
