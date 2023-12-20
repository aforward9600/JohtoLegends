	object_const_def ; object_event constants
	const CELADONDEPTSTORE1F_RECEPTIONIST
	const CELADONDEPTSTORE1F_GENTLEMAN
	const CELADONDEPTSTORE1F_TEACHER
	const CELADONDEPTSTORE1F_DELINQUENT
	const CELADONDEPTSTORE1F_BIKER

CeladonDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore1FReceptionistScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CeladonDeptStore1FReceptionist2
	jumptextfaceplayer CeladonDeptStore1FReceptionistText2

.CeladonDeptStore1FReceptionist2:
	jumptextfaceplayer CeladonDeptStore1FReceptionistText

CeladonDeptStore1FGentlemanScript:
	jumptextfaceplayer CeladonDeptStore1FGentlemanText

CeladonDeptStore1FTeacherScript:
	jumptextfaceplayer CeladonDeptStore1FTeacherText

CeladonDeptStore1FDirectory:
	jumptext CeladonDeptStore1FDirectoryText

CeladonDeptStore1FBikerScript:
	jumptextfaceplayer CeladonDeptStore1FBikerText

CeladonDeptStore1FDelinquentScript:
	jumptextfaceplayer CeladonDeptStore1FDelinquentText

CeladonDeptStore1FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore1FReceptionistText:
	text "Hello! Welcome to"
	line "Celadon Dept."
	cont "Store!"

	para "The directory is"
	line "on the wall."
	done

CeladonDeptStore1FReceptionistText2:
	text "Please don't hurt"
	line "me!"

	para "…Wait, you're not a"
	line "Fed, are you?"

	para "…Sorry…"
	done

CeladonDeptStore1FGentlemanText:
	text "The Dept. Store is"
	line "finally clear of"
	cont "those thugs!"

	para "Now I can resume"
	line "standing around in"
	cont "a random store!"
	done

CeladonDeptStore1FTeacherText:
	text "Back to shopping!"
	done

CeladonDeptStore1FDirectoryText:
	text "1F: Service"
	line "    Counter"

	para "2F: Trainer's"
	line "    Market"

	para "3F: TM Shop"

	para "4F: Wiseman Gifts"

	para "5F: Drug Store"

	para "6F: Rooftop"
	line "    Square"
	done

CeladonDeptStore1FDelinquentText:
	text "We're under order"
	line "not to trash the"
	cont "Dept. Store."

	para "That's fine. I like"
	line "to steal from here"
	cont "anyway!"
	done

CeladonDeptStore1FBikerText:
	text "I know it's rude to"
	line "ride a bike inside"
	cont "a store!"

	para "That's why I'm doing"
	line "it!"
	done

CeladonDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, CELADON_CITY, 1
	warp_event  8,  7, CELADON_CITY, 1
	warp_event 15,  0, CELADON_DEPT_STORE_2F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore1FElevatorButton

	db 5 ; object events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FReceptionistScript, -1
	object_event 14,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FGentlemanScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  3,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FTeacherScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  6,  4, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FDelinquentScript, EVENT_SAFFRON_CITY_FEDS
	object_event 12,  4, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FBikerScript, EVENT_SAFFRON_CITY_FEDS
