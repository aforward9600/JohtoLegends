	object_const_def ; object_event constants
	const SILVERCAVEMEWROOM_MEW
	const SILVERCAVEMEWROOM_ROCK1
	const SILVERCAVEMEWROOM_ROCK2
	const SILVERCAVEMEWROOM_ROCK3
	const SILVERCAVEMEWROOM_ROCK4
	const SILVERCAVEMEWROOM_ROCK5

SilverCaveMewRoom_MapScripts:
	db 3 ; scene scripts
	scene_script .MewAppears  ; SCENE_MEW_APPEARS
	scene_script .DummyScene0 ; SCENE_MEW_PLAYS
	scene_script .DummyScene1 ; SCENE_MEW_GONE

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MewDisappears

.MewDisappears:
	disappear SILVERCAVEMEWROOM_MEW
	return

.MewAppears:
	prioritysjump .MewAppears2
	end

.MewAppears2:
	applymovement PLAYER, PlayerMovesTowardMew
	pause 15
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	pause 15
	turnobject PLAYER, RIGHT
	pause 15
	cry MEW
	pause 30
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	pause 15
	appear SILVERCAVEMEWROOM_MEW
	turnobject SILVERCAVEMEWROOM_MEW, DOWN
	pause 15
	cry MEW
	pause 45
	applymovement SILVERCAVEMEWROOM_MEW, MewCirclesMovement
	applymovement SILVERCAVEMEWROOM_MEW, MewCirclesMovement
	applymovement SILVERCAVEMEWROOM_MEW, MewCirclesMovement
	applymovement SILVERCAVEMEWROOM_MEW, MewCirclesMovement
	turnobject SILVERCAVEMEWROOM_MEW, DOWN
	pause 30
	cry MEW
	pause 30
	applymovement SILVERCAVEMEWROOM_MEW, MewSpinsMovement
	applymovement SILVERCAVEMEWROOM_MEW, MewSpinsMovement
	applymovement SILVERCAVEMEWROOM_MEW, MewSpinsMovement
	disappear SILVERCAVEMEWROOM_MEW
	setscene SCENE_MEW_PLAYS
	return

.DummyScene0:
	end

.DummyScene1:
	end

MewScript:
	faceplayer
	opentext
	writetext MewCry
	pause 15
	cry MEW
	waitbutton
	closetext
	loadwildmon MEW, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear SILVERCAVEMEWROOM_MEW
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtMew
	setevent EVENT_BEAT_MEW
	end

.CaughtMew:
	setevent EVENT_CAUGHT_MEW
	end

.NotBeaten:
	reloadmapafterbattle
	end

SilverCaveRock:
	opentext
	checkevent EVENT_CAUGHT_MEW
	iftrue .AlreadyCaughtMew
	checkevent EVENT_BEAT_MEW
	iftrue .MewIsGoneAgain
	checkscene
	ifequal SCENE_MEW_GONE, .MewIsGone
	writetext IsMewHereText
	yesorno
	iffalse .DidntDecide
	random 5
	ifequal 0, .NotHere
	ifequal 1, .NotHere
	ifequal 2, .MewIsHere
	ifequal 3, .NotHere
	ifequal 4, .NotHere

.MewIsHere:
	closetext
	playsound SFX_ELEVATOR_END
	waitsfx
	pause 15
	cry MEW
	pause 15
	appear SILVERCAVEMEWROOM_MEW
	setscene SCENE_MEW_GONE
	end

.NotHere:
	playsound SFX_WRONG
	pause 15
	waitsfx
.MewIsGone:
	writetext MewSeemsGoneText
	waitbutton
	closetext
	setscene SCENE_MEW_GONE
	end

.AlreadyCaughtMew:
	writetext MewIsCaughtText
	waitbutton
	closetext
	end

.MewIsGoneAgain:
	writetext MewIsGoneAgainText
	waitbutton
.DidntDecide:
	closetext
	end

PlayerMovesTowardMew:
	step UP
	step_end

MewCirclesMovement:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step RIGHT
	step_end

MewSpinsMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

MewCry:
	text "Mew: Mew!"
	done

IsMewHereText:
	text "Is Mew here?"
	done

MewSeemsGoneText:
	text "Seems like Mew is"
	line "gone for now…"
	done

MewIsGoneAgainText:
	text "Mew is gone…"
	done

MewIsCaughtText:
	text "You've already"
	line "caught Mew."
	done

SilverCaveMewRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  7, SILVER_CAVE_SUMMIT_OUTSIDE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  5,  5, SPRITE_MEW_WALK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MewScript, EVENT_MT_SILVER_MEW
	object_event  3,  3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCaveRock, -1
	object_event  3,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCaveRock, -1
	object_event  5,  3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCaveRock, -1
	object_event  7,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCaveRock, -1
	object_event  7,  3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCaveRock, -1
