	object_const_def ; object_event constants
	const SEAFOAMISLAND1F_BOULDER1
	const SEAFOAMISLAND1F_BOULDER2

SeafoamIsland1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable1F

.SetUpStoneTable1F:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable

.StoneTable:
	stonetable 6, SEAFOAMISLAND1F_BOULDER1, .Boulder1
	stonetable 7, SEAFOAMISLAND1F_BOULDER2, .Boulder2
	db -1 ; end

.Boulder1:
	disappear SEAFOAMISLAND1F_BOULDER1
	clearevent EVENT_SEAFOAM_ISLAND_BOULDER_B1F_1
	sjump .Fall

.Boulder2:
	disappear SEAFOAMISLAND1F_BOULDER2
	clearevent EVENT_SEAFOAM_ISLAND_BOULDER_B1F_2
	sjump .Fall

.Fall:
	pause 30
	scall .FX
	opentext
	writetext SeafoamIsland1FBoulderFellText
	waitbutton
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end

SeafoamIsland1FBoulder:
	jumpstd strengthboulder

SeafoamIsland1FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

SeafoamIsland1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 26, 15, ROUTE_20, 1
	warp_event  4, 15, ROUTE_20, 3
	warp_event  7,  5, SEAFOAM_ISLAND_B1F, 1
	warp_event 25,  3, SEAFOAM_ISLAND_B1F, 2
	warp_event 23, 15, SEAFOAM_ISLAND_B1F, 3
	warp_event 17,  6, SEAFOAM_ISLAND_B1F, 7
	warp_event 25,  6, SEAFOAM_ISLAND_B1F, 8

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 15, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIsland1FBoulder, EVENT_SEAFOAM_ISLAND_BOULDER_1F_1
	object_event 24,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIsland1FBoulder, EVENT_SEAFOAM_ISLAND_BOULDER_1F_2
