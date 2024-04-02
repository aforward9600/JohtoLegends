	object_const_def ; object_event constants
	const CERULEANTRADESPEECHHOUSE_GRANNY
	const CERULEANTRADESPEECHHOUSE_GRAMPS
	const CERULEANTRADESPEECHHOUSE_RHYDON
	const CERULEANTRADESPEECHHOUSE_ZUBAT

CeruleanTradeSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanTradeSpeechHouseGrannyScript:
	jumptextfaceplayer CeruleanTradeSpeechHouseGrannyText

CeruleanTradeSpeechHouseGrampsScript:
	jumptextfaceplayer CeruleanTradeSpeechHouseGrampsText

CeruleanTradeSpeechHouseJynxScript:
	refreshscreen
	pokepic JYNX
	cry JYNX
	waitbutton
	closepokepic
	opentext
	writetext CeruleanTradeSpeechHouseJynxText
	waitbutton
	closetext
	end

CeruleanTradeSpeechHouseBulbasaurScript:
	refreshscreen
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext CeruleanTradeSpeechHouseBulbasaurText
	waitbutton
	closetext
	end

CeruleanTradeSpeechHouseGrannyText:
	text "My husband lives"
	line "happily with #-"
	cont "mon he got through"
	cont "trades."

	para "Although lately,"
	line "he's been more"
	cont "afraid of having"
	cont "them stolen."
	done

CeruleanTradeSpeechHouseGrampsText:
	text "They'll never take"
	line "Zynx away from me!"
	done

CeruleanTradeSpeechHouseJynxText:
	text "Zynx: Jynx jynx!"
	done

CeruleanTradeSpeechHouseBulbasaurText:
	text "Bulbasaur: Bulba!"
	done

CeruleanTradeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CERULEAN_CITY, 2
	warp_event  3,  7, CERULEAN_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseGrannyScript, -1
	object_event  1,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseGrampsScript, -1
	object_event  5,  2, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseJynxScript, -1
	object_event  5,  6, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseBulbasaurScript, -1
