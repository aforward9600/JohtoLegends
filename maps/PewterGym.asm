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
	setevent EVENT_DECO_BIG_ONIX_DOLL
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .FlintAfterScript
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

.FlintAfterScript:
	checkflag ENGINE_JACK
	iffalse .Rematch
	writetext FlintMySonText
	waitbutton
	closetext
	end

.Rematch:
	writetext FlintRematchText
	waitbutton
	closetext
	winlosstext FlintWinLossText, FlintLastMonText
	loadtrainer FLINT, FLINT1
	startbattle
	reloadmapafterbattle
	opentext
	writetext FlintAfterRematchText
	waitbutton
	closetext
	setflag ENGINE_JACK
	end

FlintLastMonText:
	text "Rock hard determi-"
	line "nation will win!"
	done

TrainerEngineerGabe:
	trainer ENGINEER, GABE, EVENT_BEAT_ENGINEER_GABE, EngineerGabeSeenText, EngineerGabeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .EngineerGabeAfterBattle2
	writetext EngineerGabeAfterBattleText
	waitbutton
	closetext
	end

.EngineerGabeAfterBattle2:
	writetext EngineerGabeAfterBattleText2
	waitbutton
	closetext
	end

TrainerEngineerBernie:
	trainer ENGINEER, BERNIE, EVENT_BEAT_ENGINEER_BERNIE, EngineerBernieSeenText, EngineerBernieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerBernieAfterBattleText
	waitbutton
	closetext
	end

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

	para "we'd be next."

	para "I couldn't risk the"
	line "lives of my wife"
	cont "and son, so I sent"

	para "them away, and"
	line "disguised myself."

	para "Now I work as a"
	line "miner to keep the"
	cont "suspicion off me."

	para "I feel terrible"
	line "about abandoning"
	cont "my post, but I did"

	para "what I needed to"
	line "for my family."

	para "If I were to join"
	line "forces with the"
	cont "Champion, and"

	para "others, then maybe"
	line "we have a chance…"

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

	para "enough to protect"
	line "others!"
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

EngineerGabeAfterBattleText2:
	text "Looks like we can"
	line "start constructing"
	cont "new buildings now."

	para "My life has a"
	line "purpose again!"
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

FlintMySonText:
	text "Flint: My son will"
	line "get to grow up in"
	cont "a world not"
	cont "gripped by fear."

	para "I haven't felt"
	line "this hopeful in a"
	cont "while."
	done

FlintRematchText:
	text "Flint: Mining is"
	line "fine, but battling"
	cont "is where I'm at my"
	cont "most comfortable."

	para "Time to keep up"
	line "with my skills!"
	done

FlintAfterRematchText:
	text "Flint: Looks like"
	line "I'll have to keep"
	cont "on improving to"

	para "make sure I can"
	line "keep up as a Gym"
	cont "Leader."
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
	object_event  6,  9, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerEngineerBernie, -1
