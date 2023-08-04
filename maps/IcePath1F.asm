	object_const_def ; object_event constants
	const ICEPATH1F_POKE_BALL1
	const ICEPATH1F_POKE_BALL2
	const ICEPATH1F_POKE_BALL3
	const ICEPATH1F_YOUNGSTER
	const ICEPATH1F_TWIN
	const ICEPATH1F_LASS
	const ICEPATH1F_SMOOCHUM
	const ICEPATH1F_PRYCE

IcePath1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .PryceMonday

.PryceMonday:
	checkevent EVENT_BEAT_PRYCE
	iftrue .IsItMonday
	disappear ICEPATH1F_PRYCE
	return

.IsItMonday:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .PryceAppears
	disappear ICEPATH1F_PRYCE
	return

.PryceAppears:
	appear ICEPATH1F_PRYCE
	return

IcePath1FTMHail:
	itemball TM_HAIL

IcePath1FPotion:
	itemball POTION

IcePath1FPokeBall:
	itemball POKE_BALL

IcePath1FBrotherScript:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .BrotherFemale
	jumptextfaceplayer IcePath1FBrotherText1

.BrotherFemale:
	jumptextfaceplayer IcePath1FBrotherText2

IcePath1FSisterScript:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .SisterFemale
	jumptextfaceplayer IcePath1FSisterText1

.SisterFemale:
	jumptextfaceplayer IcePath1FSisterText2

TrainerPicnickerHaylee:
	trainer PICNICKER, HAYLEE, EVENT_BEAT_PICNICKER_HAYLEE, PicnickerHayleeSeenText, PicnickerHayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHayleeAfterText
	waitbutton
	closetext
	end

IcePath1FSmoochumScript:
	refreshscreen
	pokepic SMOOCHUM
	cry SMOOCHUM
	waitbutton
	closepokepic
	opentext
	writetext IcePath1FSmoochumText
	waitbutton
	closetext
	end

IcePath1FPryceScript:
	jumptextfaceplayer IcePath1FPryceText

IcePath1FBrotherText1:
	text "My sister was"
	line "looking for a"
	cont "Smoochum, but she"
	cont "almost gave up."

	para "Some teenage girl"
	line "felt bad and gave"
	cont "her one."

	para "I'm forever in her"
	line "debt. Now we can"
	cont "get out of here"
	cont "before I freeze."
	done

IcePath1FBrotherText2:
	text "My sister was"
	line "looking for a"
	cont "Smoochum, but she"
	cont "almost gave up."

	para "Some teenage boy"
	line "felt bad and gave"
	cont "her one."

	para "I'm forever in his"
	line "debt. Now we can"
	cont "get out of here"
	cont "before I freeze."
	done

IcePath1FSisterText1:
	text "Yay! Smoochum,"
	line "Smoochum,"
	cont "Smoochum!"

	para "I want to thank"
	line "her again!"
	done

IcePath1FSisterText2:
	text "Yay! Smoochum,"
	line "Smoochum,"
	cont "Smoochum!"

	para "I want to thank"
	line "him again!"
	done

PicnickerHayleeSeenText:
	text "Over there is the"
	line "exit to Route 44."

	para "How about a battle"
	line "to celebrate"
	cont "leaving this"
	cont "frigid cavern?"
	done

PicnickerHayleeBeatenText:
	text "You certainly"
	line "celebrated!"
	done

PicnickerHayleeAfterText:
	text "After Route 44 is"
	line "Mahogany Town."

	para "The Gym Leader"
	line "there is not very"
	cont "easy for Dragon"
	cont "trainers."
	done

IcePath1FSmoochumText:
	text "Smoochum: Smoo-"
	line "mooo!"
	done

IcePath1FPryceText:
	text "This cold is"
	line "certainly not good"
	cont "for my back,"

	para "but it helps"
	line "improve the power"
	cont "of my #mon!"

	para "You should just"
	line "try standing here"
	cont "sometime!"
	done

IcePath1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 19, ROUTE_44, 1
	warp_event 36, 27, BLACKTHORN_CITY, 7
	warp_event 37,  5, ICE_PATH_B1F, 1
	warp_event 37, 13, ICE_PATH_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event 31,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, IcePath1FTMHail, EVENT_GOT_TM07_HAIL
	object_event 32, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FPotion, EVENT_ICE_PATH_1F_PP_UP
	object_event 33,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FPokeBall, EVENT_ICE_PATH_1F_POKE_BALL
	object_event 19,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePath1FBrotherScript, -1
	object_event 21,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePath1FSisterScript, -1
	object_event 11, 15, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerPicnickerHaylee, -1
	object_event 20,  2, SPRITE_SMOOCHUM, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, IcePath1FSmoochumScript, -1
	object_event 28,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePath1FPryceScript, EVENT_ICE_PATH_1F_PRYCE
