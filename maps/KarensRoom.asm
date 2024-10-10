	object_const_def ; object_event constants
	const KARENSROOM_AGATHA

KarensRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AgathasRoomDoors

.LockDoor:
	prioritysjump .AgathasDoorLocksBehindYou
	end

.DummyScene:
	end

.AgathasRoomDoors:
	checkevent EVENT_AGATHAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_AGATHAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $7c ; open door
.KeepExitClosed:
	return

.AgathasDoorLocksBehindYou:
	applymovement PLAYER, AgathasRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_AGATHAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

AgathaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_AGATHA
	iftrue AgathaScript_AfterBattle
	checkevent EVENT_COMPLETED_EPILOGUE
	iftrue AgathaRematch
	writetext AgathaScript_AgathaBeforeText
	waitbutton
	closetext
AgathaBattle:
	winlosstext AgathaScript_AgathaBeatenText, AgathaLastMonText
	loadtrainer AGATHA, AGATHA1
AgathaReconvene:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_AGATHA
	setevent EVENT_DECO_CARPET_1
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue AgathaRematchBeaten
	writetext AgathaScript_AgathaDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $7c ; open door
	reloadmappart
	closetext
	setevent EVENT_AGATHAS_ROOM_EXIT_OPEN
	waitsfx
	end

AgathaRematch:
	writetext AgathaScript_AgathaBeforeText2
	waitbutton
	closetext
	winlosstext AgathaScript_AgathaBeatenText, AgathaLastMonText
	loadtrainer AGATHA, AGATHA2
	sjump AgathaReconvene

AgathaScript_AfterBattle:
	writetext AgathaScript_AgathaDefeatText
	waitbutton
	closetext
	end

AgathaRematchBeaten:
	writetext AgathaScript_AgathaDefeatText2
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $7c ; open door
	reloadmappart
	closetext
	setevent EVENT_AGATHAS_ROOM_EXIT_OPEN
	waitsfx
	end

AgathasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_resume

AgathaLastMonText:
	text "Can it be?"

	para "One as strong as"
	line "he was?"
	done

AgathaScript_AgathaBeforeText:
	text "I am Agatha of the"
	line "Elite Four."

	para "I'm the strongest"
	line "member, since I've"
	cont "been here the"
	cont "longest."

	para "I'm a master of"
	line "tricky #mon."

	para "You can never tell"
	line "what the next move"
	cont "will be."

	para "There was once a"
	line "trainer tougher"
	cont "than me, but he"
	cont "retired not too"
	cont "long ago."

	para "He was once tough"
	line "and handsome, but"
	cont "that was years"
	cont "ago."

	para "Now he just wants"
	line "to fiddle around"
	cont "with research."

	para "He's wrong! #mon"
	line "are for battling."
	cont "I'll teach this"
	cont "to you!"
	done

AgathaScript_AgathaBeatenText:
	text "You remind me of"
	line "him in his prime."
	cont "A fierce trainer."
	done

AgathaScript_AgathaDefeatText:
	text "Well done, young"
	line "one."

	para "It takes guts and"
	line "brains to take me"
	cont "on. Now you're the"
	cont "Champion!"

	para "Or at least you"
	line "would have been,"
	cont "if you were a"

	para "little quicker."
	line "Someone else beat"
	cont "you to it."

	para "Go on into the"
	line "next room, and"
	cont "see for yourself"

	para "what kind of"
	line "trainer you'll"
	cont "face."
	done

AgathaScript_AgathaBeforeText2:
	text "Agatha: Back again"
	line "are you?"

	para "The reigning Champ"
	line "coming to defend"
	cont "the title?"

	para "Let's see if you've"
	line "still got what it"
	cont "takes!"
	done

AgathaScript_AgathaDefeatText2:
	text "Agatha: You're"
	line "really something,"
	cont "child!"

	para "You'd give Oak a"
	line "run for his money"
	cont "if he was still in"
	cont "his prime!"

	para "Go on!"

	para "Your challenger"
	line "should arrive"
	cont "shortly,"

	para "and then the real"
	line "challenge begins!"
	done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AgathaScript_Battle, -1
