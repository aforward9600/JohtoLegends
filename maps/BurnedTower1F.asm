	object_const_def ; object_event constants
	const BURNEDTOWER1F_ROCK
	const BURNEDTOWER1F_EUSINE
	const BURNEDTOWER1F_MORTY
	const BURNEDTOWER1F_POKE_BALL
	const BURNEDTOWER1F_ENOKI
	const BURNEDTOWER1F_ENOKI_2

BurnedTower1F_MapScripts:
	db 3 ; scene scripts
	scene_script .EusineScene ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_BURNEDTOWER1F_RIVAL_BATTLE
	scene_script .DummyScene2 ; SCENE_BURNEDTOWER1F_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HoleAndLadder

.EusineScene:
	checkevent EVENT_BURNED_TOWER_1F_EUSINE
	iftrue .SceneEnd
	prioritysjump .MeetEusine
	end

.SceneEnd:
	end

.DummyScene1:
	end

.DummyScene2:
	applymovement PLAYER, BurnedTower1F_PlayerMovesRight
	opentext
	writetext ImHidingTheBasementText
	waitbutton
	closetext
	applymovement BURNEDTOWER1F_ENOKI_2, BurnedTower1F_EnokiHidesMovement
	turnobject BURNEDTOWER1F_ENOKI_2, DOWN
	turnobject PLAYER, LEFT
	setscene SCENE_FINISHED
	playsound SFX_STRENGTH
	earthquake 50
	waitsfx
	changeblock 6, 14, $09 ; No Ladder
	reloadmappart
	closetext
	pause 15
	applymovement BURNEDTOWER1F_ENOKI_2, BurnedTower1F_EnokiLeavesMovement
	turnobject PLAYER, RIGHT
	disappear BURNEDTOWER1F_ENOKI_2
	playsound SFX_EXIT_BUILDING
	setevent EVENT_BURNED_TOWER_1F_ENOKI_2
	setevent EVENT_HIDE_BASEMENT
	setscene SCENE_DEFAULT
	end

.HoleAndLadder:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .HideBasement
	changeblock 6, 14, $09 ; No ladder
.HideBasement:
	checkevent EVENT_HIDE_BASEMENT
	iftrue .HideBasement2
	return

.HideBasement2:
	changeblock 6, 14, $09 ; No ladder
	return

.MeetEusine:
	turnobject BURNEDTOWER1F_ENOKI, DOWN
	showemote EMOTE_SHOCK, BURNEDTOWER1F_ENOKI, 15
	applymovement BURNEDTOWER1F_ENOKI, BurnedTower1FEusineMovement
	opentext
	writetext BurnedTower1FEnokiIntroText
	waitbutton
	closetext
	moveobject BURNEDTOWER1F_ENOKI, 9, 14
	setscene SCENE_BURNEDTOWER1F_RIVAL_BATTLE
	end

BurnedTower1FEusineScript:
	opentext
	writetext EusineBurnedTowerSuicuneText
	waitbutton
	closetext
	opentext
	writetext MortyHoOhText
	waitbutton
	closetext
	opentext
	writetext EusineReallyText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, BURNEDTOWER1F_EUSINE, 15
	special FadeOutMusic
	pause 15
	turnobject BURNEDTOWER1F_EUSINE, RIGHT
	pause 15
	applymovement PLAYER, BurnedTowerMovement_PlayerWalksToSilver
	applymovement BURNEDTOWER1F_EUSINE, BurnedTowerMovement_SilverWalksToPlayer
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext EusineHelloText
	waitbutton
	closetext
	setscene SCENE_BURNEDTOWER1F_NOTHING
	special FadeOutMusic
	pause 15
	earthquake 50
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	waitsfx
	changeblock 10, 8, $25 ; hole
	reloadmappart
	pause 15
	applymovement PLAYER, BurnedTower1FMovement_PlayerStartsToFall
	playsound SFX_KINESIS
	showemote EMOTE_SHOCK, BURNEDTOWER1F_EUSINE, 20
	opentext
	writetext AreYouOKText
	waitbutton
	closetext
	setevent EVENT_HOLE_IN_BURNED_TOWER
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	setmapscene BURNED_TOWER_B1F, SCENE_FINISHED
	pause 15
	warpcheck
	end

BurnedTower1FEnokiScript:
	jumptextfaceplayer BurnedTower1FEnokiText

BurnedTower1FRock:
	jumpstd smashrock

BurnedTower1FHiddenEther:
	hiddenitem ETHER, EVENT_BURNED_TOWER_1F_HIDDEN_ETHER

BurnedTower1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_BURNED_TOWER_1F_HIDDEN_ULTRA_BALL

BurnedTower1FHPUp:
	itemball TM_WILL_O_WISP

BurnedTowerMovement_PlayerWalksToSilver:
	step LEFT
	step_end

