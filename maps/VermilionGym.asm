	object_const_def ; object_event constants
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_SOLDIER1
	const VERMILIONGYM_SOLDIER2
	const VERMILIONGYM_SOLDIER3

VermilionGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, LtSurgeLastMonText
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_SOLDIER_ULYSSES
	setevent EVENT_BEAT_SOLDIER_DOUGLAS
	setevent EVENT_BEAT_SOLDIER_GRANT
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .LtSurgeStay
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

.LtSurgeStay:
	checkflag ENGINE_GAVEN
	iffalse .LtSurgeRematch
	writetext LtSurgeStayText
	waitbutton
	closetext
	end

.LtSurgeRematch:
	writetext LtSurgeRematchText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, LtSurgeLastMonText
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	opentext
	writetext LtSurgeRematchAfterText
	waitbutton
	closetext
	setflag ENGINE_GAVEN
	end

LtSurgeLastMonText:
	text "Never give up!"

	para "Never surrender!"
	done

TrainerSoldierUlysses:
	trainer SOLDIER, ULYSSES, EVENT_BEAT_SOLDIER_ULYSSES, SoldierUlyssesSeenText, SoldierUlyssesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierUlyssesAfterBattleText
	waitbutton
	closetext
	end

TrainerSoldierDouglas:
	trainer SOLDIER, DOUGLAS, EVENT_BEAT_SOLDIER_DOUGLAS, SoldierDouglasSeenText, SoldierDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierDouglasAfterBattleText
	waitbutton
	closetext
	end

TrainerSoldierGrant:
	trainer SOLDIER, GRANT, EVENT_BEAT_SOLDIER_GRANT, SoldierGrantSeenText, SoldierGrantBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierGrantAfterBattleText
	waitbutton
	closetext
	end

VermilionGymBed:
	jumptext VermilionGymBedText

LtSurgeIntroText:
	text "Pvt.Surge: Just my"
	line "luck!"

	para "We end the war,"
	line "and now we can't"
	cont "get home!"

	para "Even with the Feds"
	line "kicked out of the"
	cont "city, the boats"
	cont "still won't sail!"

	para "Our forces aren't"
	line "big enough to take"
	cont "them on,"

	para "and we need to"
	line "defend the city."

	para "And just when I"
	line "was going to get"
	cont "my promotion…"

	para "So, who are you?"

	para "…The Champion, eh?"

	para "Well, anyone who"
	line "can beat my old"
	cont "man is alright by"
	cont "me!"

	para "You need something"
	line "from me?"

	para "…Looking for a new"
	line "Gym Leader to take"
	cont "on the Feds?"

	para "Well, count me in!"

	para "With the Champion"
	line "and 8 Gym Leaders,"

	para "there's no way we"
	line "can lose!"

	para "Let's see how tough"
	line "you are!"
	done

LtSurgeWinLossText:
	text "Pvt.Surge: Arrrgh!"
	line "I'm having a"
	cont "flashback!"

	para "I can see why my"
	line "old man lost to"
	cont "you!"
	done

ReceivedThunderBadgeText:
	text "Pvt.Surge received"
	line "ThunderBadge."
	done

LtSurgeThunderBadgeText:
	text "A ThunderBadge…"

	para "Perfect for me,"
	line "wouldn't you say?"

	para "I'll answer the"
	line "the call to duty"
	cont "when you're ready!"
	done

LtSurgeFightDoneText:
	text "I'll answer the"
	line "the call to duty"
	cont "when you're ready!"

	para "Let's rock!"
	done

LtSurgeStayText:
	text "I think after I"
	line "get my promotion,"
	cont "I'll settle down"
	cont "here and be the"
	cont "Gym Leader."

	para "I've grown fond of"
	line "this place."
	done

SoldierUlyssesSeenText:
	text "Do you have busi-"
	line "ness with our"
	cont "commander?"
	done

SoldierUlyssesBeatenText:
	text "I have failed!"
	done

SoldierUlyssesAfterBattleText:
	text "He's a private,"
	line "same as the rest"
	cont "of us,"

	para "but he really"
	line "stepped up during"
	cont "the war after we"
	cont "lost our previous"
	cont "commander."

	para "He was due for a"
	line "promotion before"
	cont "this whole mess."
	done

SoldierDouglasSeenText:
	text "Are you an enemy"
	line "combatant?"
	done

SoldierDouglasBeatenText:
	text "Combatant indeed!"
	done

SoldierDouglasAfterBattleText:
	text "After the war, we"
	line "decided to help"
	cont "out the citizens"
	cont "of Vermilion."

	para "We've kept them"
	line "safe since the"
	cont "initial attack."

	para "I think they've"
	line "warmed up to us."
	done

SoldierGrantSeenText:
	text "Don't take another"
	line "step!"

	para "You're trespassing!"
	done

SoldierGrantBeatenText:
	text "You stepped all"
	line "over me!"
	done

SoldierGrantAfterBattleText:
	text "Sorry if I came"
	line "off as rude."

	para "We need to keep on"
	line "our toes with the"
	cont "Feds about."
	done

VermilionGymBedText:
	text "It's a soldier's"
	line "bed."

	para "You probably don't"
	line "want to nap here."
	done

LtSurgeRematchText:
	text "Pvt.Surge: Hey"
	line "Champion!"

	para "As a soldier, I"
	line "never stop with my"
	cont "training!"

	para "Wanna see?"
	done

LtSurgeRematchAfterText:
	text "Pvt.Surge: I gotta"
	line "continue training"
	cont "my #mon and my"
	cont "body!"
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	db 0 ; coord events

	db 20 ; bg events
	bg_event  3, 12, BGEVENT_READ, VermilionGymBed
	bg_event  3, 13, BGEVENT_READ, VermilionGymBed
	bg_event  7, 12, BGEVENT_READ, VermilionGymBed
	bg_event  7, 13, BGEVENT_READ, VermilionGymBed
	bg_event  1, 14, BGEVENT_READ, VermilionGymBed
	bg_event  3,  8, BGEVENT_READ, VermilionGymBed
	bg_event  3,  9, BGEVENT_READ, VermilionGymBed
	bg_event  7,  8, BGEVENT_READ, VermilionGymBed
	bg_event  7,  9, BGEVENT_READ, VermilionGymBed
	bg_event  1, 10, BGEVENT_READ, VermilionGymBed
	bg_event  1, 11, BGEVENT_READ, VermilionGymBed
	bg_event  5, 10, BGEVENT_READ, VermilionGymBed
	bg_event  5, 11, BGEVENT_READ, VermilionGymBed
	bg_event  9, 10, BGEVENT_READ, VermilionGymBed
	bg_event  9, 11, BGEVENT_READ, VermilionGymBed
	bg_event  1, 15, BGEVENT_READ, VermilionGymBed
	bg_event  5, 14, BGEVENT_READ, VermilionGymBed
	bg_event  5, 15, BGEVENT_READ, VermilionGymBed
	bg_event  9, 14, BGEVENT_READ, VermilionGymBed
	bg_event  9, 15, BGEVENT_READ, VermilionGymBed

	db 4 ; object events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, EVENT_VERMILION_GYM_SURGE
	object_event  3, 15, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSoldierUlysses, -1
	object_event  8, 11, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierDouglas, -1
	object_event  4,  7, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierGrant, -1
