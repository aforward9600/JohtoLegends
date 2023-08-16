	object_const_def ; object_event constants
	const GOLDENRODDEPTSTORE1F_RECEPTIONIST
	const GOLDENRODDEPTSTORE1F_POKEFAN_F
	const GOLDENRODDEPTSTORE1F_BUG_CATCHER
	const GOLDENRODDEPTSTORE1F_GENTLEMAN
	const GOLDENRODDEPTSTORE1F_LUCKY_NUMBER

GoldenrodDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodDeptStore1FReceptionistScript:
	jumptextfaceplayer GoldenrodDeptStore1FReceptionistText

GoldenrodDeptStore1FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore1FGentlemanText

GoldenrodDeptStore1FPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStore1FPokefanFText

GoldenrodDeptStore1FLassScript:
	jumptextfaceplayer GoldenrodDeptStore1FLassText

GoldenrodDeptStore1FDirectory:
	jumptext GoldenrodDeptStore1FDirectoryText

GoldenrodDeptStore1FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore1FLuckyNumber:
	faceplayer
	opentext
	writetext DeptStore1FLuckyNumberAskToPlayText
	buttonsound
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext DeptStore1FLuckyNumberThisWeeksIdIsText
	buttonsound
	closetext
	pause 15
	opentext
	writetext DeptStore1FLuckyNumberCheckIfMatchText
	buttonsound
	waitsfx
	writetext DeptStore1FLuckyNumberDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	buttonsound
	special CheckForLuckyNumberWinners
	closetext
	pause 15
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	sjump .NoPrize

.GameOver:
	writetext DeptStore1FLuckyNumberComeAgainText
	waitbutton
	closetext
	end

.FirstPlace:
	writetext DeptStore1FLuckyNumberPerfectMatchText
	playsound SFX_1ST_PLACE
	waitsfx
	buttonsound
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.SecondPlace:
	writetext DeptStore1FLuckyNumberOkayMatchText
	playsound SFX_2ND_PLACE
	waitsfx
	buttonsound
	giveitem RARE_CANDY
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.ThirdPlace:
	writetext DeptStore1FLuckyNumberWeakMatchText
	playsound SFX_3RD_PLACE
	waitsfx
	buttonsound
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.NoPrize:
	writetext DeptStore1FLuckyNumberNoneOfYourIDNumbersMatchText
	waitbutton
	closetext
	end

.BagFull:
	writetext DeptStore1FLuckyNumberNoRoomForYourPrizeText
	waitbutton
	closetext
	end

GoldenrodDeptStore1FReceptionistText:
	text "Welcome to Golden-"
	line "rod Dept.Store."
	done

GoldenrodDeptStore1FGentlemanText:
	text "The Dept.Store"
	line "has a decent se-"
	cont "lection."

	para "But some items"
	line "are only available"

	para "as Game Corner"
	line "prizes."
	done

GoldenrodDeptStore1FPokefanFText:
	text "My daughter loves"
	line "to shop."

	para "Frankly, I don't"
	line "see the fun in it."
	done

GoldenrodDeptStore1FLassText:
	text "Yay!"

	para "Shopping,"
	line "shopping,"
	cont "shopping!"
	done

GoldenrodDeptStore1FDirectoryText:
	text "1F Service Counter"

	para "2F Trainer's"
	line "   Market"

	para "3F Battle"
	line "   Collection"

	para "4F Medicine Box"

	para "5F TM Corner"

	para "6F Tranquil Square"

	para "Rooftop Lookout"
	done

DeptStore1FLuckyNumberAskToPlayText:
	text "Hi, are you here"
	line "for the Lucky Num-"
	cont "ber Game?"

	para "Want me to check"
	line "the ID numbers of"
	cont "your #mon?"

	para "If you get lucky,"
	line "you win a prize."
	done

DeptStore1FLuckyNumberThisWeeksIdIsText:
	text "Today's ID"
	line "number is @"
	text_ram wStringBuffer3
	text "."
	done

DeptStore1FLuckyNumberCheckIfMatchText:
	text "Let's see if you"
	line "have a match."
	done

DeptStore1FLuckyNumberDotDotDotText:
	text "<……>"
	line "<……>"
	done

DeptStore1FLuckyNumberComeAgainText:
	text "Please come back"
	line "tomorrow for the"
	cont "next Lucky Number."
	done

DeptStore1FLuckyNumberPerfectMatchText:
	text "Wow! You have a"
	line "perfect match of"
	cont "all five numbers!"

	para "We have a grand"
	line "prize winner!"

	para "You have won this"
	line "strange Ball that"

	para "was given to us"
	line "by a strange man"
	cont "in all black!"
	done

DeptStore1FLuckyNumberOkayMatchText:
	text "Hey! You've"
	line "matched the last"
	cont "three numbers!"

	para "You've won second"
	line "prize, a Rare"
	cont "Candy!"
	done

DeptStore1FLuckyNumberWeakMatchText:
	text "Ooh, you've"
	line "matched the last"
	cont "two numbers."

	para "You've won third"
	line "prize, a PP Up."
	done

DeptStore1FLuckyNumberNoneOfYourIDNumbersMatchText:
	text "Nope, none of your"
	line "ID numbers match."
	done

DeptStore1FLuckyNumberNoRoomForYourPrizeText:
	text "You've got no room"
	line "for your prize."

	para "Make room and come"
	line "back right away."
	done

GoldenrodDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, GOLDENROD_CITY, 9
	warp_event  8,  7, GOLDENROD_CITY, 9
	warp_event 15,  0, GOLDENROD_DEPT_STORE_2F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore1FElevatorButton

	db 5 ; object events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FReceptionistScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FPokefanFScript, -1
	object_event  5,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FLassScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FGentlemanScript, -1
	object_event 11,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FLuckyNumber, -1
