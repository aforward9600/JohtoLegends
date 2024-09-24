	object_const_def ; object_event constants
	const CERULEANGYM_DAISY
	const CERULEANGYM_LILY
	const CERULEANGYM_SWIMMER_GIRL1
	const CERULEANGYM_SWIMMER_GIRL2
	const CERULEANGYM_SWIMMER_GUY
	const CERULEANGYM_VIOLET

CeruleanGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletLastMonText:
	text "Not yet!"
	done

DaisyLastMonText:
	text "Last one already?"

	para "Man!"
	done

LilyLastMonText:
	text "…Last one, huh?"
	done

CeruleanGymVioletScript:
	faceplayer
	opentext
	readvar VAR_FACING
	ifequal DOWN, .PleaseGetOnTheDock
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .SensationalRematch
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	checkevent EVENT_CERULEAN_GYM_LILY
	iftrue .FindLily
	writetext VioletIntroText
	waitbutton
	closetext
	winlosstext VioletWinLossText, VioletLastMonText
	loadtrainer SENSATIONAL1, VIOLET1
	setlasttalked CERULEANGYM_VIOLET
	startbattle
	reloadmapafterbattle
	pause 10
	turnobject PLAYER, LEFT
	opentext
	writetext DaisyIntroText
	waitbutton
	closetext
	winlosstext DaisyWinLossText, DaisyLastMonText
	loadtrainer SENSATIONAL2, DAISY
	setlasttalked CERULEANGYM_DAISY
	startbattle
	reloadmapafterbattle
	pause 10
	turnobject PLAYER, RIGHT
	special FadeOutMusic
	pause 10
	opentext
	writetext LilyIntroText
	waitbutton
	closetext
	winlosstext LilyWinLossText2, LilyLastMonText
	loadtrainer SENSATIONAL3, LILY
	setlasttalked CERULEANGYM_LILY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SENSATIONAL_SISTERS
	clearevent EVENT_CERULEAN_CITY_CIVILLIANS
	setevent EVENT_BEAT_SWIMMERF_AQUA
	setevent EVENT_BEAT_SWIMMERF_SHEILA
	setevent EVENT_BEAT_SWIMMERM_TANNER
	opentext
	writetext ReceivedCascadeBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
	setevent EVENT_DECO_CARPET_2
	writetext MistyFightDoneText
	sjump .EndViolet

.FightDone:
	writetext VioletAfterText
	sjump .EndViolet

.FindLily:
	writetext FindLilyText
	sjump .EndViolet

.PleaseGetOnTheDock:
	writetext PleaseGetOnTheDockText
.EndViolet:
	waitbutton
	closetext
	turnobject CERULEANGYM_VIOLET, DOWN
	end

.SensationalRematch:
	checkflag ENGINE_HUEY
	iftrue .VioletPost
	writetext VioletRematchText
	waitbutton
	closetext
	winlosstext VioletWinLossText, VioletLastMonText
	loadtrainer SENSATIONAL1, VIOLET1
	setlasttalked CERULEANGYM_VIOLET
	startbattle
	reloadmapafterbattle
	pause 10
	turnobject PLAYER, LEFT
	opentext
	writetext DaisyIntroText
	waitbutton
	closetext
	winlosstext DaisyWinLossText, DaisyLastMonText
	loadtrainer SENSATIONAL2, DAISY
	setlasttalked CERULEANGYM_DAISY
	startbattle
	reloadmapafterbattle
	pause 10
	turnobject PLAYER, RIGHT
	opentext
	writetext LilyRematchText
	waitbutton
	closetext
	winlosstext LilyWinLossText, LilyLastMonText
	loadtrainer SENSATIONAL3, LILY
	setlasttalked CERULEANGYM_LILY
	startbattle
	reloadmapafterbattle
	opentext
	writetext LilyAfterRematchText
	waitbutton
	closetext
	setflag ENGINE_HUEY
	end

.VioletPost:
	writetext VioletAfterRematchText
	waitbutton
	closetext
	end

CeruleanGymDaisyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .DaisyRematch
	checkevent EVENT_CERULEAN_GYM_LILY
	iftrue .CeruleanGymDaisy2
	checkevent EVENT_BEAT_SENSATIONAL_SISTERS
	iftrue .DaisyAfter
	writetext CeruleanGymDaisyText3
	waitbutton
	closetext
	turnobject CERULEANGYM_DAISY, DOWN
	end

.CeruleanGymDaisy2:
	writetext CeruleanGymDaisyText1
	waitbutton
	closetext
	turnobject CERULEANGYM_DAISY, DOWN
	end

.DaisyAfter:
	writetext CeruleanGymDaisyText2
	waitbutton
	closetext
	turnobject CERULEANGYM_DAISY, DOWN
	end

.DaisyRematch:
	checkflag ENGINE_HUEY
	iffalse .DaisyPost
	writetext CeruleanGymDaisyText4
	waitbutton
	closetext
	turnobject CERULEANGYM_DAISY, DOWN
	end

.DaisyPost:
	writetext CeruleanGymDaisyText5
	waitbutton
	closetext
	turnobject CERULEANGYM_DAISY, DOWN
	end

CeruleanGymLilyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .LilyRematch
	checkevent EVENT_BEAT_SENSATIONAL_SISTERS
	iftrue .LilyAfter
	writetext CeruleanGymLilyText1
	waitbutton
	closetext
	turnobject CERULEANGYM_LILY, DOWN
	end

.LilyAfter:
	writetext CeruleanGymLilyText2
	waitbutton
	closetext
	turnobject CERULEANGYM_LILY, DOWN
	end

.LilyRematch:
	checkflag ENGINE_HUEY
	iffalse .LilyPost
	writetext CeruleanGymLilyText3
	waitbutton
	closetext
	turnobject CERULEANGYM_LILY, DOWN
	end

.LilyPost:
	writetext CeruleanGymLilyText4
	waitbutton
	closetext
	turnobject CERULEANGYM_LILY, DOWN
	end

TrainerSwimmerfDiana:
	trainer SWIMMERF, SHEILA, EVENT_BEAT_SWIMMERF_SHEILA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfBriana:
	trainer SWIMMERF, AQUA, EVENT_BEAT_SWIMMERF_AQUA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfBrianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer SWIMMERM, TANNER, EVENT_BEAT_SWIMMERM_TANNER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	waitbutton
	closetext
	end

VioletIntroText:
	text "Violet: You wanna"
	line "see how strong we"
	cont "are?"

	para "Alrighty!"

	para "You'll have to"
	line "fight all three of"
	cont "us in a row!"

	para "Lose at all, and"
	line "you'll have to"
	cont "start over!"

	para "Are you ready to"
	line "find out why we're"
	cont "called the Sensa-"
	cont "tional Sisters?"
	done

VioletWinLossText:
	text "Violet: Oh man…"
	done

DaisyWinLossText:
	text "Daisy: Well, that"
	line "was fun!"
	done

LilyWinLossText:
	text "Lily: …Can we"
	line "really do this?"
	done

ReceivedCascadeBadgeText:
	text "The Sensational"
	line "Sisters received"
	cont "CascadeBadge."
	done

MistyFightDoneText:
	text "Lily: This was Mom"
	line "and Dad's badge,"
	cont "right?"

	para "…Seeing this badge"
	line "like this…"

	para "…When you're ready"
	line "for us, let us"
	cont "know."

	para "We'll kick their"
	line "butts good!"
	done

SwimmerfDianaSeenText:
	text "The Feds like us-"
	line "ing the pool, so"
	cont "they just leave it"
	cont "alone."
	done

SwimmerfDianaBeatenText:
	text "At least you're"
	line "not a Fed!"
	done

SwimmerfDianaAfterBattleText:
	text "I'll be happy to"
	line "just swim in peace"
	cont "someday."
	done

SwimmerfBrianaSeenText:
	text "You here for some"
	line "exercise?"
	done

SwimmerfBrianaBeatenText:
	text "I guess not…"
	done

SwimmerfBrianaAfterBattleText:
	text "I exercise to keep"
	line "healthy."

	para "Makes running away"
	line "from the Feds"
	cont "easier!"
	done

