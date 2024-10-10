	object_const_def ; object_event constants
	const KOGASROOM_GEN_SURGE

KogasRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SurgesRoomDoors

.LockDoor:
	prioritysjump .SurgesDoorLocksBehindYou
	end

.DummyScene:
	end

.SurgesRoomDoors:
	checkevent EVENT_GEN_SURGES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_GEN_SURGES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $7a ; open door
.KeepExitClosed:
	return

.SurgesDoorLocksBehindYou:
	applymovement PLAYER, SurgesRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_GEN_SURGES_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

SurgeScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_GEN_SURGE
	iftrue SurgeScript_AfterBattle
	checkevent EVENT_COMPLETED_EPILOGUE
	iftrue SurgeRematch
	writetext SurgeScript_SurgeBeforeText
	waitbutton
	closetext
SurgeBattle:
	winlosstext SurgeScript_SurgeBeatenText, GeneralSurgeLastMonText
	loadtrainer GEN_SURGE, GEN_SURGE1
SurgeReconvene:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_GEN_SURGE
	setevent EVENT_DECO_PIKACHU_DOLL
	opentext
	writetext SurgeScript_SurgeDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $7a ; open door
	reloadmappart
	closetext
	setevent EVENT_GEN_SURGES_ROOM_EXIT_OPEN
	waitsfx
	end

Surge2:
	winlosstext SurgeScript_SurgeBeatenText, GeneralSurgeLastMonText
	loadtrainer GEN_SURGE, GEN_SURGE2
	sjump SurgeReconvene

SurgeRematch:
	writetext SurgeScript_SurgeBeforeText2
	waitbutton
	closetext
	sjump Surge2

SurgeScript_AfterBattle:
	writetext SurgeScript_SurgeDefeatText
	waitbutton
	closetext
	end

SurgesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_resume

GeneralSurgeLastMonText:
	text "Don't give up 'til"
	line "you see the whites"
	cont "of their eyes!"
	done

SurgeScript_SurgeBeforeText:
	text "Attention…"
	line "At ease!"

	para "I am General Surge"
	line "of the Elite Four."

	para "After the war, the"
	line "League was impres-"
	cont "sed with my skill,"

	para "and gave me this"
	line "position."

	para "I may be retired"
	line "from the military,"
	cont "but my skills are"

	para "still just as"
	line "sharp as they were"
	cont "during war."

	para "My son followed in"
	line "my footsteps, and"
	cont "hopes to be better"
	cont "than me someday."

	para "I'll let him keep"
	line "dreaming. Hahaha!"

	para "Jokes aside, it's"
	line "time for you to"
	cont "face my electrif-"
	cont "ying #mon!"
	done

SurgeScript_SurgeBeatenText:
	text "A job well done."
	done

SurgeScript_SurgeDefeatText:
	text "That battle will"
	line "go down in the"
	cont "history books!"

	para "Just like the"
	line "battle of Seafoam"
	cont "where I…"

	para "…Ah, nevermind."

	para "That's not"
	line "important now."

	para "Go on, the"
	line "next member is"
	cont "waiting."
	done

SurgeScript_SurgeBeforeText2:
	text "Surge: Attention…"
	line "At ease!"

	para "You're returned,"
	line "<PLAYER>!"

	para "I knew you'd be"
	line "back!"

	para "You've got the"
	line "heart of a warrior"
	cont "in you!"

	para "Let me see your"
	line "war face!"
	done

KogasRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_GEN_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SurgeScript_Battle, -1
