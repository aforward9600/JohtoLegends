	object_const_def ; object_event constants
	const MOUNTMORTAR1FINSIDE_BOULDER_1
	const MOUNTMORTAR1FINSIDE_POKE_BALL1
	const MOUNTMORTAR1FINSIDE_POKE_BALL2
	const MOUNTMORTAR1FINSIDE_POKE_BALL3
	const MOUNTMORTAR1FINSIDE_HIKER3
	const MOUNTMORTAR1FINSIDE_POKE_BALL5
	const MOUNTMORTAR1FINSIDE_SUPER_NERD1
	const MOUNTMORTAR1FINSIDE_SUPER_NERD2
	const MOUNTMORTAR1FINSIDE_POKE_BALL6
	const MOUNTMORTAR1FINSIDE_POKE_BALL7
	const MOUNTMORTAR1FINSIDE_HIKER1
	const MOUNTMORTAR1FINSIDE_HIKER2
	const MOUNTMORTAR1FINSIDE_BOULDER_2
	const MOUNTMORTAR1FINSIDE_YOUNGSTER

MountMortar1FInside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_MOUNT_MORTAR_1F_INSIDE_HIKER

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks

.DummyScene0:
	end

.DummyScene1:
	end

.ClearRocks:
	checkevent EVENT_MOUNT_MORTAR_HIKER_2
	iftrue .MoveRocks
	changeblock 26, 46, $1d ; rock
	changeblock 24, 46, $1d ; rock
	changeblock 10, 46, $1d ; rock
	changeblock 12, 46, $1d ; rock
	changeblock 30, 46, $19 ; rocks
	return
.MoveRocks:
	checkevent EVENT_MET_HIKER
	iftrue .MoveRocks1
	changeblock 16, 46, $1d ; rock
	changeblock 10, 46, $1d ; rock
	changeblock 12, 46, $1d ; rock
	return
.MoveRocks1:
	return

TrainerPokemaniacAllan:
	trainer POKEMANIAC, ALLAN1, EVENT_BEAT_POKEMANIAC_ALLAN, PokemaniacAllanSeenText, PokemaniacAllanBeatenText, 0, .Script

.Script:
	opentext
	writetext PokemaniacAllanAfterBattleText
	waitbutton
	closetext
	applymovement MOUNTMORTAR1FINSIDE_SUPER_NERD1, PokemaniacMovement
	disappear MOUNTMORTAR1FINSIDE_SUPER_NERD1
	setscene SCENE_MOUNT_MORTAR_1F_INSIDE_HIKER
	end
	

TrainerSupernerdMarkus:
	trainer SUPER_NERD, MARKUS, EVENT_BEAT_SUPER_NERD_MARKUS, SupernerdMarkusSeenText, SupernerdMarkusBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdMarkusAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerOzzy:
	trainer HIKER, OZZY, EVENT_BEAT_HIKER_OZZY, HikerOzzySeenText, HikerOzzyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerOzzyAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterBert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterBertSeenText, YoungsterBertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterBertAfterBattleText
	waitbutton
	closetext
	end

HikerStopsYou1:
	moveobject MOUNTMORTAR1FINSIDE_HIKER1, 11, 42
	appear MOUNTMORTAR1FINSIDE_HIKER1
	applymovement MOUNTMORTAR1FINSIDE_HIKER1, HikerMovement1
	turnobject, PLAYER, RIGHT
	opentext
	writetext FinallyDoneText
	waitbutton
	closetext
	applymovement MOUNTMORTAR1FINSIDE_HIKER1, HikerMovement2
	disappear MOUNTMORTAR1FINSIDE_HIKER1
	changeblock 16, 46, $02 ; rock
	changeblock 10, 46, $24 ; exit
	changeblock 12, 46, $02 ; rock
	setevent EVENT_MOUNT_MORTAR_HIKER_1
	setevent EVENT_MET_HIKER
	setmapscene ROUTE_38_ECRUTEAK_GATE, SCENE_ECRUTEAK_GATE_RIVAL
	setevent EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	setscene SCENE_DEFAULT
	end

