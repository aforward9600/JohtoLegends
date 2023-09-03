	object_const_def ; object_event constants

CinnabarVolcano1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CinnabarVolcano1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9, 17, POKEMON_MANSION_B1F, 2
	warp_event  9,  3, CINNABAR_VOLCANO_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
