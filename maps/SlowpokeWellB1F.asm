	object_const_def ; object_event constants
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL

SlowpokeWellB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSuperNerdNed:
	trainer SUPER_NERD, NED1, EVENT_BEAT_SUPER_NERD_NED, SuperNerdNedSeenText, SuperNerdNedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdNedAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacDamien:
	trainer POKEMANIAC, DAMIEN, EVENT_BEAT_POKEMANIAC_DAMIEN, PokemaniacDamienSeenText, PokemaniacDamienBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacDamienAfterBattleText
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd strengthboulder

SlowpokeWellB1FSuperPotion:
	itemball FULL_HEAL

SuperNerdNedSeenText:
	text "Have you ever"
	line "observed a"
	cont "Slowpoke in the"
	cont "wild?"

	para "It's fascinating,"
	line "don't you think?"
	done

SuperNerdNedBeatenText:
	text "Truly fascinating!"
	done

SuperNerdNedAfterBattleText:
	text "We've always"
	line "thought that"

	para "Slowpoke need a"
	line "Shellder in order"

	para "to evolve, but is"
	line "that true?"

	para "Perhaps I should"
	line "ask Mr. Elm…"

	para "Whoops, I mean"
	line "Professor Elm!"

	para "I forgot he just"
	line "recently became"

	para "a full-fledged"
	line "#mon Professor!"
	done

PokemaniacDamienSeenText:
	text "You want a"
	line "Slowpoke?"

	para "Too bad, they're"
	line "all mine!"
	done

PokemaniacDamienBeatenText:
	text "Ok, not really…"
	done

PokemaniacDamienAfterBattleText:
	text "I'd love to have"
	line "all the Slowpoke"
	cont "to myself,"

	para "but I can't do"
	line "that…"

	para "That would just"
	line "be selfish!"
	done

SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 15,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSuperNerdNed, -1
	object_event  5,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacDamien, -1
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
