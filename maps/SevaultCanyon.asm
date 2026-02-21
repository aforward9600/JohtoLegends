	object_const_def ; object_event constants
	const SEVAULTCANYON_COOLTRAINER_M
	const SEVAULTCANYON_COOLTRAINER_F
	const SEVAULTCANYON_LASS
	const SEVAULTCANYON_YOUNGSTER
	const SEVAULTCANYON_POKE_BALL_1
	const SEVAULTCANYON_POKE_BALL_2
	const SEVAULTCANYON_ROCK1
	const SEVAULTCANYON_ROCK2
	const SEVAULTCANYON_ZAPDOS1
	const SEVAULTCANYON_ZAPDOS2
	const SEVAULTCANYON_ZAPDOS3
	const SEVAULTCANYON_ZAPDOS4

SevaultCanyon_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

TrainerCooltrainerMHector:
	trainer COOLTRAINERM, HECTOR, EVENT_BEAT_COOLTRAINERM_HECTOR, CooltrainerMHectorSeenText, CooltrainerMHectorBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerMHectorAfterText

TrainerCooltrainerFPhoebe:
	trainer COOLTRAINERF, PHOEBE, EVENT_BEAT_COOLTRAINERF_PHOEBE, CooltrainerFPhoebeSeenText, CooltrainerFPhoebeBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerFPhoebeAfterText

TrainerLassSamantha:
	trainer LASS, SAMANTHA, EVENT_BEAT_LASS_SAMANTHA, LassSamanthaSeenText, LassSamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext LassSamanthaAfterText

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext YoungsterJimmyAfterText

SevaultCanyonKingsRock:
	itemball KINGS_ROCK

SevaultCanyonEther:
	itemball ETHER

SevaultCanyonRock:
	jumpstd smashrock

ZapdosLeft:
	cry ZAPDOS
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	appear SEVAULTCANYON_ZAPDOS1
	applymovement SEVAULTCANYON_ZAPDOS1, ZapdosRunsRight2
	playsound SFX_JUMP_OVER_LEDGE
	applymovement SEVAULTCANYON_ZAPDOS1, ZapdosJumpsRight
	applymovement SEVAULTCANYON_ZAPDOS1, ZapdosFacesDown
	turnobject PLAYER, UP
	pause 15
	cry ZAPDOS
	pause 15
	applymovement SEVAULTCANYON_ZAPDOS1, ZapdosRunsUp
	disappear SEVAULTCANYON_ZAPDOS1
	appear SEVAULTCANYON_ZAPDOS2
	setscene SCENE_FINISHED
	end

SevaultCanyonZapdos1:
	faceplayer
	opentext
	writetext ZapdosGText
	cry ZAPDOS
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	applymovement SEVAULTCANYON_ZAPDOS2, ZapdosJumpsRight
	applymovement SEVAULTCANYON_ZAPDOS2, ZapdosRunsUp2
	disappear SEVAULTCANYON_ZAPDOS2
	appear SEVAULTCANYON_ZAPDOS3
	end
	
SevaultCanyonZapdos2:
	faceplayer
	opentext
	writetext ZapdosGText
	cry ZAPDOS
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	applymovement SEVAULTCANYON_ZAPDOS3, ZapdosJumpsDown
	applymovement SEVAULTCANYON_ZAPDOS3, ZapdosRunsDown
	disappear SEVAULTCANYON_ZAPDOS3
	appear SEVAULTCANYON_ZAPDOS4
	end

SevaultCanyonZapdos3:
	faceplayer
	opentext
	writetext ZapdosGText
	pause 15
	cry ZAPDOS_G
	waitbutton
	closetext
	loadwildmon ZAPDOS_G, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear SEVAULTCANYON_ZAPDOS4
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtZapdosG
	setevent EVENT_BEAT_ZAPDOS_G
	end

.CaughtZapdosG:
	setevent EVENT_CAUGHT_ZAPDOS_G
	end

.NotBeaten:
	reloadmapafterbattle
	end

ZapdosRunsRight2:
	big_step RIGHT
	big_step RIGHT
	step_end

ZapdosJumpsRight:
	fast_jump_step RIGHT
	step_end

ZapdosRunsUp:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

ZapdosRunsUp2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step UP
	step_end

ZapdosJumpsDown:
	fast_jump_step DOWN
	step_end

ZapdosRunsDown:
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	step_end

ZapdosFacesDown:
	turn_head DOWN
	step_end

ZapdosGText:
	text "G-g-gyaoo!"
	done

CooltrainerMHectorSeenText:
	text "The Larvitar here"
	line "are descended from"
	cont "ones brought here"
	cont "long ago."
	done

CooltrainerMHectorBeatenText:
	text "Guess I should"
	line "have added one"
	cont "to my team…"
	done

CooltrainerMHectorAfterText:
	text "Tyranitar may have"
	line "formed this canyon"
	cont "through their"
	cont "rampaging."
	done

CooltrainerFPhoebeSeenText:
	text "The ruins are so"
	line "mysterious…"
	done

CooltrainerFPhoebeBeatenText:
	text "Truly mysterious…"
	done

CooltrainerFPhoebeAfterText:
	text "Empty, ancient"
	line "rooms…"

	para "What was in there"
	line "long ago?"
	done

LassSamanthaSeenText:
	text "I came here to"
	line "pick flowers, but"
	cont "there aren't"
	cont "any here!"
	done

LassSamanthaBeatenText:
	text "No flowers for me…"
	done

LassSamanthaAfterText:
	text "The elder said I"
	line "can't pick the"
	cont "flowers near the"
	cont "temple."

	para "I hate it here!"
	done

YoungsterJimmySeenText:
	text "It's easy to trip"
	line "on all of these"
	cont "stairs and rocks."
	done

YoungsterJimmyBeatenText:
	text "YOW! Jimmy down!"
	done

YoungsterJimmyAfterText:
	text "I need to look"
	line "where I'm going."
	done

SevaultCanyon_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19, 67, SEVAULT_CANYON_HOUSE, 1

	db 2 ; coord events
	coord_event, 26, 43, SCENE_DEFAULT, ZapdosLeft
	coord_event, 27, 43, SCENE_DEFAULT, ZapdosLeft

	db 0 ; bg events

	db 12 ; object events
	object_event 13, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerMHector, -1
	object_event 17, 70, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerFPhoebe, -1
	object_event 15, 48, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassSamantha, -1
	object_event 24, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterJimmy, -1
	object_event 26, 54, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, SevaultCanyonKingsRock, EVENT_SEVAULT_CANYON_KINGS_ROCK
	object_event 19, 46, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, SevaultCanyonEther, EVENT_SEVAULT_CANYON_ETHER
	object_event 24, 54, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevaultCanyonRock, -1
	object_event 26, 52, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevaultCanyonRock, -1
	object_event 22, 42, SPRITE_ZAPDOS_G, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SEVAULT_CANYON_ZAPDOS_1
	object_event  3, 26, SPRITE_ZAPDOS_G, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevaultCanyonZapdos1, EVENT_SEVAULT_CANYON_ZAPDOS_2
	object_event  6,  4, SPRITE_ZAPDOS_G, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevaultCanyonZapdos2, EVENT_SEVAULT_CANYON_ZAPDOS_3
	object_event 13, 58, SPRITE_ZAPDOS_G, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevaultCanyonZapdos3, EVENT_SEVAULT_CANYON_ZAPDOS_4
	