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

Route38EcruteakGateRivalScript:
	jumptextfaceplayer Route38EcruteakRivalText

EcruteakGateRival1:
	special FadeOutMusic
	pause 10
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female1
	playmusic MUSIC_DAHLIA_ENCOUNTER
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement1
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .RivalBattle1
	writetext HeyDracoText
	waitbutton
	closetext
	applymovement PLAYER, MovementBack
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement2
	turnobject ROUTE38ECRUTEAKGATE_RIVAL, RIGHT
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.Female1:
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement1
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .RivalBattle1
	writetext HeyDahliaText
	waitbutton
	closetext
	applymovement PLAYER, MovementBack
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement2
	turnobject ROUTE38ECRUTEAKGATE_RIVAL, RIGHT
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.RivalBattle1:
	writetext GotAnEeveeText
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female3
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

.Female3:
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar2
	winlosstext RivalEcruteakGateWinText, RivalEcruteakGateLossText
	setlasttalked ROUTE38ECRUTEAKGATE_RIVAL
	loadtrainer RIVAL4, RIVAL4_B_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious2

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

EcruteakGateRival2:
	special FadeOutMusic
	pause 10
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female2
	playmusic MUSIC_DAHLIA_ENCOUNTER
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement3
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .RivalBattle2
	writetext HeyDracoText
	waitbutton
	closetext
	applymovement PLAYER, MovementBack
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement4
	turnobject ROUTE38ECRUTEAKGATE_RIVAL, RIGHT
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	playmapmusic
	end
.Female2:
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement3
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .RivalBattle2
	writetext HeyDahliaText
	waitbutton
	closetext
	applymovement PLAYER, MovementBack
	applymovement ROUTE38ECRUTEAKGATE_RIVAL, Movement4
	turnobject ROUTE38ECRUTEAKGATE_RIVAL, RIGHT
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.RivalBattle2:
	writetext GotAnEeveeText
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female4
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar3
	winlosstext RivalEcruteakGateWinText, RivalEcruteakGateLossText
	setlasttalked ROUTE38ECRUTEAKGATE_RIVAL
	loadtrainer RIVAL3, RIVAL3_B_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious3

.Larvitar3:
	winlosstext RivalEcruteakGateWinText, RivalEcruteakGateLossText
	setlasttalked ROUTE38ECRUTEAKGATE_RIVAL
	loadtrainer RIVAL3, RIVAL3_B_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious3

.AfterVictorious3:
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

.Female4:
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar4
	winlosstext RivalEcruteakGateWinText, RivalEcruteakGateLossText
	setlasttalked ROUTE38ECRUTEAKGATE_RIVAL
	loadtrainer RIVAL4, RIVAL4_B_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious4

.Larvitar4:
	winlosstext RivalEcruteakGateWinText, RivalEcruteakGateLossText
	setlasttalked ROUTE38ECRUTEAKGATE_RIVAL
	loadtrainer RIVAL4, RIVAL4_B_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious4

.AfterVictorious4:
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
	step RIGHT
	step RIGHT
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

Route38EcruteakRivalText:
	text "Test"
	done

HeyDracoText:
	text "Hey <PLAYER>!"

	para "Have you been to"
	line "the Ecruteak Dance"
	cont "House yet?"

	para "You can get a"
	line "#mon from the"
	cont "Kimono Girl there!"

	para "She's really nice,"
	line "and pretty too!"

	para "I hope I can be"
	line "that pretty"
	cont "someday..."

	para "...What? You're"
	line "saying that I'm"
	cont "already pretty?"

	para "Hehehe..."

	para "Stop it. You're"
	line "making me blush."
	cont "I-I-I'll see you"
	cont "later!"
	done

HeyDahliaText:
	text "Hey <PLAYER>!"

	para "Have you been to"
	line "the Ecruteak Dance"
	cont "House yet?"

	para "You can get a"
	line "#mon from the"
	cont "Kimono Girl there!"

	para "She's really nice,"
	line "and pretty too!"

	para "...What? You're"
	line "saying I have a"
	cont "crush?"

	para "Uh..."

	para "Stop it. I'm not"
	line "blushing. I'm not!"
	cont "I-I-I'll see you"
	cont "later!"
	done

GotAnEeveeText:
	text "Hey, <PLAYER>!"

	para "Looks like you got"
	line "an Eevee too!"

	para "Wanna see whose is"
	line "stronger?"
	done

RivalEcruteakGateWinText:
	text "I guess yours is"
	line "is stronger."
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
	object_event  4,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateRivalScript, EVENT_ECRUTEAK_GATE_RIVAL_1
