	object_const_def ; object_event constants
	const BRUNOSROOM_MARTHA

BrunosRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .MarthasRoomDoors

.LockDoor:
	prioritysjump .MarthasDoorLocksBehindYou
	end

.DummyScene:
	end

.MarthasRoomDoors:
	checkevent EVENT_MARTHAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_MARTHAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $7b ; open door
.KeepExitClosed:
	return

.MarthasDoorLocksBehindYou:
	applymovement PLAYER, MarthasRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_MARTHAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

MarthaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_MARTHA
	iftrue MarthaScript_AfterBattle
	writetext MarthaScript_MarthaBeforeText
	waitbutton
	closetext
	winlosstext MarthaScript_MarthaBeatenText, 0
	loadtrainer MARTHA, MARTHA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_MARTHA
	opentext
	writetext MarthaScript_MarthaDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $7b ; open door
	reloadmappart
	closetext
	setevent EVENT_MARTHAS_ROOM_EXIT_OPEN
	waitsfx
	end

MarthaScript_AfterBattle:
	writetext MarthaScript_MarthaDefeatText
	waitbutton
	closetext
	end

MarthasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MarthaScript_MarthaBeforeText:
	text "Howdy! Err...I"
	line "mean..."

	para "Greetings. I am"
	line "Martha of the"
	cont "Elite Four."

	para "It is an honor to"
	line "to meet you. My"
	cont "brother, Milton,"
	cont "told me about you."

	para "I can't wait to"
	line "see how strong you"
	cont "you are!...I mean,"

	para "I uh...Ah forget"
	line "this prim and"
	cont "proper nonsense!"

	para "I was never really"
	line "good at acting all"
	cont "lady-like! My up-"

	para "bringing would"
	line "have you believe"
	cont "that I'm fancy,"

	para "but that's never"
	line "been my thing! I"
	cont "always wanted to"

	para "get my hands dirty"
	line "like my brother!"
	cont "So, enough with"

	para "the formalities! I"
	line "accept your"
	cont "challenge!"
	done

MarthaScript_MarthaBeatenText:
	text "Well I'll be! He"
	line "wasn't lying!"
	done

MarthaScript_MarthaDefeatText:
	text "Well done there!"
	line "my brother was"
	cont "right about you!"

	para "If I ever have any"
	line "children, I would"
	cont "raise them to be"

	para "like you, not the"
	line "way I was raised."

	para "Go on, the last"
	line "Elite Four member"
	cont "is waiting."

	done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_MARTHA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MarthaScript_Battle, -1