HikerStopsYou2:
	moveobject MOUNTMORTAR1FINSIDE_HIKER1, 11, 42
	appear MOUNTMORTAR1FINSIDE_HIKER1
	applymovement MOUNTMORTAR1FINSIDE_HIKER1, HikerMovement3
	turnobject, PLAYER, RIGHT
	opentext
	writetext FinallyDoneText
	waitbutton
	closetext
	applymovement MOUNTMORTAR1FINSIDE_HIKER1, HikerMovement4
	disappear MOUNTMORTAR1FINSIDE_HIKER1
	changeblock 16, 46, $02 ; rock
	changeblock 10, 46, $24 ; exit
	changeblock 12, 46, $02 ; rock
	setevent EVENT_MOUNT_MORTAR_HIKER_1
	setevent EVENT_MET_HIKER
	setmapscene ROUTE_38_ECRUTEAK_GATE, SCENE_ECRUTEAK_GATE_RIVAL
	setevent EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	setscene SCENE_DEFAULT
	end

MountMortar1FInsideBoulder:
	jumpstd strengthboulder

MountMortar1FInsideRock:
	jumpstd smashrock

MountMortar1FInsideEscapeRope:
	itemball ESCAPE_ROPE

MountMortar1FInsideMaxRevive:
	itemball REVIVE

MountMortar1FInsideHyperPotion:
	itemball SUPER_POTION

MountMortar1FInsideNugget:
	itemball AWAKENING

MountMortar1FInsideIron:
	itemball EVERSTONE

MountMortar1FInsideUltraBall:
	itemball GREAT_BALL

MountMortar1FInsideHiddenMaxRepel:
	hiddenitem MAX_REPEL, EVENT_MOUNT_MORTAR_1F_INSIDE_HIDDEN_MAX_REPEL

MountMortar1FInsideHikerScript:
	faceplayer
	opentext
	checkevent EVENT_MOUNT_MORTAR_HIKER_2
	iftrue .NextRocks
	writetext MountMortar1FInsideHikerText1
	waitbutton
	closetext
	end

.NextRocks:
	writetext MountMortar1FInsideHikerText2
	waitbutton
	closetext
	end

PokemaniacMovement:
	step RIGHT
	step DOWN
	step_end

HikerMovement1:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step LEFT
	step_end

HikerMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end

HikerMovement3:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step LEFT
	step_end

HikerMovement4:
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end

PokemaniacAllanSeenText:
	text "I'm looking for a"
	line "Marill, they're"
	cont "quite the rare"
	cont "#mon."
	done

PokemaniacAllanBeatenText:
	text "If I had a Marill,"
	line "I woulda won!"
	done

PokemaniacAllanAfterBattleText:
	text "Guess I'll go look"
	line "somewhere else."
	done

SupernerdMarkusSeenText:
	text "The rocks here are"
	line "so interesting,"
	cont "wouldn't you say?"
	done

SupernerdMarkusBeatenText:
	text "You must not think"
	line "so…"
	done

SupernerdMarkusAfterBattleText:
	text "Geology was my"
	line "favorite subject"
	cont "in school."

	para "I'm just absorbed"
	line "into the study of"
	cont "rocks."
	done

HikerOzzySeenText:
	text "Dark caves like"
	line "this make me feel"
	cont "at home!"
	done

HikerOzzyBeatenText:
	text "No place like"
	line "home!"
	done

HikerOzzyAfterBattleText:
	text "My home isn't this"
	line "damp at the least."
	done

MountMortar1FInsideHikerText1:
	text "I'm clearing out"
	line "these rocks."

	para "Best to come back"
	line "later."
	done

