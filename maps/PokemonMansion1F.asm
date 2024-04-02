	object_const_def ; object_event constants
	const POKEMONMANSION1F_DIARY
	const POKEMONMANSION1F_DIARY2
	const POKEMONMANSION1F_SCIENTIST
	const POKEMONMANSION1F_SCIENTIST2
	const POKEMONMANSION1F_GIOVANNI

PokemonMansion1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Shutters1F

.Shutters1F:
	checkevent EVENT_POKEMON_MANSION_SWITCH
	iftrue .Shutters1FSwitch
	return

.Shutters1FSwitch:
	changeblock 16,  6, $0e ; Floor
	changeblock 20, 16, $0e ; Floor
	changeblock 26,  4, $14 ; Shutter
	changeblock  2,  4, $02 ; Open Eyes
	return

PokemonMansion1FAbraStatue:
	opentext
	writetext PokemonMansionPressTheButtonText
	yesorno
	iffalse .DidntPressTheButton
	writetext WhoWouldntText
	buttonsound
	waitsfx
	playsound SFX_PUSH_BUTTON
	closetext
	checkevent EVENT_POKEMON_MANSION_SWITCH
	iftrue .TurnOffSwitch
	setevent EVENT_POKEMON_MANSION_SWITCH
	changeblock 16,  6, $0e ; Floor
	changeblock 20, 16, $0e ; Floor
	changeblock 26,  4, $14 ; Shutter
	changeblock  2,  4, $02 ; Open Eyes
	reloadmappart
	end

.TurnOffSwitch:
	clearevent EVENT_POKEMON_MANSION_SWITCH
	changeblock 16,  6, $54 ; Shutter
	changeblock 20, 16, $54 ; Shutter
	changeblock 26,  4, $0e ; Floor
	changeblock  2,  4, $77 ; Closed Eyes
	reloadmappart
	end

.DidntPressTheButton:
	writetext NotQuiteYetText
	waitbutton
	closetext
	end

PokemonMansion1FDiary:
	jumptext PokemonMansion1FDiaryText

PokemonMansion1FDiary2:
	jumptext PokemonMansion1FDiary2Text

PokemonMansion1FScientist:
	jumptextfaceplayer PokemonMansion1FScientistText

PokemonMansion1FScientist2:
	jumptextfaceplayer PokemonMansion1FScientist2Text

PokemonMansion1FGiovanni:
	opentext
	readvar VAR_BADGES
	ifequal 15, .CanSpeakWithGiovanni
	writetext GiovanniLeaveMeAloneText
	waitbutton
	closetext
	end

.CanSpeakWithGiovanni:
	writetext GiovanniItsAllGoneText
	waitbutton
	closetext
	pause 15
	showemote EMOTE_SHOCK, POKEMONMANSION1F_GIOVANNI, 15
	pause 10
	faceplayer
	opentext
	writetext PokemonMansion1FGiovanniText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .GiovanniLeavesRight
	applymovement POKEMONMANSION1F_GIOVANNI, GiovanniLeavesDownMovement
	disappear POKEMONMANSION1F_GIOVANNI
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	clearevent EVENT_VIRIDIAN_GYM_TRAINERS
	end

.GiovanniLeavesRight:
	applymovement POKEMONMANSION1F_GIOVANNI, GiovanniLeavesRightMovement
	disappear POKEMONMANSION1F_GIOVANNI
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	clearevent EVENT_VIRIDIAN_GYM_TRAINERS
	end

GiovanniLeavesDownMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

GiovanniLeavesRightMovement:
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

PokemonMansionPressTheButtonText:
	text "A secret switch!"

	para "Press it?"
	done

WhoWouldntText:
	text "Who wouldn't?"
	done

NotQuiteYetText:
	text "Not quite yet!"
	done

