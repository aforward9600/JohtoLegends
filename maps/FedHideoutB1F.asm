	object_const_def ; object_event constants
	const FEDHIDEOUTB1F_SABRINA
	const FEDHIDEOUTB1F_DELINQUENT
	const FEDHIDEOUTB1F_DAISY
	const FEDHIDEOUTB1F_VIOLET
	const FEDHIDEOUTB1F_LILY
	const FEDHIDEOUTB1F_BIKER
	const FEDHIDEOUTB1F_DELINQUENT2
	const FEDHIDEOUTB1F_ROUGHNECK

FedHideoutB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FedHideoutB1FSabrina:
	faceplayer
	opentext
	writetext FedHideoutB1FSabrinaText
	waitbutton
	closetext
	turnobject FEDHIDEOUTB1F_SABRINA, LEFT
	end

FedHideoutB1FDelinquent:
	faceplayer
	opentext
	writetext FedHideoutB1FDelinquentText
	waitbutton
	closetext
	turnobject FEDHIDEOUTB1F_DELINQUENT, RIGHT
	end

FedHideoutB1FDaisy:
	jumptext FedHideoutB1FDaisyText

FedHideoutB1FViolet:
	jumptext FedHideoutB1FVioletText

FedHideoutB1FLily:
	jumptext FedHideoutB1FLilyText

FedHideoutB1FBiker:
	jumptextfaceplayer FedHideoutB1FBikerText

TrainerDelinquentTabitha:
	trainer DELINQUENT, TABITHA, EVENT_BEAT_DELINQUENT_TABITHA, DelinquentTabithaSeenText, DelinquentTabithaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentTabithaAfterText
	waitbutton
	closetext
	end

TrainerRoughneckKyle:
	trainer ROUGHNECK, KYLE_2, EVENT_BEAT_ROUGHNECK_KYLE, RoughneckKyleSeenText, RoughneckKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckKyleAfterText
	waitbutton
	checkevent EVENT_GOT_ELEVATOR_PASSWORD
	iftrue .GotElevatorPassword
	closetext
	end

.GotElevatorPassword:
	writetext RoughneckKyleElevatorText
	waitbutton
	closetext
	end

FedHideoutB1FSabrinaText:
	text "Sabrina: She's too"
	line "easy."

	para "Go on ahead."
	done

FedHideoutB1FDelinquentText:
	text "It's like she can"
	line "predict my every"
	cont "move!"
	done

FedHideoutB1FDaisyText:
	text "Daisy: Hey mister!"

	para "Wanna play with us"
	line "please?"
	done

FedHideoutB1FVioletText:
	text "Violet: Can I ride"
	line "your bike, mister?"

	para "I promise I won't"
	line "bang it up too"
	cont "badly!"
	done

FedHideoutB1FLilyText:
	text "Lily: How does"
	line "this feel?"

	para "I hope it hurts!"
	done

FedHideoutB1FBikerText:
	text "Make it stop!"
	done

DelinquentTabithaSeenText:
	text "Glad I'm over here"
	line "and not fighting"
	cont "those girls."

	para "They seem pretty"
	line "tough."

	para "What about you?"
	done

DelinquentTabithaBeatenText:
	text "You might be even"
	line "tougher!"
	done

DelinquentTabithaAfterText:
	text "I'm not sure which"
	line "would be the worse"
	cont "fate."
	done

RoughneckKyleSeenText:
	text "Sorry, I can't let"
	line "you use this"
	cont "elevator!"
	done

RoughneckKyleBeatenText:
	text "Sorry, no can do!"
	done

RoughneckKyleAfterText:
	text "Even if you wanted"
	line "to, it's no use!"

	para "You'll need the"
	line "password for it!"

	para "Guess what?"

	para "I don't know it!"

	para "Looks like it's"
	line "over for you!"

	para "Heheheheh!"
	done

RoughneckKyleElevatorText:
	text "…Wait, you already"
	line "have the password?"

	para "…Oh no…"
	done

FedHideoutB1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13,  2, FED_HIDEOUT_1F, 3
	warp_event 15,  2, FED_HIDEOUT_B2F, 1
	warp_event 16, 19, FED_HIDEOUT_ELEVATOR, 1
	warp_event 17, 19, FED_HIDEOUT_ELEVATOR, 2
	warp_event 13, 24, FED_HIDEOUT_B2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event 11, 11, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideoutB1FSabrina, EVENT_FED_HIDEOUT_NPCS
	object_event 10, 11, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FedHideoutB1FDelinquent, EVENT_FED_HIDEOUT_NPCS
	object_event 11, 21, SPRITE_SENSATIONAL_BLONDE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FedHideoutB1FDaisy, EVENT_FED_HIDEOUT_NPCS
	object_event 12, 20, SPRITE_SENSATIONAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FedHideoutB1FViolet, EVENT_FED_HIDEOUT_NPCS
	object_event 13, 21, SPRITE_SENSATIONAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FedHideoutB1FLily, EVENT_FED_HIDEOUT_NPCS
	object_event 12, 21, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FedHideoutB1FBiker, EVENT_FED_HIDEOUT_NPCS
	object_event  2, 22, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerDelinquentTabitha, EVENT_FED_HIDEOUT_NPCS
	object_event 17, 16, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerRoughneckKyle, EVENT_FED_HIDEOUT_NPCS