MountMortar1FInsideHikerText2:
	text "These earthquakes"
	line "are getting"
	cont "ridiculous."

	para "It's going to take"
	line "me a little while"
	cont "to clear this out."

	para "Hm? You need to"
	line "get to Ecruteak"
	cont "City?"

	para "Well, you can take"
	line "the long way"
	cont "around through the"
	cont "cave."

	para "Maybe by the time"
	line "you get through,"
	cont "I'll have this"
	cont "cleared."

	para "Pardon? You say"
	line "you've had this"
	cont "happen before?"

	para "Yeah, there have"
	line "been a lot of"
	cont "quakes lately."

	para "I have a feeling"
	line "this will happen"
	cont "to you again."
	done

FinallyDoneText:
	text "Whew!"

	para "I finally cleared"
	line "out those rocks!"

	para "Looks like I got"
	line "done a little too"
	cont "late, though."

	para "Sorry I made you"
	line "take the long way"
	cont "around, but think"

	para "of it this way."

	para "You got some more"
	line "experience!"

	para "Gahahahaha!"

	para "See you around,"
	line "kid!"
	done

YoungsterBertSeenText:
	text "Wassup?"

	para "I'm just here"
	line "since it's nice"
	cont "and quiet."

	para "What about you?"
	done

YoungsterBertBeatenText:
	text "Well, it's not so"
	line "quiet now."
	done

YoungsterBertAfterBattleText:
	text "You're heading to"
	line "Ecruteak City?"

	para "It's quite the"
	line "traditional little"
	cont "hamlet."

	para "The buildings are"
	line "cool-looking."
	done

MountMortar1FInside_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 11, 47, MOUNT_MORTAR_1F_OUTSIDE, 5
	warp_event 29, 47, MOUNT_MORTAR_1F_OUTSIDE, 6
	warp_event  5, 39, MOUNT_MORTAR_1F_OUTSIDE, 8
	warp_event 33, 41, MOUNT_MORTAR_1F_OUTSIDE, 9
	warp_event  3, 19, MOUNT_MORTAR_B1F, 1
	warp_event  9,  9, MOUNT_MORTAR_2F_INSIDE, 2
	warp_event 27, 41, MOUNT_MORTAR_1F_OUTSIDE, 10
	warp_event  9, 23, MOUNT_MORTAR_1F_OUTSIDE, 11

	db 2 ; coord events
	coord_event 6, 39, SCENE_MOUNT_MORTAR_1F_INSIDE_HIKER, HikerStopsYou1
	coord_event 6, 40, SCENE_MOUNT_MORTAR_1F_INSIDE_HIKER, HikerStopsYou2

	db 1 ; bg events
	bg_event 30, 11, BGEVENT_ITEM, MountMortar1FInsideHiddenMaxRepel

	db 14 ; object events
	object_event  9, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortar1FInsideRock, -1
	object_event 35, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideEscapeRope, EVENT_MOUNT_MORTAR_1F_INSIDE_ESCAPE_ROPE
	object_event 16, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideMaxRevive, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_REVIVE
	object_event 10, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideHyperPotion, EVENT_MOUNT_MORTAR_1F_INSIDE_HYPER_POTION
	object_event 25, 21, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHikerOzzy, -1
	object_event 35, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideNugget, EVENT_MOUNT_MORTAR_1F_INSIDE_NUGGET
	object_event  8, 22, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPokemaniacAllan, EVENT_BEAT_POKEMANIAC_ALLAN
	object_event 24, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdMarkus, -1
	object_event  8, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideIron, EVENT_MOUNT_MORTAR_1F_INSIDE_IRON
	object_event 17, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideUltraBall, EVENT_MOUNT_MORTAR_1F_INSIDE_ULTRA_BALL
	object_event 18, 46, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortar1FInsideHikerScript, EVENT_MOUNT_MORTAR_HIKER_1
	object_event 28, 46, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortar1FInsideHikerScript, EVENT_MOUNT_MORTAR_HIKER_2
	object_event  7,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortar1FInsideBoulder, -1
	object_event 31,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerYoungsterBert, -1