PokemonMansion1FDiaryText:
	text "Diary: Date XX"

	para "An anomoly has"
	line "appeared on the"
	cont "East coast of"
	cont "Cinnabar Island."

	para "We captured the"
	line "anomoly before the"
	cont "citizens panicked."

	para "It will be held in"
	line "the basement for"
	cont "testing."
	done

PokemonMansion1FDiary2Text:
	text "Diary: Date XX"

	para "The anomaly has an"
	line "almost impossible"
	cont "physiology."

	para "It appears to both"
	line "exist and not at"
	cont "the same time."

	para "We can see clean"
	line "through parts of"
	cont "it at times."

	para "At times, it takes"
	line "other forms, most"
	cont "likely as an inti-"
	cont "midation tactic."

	para "We have decided to"
	line "name it:"

	para "Experiment 'M(00)."
	done

PokemonMansion1FScientistText:
	text "You shouldn't be"
	line "here."

	para "It's dangerous."

	para "Not like there's"
	line "much left here to"
	cont "take."

	para "All of that"
	line "research, gone…"
	done

PokemonMansion1FScientist2Text:
	text "Well, the shutters"
	line "still work, so"
	cont "there's that."

	para "The switches in"
	line "the statues still"
	cont "work too."
	done

GiovanniItsAllGoneText:
	text "???: …All of our"
	line "plans, ruined…"

	para "…That blasted"
	line "#mon…"

	para "After all of the"
	line "money I spent…"

	para "Perhaps mother was"
	line "right…"

	para "…Some leader I am…"
	done

PokemonMansion1FGiovanniText:
	text "???: Who are you?"

	para "…The Champion?"

	para "What are you doing"
	line "here?"

	para "Come to look at"
	line "the remains of my"
	cont "old mansion?"

	para "Go ahead. There's"
	line "nothing left here…"

	para "All of that money,"
	line "gone up in smoke…"

	para "…That's not what"
	line "you're here for?"

	para "…You're looking for"
	line "the owner of the"
	cont "warehouse in"
	cont "Viridian City?"

	para "That's me. I am"
	line "Giovanni."

	para "So, you've heard of"
	line "my battling skills"
	cont "and are looking"
	cont "for a new Gym"
	cont "Leader?"

	para "Looking to take on"
	line "the Federation, I"
	cont "see?"

	para "…This could be a"
	line "great opportunity…"

	para "…An opportunity to"
	line "show her up…"

	para "…Sorry. Just lost"
	line "in thought."

	para "If you want to"
	line "test my abilities,"
	cont "then meet me at my"
	cont "warehouse."

	para "I shall battle you"
	line "there."
	done

GiovanniLeaveMeAloneText:
	text "???: Leave me"
	line "alone."
	done

PokemonMansion1F_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  4, 27, CINNABAR_ISLAND, 2
	warp_event  5, 27, CINNABAR_ISLAND, 2
	warp_event  6, 27, CINNABAR_ISLAND, 2
	warp_event  7, 27, CINNABAR_ISLAND, 2
	warp_event 26, 27, CINNABAR_ISLAND, 2
	warp_event 27, 27, CINNABAR_ISLAND, 2
	warp_event  5, 10, POKEMON_MANSION_2F, 1
	warp_event 21, 23, POKEMON_MANSION_B1F, 1
	warp_event 16, 15, POKEMON_MANSION_3F, 4 ; hole
	warp_event 17, 15 ,POKEMON_MANSION_3F, 5 ; hole
	warp_event 19, 15, POKEMON_MANSION_3F, 6 ; hole

	db 0 ; coord events

	db 1 ; bg events
	bg_event 2, 5, BGEVENT_READ, PokemonMansion1FAbraStatue

	db 5 ; object events
	object_event  6,  5, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, PokemonMansion1FDiary, -1
	object_event 25,  8, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, PokemonMansion1FDiary2, -1
	object_event  5, 19, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion1FScientist, -1
	object_event 16,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion1FScientist2, -1
	object_event 26,  8, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion1FGiovanni, EVENT_CINNABAR_MANSION_1F_GIOVANNI
