	object_const_def ; object_event constants
	const BURNEDTOWERB1F_RAIKOU1
	const BURNEDTOWERB1F_ENTEI1
	const BURNEDTOWERB1F_SUICUNE1
	const BURNEDTOWERB1F_RAIKOU2
	const BURNEDTOWERB1F_ENTEI2
	const BURNEDTOWERB1F_SUICUNE2
	const BURNEDTOWERB1F_ENOKI

BurnedTowerB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .LadderCallback
	callback MAPCALLBACK_OBJECTS, .EnteiAppears

.DummyScene0:
	end

.DummyScene1:
	end

.LadderCallback:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .HideLadder
	changeblock 6, 14, $02 ; floor
.HideLadder:
	return

.EnteiAppears:
	checkevent EVENT_CAUGHT_ENTEI
	iftrue .EnteiWillNotAppear
	checkevent EVENT_BEAT_ENTEI
	iftrue .EnteiWillNotAppear
	checkevent EVENT_BEAT_LAIR_ARCHER
	iftrue .EnteiMayAppear
.EnteiWillNotAppear:
	disappear BURNEDTOWERB1F_ENTEI1
	return

.EnteiMayAppear:
	appear BURNEDTOWERB1F_ENTEI1
	return

ReleaseTheBeasts:
	playmusic MUSIC_NONE
	pause 30
	opentext
	writetext TheyWontAwakeText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, DOWN
	special FadeOutMusic
	pause 10
	playmusic MUSIC_TIN_TOWER
	appear BURNEDTOWERB1F_ENOKI
	applymovement BURNEDTOWERB1F_ENOKI, EnokiMovement1
	applymovement PLAYER, PlayerMovement1
	turnobject PLAYER, RIGHT
	applymovement BURNEDTOWERB1F_ENOKI, EnokiMovement2
	turnobject PLAYER, UP
	opentext
	writetext RaikouText
	waitbutton
	closetext
	applymovement BURNEDTOWERB1F_ENOKI, EnokiMovement3
	turnobject PLAYER, RIGHT
	opentext
	writetext EnteiText
	waitbutton
	closetext
	applymovement BURNEDTOWERB1F_ENOKI, EnokiMovement4
	turnobject BURNEDTOWERB1F_ENOKI, UP
	turnobject PLAYER, UP
	opentext
	writetext SuicuneText
	waitbutton
	closetext
	applymovement BURNEDTOWERB1F_ENOKI, EnokiMovement5
	turnobject BURNEDTOWERB1F_ENOKI, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext InTheDistantPastText
	waitbutton
	closetext
	applymovement BURNEDTOWERB1F_ENOKI, EnokiMovement6
	disappear BURNEDTOWERB1F_ENOKI
	waitsfx
	special RestartMapMusic
	setscene SCENE_DEFAULT
	setevent EVENT_RELEASED_THE_BEASTS
	setmapscene ECRUTEAK_GYM, SCENE_FINISHED
	setevent EVENT_ECRUTEAK_GYM_GRAMPS
	clearevent EVENT_ECRUTEAK_CITY_GRAMPS
	setevent EVENT_BURNED_TOWER_MORTY
	setevent EVENT_BURNED_TOWER_1F_EUSINE
	clearevent EVENT_ECRUTEAK_GYM_KIDS
	clearevent EVENT_BURNED_TOWER_1F_ENOKI_2
	setmapscene BURNED_TOWER_1F, SCENE_BURNEDTOWER1F_NOTHING
	refreshscreen
	changeblock 6, 14, $1b ; ladder
	reloadmappart
	closetext
	setscene SCENE_DEFAULT
	end

EnteiBattle:
	opentext
	writetext EnteiCry
	pause 15
	cry ENTEI
	waitbutton
	closetext
	loadwildmon ENTEI, 60
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	ifequal LOSE, .NotBeaten
	disappear BURNEDTOWERB1F_ENTEI1
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtEntei
	setevent EVENT_BEAT_ENTEI
	end

.CaughtEntei:
	setevent EVENT_CAUGHT_ENTEI
	end

.NotBeaten:
	reloadmapafterbattle
	end

RaikouExamine:
	jumptext RaikouExamineText

EnteiExamine:
	jumptext EnteiExamineText

SuicuneExamine:
	jumptext SuicuneExamineText

EnokiMovement1:
	step UP
	step UP
	step UP
	step UP
	step_end

