	object_const_def ; object_event constants
	const MANIASHOUSE_ROCKER
	const MANIASHOUSE_POKEFAN_F
	const MANIASHOUSE_SNEASEL
	const MANIASHOUSE_SHUCKLE

ManiasHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ManiaScript:
	jumptextfaceplayer MyPokemonAreCoolText

ManiaMotherScript:
	jumptextfaceplayer MyHusbandText

SneaselScript:
	refreshscreen
	pokepic SNEASEL
	cry SNEASEL
	waitbutton
	closepokepic
	opentext
	writetext SneaselText
	waitbutton
	closetext
	end

ShuckleScript:
	refreshscreen
	pokepic SHUCKLE
	cry SHUCKLE
	waitbutton
	closepokepic
	opentext
	writetext ShuckleText
	waitbutton
	closetext
	end

MyPokemonAreCoolText:
	text "Aren't my #mon"
	line "so cool?"

	para "I hope to be with"
	line "them forever!"
	done

MyHusbandText:
	text "My husband travels"
	line "and always brings"
	cont "home a new #mon"
	cont "for our son."

	para "If he keeps going,"
	line "we might as well"
	cont "open a zoo like in"
	cont "Fuchsia City."
	done

SneaselText:
	text "Sneasel: Sneasa!"
	done

ShuckleText:
	text "Shuckle: Durrur!"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, CianwoodTelevision

	db 4 ; object events
	object_event  2,  4, SPRITE_KID, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
	object_event  5,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaMotherScript, -1
	object_event  0,  2, SPRITE_SNEASEL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SneaselScript, -1
	object_event  5,  1, SPRITE_SHUCKLE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShuckleScript, -1
