	object_const_def ; object_event constants
	const BLACKTHORNDRAGONSPEECHHOUSE_GRANNY
	const BLACKTHORNDRAGONSPEECHHOUSE_EKANS

BlackthornDragonSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornDragonSpeechHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_DOLL_FROM_OLD_LADY
	iftrue .GotADoll
	checkevent EVENT_GOT_A_POKEMON_FROM_MASTER
	iftrue .GetADoll
	writetext ComeBackWithAPokemonText
	waitbutton
	closetext
	end

.GetADoll:
	writetext TakeThisDollText
	buttonsound
	waitsfx
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .GetLarvitarDoll
	setevent EVENT_DECO_DRATINI_DOLL
	getmonname STRING_BUFFER_3, DRATINI
	writetext PlayerReceivedStarterDollText
	sjump .FinishGettingDoll

.GetLarvitarDoll:
	setevent EVENT_DECO_LARVITAR_DOLL
	getmonname STRING_BUFFER_3, LARVITAR
	writetext PlayerReceivedStarterDollText
.FinishGettingDoll:
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	setevent EVENT_GOT_DOLL_FROM_OLD_LADY
.GotADoll:
	writetext TreatDollWellText
	waitbutton
	closetext
	end

BlackthornDragonSpeechHouseDratiniScript:
	refreshscreen
	pokepic DRATINI
	cry DRATINI
	waitbutton
	closepokepic
	opentext
	writetext BlackthornDragonSpeechHouseDratiniText
	waitbutton
	closetext
	end

; unused
BlackthornDragonSpeechHousePictureBookshelf:
	jumpstd picturebookshelf

; unused
BlackthornDragonSpeechHouseMagazineBookshelf:
	jumpstd magazinebookshelf

BlackthornDragonSpeechHouseGrannyText:
	text "A clan of trainers"
	line "who can freely"

	para "command dragons"
	line "live right here in"
	cont "Blackthorn."

	para "As a result, there"
	line "are many legends"

	para "about dragons in"
	line "this town."

	para "You should know."
	line "You live here."
	done

BlackthornDragonSpeechHouseDratiniText:
	text "Dratini: Draa!"
	done

PlayerReceivedStarterDollText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text " Doll!"
	done

ComeBackWithAPokemonText:
	text "Come back after"
	line "you have a"
	cont "#mon."

	para "I'll have a gift"
	line "for you."
	done

TakeThisDollText:
	text "What a cute"
	line "#mon!"

	para "Take this doll to"
	line "decorate your"
	cont "room!"
	done

TreatDollWellText:
	text "Treat that doll"
	line "well!"
	done

BlackthornDragonSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 2
	warp_event  3,  7, BLACKTHORN_CITY, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, MoveDeleterTelevision

	db 2 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornDragonSpeechHouseGrannyScript, -1
	object_event  5,  5, SPRITE_DRATINI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornDragonSpeechHouseDratiniScript, -1
