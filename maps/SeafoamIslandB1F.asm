	object_const_def ; object_event constants
	const SEAFOAMISLANDB1F_BOULDER1
	const SEAFOAMISLANDB1F_BOULDER2

SeafoamIslandB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTableB1F

.SetUpStoneTableB1F:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable

.StoneTable:
	stonetable 9, SEAFOAMISLANDB1F_BOULDER1, .Boulder1
	stonetable 10, SEAFOAMISLANDB1F_BOULDER2, .Boulder2
	db -1 ; end

.Boulder1:
	disappear SEAFOAMISLANDB1F_BOULDER1
	clearevent EVENT_SEAFOAM_ISLAND_BOULDER_B2F_1
	sjump .Fall

.Boulder2:
	disappear SEAFOAMISLANDB1F_BOULDER2
	clearevent EVENT_SEAFOAM_ISLAND_BOULDER_B2F_2
	sjump .Fall

.Fall:
	pause 30
	scall .FX
	opentext
	writetext SeafoamIslandB1FBoulderFellText
	waitbutton
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end

SeafoamIslandB1FBoulder:
	jumpstd strengthboulder

SeafoamIslandB1FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

SeafoamIslandB1F_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  9,  7, SEAFOAM_ISLAND_1F, 3
	warp_event 27,  5, SEAFOAM_ISLAND_1F, 4
	warp_event 25, 17, SEAFOAM_ISLAND_1F, 5
	warp_event  7,  5, SEAFOAM_ISLAND_B2F, 1
	warp_event 15,  9, SEAFOAM_ISLAND_B2F, 2
	warp_event 21, 17, SEAFOAM_ISLAND_B2F, 3
	warp_event 19,  9, SEAFOAM_ISLAND_1F, 6
	warp_event 26,  8, SEAFOAM_ISLAND_1F, 7
	warp_event 20,  7, SEAFOAM_ISLAND_B2F, 7
	warp_event 24,  7, SEAFOAM_ISLAND_B2F, 8
	warp_event 27, 13, SEAFOAM_ISLAND_B2F, 11

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 20, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB1FBoulder, EVENT_SEAFOAM_ISLAND_BOULDER_B1F_1
	object_event 25,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB1FBoulder, EVENT_SEAFOAM_ISLAND_BOULDER_B1F_2
