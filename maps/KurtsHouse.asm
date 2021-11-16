	object_const_def ; object_event constants
	const KURTSHOUSE_YOUNGSTER
	const KURTSHOUSE_SLOWPOKE

KurtsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KurtsHouseYoungster:
	faceplayer
	opentext
	writetext KurtsHouseYoungsterText
	waitbutton
	closetext
	end

KurtsHouseSlowpoke:
	refreshscreen
	pokepic SLOWPOKE
	cry SLOWPOKE
	waitbutton
	closepokepic
	opentext
	writetext KurtsHouseSlowpokeText
	waitbutton
	closetext
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseCelebiStatue:
	jumptext KurtsHouseCelebiStatueText

KurtsHouseBookshelf:
	jumpstd difficultbookshelf

KurtsHouseRadio:
	jumpstd radio2

KurtsHouseYoungsterText:
	text "I'm just here"
	line "to watch Kurt's"
	cont "Slowpoke."

	para "Apparently his son"
	line "has one as well."
	done

KurtsHouseSlowpokeText:
	text "Slowpoke: …"
	line "Yawn?"
	done

KurtsHouseOakPhotoText:
	text "A photo of young"
	line "Kurt with another"
	cont "young man."

	para "The other man is"
	line "holding a trophy."

	para "It says:"

	para "Me and Sam."
	done

KurtsHouseCelebiStatueText:
	text "It's a statue of"
	line "the forest's pro-"
	cont "tector."
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6,  1, BGEVENT_READ, KurtsHouseRadio
	bg_event  8,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  9,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  4,  1, BGEVENT_READ, KurtsHouseCelebiStatue

	db 2 ; object events
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsHouseYoungster, -1
	object_event  6,  3, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsHouseSlowpoke, -1