SwimmermParkerSeenText:
	text "Stretch before you"
	line "swim!"
	done

SwimmermParkerBeatenText:
	text "Ah! Cramp!"
	done

SwimmermParkerAfterBattleText:
	text "Cramps can be"
	line "deadly!"

	para "Stretch real good"
	line "first!"
	done

CeruleanGymDaisyText1:
	text "Daisy: You should"
	line "talk to Violet in"
	cont "the middle first!"

	para "Then we can get"
	line "started!"
	done

CeruleanGymDaisyText3:
	text "Daisy: Would you"
	line "mind finding my"
	cont "sisters first?"

	para "I don't wanna"
	line "start without"
	cont "them!"
	done

CeruleanGymDaisyText2:
	text "Daisy: When you"
	line "call us, we'll"
	cont "come to help!"
	done

CeruleanGymLilyText1:
	text "Lily: …Can you"
	line "talk with Violet"
	cont "first?"

	para "…I think she'll be"
	line "a better first"
	cont "match…"
	done

CeruleanGymLilyText2:
	text "Lily: …We'll make"
	line "those Feds pay…"
	done

FindLilyText:
	text "Violet: Before we"
	line "begin, can you go"
	cont "find Lily?"

	para "We don't want to"
	line "start without her!"
	done

VioletAfterText:
	text "Violet: Let's do"
	line "it!"

	para "Let's beat them up!"
	done

PleaseGetOnTheDockText:
	text "Violet: Please get"
	line "on the dock so we"
	cont "can battle."
	done

DaisyIntroText:
	text "Daisy: I'm up next!"

	para "I'm not a pushover"
	line "like Violet!"
	done

LilyIntroText:
	text "Lily: You're the"
	line "Champion, right?"

	para "…I thought so."

	para "…I was hoping that"
	line "you'd come…"

	para "…My sisters may"
	line "not show it, but"
	cont "after our parents"
	cont "passed away…"

	para "Violet:……………………"
	
	para "Daisy:………………………"

	para "Lily: We've been"
	line "having a hard time"
	cont "moving on…"

	para "…I think with your"
	line "help, we can make"
	cont "our region a"
	cont "better place…"

	para "…We can make it"
	line "better for every-"
	cont "one…"

	para "…Alright, I think"
	line "I'm ready."

	para "Hit me with your"
	line "best shot!"
	done

CeruleanGymDaisyText4:
	text "Daisy: You want a"
	line "rematch?"

	para "Talk to Violet and"
	line "we'll get started!"
	done

CeruleanGymLilyText3:
	text "Lily: Speak with"
	line "Violet if you want"
	cont "to face us again."
	done

CeruleanGymDaisyText5:
	text "Daisy: I think I'll"
	line "go swimming today!"
	done

CeruleanGymLilyText4:
	text "Lily: Thank you,"
	line "<PLAYER>."

	para "For everything."
	done

VioletAfterRematchText:
	text "Violet: We beat"
	line "those guys pretty"
	cont "bad, huh?"
	done

VioletRematchText:
	text "Violet: Here for a"
	line "rematch, huh?"

	para "We'll be happy to"
	line "play with you!"
	done

LilyRematchText:
	text "Lily: I'm feeling"
	line "much better than"
	cont "I was during our"
	cont "first battle."

	para "I think I'll do"
	line "better this time!"
	done

LilyAfterRematchText:
	text "Lily: I lost, but"
	line "I don't feel bad"
	cont "about it."

	para "It feels good to"
	line "have fun again."

	para "Thank you <PLAYER>."
	done

LilyWinLossText2:
	text "Lily: It's been a"
	line "while since I've"
	cont "felt this good."
	done

CeruleanGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, CERULEAN_CITY, 4
	warp_event  5, 15, CERULEAN_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  3,  3, SPRITE_SENSATIONAL_BLONDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymDaisyScript, EVENT_CERULEAN_GYM_DAISY
	object_event  5,  3, SPRITE_SENSATIONAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymLilyScript, EVENT_CERULEAN_GYM_LILY
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  3, SPRITE_SENSATIONAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymVioletScript, EVENT_CERULEAN_GYM_VIOLET
