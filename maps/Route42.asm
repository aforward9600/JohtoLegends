	object_const_def ; object_event constants
	const ROUTE42_FISHER
	const ROUTE42_HIKER
	const ROUTE42_SUPER_NERD
	const ROUTE42_FRUIT_TREE1
	const ROUTE42_FRUIT_TREE2
	const ROUTE42_FRUIT_TREE3
	const ROUTE42_POKE_BALL1
	const ROUTE42_POKE_BALL2
	const ROUTE42_TEACHER

Route42_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE42_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE42_SUICUNE

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

TrainerFisherFred:
	trainer FISHER, FRED, EVENT_BEAT_FISHER_FRED, FisherFredSeenText, FisherFredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherFredAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJordan:
	trainer PSYCHIC_T, JORDAN, EVENT_BEAT_PSYCHIC_JORDAN, PsychicJordanSeenText, PsychicJordanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJordanRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext PsychicJordanLetsDoItText
	waitbutton
	winlosstext PsychicJordanBeatenText, 0
	loadtrainer PSYCHIC_T, JORDAN
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext PsychicJordanRefusedText
	waitbutton
	closetext
	end

TrainerCamperHoward:
	trainer CAMPER, HOWARD, EVENT_BEAT_CAMPER_HOWARD, CamperHowardSeenText, CamperHowardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperHowardAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherCadi:
	trainer TEACHER, CADI, EVENT_BEAT_TEACHER_CADI, TeacherCadiSeenText, TeacherCadiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherCadiRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_BEAUTY_ENCOUNTER
	writetext TeacherCadiLetsDoItText
	waitbutton
	checkflag ENGINE_FOGBADGE
	iftrue .CadiRematch1
	winlosstext TeacherCadiBeatenText, 0
	loadtrainer TEACHER, CADI
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext TeacherCadiRefusedText
	waitbutton
	closetext
	end

.CadiRematch1:
	checkflag ENGINE_MINERALBADGE
	iftrue .CadiRematch2
	winlosstext TeacherCadiBeatenText, 0
	loadtrainer TEACHER, CADI2
	startbattle
	reloadmapafterbattle
	closetext
	end

.CadiRematch2:
	winlosstext TeacherCadiBeatenText, 0
	loadtrainer TEACHER, CADI3
	startbattle
	reloadmapafterbattle
	closetext
	end

Route42Sign1:
	jumptext Route42Sign1Text

MtMortarSign1:
	jumptext MtMortarSign1Text

MtMortarSign2:
	jumptext MtMortarSign2Text

Route42Sign2:
	jumptext Route42Sign2Text

Route42UltraBall:
	itemball GREAT_BALL

Route42SuperPotion:
	itemball SUPER_POTION

Route42FruitTree1:
	fruittree FRUITTREE_ROUTE_42_1

Route42FruitTree2:
	fruittree FRUITTREE_ROUTE_42_2

Route42FruitTree3:
	fruittree FRUITTREE_ROUTE_42_3

Route42HiddenMaxPotion:
	hiddenitem RARE_CANDY, EVENT_ROUTE_42_HIDDEN_MAX_POTION

Route42SuicuneMovement:
	set_sliding
	fast_jump_step UP
	fast_jump_step UP
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

FisherFredSeenText:
	text "Argh! Lost another"
	line "one! This is your"
	cont "fault, kid!"
	done

FisherFredBeatenText:
	text "Maybe it was my"
	line "fault."
	done

FisherFredAfterBattleText:
	text "Sorry I yelled at"
	line "you."

	para "I've been trying"
	line "to catch some new"
	cont "#mon, but I've"

	para "had the worst"
	line "luck."
	done

CamperHowardSeenText:
	text "Mt.Mortar isn't"
	line "the easiest place"
	cont "to camp,"

	para "but it's a"
	line "challenge I'm"
	cont "looking forward"
	cont "to!"
	done

CamperHowardBeatenText:
	text "This wasn't the"
	line "challenge I was"
	cont "looking for!"
	done

CamperHowardAfterBattleText:
	text "Sleeping on rocks"
	line "is uncomfortable."
	done

PsychicJordanSeenText:
	text "Hmmmm…"

	para "It seems that the"
	line "#mon I seek is"
	cont "not here…"
	done

PsychicJordanBeatenText:
	text "My intuition was"
	line "correct…"
	done

PsychicJordanLetsDoItText:
	text "Let us commence."
	done

PsychicJordanRematchText:
	text "I forsaw your"
	line "return."

	para "Shall we battle?"
	done

PsychicJordanRefusedText:
	text "You will return."

	para "I forsee it."
	done

Route42Sign1Text:
	text "Route 42"

	para "Ecruteak City -"
	line "Mahogany Town"

	para "Teacher Cadi is"
	line "willing to fight"
	cont "anytime!"
	done

MtMortarSign1Text:
	text "Mt.Mortar"

	para "Waterfall Cave"
	line "Inside"
	done

MtMortarSign2Text:
	text "Mt.Mortar"

	para "Waterfall Cave"
	line "Inside"
	done

Route42Sign2Text:
	text "Route 42"

	para "Ecruteak City -"
	line "Mahogany Town"

	para "Psychic Jordan"
	line "will always be"
	cont "prepared to fight."

	para "I envision seeing"
	line "you more than"
	cont "once."
	done

TeacherCadiSeenText:
	text "I'm taking a break"
	line "from teaching"
	cont "right now."

	para "The mountain air"
	line "is so refreshing."
	done

TeacherCadiBeatenText:
	text "Looks like I got"
	line "schooled!"
	done

TeacherCadiLetsDoItText:
	text "Let us commence."
	done

TeacherCadiRematchText:
	text "I'm still on a"
	line "break, but it's"
	cont "always a fun time"
	cont "to battle."

	para "How about a battle"
	line "to pass the time?"
	done

TeacherCadiRefusedText:
	text "Oh well."

	para "Perhaps later."
	done

Route42_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  0,  8, ROUTE_42_ECRUTEAK_GATE, 3
	warp_event  0,  9, ROUTE_42_ECRUTEAK_GATE, 4
	warp_event 10,  5, MOUNT_MORTAR_1F_OUTSIDE, 1
	warp_event 28,  9, MOUNT_MORTAR_1F_OUTSIDE, 2
	warp_event 46,  7, MOUNT_MORTAR_1F_OUTSIDE, 3
	warp_event  3,  5, FOSSIL_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event  4, 10, BGEVENT_READ, Route42Sign1
	bg_event  7,  5, BGEVENT_READ, MtMortarSign1
	bg_event 45,  9, BGEVENT_READ, MtMortarSign2
	bg_event 54,  8, BGEVENT_READ, Route42Sign2
	bg_event  7,  4, BGEVENT_ITEM, Route42HiddenMaxPotion

	db 9 ; object events
	object_event 42,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherFred, -1
	object_event 49,  8, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperHoward, -1
	object_event 47, 12, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJordan, -1
	object_event 27, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree1, -1
	object_event 28, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree2, -1
	object_event 29, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree3, -1
	object_event  4, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route42UltraBall, EVENT_ROUTE_42_ULTRA_BALL
	object_event 33,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route42SuperPotion, EVENT_ROUTE_42_SUPER_POTION
	object_event  6,  8, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerTeacherCadi, -1
