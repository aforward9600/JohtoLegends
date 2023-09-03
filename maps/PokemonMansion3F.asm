	object_const_def ; object_event constants
	const POKEMONMANSION3F_DIARY1
	const POKEMONMANSION3F_DIARY2
	const POKEMONMANSION3F_SCIENTIST
	const POKEMONMANSION3F_BURGLAR

PokemonMansion3F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Shutters3F

.Shutters3F:
	checkevent EVENT_POKEMON_MANSION_SWITCH
	iftrue .Shutters3FSwitch
	return

.Shutters3FSwitch:
	changeblock 14, 10, $5f ; Shutter
	changeblock 14,  4, $0e ; Floor
	changeblock 10,  4, $02 ; Open Eyes
	return

PokemonMansion3FAbraStatue:
	opentext
	writetext PokemonMansionPressTheButton3FText
	yesorno
	iffalse .DidntPressTheButton3F
	writetext WhoWouldnt3FText
	buttonsound
	waitsfx
	playsound SFX_PUSH_BUTTON
	closetext
	checkevent EVENT_POKEMON_MANSION_SWITCH
	iftrue .TurnOffSwitch3F
	setevent EVENT_POKEMON_MANSION_SWITCH
	changeblock 14, 10, $5f ; Shutter
	changeblock 14,  4, $0e ; Floor
	changeblock 10,  4, $02 ; Open Eyes
	reloadmappart
	end

.TurnOffSwitch3F:
	clearevent EVENT_POKEMON_MANSION_SWITCH
	changeblock 14, 10, $0e ; Floor
	changeblock 14,  4, $5f ; Shutter
	changeblock 10,  4, $77 ; Closed Eyes
	reloadmappart
	end

.DidntPressTheButton3F:
	writetext NotQuiteYet3FText
	waitbutton
	closetext
	end

TrainerBurglarHarry:
	trainer BURGLAR, BURGLAR_HARRY, EVENT_BEAT_BURGLAR_HARRY, BurglarHarrySeenText, BurglarHarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarHarryAfterBattleText
	waitbutton
	closetext
	end

PokemonMansion3FScientist:
	jumptextfaceplayer PokemonMansion3FScientistText

PokemonMansion3FDiary:
	jumptext PokemonMansion3FDiaryText

PokemonMansion3FDiary2:
	jumptext PokemonMansion3FDiary2Text

PokemonMansion3FHiddenNugget:
	hiddenitem NUGGET, EVENT_POKEMON_MANSION_3F_HIDDEN_NUGGET

PokemonMansionPressTheButton3FText:
	text "A secret switch!"

	para "Press it?"
	done

WhoWouldnt3FText:
	text "Who wouldn't?"
	done

NotQuiteYet3FText:
	text "Not quite yet!"
	done

PokemonMansion3FDiaryText:
	text "Diary: Feb. 6"
	line "We obtained a new"
	cont "#mon from Mew."

	para "We have named this"
	line "new #mon"
	cont "Mewtwo."
	done

PokemonMansion3FDiary2Text:
	text "Diary: Date XX"

	para "'M(00) has been"
	line "communicating with"
	cont "Mewtwo via brain"
	cont "waves!"

	para "They're in sync"
	line "with each other!"

	para "Perhaps the two"
	line "can be used at"
	cont "the same time!"

	para "The boss would be"
	line "unstoppable!"

	para "Diary: Date XX"

	para "The others don't"
	line "seem to care, but"
	cont "it looks like the"
	cont "two are becoming"
	cont "more agitated."

	para "This is bad."

	para "I can't tell what"
	line "will happen, but"
	cont "we need to prepare"
	cont "for the worst."

	para "Diary: Date XX"

	para "'M(00) has been"
	line "restless."

	para "Mewtwo's brain"
	line "waves are getting"
	cont "stronger."

	para "I need to get out"
	line "of here…"

	para "Before it's too"
	line "late."

	para "Dr. F"
	done

PokemonMansion3FScientistText:
	text "This place used to"
	line "be beautiful."

	para "Now look at it…"
	done

BurglarHarrySeenText:
	text "You seen any good"
	line "loot?"
	done

BurglarHarryBeatenText:
	text "My loot!"
	done

BurglarHarryAfterBattleText:
	text "All I've seen are"
	line "some old books!"

	para "Where's the gold?"
	done

PokemonMansion3F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  7, 10, POKEMON_MANSION_2F, 2
	warp_event  6,  1, POKEMON_MANSION_2F, 3
	warp_event 25, 14, POKEMON_MANSION_2F, 4
	warp_event 16, 14, POKEMON_MANSION_1F, 9
	warp_event 17, 14, POKEMON_MANSION_1F, 10
	warp_event 19, 14, POKEMON_MANSION_1F, 11

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10,  5, BGEVENT_READ, PokemonMansion3FAbraStatue
	bg_event  1, 10, BGEVENT_ITEM, PokemonMansion3FHiddenNugget

	db 4 ; object events
	object_event  6, 12, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, PokemonMansion3FDiary, -1
	object_event 19,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, PokemonMansion3FDiary2, -1
	object_event 26, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion3FScientist, -1
	object_event  5, 14, SPRITE_BURGLAR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBurglarHarry, -1