BurnedTowerMovement_SilverWalksToPlayer:
	step RIGHT
	step_resume

BurnedTower1FMovement_PlayerStartsToFall:
	skyfall_top
	step_end

BurnedTower1FEusineMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_resume

BurnedTower1F_PlayerMovesRight:
	step RIGHT
	step_end

BurnedTower1F_EnokiLeavesMovement:
	step RIGHT
	step RIGHT
	step DOWN
	step_end

BurnedTower1F_EnokiHidesMovement:
	step UP
	step LEFT
	step LEFT
	step_end

EusineBurnedTowerSuicuneText:
	text "Eusine: Come on"
	line "Morty!"

	para "Suicune's gotta be"
	line "here!"

	para "Your gramps would-"
	line "n't have forbid us"
	cont "from coming here"

	para "if it wasn't!"
	done

MortyHoOhText:
	text "Morty: I don't"
	line "really care about"
	cont "Suicune."

	para "I'm interested in"
	line "meeting that"
	cont "rainbow-colored"
	cont "#mon."
	done

EusineReallyText:
	text "Eusine: Really,"
	line "man?"

	para "There are plenty"
	line "of bird #mon."

	para "There's only one"
	line "like Suicune!"
	done

EusineHelloText:
	text "Hi there!"

	para "I'm Eusine, and"
	line "this is Morty!"

	para "We're searching"
	line "for the legendary"
	cont "#mon, Suicune!"
	
	para "Can you help us?"

	para "...What?"

	para "Morty's gramps is"
	line "looking for us?"

	para "Ah man, we're"
	line "busted."

	para "Alright, looks"
	line "like we gotta go,"
	cont "right, Morty?"
	done

AreYouOKText:
	text "Woah!"

	para "Are you OK?"
	done

BurnedTower1FEnokiIntroText:
	text "Hello."
	line "I beg your pardon,"

	para "but I need some"
	line "help. My grandson"
	cont "Morty and his"

	para "friend Eusine are"
	line "somewhere here in"
	cont "the Burned Tower."

	para "Could you help me"
	line "find them?"
	done

ImHidingTheBasementText:
	text "This will hope-"
	line "fully prevent any-"
	cont "one else from"
	cont "disturbing them"
	cont "until the proper"
	cont "time comes."

	para "I'll be waiting at"
	line "the Gym for your"
	cont "challenge."
	done

BurnedTower1FEnokiText:
	text "Hmmm...."
	line "Maybe they're"
	cont "near the center."
	done

BurnedTower1F_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event  9, 15, ECRUTEAK_CITY, 13
	warp_event 10, 15, ECRUTEAK_CITY, 13
	warp_event 10,  9, BURNED_TOWER_B1F, 1
	warp_event 16,  1, BURNED_TOWER_2F, 1
	warp_event  5,  6, BURNED_TOWER_B1F, 1 ; inaccessible, left over from G/S
	warp_event  4,  6, BURNED_TOWER_B1F, 1 ; inaccessible, left over from G/S
	warp_event 15,  4, BURNED_TOWER_B1F, 2 ; inaccessible, left over from G/S
	warp_event 15,  5, BURNED_TOWER_B1F, 2 ; inaccessible, left over from G/S
	warp_event 10,  7, BURNED_TOWER_B1F, 3 ; inaccessible, left over from G/S
	warp_event  5, 14, BURNED_TOWER_B1F, 4 ; inaccessible, left over from G/S
	warp_event  4, 14, BURNED_TOWER_B1F, 4 ; inaccessible, left over from G/S
	warp_event 14, 14, BURNED_TOWER_B1F, 5 ; inaccessible, left over from G/S
	warp_event 15, 14, BURNED_TOWER_B1F, 5 ; inaccessible, left over from G/S
	warp_event  7, 15, BURNED_TOWER_B1F, 6 ; inaccessible, left over from G/S

	db 1 ; coord events
	coord_event 11,  9, SCENE_BURNEDTOWER1F_RIVAL_BATTLE, BurnedTower1FEusineScript

	db 2 ; bg events
	bg_event  8,  7, BGEVENT_ITEM, BurnedTower1FHiddenEther
	bg_event 13, 11, BGEVENT_ITEM, BurnedTower1FHiddenUltraBall

	db 6 ; object events
	object_event 15,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTower1FRock, -1
	object_event  8,  9, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, BurnedTower1FEusineScript, EVENT_BURNED_TOWER_MORTY
	object_event  7,  9, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_MORTY
	object_event 14,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, BurnedTower1FHPUp, EVENT_BURNED_TOWER_1F_HP_UP
	object_event 12, 12, SPRITE_ENOKI, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTower1FEnokiScript, EVENT_BURNED_TOWER_1F_EUSINE
	object_event  9, 15, SPRITE_ENOKI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_1F_ENOKI_2
