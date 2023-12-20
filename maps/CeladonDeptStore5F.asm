	object_const_def ; object_event constants
	const CELADONDEPTSTORE5F_CLERK1
	const CELADONDEPTSTORE5F_CLERK2
	const CELADONDEPTSTORE5F_GENTLEMAN
	const CELADONDEPTSTORE5F_SAILOR
	const CELADONDEPTSTORE5F_TEACHER
	const CELADONDEPTSTORE5F_DELINQUENT
	const CELADONDEPTSTORE5F_BIKER
	const CELADONDEPTSTORE5F_ROUGHNECK

CeladonDeptStore5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore5FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_1
	closetext
	end

CeladonDeptStore5FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_2
	closetext
	end

CeladonDeptStore5FGentlemanScript:
	jumptextfaceplayer CeladonDeptStore5FGentlemanText

CeladonDeptStore5FSailorScript:
	jumptextfaceplayer CeladonDeptStore5FSailorText

CeladonDeptStore5FTeacherScript:
	jumptextfaceplayer CeladonDeptStore5FTeacherText

CeladonDeptStore5FBikerScript:
	jumptextfaceplayer CeladonDeptStore5FBikerText

CeladonDeptStore5FDelinquentScript:
	jumptextfaceplayer CeladonDeptStore5FDelinquentText

CeladonDeptStore5FRoughneckScript:
	jumptextfaceplayer CeladonDeptStore5FRoughneckText

CeladonDeptStore5FDirectory:
	jumptext CeladonDeptStore5FDirectoryText

CeladonDeptStore5FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore5FGentlemanText:
	text "Back in my day,"
	line "vitamins didn't"
	cont "cost so much!"

	para "Darn inflation!"

	para "Let's hope we can"
	line "get it under"
	cont "control with those"
	cont "ruffians gone."
	done

CeladonDeptStore5FSailorText:
	text "Have you found any"
	line "PP Up?"

	para "I'd love to buy"
	line "some, but you can't"
	cont "find it anywhere…"
	done

CeladonDeptStore5FTeacherText:
	text "You want to raise"
	line "your #mon's"
	cont "happiness easily?"

	para "Use vitamins on"
	line "them."

	para "The more you use"
	line "them, the less"
	cont "effective they"
	cont "become, I'm afraid…"
	done

CeladonDeptStore5FBikerText:
	text "I'm gonna jack my"
	line "#mon up with so"
	cont "many drugs!"

	para "It'll be great!"
	done

CeladonDeptStore5FRoughneckText:
	text "I don't have enough"
	line "money for the"
	cont "vitamins…"

	para "…Wait, I can just"
	line "steal them!"
	done

CeladonDeptStore5FDelinquentText:
	text "These floors are"
	line "so tacky!"

	para "Who picks yellow"
	line "for their floor?"

	para "People with no"
	line "taste, that's who!"
	done

CeladonDeptStore5FDirectoryText:
	text "5F: Drug Store"
	done

CeladonDeptStore5F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, CELADON_DEPT_STORE_4F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_6F, 1
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore5FElevatorButton

	db 8 ; object events
	object_event  7,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FClerk1Script, -1
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FClerk2Script, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FGentlemanScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  3,  4, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FSailorScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  1,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FTeacherScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 12,  6, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FDelinquentScript, EVENT_SAFFRON_CITY_FEDS
	object_event  3,  5, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FBikerScript, EVENT_SAFFRON_CITY_FEDS
	object_event  8,  1, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FRoughneckScript, EVENT_SAFFRON_CITY_FEDS
