	object_const_def ; object_event constants
	const DARKCAVENEWENTRANCE_HIKER
	const DARKCAVENEWENTRANCE_POKE_BALL

DarkCaveNewEntrance_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_SPOKE_WITH_ELM
	iftrue .Done
	changeblock  6,  2, $2a ; rock
	changeblock  8,  2, $1d ; rock
	changeblock  8,  4, $05 ; rock
.Done:
	return

DarkCaveNewEntranceHikerScript:
	faceplayer
	opentext
	checkevent EVENT_SPOKE_WITH_ELM
	iftrue .DarkCaveRocksCleared
	writetext DarkCaveNewEntranceHikerText1
	waitbutton
	closetext
	turnobject DARKCAVENEWENTRANCE_HIKER, RIGHT
	end

.DarkCaveRocksCleared:
	writetext DarkCaveNewEntranceHikerText2
	waitbutton
	closetext
	end

DarkCaveNewEntrancePotion:
	itemball POTION

DarkCaveNewEntranceHikerText1:
	text "Hey! Get out of"
	line "here!"

	para "Can't ya see I'm"
	line "working here? The"
	cont "cave-in was"
	cont "devastating."

	para "#mon were"
	line "disturbed from"
	cont "their sleep. I"
	cont "have to use a fla-"

	para "shlight to see in"
	line "here, it's damp,"
	cont "it's cold, there's"

	para "so many Zubats in"
	line "here, the"
	cont "Teddiursa are"
	cont "trying to find"

	para "food on me, the"
	line "Wynaut just stand"
	cont "there and stare"
	cont "at me,"

	para "waiting for me to"
	line "do something. I'm"
	cont "tired, I'm hungry,"

	para "and I want to go"
	line "home! Stay out of"
	cont "my way!"
	done

DarkCaveNewEntranceHikerText2:
	text "Sorry if I yelled"
	line "at ya before."

	para "Working in this"
	line "place has been a"
	cont "nightmare, but it's"
	cont "all good now!"

	para "Now I can get out"
	line "of YAAAAARGH!"

	para "Dang Geodudes"
	line "tripping me!"
	done

DarkCaveNewEntrance_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  3, ROUTE_45, 1
	warp_event  9,  3, DARK_CAVE_BLACKTHORN_ENTRANCE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveNewEntranceHikerScript, -1
	object_event  2,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveNewEntrancePotion, EVENT_DARK_CAVE_NEW_ENTRANCE_POTION

