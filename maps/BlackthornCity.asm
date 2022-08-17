	object_const_def ; object_event constants
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_GRAMPS1
	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_M
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_LASS
	const BLACKTHORNCITY_HIKER
	const BLACKTHORNCITY_RIVAL

BlackthornCity_MapScripts:
	db 2 ; scene scripts
	scene_script .IcePathGuard ; SCENE_DEFAULT
	scene_script .Dummy1 ; SCENE_BLACKTHORN_CITY_NOTHING

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.IcePathGuard:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject BLACKTHORNCITY_LASS, 36, 10
.Skip:
	end

.Dummy1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	return

.Santos:
	checkflag ENGINE_GLACIERBADGE
	iftrue .DoesSantosAppear
	disappear BLACKTHORNCITY_SANTOS
	return

.DoesSantosAppear:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	return

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	return

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MASTER
	iftrue .BeatClair
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext Text_ClairIsOut
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext Text_ClairIsIn
	waitbutton
	closetext
	end

.BeatClair:
	writetext Text_ClairIsBeaten
	waitbutton
	closetext
	end

BlackthornGramps1Script:
	jumptextfaceplayer BlackthornGrampsRefusesEntryText

BlackthornGramps2Script:
	jumptextfaceplayer BlackthornGrampsGrantsEntryText

BlackthornBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_JOURNAL
	iftrue .GotJournal
	writetext PokemonCenterGuardText
	waitbutton
	closetext
	end

.GotJournal:
	writetext BlackthornCityBlackBeltText
	waitbutton
	closetext
	end

BlackthornCooltrainerMScript:
	jumptextfaceplayer BlackthornCooltrainerMText

BlackthornYoungsterScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_MASTER
	iftrue .GotPokemon
	jumptextfaceplayer BlackthornYoungsterText

.GotPokemon
	checkevent EVENT_RECEIVED_EXP_SHARE
	iftrue .GotExpShare
	faceplayer
	opentext
	writetext BlackthornYoungsterText2
	buttonsound
	verbosegiveitem EXP_SHARE
	setevent EVENT_RECEIVED_EXP_SHARE
	writetext ThatsExpShareText
	waitbutton
	closetext
	end

.GotExpShare
	jumptextfaceplayer BlackthornYoungsterText3

BlackthornLassScript:
	checkevent EVENT_GOT_JOURNAL
	iftrue .GotJournal
	jumptextfaceplayer BlackthornLassText

.GotJournal:
	jumptextfaceplayer BlackthornLassText2

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	buttonsound
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	buttonsound
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityPlayersHouseSign:
	jumptext BlackthornCityPlayersHouseText

BlackthornCityPokecenterSign:
	jumpstd pokecentersign

BlackthornCityMartSign:
	jumpstd martsign

BlackthornCityMastersHouseSign:
	jumptext BlackthornCityMastersHouseText

BlackthornCityRivalsHouseSign:
	jumptext BlackthornCityRivalsHouseText

BlackthornCity_HikerStopsYou1:
	turnobject BLACKTHORNCITY_HIKER, LEFT
	opentext
	writetext BlackthornCityHikerStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, HikerMovesYouMovement
	end

BlackthornCity_HikerStopsYou2:
	turnobject BLACKTHORNCITY_HIKER, RIGHT
	opentext
	writetext BlackthornCityHikerStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, HikerMovesYouMovement
	end

BlackthornCity_HikerStopsYou3:
	turnobject BLACKTHORNCITY_HIKER, RIGHT
	opentext
	writetext BlackthornCityHikerStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, HikerMovesYouMovement
	end

BlackthornHikerScript:
	checkevent EVENT_GOT_JOURNAL
	iftrue .Done
	jumptextfaceplayer BlackthornCityHikerStopsYouText
.Done
	jumptextfaceplayer BlackthornHikerText

HikerMovesYouMovement:
	step UP
	step_end

Text_ClairIsOut:
	text "I am sorry."

	para "The Master has"
	line "told me that you"
	cont "can only enter"

	para "when you have"
	line "seven Badges, as"
	cont "well as having"

	para "talked to a person"
	line "who possesses"
	cont "knowledge of"
	cont "evolution."

	para "Don't ask me about"
	line "that last one."

	para "I don't make the"
	line "rules here."
	done

Text_ClairIsIn:
	text "The Master is"
	line "waiting for you."
	done

Text_ClairIsBeaten:
	text "You defeated"
	line "The Master?"

	para "That's amazing!"
	done

BlackthornGrampsRefusesEntryText:
	text "No. Only chosen"
	line "trainers may train"

	para "here."
	line "Please leave."
	done

BlackthornGrampsGrantsEntryText:
	text "If the Master"
	line "procclaims you a"
	cont "Dragon Master,"
	cont "I do too."

	para "You may enter."
	done

PokemonCenterGuardText:
	text "They're installing"
	line "a video phone in"
	cont "the #mon Center"

	para "right now. You'll"
	line "be able to call"
	cont "the Abra Delivery"

	para "Service to store"
	line "#mon and items."
	cont "Come back in a"

	para "little while."
	done

BlackthornCityBlackBeltText:
	text "You enjoying the"
	line "video phone? It's"
	cont "pretty useful."
	done

BlackthornCooltrainerMText:
	text "Are you going to"
	line "make your #mon"
	cont "forget some moves?"

	para "The Move Deleter's"
	line "House is right"
	cont "there."

	para "I don't see why he"
	line "does that."

	para "There aren't any"
	line "moves that can't"
	cont "be forgotten."
	done

