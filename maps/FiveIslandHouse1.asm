	object_const_def ; object_event constants
	const FIVEISLANDHOUSE1_YOUNGSTER
	const FIVEISLANDHOUSE1_TEACHER

FiveIslandHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FiveIslandHouse1YoungsterScript:
	jumptextfaceplayer FiveIslandHouse1YoungsterText

FiveIslandHouse1TeacherScript:
	jumptextfaceplayer FiveIslandHouse1TeacherText

FiveIslandHouse1YoungsterText:
	text "Selphy is so mean!"
	done

FiveIslandHouse1TeacherText:
	text "The young girl in"
	line "the house north of"
	cont "here can be quite"
	cont "a handful."
	done

FiveIslandHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FIVE_ISLAND, 4
	warp_event  5,  7, FIVE_ISLAND, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FiveIslandHouse1YoungsterScript, -1
	object_event  6,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FiveIslandHouse1TeacherScript, -1
