	object_const_def ; object_event constants
	const RUINVALLEY_SCIENTIST
	const RUINVALLEY_POKE_BALL_1
	const RUINVALLEY_POKE_BALL_2
	const RUINVALLEY_ROCK_1
	const RUINVALLEY_ROCK_2
	const RUINVALLEY_ROCK_3
	const RUINVALLEY_ROCK_4

RuinValley_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RuinValleyScientistScript:
	jumptextfaceplayer RuinValleyScientistText

RuinValleySunStone:
	itemball SUN_STONE

RuinValleyHPUp:
	itemball HP_UP

RuinValleyRock:
	jumpstd smashrock

RuinValleyScientistText:
	text "The writing in"
	line "this cave has yet"
	cont "to be deciphered,"

	para "but it resembles"
	line "the language of"
	cont "the ancient people"
	cont "of Onaga."

	para "It's a rural region"
	line "to the north of"
	cont "Unova."

	para "The first people"
	line "of these islands"
	cont "could have been"
	cont "from Onaga."
	done

RuinValley_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 20, 17, DOTTED_HOLE_ENTRANCE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 21, 18, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinValleyScientistScript, -1
	object_event  5, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, RuinValleySunStone, EVENT_RUIN_VALLEY_SUN_STONE
	object_event 38, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, RuinValleyHPUp, EVENT_RUIN_VALLEY_HP_UP
	object_event  4, 26, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinValleyRock, -1
	object_event  5, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinValleyRock, -1
	object_event 36, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinValleyRock, -1
	object_event 37, 24, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinValleyRock, -1
