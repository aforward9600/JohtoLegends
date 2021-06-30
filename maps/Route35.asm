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

TrainerBirdKeeperBryan:
	trainer BIRD_KEEPER, GUNNER, EVENT_BEAT_BIRD_KEEPER_GUNNER, BirdKeeperBryanSeenText, BirdKeeperBryanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBryanAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerIrwinAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterCaleb:
	trainer YOUNGSTER, CALEB, EVENT_BEAT_YOUNGSTER_CALEB, YoungsterCalebSeenText, YoungsterCalebBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterCalebAfterBattleText
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

TrainerPicnickerBrooke:
	trainer PICNICKER, CHLOE, EVENT_BEAT_PICNICKER_CHLOE, PicnickerBrookeSeenText, PicnickerBrookeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerBrookeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerKim:
	trainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerKimAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherPalmer:
	trainer BUG_CATCHER, ARNIE1, EVENT_BEAT_BUG_CATCHER_PALMER, BugCatcherPalmerSeenText, BugCatcherPalmerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherPalmerAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherKelvin:
	trainer FIREBREATHER, KELVIN, EVENT_BEAT_FIREBREATHER_KELVIN, FirebreatherKelvinSeenText, FirebreatherKelvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherKelvinAfterBattleText
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

YoungsterCalebSeenText:
	text "Thanks for coming"
	line "over here!"

	para "I was getting"
	line "pretty lonely!"
	done

YoungsterCalebBeatenText:
	text "Maaaannn!"
	done

YoungsterCalebAfterBattleText:
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

PicnickerBrookeSeenText:
	text "My boyfriend's"
	line "weak, so I can't"
	cont "rely on him."
	done

PicnickerBrookeBeatenText:
	text "Oh, my! You're so"
	line "strong!"
	done

PicnickerBrookeAfterBattleText:
	text "I can count on my"
	line "#MON more than"
	cont "my boyfriend."
	done

PicnickerKimSeenText:
	text "Are you going to"
	line "the GYM? Me too!"
	done

PicnickerKimBeatenText:
	text "Oh. I couldn't"
	line "win…"
	done

PicnickerKimAfterBattleText:
	text "The GYM BADGES are"
	line "pretty. I collect"
	cont "them."
	done

BirdKeeperBryanSeenText:
	text "What kinds of"
	line "BALLS do you use?"
	done

BirdKeeperBryanBeatenText:
	text "Yikes! Not fast"
	line "enough!"
	done

BirdKeeperBryanAfterBattleText:
	text "Some #MON flee"
	line "right away."

	para "Try catching them"
	line "with KURT's FAST"
	cont "BALL."

	para "Whenever I find a"
	line "WHT APRICORN, I"
	cont "take it to KURT."

	para "He turns it into a"
	line "custom BALL."
	done

JugglerIrwin1SeenText:
	text "Round #mon are"
	line "kinda my thing."
	done

JugglerIrwin1BeatenText:
	text "Juggling style!"
	done

JugglerIrwinAfterBattleText:
	text "I've only dropped"
	line "my Jigglypuff"
	cont "once, OK?"
	done

BugCatcherPalmerSeenText:
	text "Wanna see my cool"
	line "Bug #mon?"
	done

BugCatcherPalmerBeatenText:
	text "Cool, huh?"
	done

BugCatcherPalmerAfterBattleText:
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

FirebreatherKelvinAfterBattleText:
	text "Well, I guess"
	line "they're right"
	cont "about that…"
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
	object_event  0, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerYoungsterCaleb, -1
	object_event  8, 20, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermAJ, -1
	object_event  3, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerBrooke, -1
	object_event 10, 26, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerKim, -1
	object_event 14, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBirdKeeperBryan, -1
	object_event  2, 10, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherKelvin, -1
	object_event 16,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherPalmer, -1
	object_event  5, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerJugglerIrwin, -1
	object_event  2,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerClancy, -1
	object_event  2, 25, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35FruitTree, -1
	object_event 13, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route35TMRollout, EVENT_ROUTE_35_TM_ROLLOUT
