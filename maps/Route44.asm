	object_const_def ; object_event constants
	const ROUTE44_FISHER1
	const ROUTE44_FISHER2
	const ROUTE44_YOUNGSTER1
	const ROUTE44_SUPER_NERD
	const ROUTE44_YOUNGSTER2
	const ROUTE44_FRUIT_TREE
	const ROUTE44_POKE_BALL1
	const ROUTE44_POKE_BALL2
	const ROUTE44_POKE_BALL3
	const ROUTE44_LASS

Route44_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperSal:
	trainer BIRD_KEEPER, SAL, EVENT_BEAT_BIRD_KEEPER_SAL, BirdKeeperSalSeenText, BirdKeeperSalBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperSalAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyFinn:
	trainer SCHOOLBOY, FINN, EVENT_BEAT_SCHOOLBOY_FINN, SchoolboyFinnSeenText, SchoolboyFinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyFinnAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherLyle:
	trainer FISHER, LYLE1, EVENT_BEAT_FISHER_LYLE, FisherLyleSeenText, FisherLyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherLyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherButch:
	trainer FISHER, BUTCH, EVENT_BEAT_FISHER_BUTCH, FisherButchSeenText, FisherButchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherButchAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterGordy:
	trainer YOUNGSTER, GORDY, EVENT_BEAT_YOUNGSTER_GORDY, YoungsterGordySeenText, YoungsterGordyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordyAfterBattleText
	waitbutton
	closetext
	end

;TrainerBugCatcherColton:
;	trainer BUG_CATCHER, COLTON, EVENT_BEAT_BUG_CATCHER_COLTON, BugCatcherColtonSeenText, BugCatcherColtonBeatenText, 0, .Script
;
;.Script:
;	endifjustbattled
;	opentext
;	writetext BugCatcherColtonAfterBattleText
;	waitbutton
;	closetext
;	end

Route44Sign1:
	jumptext Route44Sign1Text

Route44Sign2:
	jumptext Route44Sign2Text

Route44FruitTree:
	fruittree FRUITTREE_ROUTE_44

Route44Revive:
	itemball REVIVE

Route44PokeBall:
	itemball POKE_BALL

Route44Repel:
	itemball REPEL

Route44HiddenElixer:
	hiddenitem ETHER, EVENT_ROUTE_44_HIDDEN_ELIXER

Route44HealScript:
	faceplayer
	opentext
	writetext Route44HealRestAWhileText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext Route44HealKeepAtItText
	waitbutton
	closetext
	end

FisherLyleSeenText:
	text "Ain't nothin'"
	line "better than some"
	cont "good ol' fishin',"
	cont "eh?"
	done

FisherLyleBeatenText:
	text "Losin' certainly"
	line "ain't better."
	done

FisherLyleAfterBattleText:
	text "Luckily the ponds"
	line "here aren't frozen"
	cont "anymore."

	para "Ice fishin' ain't"
	line "my thing."
	done

FisherButchSeenText:
	text "Hey pal, you wanna"
	line "fish?"

	para "I'll let you in on"
	line "a secret if you"
	cont "beat me!"
	done

FisherButchBeatenText:
	text "Alright, alright!"
	line "I'll tell ya."
	done

FisherButchAfterBattleText:
	text "Up at the Lake of"
	line "Rage, my buddy has"
	cont "some fishing rods"

	para "he likes to give"
	line "away."

	para "Go see him if you"
	line "want to start"
	cont "learning how to"
	cont "fish."
	done

BirdKeeperSalSeenText:
	text "You came through"
	line "the Ice Path?"

	para "Good job. That"
	line "place is torture"
	cont "on my birds."
	done

BirdKeeperSalBeatenText:
	text "I can see why"
	line "you made it."
	done

BirdKeeperSalAfterBattleText:
	text "There's still snow"
	line "here. Hopefully it"
	cont "all melts soon."
	done

SchoolboyFinnSeenText:
	text "Someone told me"
	line "there are Tangela"
	cont "here, but they"
	cont "lied to me!"
	done

SchoolboyFinnBeatenText:
	text "I really want a"
	line "Tangela…"
	done

SchoolboyFinnAfterBattleText:
	text "There's still snow"
	line "on the ground, so"
	cont "I guess they are"

	para "not around right"
	line "now…"
	done

YoungsterGordySeenText:
	text "You won't believe"
	line "this!"

	para "I lost to the Gym"
	line "Leader at the"
	cont "Lake of Rage!"

	para "I've been here"
	line "searching for some"
	cont "new #mon, but"

	para "so far, I haven't"
	line "got anything."
	done

YoungsterGordyBeatenText:
	text "Your #mon might"
	line "do fine."
	done

YoungsterGordyAfterBattleText:
	text "Grass-types don't"
	line "do so well,"
	cont "neither do Water"

	para "or Electric-types."
	line "Apparently Ice-"
	cont "types have more"

	para "resistances than"
	line "we first thought."
	done

BugCatcherColtonSeenText:
	text "It was pretty cold"
	line "in Ice Path."

	para "My #mon are"
	line "still thawing out."
	done

BugCatcherColtonBeatenText:
	text "I guess they"
	line "weren't thawed out"
	cont "enough."
	done

BugCatcherColtonAfterBattleText:
	text "I guess it's not"
	line "much warmer out"
	cont "here."
	done

Route44HealRestAWhileText:
	text "Ice Path can take"
	line "a lot out of you."

	para "Here, let me heal"
	line "your #mon."
	done

Route44HealKeepAtItText:
	text "Don't give up!"
	done

Route44Sign1Text:
	text "Route 44"
	line "Ice Path Ahead"
	done

Route44Sign2Text:
	text "Route 44"

	para "Mahogany Town -"
	line "Blackthorn City"
	done

Route44_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 56,  7, ICE_PATH_1F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 53,  7, BGEVENT_READ, Route44Sign1
	bg_event  6, 10, BGEVENT_READ, Route44Sign2
	bg_event 32,  9, BGEVENT_ITEM, Route44HiddenElixer

	db 10 ; object events
	object_event 33,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherLyle, -1
	object_event 24, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherButch, -1
	object_event 35, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSchoolboyFinn, -1
	object_event 44,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterGordy, -1
	object_event 53, 10, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperSal, -1
	object_event  9,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route44FruitTree, -1
	object_event 35,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44Revive, EVENT_ROUTE_44_MAX_REVIVE
	object_event 57, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44PokeBall, EVENT_ROUTE_44_ULTRA_BALL
	object_event 14,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44Repel, EVENT_ROUTE_44_MAX_REPEL
	object_event 57,  8, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route44HealScript, -1
