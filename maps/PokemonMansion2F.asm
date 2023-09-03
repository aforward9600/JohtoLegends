	object_const_def ; object_event constants
	const POKEMONMANSION2F_DIARY1
	const POKEMONMANSION2F_DIARY2
	const POKEMONMANSION2F_BURGLAR
	const POKEMONMANSION2F_SCIENTIST1
	const POKEMONMANSION2F_SCIENTIST2
	const POKEMONMANSION2F_POKE_BALL

PokemonMansion2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Shutters2F

.Shutters2F:
	checkevent EVENT_POKEMON_MANSION_SWITCH
	iftrue .Shutters2FSwitch
	return

.Shutters2FSwitch:
	changeblock  6, 22, $5f ; Shutter
	changeblock 18,  8, $0e ; Floor
	changeblock  8,  4, $0e ; Floor
	changeblock 18,  4, $54 ; Shutter
	changeblock  2, 10, $02 ; Open Eyes
	return

PokemonMansion2FAbraStatue:
	opentext
	writetext PokemonMansionPressTheButton2FText
	yesorno
	iffalse .DidntPressTheButton2F
	writetext WhoWouldnt2FText
	buttonsound
	waitsfx
	playsound SFX_PUSH_BUTTON
	closetext
	checkevent EVENT_POKEMON_MANSION_SWITCH
	iftrue .TurnOffSwitch2F
	setevent EVENT_POKEMON_MANSION_SWITCH
	changeblock  6, 22, $5f ; Shutter
	changeblock 18,  8, $0e ; Floor
	changeblock  8,  4, $0e ; Floor
	changeblock 18,  4, $54 ; Shutter
	changeblock  2, 10, $02 ; Open Eyes
	reloadmappart
	end

.TurnOffSwitch2F:
	clearevent EVENT_POKEMON_MANSION_SWITCH
	changeblock  6, 22, $0e ; Floor
	changeblock 18,  8, $14 ; Shutter
	changeblock  8,  4, $5f ; Shutter
	changeblock 18,  4, $0e ; Floor
	changeblock  2, 10, $77 ; Closed Eyes
	reloadmappart
	end

.DidntPressTheButton2F:
	writetext NotQuiteYet2FText
	waitbutton
	closetext
	end

TrainerBurglarMarv:
	trainer BURGLAR, MARV, EVENT_BEAT_BURGLAR_MARV, BurglarMarvSeenText, BurglarMarvBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarMarvAfterBattleText
	waitbutton
	closetext
	end

PokemonMansion2FScientist:
	jumptextfaceplayer PokemonMansion2FScientistText

PokemonMansion2FScientist2:
	faceplayer
	opentext
	writetext PokemonMansion2FScientist2Text
	waitbutton
	closetext
	turnobject POKEMONMANSION2F_SCIENTIST2, DOWN
	end

PokemonMansion2FDiary:
	jumptext PokemonMansion2FDiaryText

PokemonMansion2FDiary2:
	jumptext PokemonMansion2FDiary2Text

PokemonMansion2FRareCandy:
	itemball RARE_CANDY

PokemonMansionPressTheButton2FText:
	text "A secret switch!"

	para "Press it?"
	done

WhoWouldnt2FText:
	text "Who wouldn't?"
	done

NotQuiteYet2FText:
	text "Not quite yet!"
	done

PokemonMansion2FDiaryText:
	text "Diary: July 5"

	para "We discovered a"
	line "new #mon deep"
	cont "in the jungle."
	done

PokemonMansion2FDiary2Text:
	text "Diary: July 10"
	line "We christened the"
	cont "newly discovered"
	cont "#mon, Mew."
	done

BurglarMarvSeenText:
	text "'EY!"

	para "Can't ya see I'm"
	line "lootin', 'ere?"
	done

BurglarMarvBeatenText:
	text "Ya mugged me!"
	done

BurglarMarvAfterBattleText:
	text "There ain't much"
	line "left 'ere."

	para "No use meandering"
	line "'round 'ere any"
	cont "longer."

	para "Don't want those"
	line "sciency guys to"
	cont "catch me."
	done

PokemonMansion2FScientistText:
	text "I lost my friends"
	line "in the fire…"

	para "All of those poor"
	line "souls…"
	done

PokemonMansion2FScientist2Text:
	text "Everything we had"
	line "worked for is gone"
	cont "now…"

	para "Was it even worth"
	line "it?"
	done

PokemonMansion2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 10, POKEMON_MANSION_1F, 7
	warp_event  7, 10, POKEMON_MANSION_3F, 1
	warp_event  6,  1, POKEMON_MANSION_3F, 2
	warp_event 25, 14, POKEMON_MANSION_3F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 2, 11, BGEVENT_READ, PokemonMansion2FAbraStatue

	db 6 ; object events
	object_event  4, 22, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, PokemonMansion2FDiary, -1
	object_event 19,  2, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, PokemonMansion2FDiary2, -1
	object_event  3, 25, SPRITE_BURGLAR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBurglarMarv, -1
	object_event  4,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion2FScientist, -1
	object_event 20, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansion2FScientist2, -1
	object_event 27, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PokemonMansion2FRareCandy, EVENT_POKEMON_MANSION_2F_RARE_CANDY
