	object_const_def ; object_event constants
	const ROUTE35_YOUNGSTER1
	const ROUTE35_YOUNGSTER2
	const ROUTE35_LASS1
	const ROUTE35_LASS2
	const ROUTE35_YOUNGSTER3
	const ROUTE35_FISHER
	const ROUTE35_BUG_CATCHER
	const ROUTE35_SUPER_NERD
	const ROUTE35_OFFICER
	const ROUTE35_FRUIT_TREE
	const ROUTE35_POKE_BALL

Route35_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperThad:
	trainer BIRD_KEEPER, THAD, EVENT_BEAT_BIRD_KEEPER_THAD, BirdKeeperThadSeenText, BirdKeeperThadBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperThadAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdHerbert:
	trainer SUPER_NERD, HERBERT_SUPER_NERD, EVENT_BEAT_JUGGLER_IRWIN, SuperNerdHerbertSeenText, SuperNerdHerbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdHerbertAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyCaleb:
	trainer SCHOOLBOY, JACK2, EVENT_BEAT_YOUNGSTER_CALEB, SchoolboyCalebSeenText, SchoolboyCalebBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyCalebAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAJ:
	trainer COOLTRAINERM, AJ, EVENT_BEAT_COOLTRAINERM_AJ, CooltrainermAJSeenText, CooltrainermAJBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAJAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerVivian:
	trainer PICNICKER, VIVIAN_PICNICKER, EVENT_BEAT_LASS_VIVIAN, PicnickerVivianSeenText, PicnickerVivianBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerVivianRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_LASS_ENCOUNTER
	writetext PicnickerVivianLetsDoItText
	waitbutton
	winlosstext PicnickerVivianBeatenText, 0
	loadtrainer PICNICKER, VIVIAN_PICNICKER
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext PicnickerVivianRefusedText
	waitbutton
	closetext
	end

TrainerFisherRusty:
	trainer FISHER, RUSTY, EVENT_BEAT_FISHER_RUSTY, FisherRustySeenText, FisherRustyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRustyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacPalmer:
	trainer POKEMANIAC, PALMER, EVENT_BEAT_BUG_CATCHER_PALMER, PokemaniacPalmerSeenText, PokemaniacPalmerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacPalmerAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherKelvin:
	trainer FIREBREATHER, KELVIN, EVENT_BEAT_FIREBREATHER_KELVIN, FirebreatherKelvinSeenText, FirebreatherKelvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherKelvinRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext FirebreatherKelvinLetsDoItText
	waitbutton
	winlosstext FirebreatherKelvinBeatenText, 0
	loadtrainer FIREBREATHER, KELVIN
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext FirebreatherKelvinRefusedText
	waitbutton
	closetext
	end

TrainerOfficerClancy:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_OFFICER_CLANCY
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerClancySeenText
	waitbutton
	closetext
	winlosstext OfficerClancyBeatenText, 0
	loadtrainer OFFICER, CLANCY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_CLANCY
	closetext
	end

.AfterBattle:
	writetext OfficerClancyAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext OfficerClancyPrettyToughText
	waitbutton
	closetext
	end

Route35Sign:
	jumptext Route35SignText

Route35TMRollout:
	itemball TM_AERIAL_ACE

Route35FruitTree:
	fruittree FRUITTREE_ROUTE_35

SchoolboyCalebSeenText:
	text "Thanks for coming"
	line "over here!"

	para "I was getting"
	line "pretty lonely!"
	done

SchoolboyCalebBeatenText:
	text "Maaaannn!"
	done

SchoolboyCalebAfterBattleText:
	text "Why am I over here"
	line "by myself?"

	para "I dunno."

	para "Why did you show"
	line "up here?"
	done

CooltrainermAJSeenText:
	text "You're almost to"
	line "Goldenrod City,"
	cont "the biggest city"
	cont "in Johto!"
	done

CooltrainermAJBeatenText:
	text "You might be"
	line "ready for the gym!"
	done

CooltrainermAJAfterBattleText:
	text "Goldenrod used to"
	line "be a smaller town,"

	para "but they've been"
	line "expanding in"
	cont "recent years."
	done

PicnickerVivianSeenText:
	text "I may be cute, but"
	line "don't underest-"
	cont "imate me!"
	done

PicnickerVivianBeatenText:
	text "I underestimated"
	line "you!"
	done

PicnickerVivianRematchText:
	text "Came back to see"
	line "how cute I am?"
	done

