	object_const_def ; object_event constants
	const CELADONDEPTSTORE2F_CLERK1
	const CELADONDEPTSTORE2F_CLERK2
	const CELADONDEPTSTORE2F_LASS
	const CELADONDEPTSTORE2F_POKEFAN_F
	const CELADONDEPTSTORE2F_ROUGHNECK
	const CELADONDEPTSTORE2F_BIKER

CeladonDeptStore2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_2F_1
	closetext
	end

CeladonDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_2F_2
	closetext
	end

CeladonDeptStore2FPokefanFScript:
	jumptextfaceplayer CeladonDeptStore2FPokefanFText

CeladonDeptStore2FLassScript:
	jumptextfaceplayer CeladonDeptStore2FLassText

CeladonDeptStore2FDirectory:
	jumptext CeladonDeptStore2FDirectoryText

CeladonDeptStore2FBikerScript:
	jumptextfaceplayer CeladonDeptStore2FBikerText

CeladonDeptStore2FRoughneckScript:
	jumptextfaceplayer CeladonDeptStore2FRoughneckText

CeladonDeptStore2FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore2FLassText:
	text "Hm, what to buy?"
	done

CeladonDeptStore2FPokefanFText:
	text "I'm so glad that I"
	line "get to take my"
	cont "girl shopping"
	cont "again after so"
	cont "long!"
	done

CeladonDeptStore2FDirectoryText:
	text "Top Grade Items"
	line "for Trainers!"

	para "2F: Trainer's"
	line "    Market"
	done

CeladonDeptStore2FBikerText:
	text "Gotta stock up on"
	line "items!"

	para "Need to keep my"
	line "#mon in good"
	cont "shape for bullying"
	cont "some nerds!"
	done

CeladonDeptStore2FRoughneckText:
	text "Eh, nothing I"
	line "really need to"
	cont "shoplift today."
	done

CeladonDeptStore2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, CELADON_DEPT_STORE_3F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_1F, 3
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore2FElevatorButton

	db 6 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore2FClerk1Script, -1
	object_event 14,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore2FClerk2Script, -1
	object_event  5,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore2FLassScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  6,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore2FPokefanFScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  5,  5, SPRITE_ROUGHNECK, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore2FRoughneckScript, EVENT_SAFFRON_CITY_FEDS
	object_event 10,  5, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0., -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore2FBikerScript, EVENT_SAFFRON_CITY_FEDS
