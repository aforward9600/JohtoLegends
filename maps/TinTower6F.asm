	object_const_def ; object_event constants
	const TINTOWER6F_POKE_BALL
	const TINTOWER6F_ARIANA

TinTower6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower6FAriana:
	trainer ARIANA, ARIANA_4, EVENT_BEAT_TIN_TOWER_ARIANA, TinTower6FArianaSeenText, TinTower6FArianaBeatenText, Ariana4LastPokemonText, .Script

.Script:
	faceplayer
	opentext
	writetext TinTower6FArianaAfterText
	waitbutton
	closetext
	end

TinTower6FMaxPotion:
	itemball MAX_POTION

Ariana4LastPokemonText:
	text "Why?"

	para "I can't lose again"
	line "to you…"
	done

TinTower6FArianaSeenText:
	text "This is really"
	line "getting out of"
	cont "hand."

	para "No matter what we"
	line "do, you're right"
	cont "there."

	para "Please just go"
	line "away!"
	done

TinTower6FArianaBeatenText:
	text "…I just can't win…"
	done

TinTower6FArianaAfterText:
	text "…I can't muster"
	line "the energy to get"
	cont "mad…"

	para "This is just"
	line "depressing…"

	para "Please just get"
	line "out of my sight…"
	done

TinTower6F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  9, TIN_TOWER_7F, 1
	warp_event 11, 15, TIN_TOWER_5F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower6FMaxPotion, EVENT_TIN_TOWER_6F_MAX_POTION
	object_event  2,  1, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TinTower6FAriana, EVENT_TIN_TOWER_1F_WISE_TRIO_1
