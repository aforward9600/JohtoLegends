	object_const_def ; object_event constants
	const ROUTE31_FISHER
	const ROUTE31_YOUNGSTER
	const ROUTE31_TEACHER
	const ROUTE31_COOLTRAINER_M
	const ROUTE31_FRUIT_TREE
	const ROUTE31_POKE_BALL1
	const ROUTE31_POKE_BALL2
	const ROUTE31_COOLTRAINER_F

Route31_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerTeacherKawakami:
	trainer TEACHER, KAWAKAMI, EVENT_BEAT_TEACHER_KAWAKAMI, TeacherKawakamiSeenText, TeacherKawakamiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherKawakamiAfterText
	waitbutton
	closetext
	end

Route31MailRecipientScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM56_DREAM_EATER
	iftrue .DescribeNightmare
	writetext Text_Route31SleepyMan
	buttonsound
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForItems
	setevent EVENT_GOT_TM56_DREAM_EATER
	closetext
	end

.DescribeNightmare:
	writetext Text_Route31DescribeNightmare
	waitbutton
.NoRoomForItems:
	closetext
	end

TrainerCooltrainerFJessie:
	trainer COOLTRAINERF, JESSIE, EVENT_BEAT_COOLTRAINERF_JESSIE, CooltrainerFJessieSeenText, CooltrainerFJessieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFJessieRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_BEAUTY_ENCOUNTER
	writetext CooltrainerFJessieLetsDoItText
	waitbutton
	winlosstext CooltrainerFJessieBeatenText, 0
	loadtrainer COOLTRAINERF, JESSIE
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext CooltrainerFJessieRefusedText
	waitbutton
	closetext
	end

Route31YoungsterScript:
	jumptextfaceplayer Route31YoungsterText

Route31Sign:
	jumptext Route31SignText

DarkCaveSign:
	jumptext DarkCaveSignText

Route31CooltrainerMScript:
	jumptextfaceplayer Route31CooltrainerMText

Route31FruitTree:
	fruittree FRUITTREE_ROUTE_31

Route31Potion:
	itemball FULL_RESTORE

Route31PokeBall:
	itemball ULTRA_BALL

Route31CooltrainerMText:
	text "Sorry, but Dark"
	line "Cave is off-"
	cont "limits right now."

	para "The cave-in"
	line "should be cleared"
	cont "up soon."
	done

TeacherKawakamiSeenText:
	text "You should always"
	line "be open to"
	cont "learning!"
	done

TeacherKawakamiBeatenText:
	text "Looks like I need"
	line "to be more open to"
	cont "learning as well!"
	done

TeacherKawakamiAfterText:
	text "See, I learned"
	line "something new."

	para "Be sure to keep"
	line "learning!"
	done

Text_Route31SleepyMan:
	text "… Hnuurg… Huh?"

	para "I walked too far"
	line "today looking for"
	cont "#mon."

	para "My feet hurt and"
	line "I'm sleepy…"

	para "I took a nap, but"
	line "then I started to"
	cont "feel like…"

	para "Something was"
	line "eating my dreams…"

	para "…Huh?"

	para "Wh-where did this"
	line "TM come from?"

	para "H-here, you take"
	line "it!"
	done

Text_Route31DescribeNightmare:
	text "Ugh…I don't feel"
	line "so good now…"

	para "Something must"
	line "have been eating"
	cont "my dreams…"

	para "When Dream Eater"
	line "is used on a"

	para "sleeping #mon,"
	line "it heals the user."

	para "Scary, huh?"
	done

Route31YoungsterText:
	text "Have you met Mr."
	line "#mon?"

	para "He lives just"
	line "South of here."

	para "He's a little odd,"
	line "so I don't visit."
	done

CooltrainerFJessieSeenText:
	text "Not too many"
	line "trainers make it"
	cont "this far."
	done

CooltrainerFJessieBeatenText:
	text "I can see why!"
	done

CooltrainerFJessieRematchText:
	text "Want a rematch?"
	done

CooltrainerFJessieLetsDoItText:
	text "Let's get to it!"
	done

CooltrainerFJessieRefusedText:
	text "7 badges is no"
	line "joke. No wonder"
	cont "you're so strong!"
	done

Route31SignText:
	text "Route 31"

	para "Violet City -"
	line "Cherrygrove City"

	para "Cooltrainer Jessie"
	line "is waiting for"
	cont "battle!"
	done

DarkCaveSignText:
	text "Dark Cave"
	done

Route31_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  6, ROUTE_31_VIOLET_GATE, 3
	warp_event  4,  7, ROUTE_31_VIOLET_GATE, 4
	warp_event 34,  5, DARK_CAVE_VIOLET_ENTRANCE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  5, BGEVENT_READ, Route31Sign
	bg_event 31,  5, BGEVENT_READ, DarkCaveSign

	db 8 ; object events
	object_event 17,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31MailRecipientScript, -1
	object_event  9,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31YoungsterScript, -1
	object_event 19, 13, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerTeacherKawakami, -1
	object_event 34,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31CooltrainerMScript, EVENT_DARK_CAVE_GUARD
	object_event 16,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31FruitTree, -1
	object_event 29,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31Potion, EVENT_ROUTE_31_POTION
	object_event 13, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31PokeBall, EVENT_ROUTE_31_POKE_BALL
	object_event 30,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerFJessie, -1
