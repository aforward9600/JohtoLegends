	object_const_def ; object_event constants
	const CELADONMANSION1F_GRANNY
	const CELADONMANSION1F_GROWLITHE1
	const CELADONMANSION1F_CLEFAIRY
	const CELADONMANSION1F_GROWLITHE2

CeladonMansion1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansionManager:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CeladonMansionManager2
	jumptextfaceplayer CeladonMansionManagerText

.CeladonMansionManager2:
	jumptextfaceplayer CeladonMansionManagerText2

CeladonMansion1FMeowth:
	refreshscreen
	pokepic MEOWTH
	cry MEOWTH
	waitbutton
	closepokepic
	opentext
	writetextend CeladonMansion1FMeowthText

CeladonMansion1FClefairy:
	refreshscreen
	pokepic CLEFAIRY
	cry CLEFAIRY
	waitbutton
	closepokepic
	opentext
	writetextend CeladonMansion1FClefairyText

CeladonMansion1FNidoranF:
	refreshscreen
	pokepic NIDORAN_F
	cry NIDORAN_F
	waitbutton
	closepokepic
	opentext
	writetextend CeladonMansion1FNidoranFText

CeladonMansionManagersSuiteSign:
	jumptext CeladonMansionManagersSuiteSignText

CeladonMansion1FBookshelf:
	jumpstd picturebookshelf

CeladonMansionManagerText:
	text "Those Feds tried"
	line "to bust in here"
	cont "one time, and I"

	para "had my #mon"
	line "attack!"

	para "They act all tough"
	line "until they fight"
	cont "someone tougher"
	cont "than them!"
	done

CeladonMansionManagerText2:
	text "Now that those"
	line "hooligans are"
	cont "gone, I can"
	cont "start renting"
	cont "again!"
	done

CeladonMansion1FMeowthText:
	text "Meowth: Meow!"
	done

CeladonMansion1FClefairyText:
	text "Clefairy: Clef"
	line "cleff!"
	done

CeladonMansion1FNidoranFText:
	text "Nidoran: Kya"
	line "kyaoo!"
	done

CeladonMansionManagersSuiteSignText:
	text "Celadon Mansion"
	line "Manager's Suite"
	done

CeladonMansion1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  6,  9, CELADON_CITY, 2
	warp_event  7,  9, CELADON_CITY, 2
	warp_event  3,  0, CELADON_CITY, 3
	warp_event  0,  0, CELADON_MANSION_2F, 1
	warp_event  7,  0, CELADON_MANSION_2F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  8, BGEVENT_UP, CeladonMansionManagersSuiteSign
	bg_event  0,  3, BGEVENT_READ, CeladonMansion1FBookshelf
	bg_event  2,  3, BGEVENT_READ, CeladonMansion1FBookshelf

	db 4 ; object events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionManager, -1
	object_event  2,  6, SPRITE_MEOWTH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FMeowth, -1
	object_event  3,  4, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FClefairy, -1
	object_event  4,  4, SPRITE_NIDORAN_F, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FNidoranF, -1
