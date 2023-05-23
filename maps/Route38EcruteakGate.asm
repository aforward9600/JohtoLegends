	object_const_def ; object_event constants
	const ROUTE38ECRUTEAKGATE_OFFICER
	const ROUTE38ECRUTEAKGATE_RIVAL

Route38EcruteakGate_MapScripts:
	db 2 ; scene scripts
	scene_script .Dummy0 ; SCENE_DEFAULT
	scene_script .Dummy1 ; SCENE_ECRUTEAK_GATE_RIVAL

	db 0 ; callbacks

.Dummy0:
	end

.Dummy1:
	end

Route38EcruteakGateOfficerScript:
	jumptextfaceplayer Route38EcruteakGateOfficerText

EcruteakGateRival2:
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement3
EcruteakGateRival1:
	special FadeOutMusic
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female1
	playmusic MUSIC_DAHLIA_ENCOUNTER
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement1
	opentext
	writetext GotAnEeveeText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar
	winlosstext RivalEcruteakGateWinText, RivalEcruteakGateLossText
	setlasttalked ROUTE38ECRUTEAKGATE_RIVAL
	loadtrainer RIVAL3, RIVAL3_B_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious

.Larvitar:
	winlosstext RivalEcruteakGateWinText, RivalEcruteakGateLossText
	setlasttalked ROUTE38ECRUTEAKGATE_RIVAL
	loadtrainer RIVAL3, RIVAL3_B_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious

.Female1:
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement1
	opentext
	writetext GotAnEeveeMaleText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar2
	winlosstext RivalEcruteakGateWinText, RivalEcruteakGateLossText
	setlasttalked ROUTE38ECRUTEAKGATE_RIVAL
	loadtrainer RIVAL4, RIVAL4_B_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious2

.AfterVictorious:
	playmusic MUSIC_DAHLIA_AFTER_BATTLE
	opentext
	writetext YouWonAgainText
	waitbutton
	closetext
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, DahliaLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear ROUTE38ECRUTEAKGATE_RIVAL
	setevent EVENT_ECRUTEAK_GATE_RIVAL_1
	setscene SCENE_DEFAULT
	waitsfx
	playmapmusic
	end

.Larvitar2:
	winlosstext RivalEcruteakGateWinText, RivalEcruteakGateLossText
	setlasttalked ROUTE38ECRUTEAKGATE_RIVAL
	loadtrainer RIVAL4, RIVAL4_B_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious2

.AfterVictorious2:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext YouWonAgainText
	waitbutton
	closetext
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, DahliaLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear ROUTE38ECRUTEAKGATE_RIVAL
	setevent EVENT_ECRUTEAK_GATE_RIVAL_1
	setscene SCENE_DEFAULT
	waitsfx
	playmapmusic
	end

Movement1:
	step RIGHT
	step RIGHT
	step_end

Movement2:
	step LEFT
	step LEFT
	step_end

Movement3:
	step DOWN
	step_end

Movement4:
	step LEFT
	step LEFT
	step UP
	step_end

MovementBack:
	step RIGHT
	step_end

DahliaLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route38EcruteakGateOfficerText:
	text "Where did you say"
	line "you're from?"

	para "Blackthorn City?"

	para "The Dragon Master"
	line "lives there,"
	cont "right?"

	para "You've come a long"
	line "way to get here."
	done

GotAnEeveeText:
	text "Hey, <PLAYER>!"

	para "I got an Eevee"
	line "from the Kimono"
	cont "girl at the Dance"
	cont "Theatre!"

	para "She's really nice,"
	line "and pretty too!"

	para "I hope I can be"
	line "that pretty"
	cont "someday…"

	para "…What? You're"
	line "saying that I'm"
	cont "already pretty?"

	para "Hehehe…"

	para "Stop it. You're"
	line "making me blush."

	para "P-please stop"
	line "talking and just"
	cont "battle me!"
	done

GotAnEeveeMaleText:
	text "Hey, <PLAYER>!"

	para "I got an Eevee"
	line "from the Kimono"
	cont "girl at the Dance"
	cont "Theatre!"

	para "She's really nice,"
	line "and pretty too!"

	para "…What? You're"
	line "saying I have a"
	cont "crush?"

	para "Uh…"

	para "Stop it. I'm not"
	line "blushing. I'm not!"

	para "P-please stop"
	line "talking and just"
	cont "battle me!"
	done

RivalEcruteakGateWinText:
	text "I guess I was"
	line "blushing"
	done

RivalEcruteakGateLossText:
	text "On the ropes"
	line "again!"
	done

YouWonAgainText:
	text "Well, looks like"
	line "you won again!"

	para "You're quite the"
	line "trainer, but I'm"
	cont "not giving up!"

	para "We'll just have to"
	line "keep battling each"
	cont "other to get"
	cont "better."

	para "I'm going on"
	line "ahead, so don't"
	cont "fall behind!"

	para "See ya!"
	done

Route38EcruteakGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_38, 1
	warp_event  0,  5, ROUTE_38, 2
	warp_event  9,  4, ECRUTEAK_CITY, 4
	warp_event  9,  5, ECRUTEAK_CITY, 5

	db 2 ; coord events
	coord_event 7, 4, SCENE_ECRUTEAK_GATE_RIVAL, EcruteakGateRival1
	coord_event 7, 5, SCENE_ECRUTEAK_GATE_RIVAL, EcruteakGateRival2

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateOfficerScript, -1
	object_event  4,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GATE_RIVAL_1
