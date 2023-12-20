	object_const_def ; object_event constants
	const CELADONDEPTSTORE4F_CLERK
	const CELADONDEPTSTORE4F_SUPER_NERD
	const CELADONDEPTSTORE4F_YOUNGSTER
	const CELADONDEPTSTORE4F_BIKER
	const CELADONDEPTSTORE4F_ROUGHNECK

CeladonDeptStore4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore4FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_4F
	closetext
	end

CeladonDeptStore4FSuperNerdScript:
	jumptextfaceplayer CeladonDeptStore4FSuperNerdText

CeladonDeptStore4FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore4FYoungsterText

CeladonDeptStore4FBikerScript:
	jumptextfaceplayer CeladonDeptStore4FBikerText

CeladonDeptStore4FRoughneckScript:
	jumptextfaceplayer CeladonDeptStore4FRoughneckText

CeladonDeptStore4FDirectory:
	jumptext CeladonDeptStore4FDirectoryText

CeladonDeptStore4FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore4FSuperNerdText:
	text "Sending Mail is so"
	line "interesting, isn't"
	cont "it?"

	para "Even with phones,"
	line "we still send"
	cont "letters."

	para "Truly fascinating!"
	done

CeladonDeptStore4FYoungsterText:
	text "You can buy Lovely"
	line "Mail here, but I"
	cont "don't really care."
	done

CeladonDeptStore4FDirectoryText:
	text "Express Yourself"
	line "With Gifts!"

	para "4F: Wiseman Gifts"
	done

CeladonDeptStore4FBikerText:
	text "Mail? What would I"
	line "want with mail?"

	para "Could I blackmail"
	line "with it?"

	para "Maybe I should get"
	line "some."
	done

CeladonDeptStore4FRoughneckText:
	text "Wiseman's Gifts?"

	para "More like Wise"
	line "Guys, am I right?"
	done

CeladonDeptStore4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, CELADON_DEPT_STORE_5F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_3F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore4FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore4FElevatorButton

	db 5 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore4FClerkScript, -1
	object_event  7,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore4FSuperNerdScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  8,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore4FYoungsterScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  1,  3, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore4FBikerScript, EVENT_SAFFRON_CITY_FEDS
	object_event  4,  7, SPRITE_ROUGHNECK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore4FRoughneckScript, EVENT_SAFFRON_CITY_FEDS
