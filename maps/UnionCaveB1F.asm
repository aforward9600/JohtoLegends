	object_const_def ; object_event constants
	const UNIONCAVEB1F_POKEFAN_M1
	const UNIONCAVEB1F_SUPER_NERD
	const UNIONCAVEB1F_DRAGON_TAMER_M
	const UNIONCAVEB1F_DRAGON_TAMER_F
	const UNIONCAVEB1F_POKE_BALL1
	const UNIONCAVEB1F_BOULDER
	const UNIONCAVEB1F_POKE_BALL2

UnionCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerDragonTamerMDrew:
	trainer DRAGON_TAMER_M, DREW, EVENT_BEAT_DRAGON_TAMER_M_DREW, DragonTamerMDrewSeenText, DragonTamerMDrewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DragonTamerMDrewAfterBattleText
	waitbutton
	closetext
	end

TrainerDragonTamerFDawna:
	trainer DRAGON_TAMER_F, DAWNA, EVENT_BEAT_DRAGON_TAMER_F_DAWNA, DragonTamerFDawnaSeenText, DragonTamerFDawnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DragonTamerFDawnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerGunther:
	trainer HIKER, GUNTHER, EVENT_BEAT_HIKER_GUNTHER, HikerGuntherSeenText, HikerGuntherBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerGuntherAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdRichard:
	trainer SUPER_NERD, SUPER_NERD_RICHARD, EVENT_BEAT_SUPER_NERD_RICHARD, SuperNerdRichardSeenText, SuperNerdRichardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdRichardAfterBattleText
	waitbutton
	closetext
	end

UnionCaveB1FTMIronHead:
	itemball TM_IRON_HEAD

UnionCaveB1FSteelDagger:
	itemball STEEL_DAGGER

UnionCaveB1FBoulder:
	jumpstd strengthboulder

HikerGuntherSeenText:
	text "A blonde girl your"
	line "age stomped me"
	cont "flat!"

	para "She went to the"
	line "Ruins of Alph"
	cont "for some research."
	done

HikerGuntherBeatenText:
	text "You stomped me"
	line "too!"
	done

HikerGuntherAfterBattleText:
	text "She was fierce!"

	para "I'm surprised I"
	line "was even able to"
	cont "fight you after!"
	done

SuperNerdRichardSeenText:
	text "A rare #mon"
	line "shows up here"
	cont "every Friday."

	para "I already have"
	line "one."

	para "Wanna see?"
	done

SuperNerdRichardBeatenText:
	text "Lapras is pretty"
	line "cool!"
	done

SuperNerdRichardAfterBattleText:
	text "Lapras are going"
	line "extinct, so I"
	cont "caught one for"
	cont "myself!"

	para "I've been studying"
	line "them in the wild"
	cont "as well."

	para "Hopefully we can"
	line "increase their"
	cont "numbers in the"
	cont "near future."
	done

DragonTamerMDrewSeenText:
	text "Hey <PLAYER>! It's"
	line "been a while!"

	para "I'm here for some"
	line "training before I"
	cont "return to"
	cont "Blackthorn City."
	done

DragonTamerMDrewBeatenText:
	text "You've gotten"
	line "stronger!"
	done

DragonTamerMDrewAfterBattleText:
	text "Dragons truly are"
	line "something else."
	done

DragonTamerFDawnaSeenText:
	text "What are you doing"
	line "here <PLAYER>?"

	para "I heard there was"
	line "a Lapras in here."

	para "I'm gonna catch it!"
	done

DragonTamerFDawnaBeatenText:
	text "Will I be able to"
	line "catch it?"
	done

DragonTamerFDawnaAfterBattleText:
	text "My team isn't all"
	line "dragons, so it'd"
	cont "be a good fit."

	para "I still catch the"
	line "ire of the older"
	cont "trainers back home"

	para "for my choice in"
	line "#mon, though…"
	done

UnionCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  3, RUINS_OF_ALPH_OUTSIDE, 7
	warp_event  3, 11, RUINS_OF_ALPH_OUTSIDE, 8
	warp_event  7, 19, UNION_CAVE_1F, 1
	warp_event  3, 33, UNION_CAVE_1F, 2
	warp_event 17, 31, UNION_CAVE_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  3, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerHikerGunther, -1
	object_event 17,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSuperNerdRichard, -1
	object_event  2, 32, SPRITE_DRAGON_TAMER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerDragonTamerMDrew, -1
	object_event 17, 30, SPRITE_DRAGON_TAMER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerDragonTamerFDawna, -1
	object_event  2, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FTMIronHead, EVENT_UNION_CAVE_B1F_TM_IRON_HEAD
	object_event  7, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCaveB1FBoulder, -1
	object_event 17, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FSteelDagger, EVENT_UNION_CAVE_B1F_STEEL_DAGGER
