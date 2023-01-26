	object_const_def ; object_event constants
	const BLACKTHORNGYM1F_MASTER
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUY

BlackthornGym1F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Boulders
	callback MAPCALLBACK_OBJECTS, .MasterGym

.Boulders:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	return

.MasterGym:
	checkevent EVENT_BEAT_MASTER
	iftrue .IsItWeekendGym
	return

.IsItWeekendGym:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .MasterDisappears
	ifequal SUNDAY, .MasterDisappears
	appear BLACKTHORNGYM1F_MASTER
	return

.MasterDisappears:
	disappear BLACKTHORNGYM1F_MASTER
	return

BlackthornGymMasterScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER
	iftrue .FightDone
	writetext MasterIntroText
	waitbutton
	closetext
	winlosstext MasterWinText, MasterLastMonText
	loadtrainer MASTER, MASTER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MASTER
	opentext
	writetext MasterText_Complete
	waitbutton
	closetext
	opentext
	writetext MasterText_ReceivedRisingBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RISINGBADGE
	readvar VAR_BADGES
.FightDone:
	checkflag ENGINE_BEAT_MASTER
	iftrue .Rematch
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	setevent EVENT_BEAT_DRAGON_TAMER_M_DEVIN
	setevent EVENT_BEAT_DRAGON_TAMER_M_DARIUS
	setevent EVENT_BEAT_DRAGON_TAMER_M_DAVIS
	setevent EVENT_BEAT_DRAGON_TAMER_F_DORA
	setevent EVENT_BEAT_DRAGON_TAMER_F_DANI
	setevent EVENT_BEAT_DRAGON_TAMER_F_DARIA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	writetext MasterText_BadgeExplain
	buttonsound
	verbosegiveitem TM_DRAGON_CLAW
	iffalse .NoRoomforDragonClaw
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymMasterText_DescribeTM24
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymMasterText_League
	waitbutton
.NoRoomforDragonClaw:
	closetext
	end

.Rematch:
	writetext MasterRematchText
	waitbutton
	closetext
	winlosstext MasterWinText, MasterLastMonText
	loadtrainer MASTER, MASTER1
	reloadmapafterbattle
	opentext
	writetext MasterBeatenAgainText
	waitbutton
	closetext
	setflag ENGINE_BEAT_MASTER
	end

TrainerDragonTamermDevin:
	trainer DRAGON_TAMER_M, DEVIN, EVENT_BEAT_DRAGON_TAMER_M_DEVIN, DragonTamermDevinSeenText, DragonTamermDevinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DragonTamermDevinAfterBattleText
	waitbutton
	closetext
	end

TrainerDragonTamermDavis:
	trainer DRAGON_TAMER_M, DAVIS, EVENT_BEAT_DRAGON_TAMER_M_DAVIS, DragonTamermDavisSeenText, DragonTamermDavisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DragonTamermDavisAfterBattleText
	waitbutton
	closetext
	end

TrainerDragonTamerfDani:
	trainer DRAGON_TAMER_F, DANI, EVENT_BEAT_DRAGON_TAMER_F_DANI, DragonTamerfDaniSeenText, DragonTamerfDaniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DragonTamerfDaniAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER
	iftrue .BlackthornGymGuyWinScript
	writetext BlackthornGymGuyText
	waitbutton
	closetext
	end

.BlackthornGymGuyWinScript:
	writetext BlackthornGymGuyWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	gettrainername STRING_BUFFER_4, MASTER, MASTER1
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, MASTER, MASTER1
	jumpstd gymstatue2

MasterLastMonText:
	text "A dragon backed"
	line "into a corner is"
	cont "still dangerous!"
	done

MasterIntroText:
	text "You have returned."

	para "I am proud of you,"
	line "<PLAYER>. Now,"
	cont "you have collected"

	para "seven Gym Badges,"
	line "and you are strong"
	cont "enough to face me."

	para "I am the Master of"
	line "Blackthorn City,"
	cont "and the Gym Leader"
	cont "as well."

	para "If you wish to be"
	line "recognized as a"
	cont "Dragon Master,"
	cont "then face me!"

	para "As a Gym Leader,"
	line "I will use my full"

	para "power against any"
	line "opponent!"
	done

