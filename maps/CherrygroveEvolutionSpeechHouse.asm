	object_const_def ; object_event constants
	const CHERRYGROVEEVOLUTIONSPEECHHOUSE_GRANNY
	const CHERRYGROVEEVOLUTIONSPEECHHOUSE_BEAUTY

CherrygroveEvolutionSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveEvolutionSpeechHouseBeautyScript:
	opentext
	writetext CherrygroveEvolutionSpeechHouseBeautyText
	waitbutton
	closetext
	end

CherrygroveEvolutionSpeechHouseGrannyScript:
	opentext
	writetext CherrygroveEvolutionSpeechHouseGrannyText
	waitbutton
	closetext
	end

CherrygroveEvolutionSpeechHouseBookshelf:
	jumpstd magazinebookshelf

CherrygroveEvolutionSpeechHouseBeautyText:
	text "A professor in New"
	line "Bark Town just got"
	cont "his certification."

	para "Apparently he"
	line "specializes in"
	cont "#mon evolution."
	done

CherrygroveEvolutionSpeechHouseGrannyText:
	text "Hmph!"

	para "Evolution! Pah!"

	para "If Arcanine evolve"
	line "from Growlithe,"
	cont "then why are there"
	cont "still Growlith?"
	done

CherrygroveEvolutionSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 5
	warp_event  3,  7, CHERRYGROVE_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CherrygroveEvolutionSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveEvolutionSpeechHouseBookshelf

	db 2 ; object events
	object_event  3,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CherrygroveEvolutionSpeechHouseGrannyScript, -1
	object_event  2,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveEvolutionSpeechHouseBeautyScript, -1
