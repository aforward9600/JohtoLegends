	object_const_def ; object_event constants
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUY

PewterGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext FlintWinLossText, FlintLastMonText
	loadtrainer FLINT, FLINT1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_ENGINEER_GABE
	setevent EVENT_BEAT_ENGINEER_BERNIE
	setevent EVENT_DECO_BIG_ONIX_DOLL
	clearevent EVENT_PEWTER_CITY_CIVILLIANS
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

TrainerEngineerGabe:
	trainer ENGINEER, GABE, EVENT_BEAT_ENGINEER_GABE, EngineerGabeSeenText, EngineerGabeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerGabeAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuyWinScript
	writetext PewterGymGuyText
	waitbutton
	closetext
	end

.PewterGymGuyWinScript:
	writetext PewterGymGuyWinText
	waitbutton
	closetext
	end

FlintLastMonText:
	text "Rock hard determi-"
	line "nation will win!"
	done

BrockIntroText:
	text "???: Hm?"

	para "Who're you?"

	para "You're Champion"
	line "<PLAYER>?"

	para "What's somebody as"
	line "important as you"
	cont "doing in Kanto?"

	para "I'd assume you've"
	line "got more important"
	cont "things to do."

	para "…Pardon?"

	para "You're looking for"
	line "a strong trainer?"

	para "…Well, seeing as"
	line "though you're not a"
	cont "a Fed…"

	para "I guess I can tell"
	line "you my real name."

	para "I'm Flint, the"
	line "former Pewter Gym"
	cont "Leader."

	para "When I heard what"
	line "the Feds did in"
	cont "Cerulean, I knew"
	cont "we'd be next."

	para "I couldn't risk the"
	line "lives of my wife"
	cont "and son, so I sent"
	cont "them away, and"
	cont "disguised myself."

	para "Now I work as a"
	line "miner to keep the"
	cont "suspicion off me."

	para "I feel terrible"
	line "about abandoning"
	cont "my post, but I did"
	cont "what I needed to"
	cont "for my family."

	para "If I were to join"
	line "forces with the"
	cont "Champion, and"
	cont "others, then maybe"
	cont "we have a chance…"

	para "You want to see"
	line "how strong I am?"

	para "Alright then!"

	para "We may be a little"
	line "rusty, but we'll"
	cont "give it all we"
	cont "got!"
	done

FlintWinLossText:
	text "I may not be as"
	line "strong as a"
	cont "Champion,"

	para "but I think I'm"
	line "still strong"
	cont "enough to protect"
	cont "others!"
	done

ReceivedBoulderBadgeText:
	text "Flint received"
	line "the Boulderbadge!"
	done

BrockBoulderBadgeText:
	text "Flint: This badge…"

	para "It brings back"
	line "memories…"

	para "Memories of a"
	line "better time…"

	para "…There's no time to"
	line "be lost in my"
	cont "past…"

	para "It's time we take"
	line "back our region!"

	para "Let me know when"
	line "you're ready!"

	para "I know we can make"
	line "a brighter future!"
	done

BrockFightDoneText:
	text "Flint: It's time"
	line "we take back our"
	cont "region!"

	para "Let me know when"
	line "you're ready!"

	para "I know we can make"
	line "a brighter future!"
	done

EngineerGabeSeenText:
	text "I've had to make"
	line "a career change to"
	cont "being a miner."
	done

EngineerGabeBeatenText:
	text "I'd like to be an"
	line "engineer again…"
	done

EngineerGabeAfterBattleText:
	text "With the Feds"
	line "torching anywhere"
	cont "they like,"

	para "we can't construct"
	line "any new buildings."

	para "It's put me out of"
	line "work and got me in"
	cont "a depressing funk…"
	done

EngineerBernieSeenText:
	text "Hi-hoooo!"
	done

EngineerBernieBeatenText:
	text "Hi-ho, hi-ho!"

	para "It's off to work I"
	line "go!"
	done

EngineerBernieAfterBattleText:
	text "It's an old song my"
	line "grandad used to"
	cont "while mining."

	para "My grandad wasn't"
	line "very tall."

	para "Don't know why I"
	line "told you that."
	done

PewterGymGuyText:
	text "Yo! CHAMP in"
	line "making! You're"

	para "really rocking."
	line "Are you battling"

	para "the GYM LEADERS of"
	line "KANTO?"

	para "They're strong and"
	line "dedicated people,"

	para "just like JOHTO's"
	line "GYM LEADERS."
	done

PewterGymGuyWinText:
	text "Yo! CHAMP in"
	line "making! That GYM"

	para "didn't give you"
	line "much trouble."

	para "The way you took"
	line "charge was really"

	para "inspiring. I mean"
	line "that seriously."
	done

PewterGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_FLINT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, EVENT_PEWTER_GYM_FLINT
	object_event  2,  5, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerEngineerGabe, -1
	object_event  6,  9, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, PewterGymGuyScript, -1
