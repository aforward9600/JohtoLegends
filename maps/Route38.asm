	object_const_def ; object_event constants
	const ROUTE38_STANDING_YOUNGSTER1
	const ROUTE38_STANDING_YOUNGSTER3
	const ROUTE38_STANDING_YOUNGSTER2
	const ROUTE38_BUENA1
	const ROUTE38_SAILOR
	const ROUTE38_FRUIT_TREE
	const ROUTE38_BUENA2

Route38_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperFarley:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperFarleySeenText, BirdKeeperFarleyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperFarleyAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorLarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorLarrySeenText, SailorLarryBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SailorLarryAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterRandy:
	trainer YOUNGSTER, RANDY, EVENT_BEAT_YOUNGSTER_RANDY, YoungsterRandySeenText, YoungsterRandyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterRandyRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext YoungsterRandyLetsDoItText
	waitbutton
	winlosstext YoungsterRandyBeatenText, 0
	loadtrainer YOUNGSTER, RANDY
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext YoungsterRandyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyEric:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyEricSeenText, SchoolboyEricBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SchoolboyEricAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyWilma:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyWilmaSeenText, BeautyWilmaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyWilmaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyFiona:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyFionaSeenText, BeautyFionaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyFionaAfterBattleText
	waitbutton
	closetext
	end

Route38Sign:
	jumptext Route38SignText

Route38TrainerTips:
	jumptext Route38TrainerTipsText

Route38FruitTree:
	fruittree FRUITTREE_ROUTE_38

BirdKeeperFarleySeenText:
	text "Perhaps someday,"
	line "we can battle in"
	cont "the sky with our"
	cont "#mon."
	done

BirdKeeperFarleyBeatenText:
	text "I can only"
	line "imagine."
	done

BirdKeeperFarleyAfterBattleText:
	text "Of course, only"
	line "ones that fly in"

	para "the air could"
	line "participate."
	done

SchoolboyEricSeenText:
	text "Have you ever"
	line "heard of Prof.Oak?"
	cont "He's the best when"

	para "it comes to #-"
	line "mon research!"
	done

SchoolboyEricBeatenText:
	text "I need to study"
	line "harder."
	done

SchoolboyEricAfterBattleText:
	text "I also heard that"
	line "he was once the"

	para "champion of the"
	line "#mon League."
	done
YoungsterRandySeenText:
	text "Ever been to"
	line "Olivine City?"

	para "The lighthouse"
	line "there is pretty"
	cont "cool!"
	done

YoungsterRandyBeatenText:
	text "You're as bright"
	line "as a lighthouse!"
	done

YoungsterRandyAfterBattleText:
	text "Alright. See you"
	line "later."
	done

YoungsterRandyRematchText:
	text "Back again, huh?"
	done

YoungsterRandyLetsDoItText:
	text "After you!"
	done

BeautyFionaSeenText:
	text "You on your way"
	line "to MooMoo Farm?"

	para "It's the biggest"
	line "attraction on the"
	cont "way to Olivine."
	done

BeautyFionaBeatenText:
	text "Alright. You"
	line "win!"
	done

BeautyFionaAfterBattleText:
	text "Then again, it's"
	line "only attraction on"
	cont "the way to"
	cont "Olivine."
	done

SailorLarrySeenText:
	text "The seas are my"
	line "domain!"

	para "There's nothing"
	line "I can't conquer on"
	cont "oceans!"
	done

SailorLarryBeatenText:
	text "Land is another"
	line "thing..."
	done

SailorLarryAfterBattleText:
	text "I'm the king of"
	line "seas, but the"
	cont "peasant of the"

	para "land. The duality"
	line "of man."
	done

BeautyWilmaSeenText:
	text "The smell of the"
	line "farm is pretty"
	cont "unbearable, but"

	para "the milk is great,"
	line "so I can live with"
	cont "it."
	done

BeautyWilmaBeatenText:
	text "Losing stinks too."
	done

BeautyWilmaAfterBattleText:
	text "I feel bad for the"
	line "farm."

	para "The embargo from"
	line "Kanto has put them"
	cont "in a bind."

	para "I still buy from"
	line "them."

	para "You gotta support"
	line "local businesses."
	done

Route38SignText:
	text "Route 38"

	para "Olivine City -"
	line "Ecruteak City"

	para "Youngster Randy"
	line "never refuses a"
	cont "challenge!"
	done

Route38TrainerTipsText:
	text "Trainer Tips"

	para "If a #mon is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Press the B But-"
	line "ton during evolu-"
	cont "tion."

	para "That startles the"
	line "#mon and stops"
	cont "its evolution."
	done

Route38_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 35,  8, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35,  9, ROUTE_38_ECRUTEAK_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 33,  7, BGEVENT_READ, Route38Sign
	bg_event  5, 13, BGEVENT_READ, Route38TrainerTips

	db 7 ; object events
	object_event  4,  1, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyFiona, -1
	object_event 15,  3, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorLarry, -1
	object_event 12, 15, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyWilma, -1
	object_event 19,  9, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyEric, -1
	object_event 24,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerYoungsterRandy, -1
	object_event 12, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route38FruitTree, -1
	object_event  5,  8, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperFarley, -1
