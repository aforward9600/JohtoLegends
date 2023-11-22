	object_const_def ; object_event constants
	const FEDHIDEOUT3F_KOGA
	const FEDHIDEOUT3F_BIKER
	const FEDHIDEOUT3F_BLAINE
	const FEDHIDEOUT3F_ROUGHNECK
	const FEDHIDEOUT3F_DELINQUENT
	const FEDHIDEOUT3F_ROUGHNECK2

FedHideoutB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FedHideoutB3FKoga:
	faceplayer
	opentext
	writetext FedHideoutB3FKogaText
	waitbutton
	closetext
	turnobject FEDHIDEOUT3F_KOGA, LEFT
	end

FedHideoutB3FBiker:
	faceplayer
	opentext
	writetext FedHideoutB3FBikerText
	waitbutton
	closetext
	turnobject FEDHIDEOUT3F_BIKER, RIGHT
	end

FedHideoutB3FBlaine:
	faceplayer
	opentext
	writetext FedHideoutB3FBlaineText
	waitbutton
	closetext
	turnobject FEDHIDEOUT3F_BLAINE, RIGHT
	end

FedHideoutB3FRoughneck:
	faceplayer
	opentext
	writetext FedHideoutB3FRoughneckText
	waitbutton
	closetext
	turnobject FEDHIDEOUT3F_ROUGHNECK, LEFT
	end

TrainerDelinquentBertha:
	trainer DELINQUENT, BERTHA, EVENT_BEAT_DELINQUENT_BERTHA, DelinquentBerthaSeenText, DelinquentBerthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentBerthaAfterText
	waitbutton
	closetext
	end

TrainerRoughneckGuido:
	trainer ROUGHNECK, GUIDO, EVENT_BEAT_ROUGHNECK_GUIDO, RoughneckGuidoSeenText, RoughneckGuidoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckGuidoAfterText
	waitbutton
	closetext
	end

FedHideoutB3FKogaText:
	text "Koga: Today, we"
	line "shall have our"
	cont "revenge."

	para "I know it."
	done

FedHideoutB3FBikerText:
	text "I hate these"
	line "ninjas!"
	done

FedHideoutB3FBlaineText:
	text "Blaine: I need to"
	line "atone for my"
	cont "actions."

	para "I hope this shall"
	line "suffice."
	done

FedHideoutB3FRoughneckText:
	text "Wait, wasn't this"
	line "this guy one of"
	cont "ours?"

	para "Why is he fighting"
	line "us, then?"
	done

DelinquentBerthaSeenText:
	text "Get out of here!"

	para "You're not welcome"
	line "in our base!"
	done

DelinquentBerthaBeatenText:
	text "I guess you can"
	line "stay…"
	done

DelinquentBerthaAfterText:
	text "There's nothing I"
	line "can do to kick you"
	cont "out now."
	done

RoughneckGuidoSeenText:
	text "Oh man, oh man…"

	para "What am I gonna"
	line "do?"
	done

RoughneckGuidoBeatenText:
	text "I'm gonna lose, I"
	line "guess…"
	done

RoughneckGuidoAfterText:
	text "I should probably"
	line "leave town…"

	para "We're finished…"
	done

FedHideoutB3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17,  2, FED_HIDEOUT_B2F, 5
	warp_event 11, 14, FED_HIDEOUT_B4F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  5,  2, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, FedHideoutB3FKoga, EVENT_FED_HIDEOUT_NPCS
	object_event  4,  2, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideoutB3FBiker, EVENT_FED_HIDEOUT_NPCS
	object_event 17, 12, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideoutB3FBlaine, EVENT_FED_HIDEOUT_NPCS
	object_event 18, 12, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideoutB3FRoughneck, EVENT_FED_HIDEOUT_NPCS
	object_event  1, 18, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerDelinquentBertha, EVENT_FED_HIDEOUT_NPCS
	object_event 12, 19, SPRITE_ROUGHNECK, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerRoughneckGuido, EVENT_FED_HIDEOUT_NPCS
