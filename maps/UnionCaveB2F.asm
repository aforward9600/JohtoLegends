	object_const_def ; object_event constants
	const UNIONCAVEB2F_COOLTRAINER_M
	const UNIONCAVEB2F_COOLTRAINER_F1
	const UNIONCAVEB2F_COOLTRAINER_F2
	const UNIONCAVEB2F_POKE_BALL1
	const UNIONCAVEB2F_POKE_BALL2
	const UNIONCAVEB2F_LAPRAS

UnionCaveB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Lapras

.Lapras:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftrue .NoAppear
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .Appear
.NoAppear:
	disappear UNIONCAVEB2F_LAPRAS
	return

.Appear:
	appear UNIONCAVEB2F_LAPRAS
	return

UnionCaveLapras:
	faceplayer
	cry LAPRAS
	random 20
	ifequal 0, .shinylapras
	loadwildmon LAPRAS, 45
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

.shinylapras
	loadwildmon LAPRAS, 45
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

TrainerCooltrainermAdrien:
	trainer COOLTRAINERM, ADRIEN, EVENT_BEAT_COOLTRAINERM_ADRIEN, CooltrainermAdrienSeenText, CooltrainermAdrienBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_UNION_CAVE_B2F_HYPER_POTION
	iftrue .AlreadyGotItem
	writetext CooltrainermAdrienAfterBattleText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext YouAlreadyGotTheItemText
	waitbutton
	closetext
	end

TrainerCooltrainerfHazel:
	trainer COOLTRAINERF, HAZEL, EVENT_BEAT_COOLTRAINERF_HAZEL, CooltrainerfHazelSeenText, CooltrainerfHazelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfHazelAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfElla:
	trainer COOLTRAINERF, ELLA, EVENT_BEAT_COOLTRAINERF_ELLA, CooltrainerfEllaSeenText, CooltrainerfEllaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfEllaAfterBattleText
	waitbutton
	closetext
	end

UnionCaveB2FElixer:
	itemball ELIXER

UnionCaveB2FHyperPotion:
	itemball HYPER_POTION

CooltrainermAdrienSeenText:
	text "Sorry, but there's"
	line "nothing here but"
	cont "me!"
	done

CooltrainermAdrienBeatenText:
	text "Now you're here"
	line "too!"
	done

CooltrainermAdrienAfterBattleText:
	text "There's an item"
	line "down there."

	para "I wonder what's in"
	line "it?"
	done

CooltrainerfHazelSeenText:
	text "You ever heard of"
	line "Lapras?"
	done

CooltrainerfHazelBeatenText:
	text "I guess I should've"
	line "had one…"
	done

CooltrainerfHazelAfterBattleText:
	text "It ferries people"
	line "on its back."

	para "It's also a good"
	line "battler,"

	para "despite its"
	line "docile appearence."
	done

CooltrainerfEllaSeenText:
	text "Some people say"
	line "Meganium isn't"
	cont "good, but they're"
	cont "all wrong!"

	para "I plan on becoming"
	line "Champion with one!"
	done

CooltrainerfEllaBeatenText:
	text "Maybe they're"
	line "right…"
	done

CooltrainerfEllaAfterBattleText:
	text "A #mon's"
	line "strength shouldn't"
	cont "be measured by"
	cont "battles alone."

	para "How cute it is"
	line "should also count!"
	done

YouAlreadyGotTheItemText:
	text "Oh, you already"
	line "got that item down"
	cont "there."

	para "I guess I don't"
	line "have anything else"
	cont "to say now."
	done

UnionCaveB2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  3, UNION_CAVE_B1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 13, 20, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermAdrien, -1
	object_event  7, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfHazel, -1
	object_event  2, 28, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfElla, -1
	object_event 16,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB2FElixer, EVENT_UNION_CAVE_B2F_ELIXER
	object_event 17, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB2FHyperPotion, EVENT_UNION_CAVE_B2F_HYPER_POTION
	object_event 11, 31, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, UnionCaveLapras, EVENT_UNION_CAVE_B2F_LAPRAS