BlackthornYoungsterText:
	text "Yo, <PLAYER>!"

	para "Today's the day,"
	line "huh?"

	para "Man, I'm jealous."

	para "Maybe someday the"
	line "Master will see me"
	cont "as being worthy."
	done

BlackthornYoungsterText2:
	text "Yo, <PLAYER>!"

	para "You got your"
	line "#mon, huh?"

	para "Man, I'm jealous."

	para "I might as well"
	line "give you this,"
	cont "since I won't"
	cont "need it now."
	done

ThatsExpShareText:
	text "That's Exp.share!"

	para "You can use it to"
	line "give experience to"

	para "a #mon that is"
	line "not in battle!"

	para "Just give it to a"
	line "#mon, and watch"
	cont "the experience"

	para "roll in!"
	done

BlackthornYoungsterText3:
	text "How's that Exp."
	line "share treating ya?"

	para "I'm going to want"
	line "it back some day."

	para "I'm going to be a"
	line "trainer eventually"
	cont "after all!"
	done

MeetSantosText:
	text "Howdy! They call"
	line "me the Week Guy!"

	para "Not weak as in"
	line "strength, but"
	cont "like time."

	para "Since it's"
	line "Saturday, I'll"
	cont "give you this!"
	done

SantosGivesGiftText:
	text "Here you go!"
	done

SantosGaveGiftText:
	text "That's a Spell"
	line "Tag! Powers up"
	cont "Ghost-type moves."
	done

SantosSaturdayText:
	text "Come back on an-"
	line "other Saturday,"
	cont "if you want!"
	done

SantosNotSaturdayText:
	text "Hey, it's not"
	line "Saturday!"
	done

BlackthornLassText:
	text "Sorry, but the"
	line "Master told me not"
	cont "to let you through"

	para "just yet. Come"
	line "back when the"
	cont "Masters says you"

	para "are ready."
	done

BlackthornLassText2:
	text "Be careful. Ice"
	line "Path is brutal to"
	cont "the trainers of"

	para "Blackthorn City."
	done

BlackthornCitySignText:
	text "Blackthorn City"

	para "A Quiet Mountain"
	line "Retreat"
	done

BlackthornGymSignText:
	text "Blackthorn City"
	line "#mon Gym"
	cont "Leader: Master"

	para "The Greatest User"
	line "of Dragon #mon"
	done

MoveDeletersHouseSignText:
	text "Move Deleter's"
	line "House"
	done

DragonDensSignText:
	text "Dragon's Den"
	line "Ahead"
	done

BlackthornCityPlayersHouseText:
	text "<PLAYER>'s House"
	done

BlackthornCityMastersHouseText:
	text "Master's House"
	done

BlackthornCityRivalsHouseText:
	text "<RIVAL>'s House"
	done

BlackthornCityHikerStopsYouText:
	text "Hey! It's"
	line "dangerous to go"
	cont "alone! Come back"

	para "when you have a"
	line "#mon for your"
	cont "protection!"
	done

BlackthornHikerText:
	text "Well, I can't stop"
	line "you now, so good"
	cont "luck!"
	done

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 20, 11, BLACKTHORN_GYM_1F, 1
	warp_event 15, 21, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 31, 23, RIVALS_HOUSE_1F, 1
	warp_event 17, 29, BLACKTHORN_MART, 2
	warp_event 23, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event 11, 31, MOVE_DELETERS_HOUSE, 1
	warp_event 38,  9, ICE_PATH_1F, 2
	warp_event 22,  1, DRAGONS_DEN_1F, 1
	warp_event  5, 25, PLAYERS_HOUSE_1F, 1
	warp_event 23, 19, MASTERS_HOUSE_1F, 1

	db 3 ; coord events
	coord_event 11, 35, SCENE_DEFAULT, BlackthornCity_HikerStopsYou1
	coord_event 13, 35, SCENE_DEFAULT, BlackthornCity_HikerStopsYou2
	coord_event 14, 35, SCENE_DEFAULT, BlackthornCity_HikerStopsYou3


	db 9 ; bg events
	bg_event 36, 24, BGEVENT_READ, BlackthornCitySign
	bg_event 19, 13, BGEVENT_READ, BlackthornGymSign
	bg_event  9, 31, BGEVENT_READ, MoveDeletersHouseSign
	bg_event 23,  3, BGEVENT_READ, DragonDensSign
	bg_event  8, 25, BGEVENT_READ, BlackthornCityPlayersHouseSign
	bg_event 18, 29, BGEVENT_READ, BlackthornCityMartSign
	bg_event 24, 29, BGEVENT_READ, BlackthornCityPokecenterSign
	bg_event 21, 19, BGEVENT_READ, BlackthornCityMastersHouseSign
	bg_event 29, 23, BGEVENT_READ, BlackthornCityRivalsHouseSign

	db 11 ; object events
	object_event 20, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 21, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 22,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps1Script, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 23,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps2Script, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event 23, 30, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, EVENT_BLACKTHORN_BLACK_BELT
	object_event 13, 27, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerMScript, -1
	object_event  6, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 29, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 39, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornLassScript, -1
	object_event 12, 35, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornHikerScript, EVENT_BLACKTHORN_HIKER
	object_event 23, 14, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLACKTHORN_CITY_RIVAL