PlayerMovement1:
	step LEFT
	step_resume

EnokiMovement2:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_end

EnokiMovement3:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

EnokiMovement4:
	step DOWN
	step LEFT
	step LEFT
	step_end

EnokiMovement5:
	step DOWN
	step_end

EnokiMovement6:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

BurnedTowerB1FEusineText:
	text "EUSINE: I dug a"
	line "hole here, too…"
	done

TheyWontAwakeText:
	text "They won't awake."

	para "Not for you."

	para "Not for I."
	done

RaikouText:
	text "Raikou."
	done

EnteiText:
	text "Entei."
	done

SuicuneText:
	text "Suicune."
	done

InTheDistantPastText:
	text "In the distant"
	line "past…"

	para "This tower burned"
	line "in a fire. Three"

	para "nameless #mon"
	line "perished in it."

	para "A rainbow-colored"
	line "#mon descended"

	para "from the sky and"
	line "resurrected them…"

	para "It's a legend that"
	line "has been passed"

	para "down by Ecruteak"
	line "Gym Leaders."

	para "Me?"

	para "I am the Leader of"
	line "the Ecruteak Gym."

	para "I am Enoki."

	para "I apologize for"
	line "not introducing"
	cont "myself earlier. I"
	cont "was preoccupied"
	cont "with the safety of"
	cont "the children."

	para "The legend I just"
	line "told you, is not"
	cont "a legend."

	para "It is true, and"
	line "these are those"
	cont "#mon spoken of."

	para "They have been"
	line "resting here for"
	cont "135 years,"
	cont "waiting."

	para "Waiting for one"
	line "worthy of facing"
	cont "them."

	para "I have not been"
	line "deemed worthy, nor"
	cont "have you."

	para "Someday, they will"
	line "meet the one they"
	cont "seek."

	para "Will it be Eusine?"
	line "Will it be your"
	cont "future child?"

	para "I cannot answer"
	line "that."

	para "What I can answer,"
	line "is this."

	para "You wish to face"
	line "me in a battle,"
	cont "yes?"

	para "Then I will accept"
	line "your challenge at"
	cont "the Gym."

	para "You will then be"
	line "one step closer"
	cont "to your goal, if"
	cont "you can defeat me."

	para "One more thing."

	para "After we leave"
	line "here, this floor"
	cont "will be sealed"
	cont "off."

	para "This way, these"
	line "#mon will not"
	cont "be disturbed until"

	para "the one they"
	line "choose arrives."

	para "I will see you"
	line "later."
	done

RaikouExamineText:
	text "It's Raikou."
	done

EnteiExamineText:
	text "It's Entei."
	done

SuicuneExamineText:
	text "It's Suicune."
	done

EnteiCry:
	text "Entei: Burrurur!"
	done

BurnedTowerB1F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 10,  9, BURNED_TOWER_1F, 3
	warp_event 17,  7, BURNED_TOWER_1F, 7
	warp_event 10,  8, BURNED_TOWER_1F, 9
	warp_event  3, 13, BURNED_TOWER_1F, 10
	warp_event 17, 14, BURNED_TOWER_1F, 12
	warp_event  7, 15, BURNED_TOWER_1F, 14

	db 1 ; coord events
	coord_event 10,  6, SCENE_FINISHED, ReleaseTheBeasts

	db 0 ; bg events

	db 7 ; object events
	object_event  7,  3, SPRITE_RAIKOU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RaikouExamine, EVENT_BURNED_TOWER_B1F_BEASTS_1
	object_event 10,  3, SPRITE_ENTEI_P, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EnteiBattle, EVENT_BURNED_TOWER_B1F_ENTEI
	object_event 10,  4, SPRITE_SUICUNE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SuicuneExamine, EVENT_BURNED_TOWER_B1F_BEASTS_1
	object_event  7,  3, SPRITE_RAIKOU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, RaikouExamine, EVENT_BURNED_TOWER_B1F_BEASTS_2
	object_event 12,  3, SPRITE_ENTEI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, EnteiExamine, EVENT_BURNED_TOWER_B1F_BEASTS_2
	object_event 10,  4, SPRITE_SUICUNE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, SuicuneExamine, EVENT_BURNED_TOWER_B1F_BEASTS_2
	object_event 10, 11, SPRITE_ENOKI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EUSINE_IN_BURNED_TOWER
