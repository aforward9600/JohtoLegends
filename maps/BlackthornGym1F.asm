	object_const_def ; object_event constants
	const BLACKTHORNGYM1F_MASTER
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUY

BlackthornGym1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Boulders

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

BlackthornGymMasterScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER
	iftrue .FightDone
	writetext MasterIntroText
	waitbutton
	closetext
	winlosstext MasterWinText, 0
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
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
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

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
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
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, MASTER, MASTER1
	jumpstd gymstatue2

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

	para "as well. If you"
	line "wish to be recogn-"
	cont "ized as a Dragon"

	para "Master, then face"
	line "me!"

	para "As a GYM LEADER,"
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

	para "earned it."
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

	para "two."
	done

CooltrainermPaulSeenText:
	text "Your first battle"
	line "against dragons?"

	para "I'll show you how"
	line "tough they are!"
	done

CooltrainermPaulBeatenText:
	text "My dragon #MON"
	line "lost?"
	done

CooltrainermPaulAfterBattleText:
	text "LANCE told you"
	line "that he'd like to"

	para "see you again?"
	line "Not a chance!"
	done

CooltrainermMikeSeenText:
	text "My chance of"
	line "losing? Not even"
	cont "one percent!"
	done

CooltrainermMikeBeatenText:
	text "That's odd."
	done

CooltrainermMikeAfterBattleText:
	text "I know my short-"
	line "comings now."

	para "Thanks for showing"
	line "me!"
	done

CooltrainerfLolaSeenText:
	text "Dragons are sacred"
	line "#MON."

	para "They are full of"
	line "life energy."

	para "If you're not"
	line "serious, you won't"

	para "be able to beat"
	line "them."
	done

CooltrainerfLolaBeatenText:
	text "Way to go!"
	done

CooltrainerfLolaAfterBattleText:
	text "Dragons are weak"
	line "against dragon-"
	cont "type moves."
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
	line "#Mon League"
	cont "and become the"

	para "Champion!"
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
	object_event  5,  3, SPRITE_MASTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymMasterScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuyScript, -1
