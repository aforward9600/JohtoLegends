	object_const_def ; object_event constants
	const POKESEERSHOUSE_GRANNY

PokeSeersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeerScript:
	faceplayer
	opentext
	writetext ShallITellYouText
	waitbutton
	closetext
	end

PokeSeerTelevision:
	jumpstd televisionscript

ShallITellYouText:
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #mon!"

	para "…What's that?"

	para "You don't need me"
	line "to tell you about"
	cont "your #mon?"

	para "…A fourth stats"
	line "page?"

	para "What are you even"
	line "talking about?!"

	para "Tch, kids these"
	line "days…"
	done

PokeSeersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 7
	warp_event  3,  7, CIANWOOD_CITY, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, PokeSeerTelevision

	db 1 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeerScript, -1
