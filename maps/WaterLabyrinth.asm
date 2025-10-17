	object_const_def ; object_event constants
	const WATERLABYRINTH_SWIMMER_GIRL
	const WATERLABYRINTH_SWIMMER
	const WATERLABYRINTH_SUPER_NERD

WaterLabyrinth_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerFKana:
	trainer SWIMMERF, KANA, EVENT_BEAT_SWIMMERF_JILL, SwimmerFKanaSeenText, SwimmerFKanaBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext SwimmerFKanaAfterText

TrainerSwimmerMBrad:
	trainer SWIMMERM, BRAD, EVENT_BEAT_SWIMMERM_PATON, SwimmerMBradSeenText, SwimmerMBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext SwimmerMBradAfterText

WaterLabyrinthSuperNerd:
	faceplayer
	opentext
	checkevent EVENT_PASSWORD_SINGULAR
	iftrue .NoMunchlaxEgg
	checkevent EVENT_GOT_SHINY_MUNCHLAX_EGG
	iftrue .AlreadyGotMunchlaxEgg
	writetext SuperNerdEggText
	buttonsound
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	checkflag ENGINE_SHINY_PASSWORD
	iftrue .AlreadyHavePassword
	setflag ENGINE_SHINY_PASSWORD
	giveegg MUNCHLAX, 5
	clearflag ENGINE_SHINY_PASSWORD
	sjump .FinishMunchlaxEgg

.AlreadyHavePassword:
	giveegg MUNCHLAX, 5
.FinishMunchlaxEgg:
	getstring STRING_BUFFER_4, .eggname
	setevent EVENT_GOT_SHINY_MUNCHLAX_EGG
.AlreadyGotMunchlaxEgg:
	writetextend AlreadyGotMunchlaxEggText

.eggname:
	db "Egg@"

.NoMunchlaxEgg:
	writetextend CantGiveMunchlaxEgg

.PartyFull:
	writetextend MunchlaxEggPartyFullText

MunchlaxEggPartyFullText:
	text "I can't trust this"
	line "Egg to you unless"
	cont "you have room."
	done

SuperNerdEggText:
	text "Good job on making"
	line "it through the"
	cont "maze."

	para "Have an Egg as a"
	line "reward."
	done

AlreadyGotMunchlaxEggText:
	text "Take good care of"
	line "of the Egg."
	done

CantGiveMunchlaxEgg:
	text "Sorry, but I can't"
	line "give you an Egg on"
	cont "a solo run."
	done

SwimmerFKanaSeenText:
	text "I can't stand that"
	line "Selphy!"
	done

SwimmerFKanaBeatenText:
	text "She's such a snob!"
	done

SwimmerFKanaAfterText:
	text "I tried to be her"
	line "friend, but she"
	cont "just laughed at"
	cont "me for not being"
	cont "rich!"
	done

SwimmerMBradSeenText:
	text "I heard there was"
	line "a reward at the"
	cont "end of this maze."
	done

SwimmerMBradBeatenText:
	text "I don't think I'm"
	line "smart enough to"
	cont "get through this…"
	done

SwimmerMBradAfterText:
	text "Forget it!"

	para "It's probably not"
	line "anything good!"
	done

WaterLabyrinth_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 47,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmerFKana, -1
	object_event 42,  3, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmerMBrad, -1
	object_event  9,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WaterLabyrinthSuperNerd, -1
	