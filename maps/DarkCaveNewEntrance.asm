	object_const_def ; object_event constants
	const DARKCAVENEWENTRANCE_HIKER

DarkCaveNewEntrance_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_BEAT_MASTER
	iftrue .Done
	changeblock  6,  2, $2a ; rock
	changeblock  8,  2, $1d ; rock
	changeblock  8,  4, $05 ; rock
.Done:
	return

DarkCaveNewEntranceHikerScript:
	faceplayer
	opentext
	writetext DarkCaveNewEntranceHikerText1
	waitbutton
	closetext
	turnobject DARKCAVENEWENTRANCE_HIKER, RIGHT
	end

DarkCaveNewEntranceHikerText1:
	text "Hey! Get out of"
	line "here!"

	para "Can't ya see I'm"
	line "working here? The"
	cont "cave-in was"
	cont "devastating,"

	para "#mon were"
	line "disturbed from"
	cont "their sleep, I had"
	cont "to use a flash-"

	para "light to see in"
	line "here, it's damp,"
	cont "it's cold, there's"

	para "so many Zubats in"
	line "here, the"
	cont "Teddiursa are"
	cont "trying to find"

	para "find food on me,"
	line "the Wynaut just"
	cont "stand there and"
	cont "stare at me,"

	para "waiting for me to"
	line "do something, I"
	cont "can't tell the"
	cont "difference bet-"

	para "ween a rock and a"
	line "Geodude until it's"
	cont "already hitting"
	cont "me, I'm tired, I'm"

	para "hungry, and I want"
	line "to go home! Stay"
	cont "out of my way!"
	done

DarkCaveNewEntrance_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  3, ROUTE_45, 1
	warp_event  9,  3, DARK_CAVE_BLACKTHORN_ENTRANCE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveNewEntranceHikerScript, -1
