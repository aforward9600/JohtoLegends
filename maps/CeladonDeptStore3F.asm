	object_const_def ; object_event constants
	const CELADONDEPTSTORE3F_CLERK
	const CELADONDEPTSTORE3F_GRAMPS
	const CELADONDEPTSTORE3F_GAMEBOY_KID1
	const CELADONDEPTSTORE3F_GAMEBOY_KID2
	const CELADONDEPTSTORE3F_SUPER_NERD
	const CELADONDEPTSTORE3F_DELINQUENT
	const CELADONDEPTSTORE3F_ROUGHNECK

CeladonDeptStore3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_3F
	closetext
	end

CeladonDeptStore3FGrampsScript:
	jumptextfaceplayer CeladonDeptStore3FGrampsText

CeladonDeptStore3FGameboyKid1Script:
	faceplayer
	opentext
	writetext CeladonDeptStore3FGameboyKid1Text
	waitbutton
	closetext
	turnobject CELADONDEPTSTORE3F_GAMEBOY_KID1, DOWN
	end

CeladonDeptStore3FGameboyKid2Script:
	faceplayer
	opentext
	writetext CeladonDeptStore3FGameboyKid2Text
	waitbutton
	closetext
	turnobject CELADONDEPTSTORE3F_GAMEBOY_KID2, DOWN
	end

CeladonDeptStore3FSuperNerdScript:
	jumptextfaceplayer CeladonDeptStore3FSuperNerdText

CeladonDeptStore3FDelinquentScript:
	jumptextfaceplayer CeladonDeptStore3FDelinquentText

CeladonDeptStore3FRoughneckScript:
	jumptextfaceplayer CeladonDeptStore3FRoughneckText

CeladonDeptStore3FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore3FDirectory:
	jumptext CeladonDeptStore3FDirectoryText

CeladonDeptStore3FGrampsText:
	text "I don't need any"
	line "TMs, but it's nice"
	cont "to just speak with"
	cont "people here."
	done

CeladonDeptStore3FGameboyKid1Text:
	text "You ever played"
	line "the Chef Game &"
	cont "Watch?"

	para "I love it!"
	done

CeladonDeptStore3FGameboyKid2Text:
	text "I only have the"
	line "Ball Game & Watch."

	para "It's okay, but I"
	line "could go for The"
	cont "Legend of Zelda!"
	done

CeladonDeptStore3FSuperNerdText:
	text "I can teach my"
	line "#mon some great"
	cont "moves here!"
	done

CeladonDeptStore3FDirectoryText:
	text "3F: TM Shop"

	para "Make Your #mon"
	line "Stronger!"
	done

CeladonDeptStore3FDelinquentText:
	text "TMs are great!"

	para "They make my"
	line "#mon stronger!"

	para "Weaklings don't"
	line "stand a chance!"
	done

CeladonDeptStore3FRoughneckText:
	text "Those two are so"
	line "absorbed in their"
	cont "games that they"
	cont "don't even notice"
	cont "us."

	para "Kids these days!"
	done

CeladonDeptStore3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, CELADON_DEPT_STORE_2F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_4F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore3FElevatorButton

	db 7 ; object events
	object_event  7,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FClerkScript, -1
	object_event  6,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGrampsScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  9,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid1Script, -1
	object_event 10,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid2Script, -1
	object_event 13,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FSuperNerdScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  7,  5, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 1, 1, 0, 0, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FDelinquentScript, EVENT_SAFFRON_CITY_FEDS
	object_event 10,  4, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FRoughneckScript, EVENT_SAFFRON_CITY_FEDS
