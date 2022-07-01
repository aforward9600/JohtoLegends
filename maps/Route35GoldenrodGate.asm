	object_const_def ; object_event constants
	const ROUTE35GOLDENRODGATE_RANDY
	const ROUTE35GOLDENRODGATE_POKEFAN_F
	const ROUTE35GOLDENRODGATE_FISHER

Route35GoldenrodGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RandyScript:
	jumptextfaceplayer Route35GoldenrodGateGuardText
;	faceplayer
;	opentext
;	checkevent EVENT_GOT_HP_UP_FROM_RANDY
;	iftrue .gothpup
;	checkevent EVENT_GAVE_KENYA
;	iftrue .questcomplete
;	checkevent EVENT_GOT_KENYA
;	iftrue .alreadyhavekenya
;	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
;	yesorno
;	iffalse .refused
;	writetext Route35GoldenrodGateRandyThanksKidText
;	buttonsound
;	waitsfx
;	readvar VAR_PARTYCOUNT
;	ifequal PARTY_LENGTH, .partyfull
;	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
;	playsound SFX_KEY_ITEM
;	waitsfx
;	givepoke SPEAROW, 10, NO_ITEM, TRUE, GiftSpearowName, GiftSpearowOTName
;	givepokemail GiftSpearowMail
;	setevent EVENT_GOT_KENYA
;.alreadyhavekenya
;	writetext Route35GoldenrodGateRandyWeirdTreeBlockingRoadText
;	waitbutton
;	closetext
;	end

;.partyfull
;	writetext Route35GoldenrodGateRandyCantCarryAnotherMonText
;	waitbutton
;	closetext
;	end
;
;.refused
;	writetext Route35GoldenrodGateRandyOhNeverMindThenText
;	waitbutton
;	closetext
;	end
;
;.questcomplete
;	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
;	buttonsound
;	verbosegiveitem HP_UP
;	iffalse .bagfull
;	setevent EVENT_GOT_HP_UP_FROM_RANDY
;.gothpup
;	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
;	waitbutton
;.bagfull
;	closetext
;	end

GiftSpearowMail:
	db FLOWER_MAIL
	db   "DARK CAVE leads"
	next "to another road@"

GiftSpearowName:
	db "KENYA@"

GiftSpearowOTName:
	db "RANDY@"

	db 0 ; filler

Route35GoldenrodGatePokefanFScript:
	jumptextfaceplayer Route35GoldenrodGatePokefanFText

.FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText_FoughtSudowoodo
	waitbutton
	closetext
	end

Route35GoldenrodGateFisherScript:
	jumptextfaceplayer Route35GoldenrodGateFisherText

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "Excuse me, kid!"
	line "Can you do a guy"
	cont "a favor?"

	para "Can you take this"
	line "#MON with MAIL"
	cont "to my friend?"

	para "He's on ROUTE 31."
	done

Route35GoldenrodGateRandyThanksKidText:
	text "You will? Perfect!"
	line "Thanks, kid!"

	para "My pal's a chubby"
	line "guy who snoozes"
	cont "all the time."

	para "You'll recognize"
	line "him right away!"
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> received a"
	line "#MON with MAIL."
	done

Route35GoldenrodGateRandyWeirdTreeBlockingRoadText:
	text "You can read it,"
	line "but don't lose it!"
	cont "ROUTE 31!"

	para "Oh, yeah. There"
	line "was a weird tree"
	cont "blocking the road."

	para "I wonder if it's"
	line "been cleared?"
	done

Route35GoldenrodGateRandyCantCarryAnotherMonText:
	text "You can't carry"
	line "another #MON…"
	done

Route35GoldenrodGateRandyOhNeverMindThenText:
	text "Oh… Never mind,"
	line "then…"
	done

Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "Thanks, kid! You"
	line "made the delivery"
	cont "for me!"

	para "Here's something"
	line "for your trouble!"
	done

Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "My pal was snooz-"
	line "ing, right? Heh,"
	cont "what'd I say?"
	done

Route35GoldenrodGatePokefanFText:
	text "Apparently, some"
	line "guy keeps getting"

	para "punched by trees"
	line "around here."

	para "Sounds pretty"
	line "bogus to me."
	done

Route35GoldenrodGatePokefanFText_FoughtSudowoodo:
	text "I like the #MON"
	line "Lullaby they play"
	cont "on the radio."
	done

Route35GoldenrodGateFisherText:
	text "Some people have"
	line "said that there"

	para "are about 300"
	line "species of #-"
	cont "mon in Johto!"

	para "Can you believe"
	line "that?!"

	para "Though some think"
	line "that we'll have"
	cont "less in the"
	cont "future…"
	done

Route35GoldenrodGateGuardText:
	text "Did you go through"
	line "the National"
	cont "Forest?"

	para "Or did you just"
	line "take the side"
	cont "path?"

	para "You'll miss out on"
	line "some great #mon"
	cont "if you took the"
	cont "short cut."
	done

Route35GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGateFisherScript, -1
