	object_const_def ; object_event constants
	const SEAFOAMISLANDB2F_BOULDER1
	const SEAFOAMISLANDB2F_BOULDER2

SeafoamIslandB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTableB2F

.SetUpStoneTableB2F:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable

.StoneTable:
	stonetable 9, SEAFOAMISLANDB2F_BOULDER1, .Boulder1
	stonetable 10, SEAFOAMISLANDB2F_BOULDER2, .Boulder2
	db -1 ; end

.Boulder1:
	disappear SEAFOAMISLANDB2F_BOULDER1
	clearevent EVENT_SEAFOAM_ISLAND_BOULDER_B3F_1
	sjump .Fall

.Boulder2:
	disappear SEAFOAMISLANDB2F_BOULDER2
	clearevent EVENT_SEAFOAM_ISLAND_BOULDER_B3F_2
	sjump .Fall

.Fall:
	pause 30
	scall .FX
	opentext
	writetext SeafoamIslandB2FBoulderFellText
	waitbutton
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end

SeafoamIslandB2FBoulder:
	jumpstd strengthboulder

SeafoamIslandB2FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

SeafoamIslandB2F_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  7,  5, SEAFOAM_ISLAND_B1F, 4
	warp_event 15,  9, SEAFOAM_ISLAND_B1F, 5
	warp_event 21, 17, SEAFOAM_ISLAND_B1F, 6
	warp_event  7, 15, SEAFOAM_ISLAND_B3F, 1
	warp_event 27,  5, SEAFOAM_ISLAND_B3F, 2
	warp_event 27, 15, SEAFOAM_ISLAND_B3F, 3
	warp_event 18,  9, SEAFOAM_ISLAND_B1F, 9
	warp_event 26, 10, SEAFOAM_ISLAND_B1F, 10
	warp_event 21,  8, SEAFOAM_ISLAND_B3F, 6
	warp_event 24,  8, SEAFOAM_ISLAND_B3F, 7
	warp_event 27, 13, SEAFOAM_ISLAND_B1F, 11

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 19,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB2FBoulder, EVENT_SEAFOAM_ISLAND_BOULDER_B2F_1
	object_event 27,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB2FBoulder, EVENT_SEAFOAM_ISLAND_BOULDER_B2F_2
