	object_const_def ; object_event constants
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_BUG_CATCHER
	const ROUTE39_FRUIT_TREE
	const ROUTE39_HEX_MANIAC

Route39_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route39Miltank:
	refreshscreen
	pokepic MILTANK
	cry MILTANK
	waitbutton
	closepokepic
	opentext
	writetext Route39MiltankText
	waitbutton
	closetext
	end

TrainerPokefanmDevon:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDevonSeenText, PokefanmDevonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmDevonAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfCamilla:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfCamillaSeenText, PokefanfCamillaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfCamillaAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorSheldon:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorSheldonSeenText, SailorSheldonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .SailorSheldonAfterBattle2
	writetext SailorSheldonAfterBattleText
	waitbutton
	closetext
	end

.SailorSheldonAfterBattle2
	writetext SailorSheldonAfterBattleText2
	waitbutton
	closetext
	end

TrainerBugCatcherStevie:
	trainer BUG_CATCHER, STEVIE, EVENT_BEAT_BUG_CATCHER_STEVIE, BugCatcherStevieSeenText, BugCatcherStevieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherStevieRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext BugCatcherStevieLetsDoItText
	waitbutton
	winlosstext BugCatcherStevieBeatenText, 0
	loadtrainer BUG_CATCHER, STEVIE
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext BugCatcherStevieAfterBattleText
	waitbutton
	closetext
	end

TrainerHexManiacSabrina:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_HEX_MANIAC_SABRINA
	iftrue .Beaten
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext HexManiacSabrinaSeenText
	waitbutton
	closetext
	winlosstext HexManiacSabrinaBeatenText, 0
	loadtrainer HEX_MANIAC, SABRINA2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_HEX_MANIAC_SABRINA
	closetext
	end

.Beaten:
	writetext HexManiacSabrinaRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext HexManiacSabrinaLetsDoItText
	waitbutton
	winlosstext HexManiacSabrinaBeatenText, 0
	loadtrainer HEX_MANIAC, SABRINA2
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext HexManiacSabrinaAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext HexManiacSabrinaHopeItGetsDarkText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text "Miltank: Mooo!"
	done

SailorSheldonSeenText:
	text "I hope the ships"
	line "start sailing to"
	cont "Kanto again."
	done

SailorSheldonBeatenText:
	text "Awaaargh!"
	done

SailorSheldonAfterBattleText:
	text "Yeah, we can"
	line "only sail to Hoenn"
	cont "and Sinnoh."

	para "Unova's tariffs"
	line "are too high, and"
	cont "Kalos, Alola,"
	cont "Galar and Paldea"
	cont "are too far for an"
	cont "average haul."

	para "Orre would be"
	line "easier if they had"
	cont "more than one"
	cont "port."
	done

PokefanmDevonSeenText:
	text "Pikachu is too"
	line "cute, but I love"
	cont "all my #mon"
	cont "equally!"
	done

PokefanmDevonBeatenText:
	text "See, all cute!"
	done

PokefanmDevonAfterBattleText:
	text "I'm quite over-"
	line "bearing toward my"
	cont "#mon, but it's"

	para "better than being"
	line "neglectful!"
	done

PokefanfCamillaSeenText:
	text "I have a #mon"
	line "some wouldn't"
	cont "consider to be"
	cont "cute, but they're"

	para "wrong! Here, take"
	line "a look!"
	done

PokefanfCamillaBeatenText:
	text "Croconaw is"
	line "adorable!"
	done

PokefanfCamillaAfterBattleText:
	text "Don't you agree?"
	line "Croconaw is just"
	cont "cutest!"
	done

PokefanMDerekPikachuIsItText:
	text "Pikachu is it!"
	line "Don't you agree?"
	done

BugCatcherStevieSeenText:
	text "There's some good"
	line "Bug #mon in"
	cont "this area!"
	done

BugCatcherStevieBeatenText:
	text "My bugs weren't"
	line "strong enough…"
	done

BugCatcherStevieRematchText:
	text "Here to rematch my"
	line "awesome bugs?"
	done

BugCatcherStevieLetsDoItText:
	text "Go, my Bug"
	line "#mon!"
	done

BugCatcherStevieAfterBattleText:
	text "Okey dokey!"

	para "National Forest"
	line "has so many Bug-"
	cont "types! You should"

	para "vist sometime."
	done

HexManiacSabrinaHopeItGetsDarkText:
	text "Ufufufu… I hope it"
	line "gets dark soon."
	done

HexManiacSabrinaSeenText:
	text "A murder of"
	line "Murkrow come out"
	cont "at night."

	para "It's a spectacular"
	line "sight."
	done

HexManiacSabrinaBeatenText:
	text "Although they can"
	line "give you a fright."
	done

HexManiacSabrinaRematchText:
	text "Ready for yet"
	line "another fight?"
	done

HexManiacSabrinaLetsDoItText:
	text "It's time to do"
	line "this right."
	done

HexManiacSabrinaAfterBattleText:
	text "This world has too"
	line "much color."

	para "I would prefer it"
	line "to be duller."

	para "The world would"
	line "look like my home."

	para "I'd like everything"
	line "to be"

	para "MONOCHROME."
	done

Route39SignText:
	text "Route 39"

	para "Olivine City -"
	line "Ecruteak City"

	para "Bug Catcher Stevie"
	line "has some Bug #-"
	cont "mon to battle!"

	para "Hex Maniac Sabrina"
	line "waits for you at"
	cont "night."
	done

MoomooFarmSignText:
	text "MooMoo Farm"

	para "Enjoy Our Fresh"
	line "and Tasty Milk"
	done

Route39TrainerTipsText:
	text "Trainer Tips"

	para "Use SnubbullCall"
	line "on trees to shake"
	cont "#mon out."

	para "Different kinds of"
	line "#mon drop out"
	cont "of trees."

	para "Use SnubbullCall"
	line "on any tree you"
	cont "see!"
	done

SailorSheldonAfterBattleText2:
	text "Sounds like the"
	line "embargo should be"
	cont "lifted soon!"

	para "I'll be sailing the"
	line "seven seas again"
	cont "in no time!"
	done

Route39_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, ROUTE_39_BARN, 1
	warp_event  5,  3, ROUTE_39_FARMHOUSE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  5, 31, BGEVENT_READ, Route39TrainerTips
	bg_event  9,  5, BGEVENT_READ, MoomooFarmSign
	bg_event 15,  7, BGEVENT_READ, Route39Sign
	bg_event  5, 13, BGEVENT_ITEM, Route39HiddenNugget

	db 10 ; object events
	object_event 13, 29, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSailorSheldon, -1
	object_event 10, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDevon, -1
	object_event 11, 19, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanfCamilla, -1
	object_event  3, 12, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  6, 11, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  4, 15, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  8, 13, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 13,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherStevie, -1
	object_event  9,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FruitTree, -1
	object_event  4, 22, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TrainerHexManiacSabrina, -1