PicnickerVivianLetsDoItText:
	text "I knew it!"
	done

PicnickerVivianRefusedText:
	text "Fine."

	para "Looks can be dec-"
	line "eiving, don't you"
	cont "think?"
	done

FisherRustySeenText:
	text "The three rules of"
	line "fishing are:"

	para "1: Be patient."

	para "2: Be quiet."

	para "3: Don't throw"
	line "your rod in the"
	cont "water."

	para "That last one I"
	line "learned the hard"
	cont "way…"
	done

FisherRustyBeatenText:
	text "Fish outta water!"
	done

FisherRustyAfterBattleText:
	text "You wouldn't"
	line "believe how many"
	cont "rods I've thrown"
	cont "away by accident…"
	done

BirdKeeperThadSeenText:
	text "I never cage my"
	line "birds!"

	para "That's just in-"
	line "humane!"
	done

BirdKeeperThadBeatenText:
	text "My birds!"
	done

BirdKeeperThadAfterBattleText:
	text "Birds are meant to"
	line "fly freely!"
	done

SuperNerdHerbertSeenText:
	text "Round #mon are"
	line "kinda my thing."
	done

SuperNerdHerbertBeatenText:
	text "Juggling style!"
	done

SuperNerdHerbertAfterBattleText:
	text "I've only dropped"
	line "my Jigglypuff"
	cont "once, OK?"
	done

PokemaniacPalmerSeenText:
	text "Wanna see my cool"
	line "#mon?"
	done

PokemaniacPalmerBeatenText:
	text "Cool, huh?"
	done

PokemaniacPalmerAfterBattleText:
	text "Some people think"
	line "Venomoth is part"
	cont "Poison-type."

	para "That's crazy, huh?"

	para "Everyone knows"
	line "it's part Psychic-"
	cont "type!"
	done

BugCatcherArnieYanmaText:
	text "Wow… Look at all"
	line "those YANMA!"

	para "I'm so blown away,"
	line "I can't move."
	done

FirebreatherKelvinSeenText:
	text "I'm not allowed in"
	line "the National"
	cont "Forest anymore…"

	para "I'm considered a"
	line "fire hazard!"

	para "Can you believe"
	line "that?!"
	done

FirebreatherKelvinBeatenText:
	text "YOW!"

	para "Hot, hot, hot!"
	done

FirebreatherKelvinRematchText:
	text "You're back!"

	para "Ready to watch"
	line "my fire show?"
	done

FirebreatherKelvinLetsDoItText:
	text "Time for a heated"
	line "match!"
	done

FirebreatherKelvinRefusedText:
	text "OK…"

	para "Looks like they"
	line "were right about"
	cont "me being a fire"
	cont "hazard…"
	done

OfficerClancySeenText:
	text "I am the protector"
	line "of the night!"
	done

OfficerClancyBeatenText:
	text "Help, I need"
	line "protection!"
	done

OfficerClancyAfterBattleText:
	text "Oh, it's just a"
	line "kid."

	para "Well, looks like"
	line "my work here is"
	cont "done!"
	done

OfficerClancyPrettyToughText:
	text "Move along,"
	line "citizen."

	para "I'm here to make"
	line "sure no suspicious"
	cont "individuals enter"
	cont "the forest."

	para "Especially that"
	line "Firebreather over"
	cont "there…"
	done

Route35SignText:
	text "Route 35"

	para "Firebreather Brad"
	line "is fired up!"

	para "Lass Vivian is"
	line "always looking for"
	cont "admirers!"
	done

Route35_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 33, ROUTE_35_GOLDENROD_GATE, 1
	warp_event 10, 33, ROUTE_35_GOLDENROD_GATE, 2
	warp_event  3,  5, ROUTE_35_NATIONAL_PARK_GATE, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  1,  7, BGEVENT_READ, Route35Sign
	bg_event 11, 31, BGEVENT_READ, Route35Sign

	db 11 ; object events
	object_event  0, 11, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSchoolboyCaleb, -1
	object_event  8, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermAJ, -1
	object_event  4, 17, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerPicnickerVivian, -1
	object_event  8, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherRusty, -1
	object_event 16,  7, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperThad, -1
	object_event  2, 10, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherKelvin, -1
	object_event 14, 28, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacPalmer, -1
	object_event  5, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSuperNerdHerbert, -1
	object_event  2,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerClancy, -1
	object_event  2, 25, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35FruitTree, -1
	object_event 13, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, Route35TMRollout, EVENT_ROUTE_35_TM_ROLLOUT