MasterWinText:
	text "There is nothing"
	line "more I can teach"
	cont "you."
	done

MasterText_Complete:
	text "Your training is"
	line "complete. You are"
	cont "now worthy of"

	para "being called a"
	line "Master. Now, here"
	cont "is the Rising-"
	cont "Badge. You've"
	cont "earned it."
	done

MasterText_ReceivedRisingBadge:
	text "<PLAYER> received"
	line "RisingBadge."
	done

MasterText_BadgeExplain:
	text "The RisingBadge"
	line "will make all"
	cont "#mon obey you."

	para "It will also let"
	line "you gain access"
	cont "to the Dragon's"

	para "Den behind the"
	line "Gym. Here, take"
	cont "this TM as a"
	cont "gift."
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> received"
	line "TM02."
	done

BlackthornGymMasterText_DescribeTM24:
	text "That contains"
	line "Dragon Claw."

	para "It will tear"
	line "through most"
	cont "types, but Fairy-"

	para "Types will ignore"
	line "it."
	done

BlackthornGymMasterText_League:
	text "You are ready to"
	line "head to the final"
	cont "part of your"

	para "journey. Go to the"
	line "#mon League,"
	cont "and challenge the"

	para "Elite Four. They"
	line "are among the most"
	cont "powerful trainers"

	para "in the world."
	line "Surf east from"
	cont "New Bark Town to"

	para "reach Route 26."
	line "It is a part of"
	cont "Kanto under"

	para "Johto's control."
	line "North from there"
	cont "is the #mon"

	para "League. We are all"
	line "rooting for you"
	cont "two."
	done

DragonTamermDevinSeenText:
	text "Hey <PLAYER>!"

	para "You finally made"
	line "it!"

	para "Now I get to show"
	line "you the true"
	cont "power of Dragons!"
	done

DragonTamermDevinBeatenText:
	text "I guess you showed"
	line "me the power!"
	done

DragonTamermDevinAfterBattleText:
	text "Dragons are really"
	line "strong, huh?"
	done

DragonTamermDavisSeenText:
	text "This lava is"
	line "scorching!"

	para "My cape might"
	line "catch on fire!"
	done

DragonTamermDavisBeatenText:
	text "You're on fire!"
	done

DragonTamermDavisAfterBattleText:
	text "Your battling"
	line "skills are fire!"

	para "You should cool"
	line "down a little!"

	para "You make us look"
	line "bad!"
	done

DragonTamerfDaniSeenText:
	text "I've been trained"
	line "by the Master!"

	para "I won't go down"
	line "easily!"
	done

DragonTamerfDaniBeatenText:
	text "Right, you were"
	line "trained too…"
	done

DragonTamerfDaniAfterBattleText:
	text "Master is the"
	line "greatest Dragon-"
	cont "trainer in Johto."

	para "Don't underestimate"
	line "him. Got it?"
	done

BlackthornGymGuyText:
	text "How's it going,"
	line "champ in the"
	cont "making?"

	para "The Master is a"
	line "pro with Dragon-"

	para "Types, as rare as"
	line "they are."

	para "No one is even"
	line "sure of his real"
	cont "name!"

	para "Ice, Fairy, and"
	line "Dragon Types can"
	cont "deal serious"

	para "damage!"
	done

BlackthornGymGuyWinText:
	text "You did it! You"
	line "have all eight"
	cont "Badges! Now you"

	para "can go to the"
	line "#mon League"
	cont "and become the"
	cont "Champion!"
	done

MasterRematchText:
	text "Back to test your"
	line "skills?"

	para "Let us commence."
	done

MasterBeatenAgainText:
	text "Perhaps you are an"
	line "even greater"
	cont "master than I!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	db 5 ; object events
	object_event  5,  3, SPRITE_MASTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymMasterScript, EVENT_BLACKTHORN_GYM_MASTER
	object_event  6,  6, SPRITE_DRAGON_TAMER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerDragonTamermDavis, -1
	object_event  1, 14, SPRITE_DRAGON_TAMER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerDragonTamermDevin, -1
	object_event  9,  2, SPRITE_DRAGON_TAMER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerDragonTamerfDani, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuyScript, -1
