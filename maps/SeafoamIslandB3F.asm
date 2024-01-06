	object_const_def ; object_event constants
	const SEAFOAMISLANDB3F_BOULDER1
	const SEAFOAMISLANDB3F_BOULDER2
	const SEAFOAMISLANDB3F_BOULDER3
	const SEAFOAMISLANDB3F_BOULDER4
	const SEAFOAMISLANDB3F_BOULDER5
	const SEAFOAMISLANDB3F_BOULDER6

SeafoamIslandB3F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, SetUpStoneTableB3F
	callback MAPCALLBACK_TILES, SeafoamIslandB3FFastCurrent

SeafoamIslandB3FFastCurrent:
	checkevent EVENT_SEAFOAM_ISLAND_BOULDER_B3F_FALLEN
	iftrue .CalmB3FWaterCallback
	iffalse .CheckBoulder
	return

.CalmB3FWaterCallback:
	changeblock 18,  6, $4d
	changeblock 18,  8, $4d
	changeblock 18, 10, $4d
	changeblock 18, 12, $4d
	changeblock 20, 12, $4d
	changeblock 14, 10, $4d
	changeblock 22, 12, $4d
	return

.CheckBoulder:
	checkevent EVENT_SEAFOAM_ISLAND_BOULDER_B3F_1
	iftrue .NeedBoulder3F
	checkevent EVENT_SEAFOAM_ISLAND_BOULDER_B3F_2
	iftrue .NeedBoulder3F
.CalmB3FWater:
	changeblock 18,  6, $4d
	changeblock 18,  8, $4d
	changeblock 18, 10, $4d
	changeblock 18, 12, $4d
	changeblock 20, 12, $4d
	changeblock 14, 10, $4d
	changeblock 22, 12, $4d
	reloadmappart
	setevent EVENT_SEAFOAM_ISLAND_BOULDER_B3F_FALLEN
.NeedBoulder3F:
	return

SetUpStoneTableB3F:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable

.StoneTable:
	stonetable 10, SEAFOAMISLANDB3F_BOULDER3, .Boulder1
	stonetable 11, SEAFOAMISLANDB3F_BOULDER4, .Boulder2
	db -1 ; end

.Boulder1:
	disappear SEAFOAMISLANDB3F_BOULDER3
	clearevent EVENT_SEAFOAM_ISLAND_BOULDER_B4F_1
	sjump .Fall

.Boulder2:
	disappear SEAFOAMISLANDB3F_BOULDER4
	clearevent EVENT_SEAFOAM_ISLAND_BOULDER_B4F_2
	sjump .Fall

.Fall:
	pause 30
	scall .FX
	opentext
	writetext SeafoamIslandB3FBoulderFellText
	waitbutton
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end

SeafoamIslandB3FBoulder:
	jumpstd strengthboulder

SeafoamIslandB3FBoulderWater:
	jumptext SeafoamIslandB3FBoulderWaterText

SeafoamIslandB3FBoulderWaterText:
	text "It looks like this"
	line "boulder isn't going"
	cont "anywhere now!"
	done

SeafoamIslandB3FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

SeafoamIslandB3F_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  5, 13, SEAFOAM_ISLAND_B2F, 4
	warp_event 25,  3, SEAFOAM_ISLAND_B2F, 5
	warp_event 25, 15, SEAFOAM_ISLAND_B2F, 6
	warp_event  9,  9, SEAFOAM_ISLAND_B4F, 1
	warp_event 25,  5, SEAFOAM_ISLAND_B4F, 2
	warp_event 18,  7, SEAFOAM_ISLAND_B2F, 9
	warp_event 19,  7, SEAFOAM_ISLAND_B2F, 10
	warp_event 20, 15, SEAFOAM_ISLAND_B4F, 3
	warp_event 21, 15, SEAFOAM_ISLAND_B4F, 4
	warp_event  3, 18, SEAFOAM_ISLAND_B4F, 5
	warp_event  6, 18, SEAFOAM_ISLAND_B4F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 18,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB3FBoulderWater, EVENT_SEAFOAM_ISLAND_BOULDER_B3F_1
	object_event 19,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB3FBoulderWater, EVENT_SEAFOAM_ISLAND_BOULDER_B3F_2
	object_event  2, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB3FBoulder, EVENT_SEAFOAM_ISLAND_BOULDER_B3F_3
	object_event  8, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB3FBoulder, EVENT_SEAFOAM_ISLAND_BOULDER_B3F_4
	object_event  9, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB3FBoulder, -1
	object_event  4, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB3FBoulder, -1
