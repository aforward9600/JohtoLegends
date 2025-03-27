	object_const_def ; object_event constants
	const AZALEATOWN_AZALEA_ROCKET1
	const AZALEATOWN_GRAMPS
	const AZALEATOWN_TEACHER
	const AZALEATOWN_YOUNGSTER
	const AZALEATOWN_SLOWPOKE1
	const AZALEATOWN_SLOWPOKE2
	const AZALEATOWN_SLOWPOKE3
	const AZALEATOWN_SLOWPOKE4
	const AZALEATOWN_FRUIT_TREE
	const AZALEATOWN_RIVAL
	const AZALEATOWN_AZALEA_ROCKET3

AzaleaTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_AZALEATOWN_NOTHING
	scene_script .DummyScene1 ; SCENE_AZALEATOWN_RIVAL_BATTLE
;	scene_script .DummyScene2 ; SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_AZALEA
	return

AzaleaTownRivalBattleScene1:
	pause 15
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_RIVAL
	applymovement AZALEATOWN_RIVAL, AzaleaTownRivalBattleApproachMovement1
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .AzaleaRivalFemale
	playmusic MUSIC_DAHLIA_ENCOUNTER
	opentext
	writetext AzaleaTownRivalBeforeText
	waitbutton
	closetext
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_OPEN_TIN_TOWER
	setevent EVENT_TIN_TOWER_TAKEOVER
	setevent EVENT_TIN_TOWER_ROOF_PLAYER
	setevent EVENT_TIN_TOWER_ROOF_HO_OH
	clearevent EVENT_BELLCHIME_PATH_ENOKI_PANIC
	applymovement AZALEATOWN_RIVAL, AzaleaTownRivalBattleExitMovement
	disappear AZALEATOWN_RIVAL
	setscene SCENE_AZALEATOWN_NOTHING
	pause 15
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.AzaleaRivalFemale:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AzaleaTownRivalBeforeText
	waitbutton
	closetext
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_OPEN_TIN_TOWER
	setevent EVENT_TIN_TOWER_TAKEOVER
	setevent EVENT_TIN_TOWER_ROOF_PLAYER
	setevent EVENT_TIN_TOWER_ROOF_HO_OH
	clearevent EVENT_BELLCHIME_PATH_ENOKI_PANIC
	applymovement AZALEATOWN_RIVAL, AzaleaTownRivalBattleExitMovement
	disappear AZALEATOWN_RIVAL
	setscene SCENE_AZALEATOWN_NOTHING
	pause 15
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

AzaleaTownCooltrainerScript:
	jumptextfaceplayer AzaleaTownCooltrainerText

AzaleaTownRocket2Script:
	jumptextfaceplayer AzaleaTownRocket2Text

AzaleaTownGrampsScript:
	jumptextfaceplayer AzaleaTownGrampsTextBefore

AzaleaTownTeacherScript:
	jumptextfaceplayer AzaleaTownTeacherText

AzaleaTownYoungsterScript:
	jumptextfaceplayer AzaleaTownYoungsterText

AzaleaTownSlowpokeScript:
	refreshscreen
	pokepic SLOWPOKE
	cry SLOWPOKE
	waitbutton
	closepokepic
	opentext
	writetext AzaleaTownSlowpokeText1
	pause 60
	writetext AzaleaTownSlowpokeText2
	waitbutton
	closetext
	end

AzaleaTownSign:
	jumptext AzaleaTownSignText

KurtsHouseSign:
	jumptext KurtsHouseSignText

AzaleaGymSign:
	jumptext AzaleaGymSignText

SlowpokeWellSign:
	jumptext SlowpokeWellSignText

CharcoalKilnSign:
	jumptext CharcoalKilnSignText

AzaleaTownIlextForestSign:
	jumptext AzaleaTownIlexForestSignText

AzaleaTownPokecenterSign:
	jumpstd pokecentersign

AzaleaTownMartSign:
	jumpstd martsign

WhiteApricornTree:
	fruittree FRUITTREE_AZALEA_TOWN

AzaleaTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL

AzaleaTownRivalBattleApproachMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

PlayerMovesDownAzalea:
	step DOWN
	step_end

AzaleaTownRivalBattleExitMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

AzaleaTownRivalBeforeText:
	text "<PLAYER>!"

	para "You're not going"
	line "to believe this!"

	para "Bell Tower is"
	line "being invaded!"

	para "You don't even"
	line "have to ask,"
	cont "do you?"

	para "It's them again…"

	para "You know for a"
	line "fact I'm going!"

	para "You're gonna be"
	line "there too, right?"

	para "After all, we"
	line "always seem to"
	cont "show up where"
	cont "there's trouble."

	para "See you there!"
	done

AzaleaTownRivalWinText:
	text "… Humph! Useless"
	line "#mon!"

	para "Listen, you. You"
	line "only won because"

	para "my #mon were"
	line "weak."
	done

AzaleaTownRivalAfterText:
	text "I hate the weak."

	para "#mon, trainers."
	line "It doesn't matter"
	cont "who or what."

	para "I'm going to be"
	line "strong and wipe"
	cont "out the weak."

	para "That goes for Team"
	line "Rocket too."

	para "They act big and"
	line "tough in a group."

	para "But get them"
	line "alone, and they're"
	cont "weak."

	para "I hate them all."

	para "You stay out of my"
	line "way. A weakling"

	para "like you is only a"
	line "distraction."
	done

AzaleaTownRivalLossText:
	text "…Humph! I knew"
	line "you were lying."
	done

AzaleaTownCooltrainerText:
	text "Looking to fight"
	line "the Gym Leader?"

	para "Good luck!"

	para "He's a lot tougher"
	line "than he looks!"
	done

AzaleaTownRocket2Text:
	text "This is such a"
	line "peaceful little"
	cont "town, isn't it?"

	para "All the Slowpoke"
	line "certainly just"

	para "make you wanna"
	line "relax."
	done

AzaleaTownGrampsTextBefore:
	text "Please be respect-"
	line "ful of our"
	cont "Slowpoke."
	done

AzaleaTownTeacherText:
	text "Did you come to"
	line "get Kurt to make"
	cont "some Balls?"

	para "A lot of people do"
	line "just that."

	para "Too bad he doesn't"
	line "make them anymore."
	done

AzaleaTownYoungsterText:
	text "Cut through Azalea"
	line "and you'll be in"
	cont "Ilex Forest."

	para "But these skinny"
	line "trees make it"

	para "impossible to get"
	line "through."

	para "…Oh, I see you"
	line "have a Scyther"
	cont "call."

	para "That makes getting"
	line "through a breeze!"
	done

AzaleaTownSlowpokeText1:
	text "Slowpoke: …"

	para "<……> <……> <……>"
	done

AzaleaTownSlowpokeText2:
	text "<……> <……>Yawn?"
	done

WoosterText:
	text "Wooster: Gugyoo…"
	done

AzaleaTownSignText:
	text "Azalea Town"
	line "Where People and"

	para "#mon Live in"
	line "Happy Harmony"
	done

KurtsHouseSignText:
	text "Kurt'S House"
	done

AzaleaGymSignText:
	text "Azalea Town"
	line "#mon Gym"
	cont "Leader: Kurt"

	para "The Ball"
	line "making master"
	done

SlowpokeWellSignText:
	text "Slowpoke Well"

	para "Also known as the"
	line "Rainmaker Well."

	para "Locals believe"
	line "that a Slowpoke's"
	cont "yawn summons rain."

	para "Records show that"
	line "a Slowpoke's yawn"

	para "ended a drought"
	line "400 years ago."
	done

CharcoalKilnSignText:
	text "Charcoal Kiln"
	done

AzaleaTownIlexForestSignText:
	text "Ilex Forest"

	para "Enter through the"
	line "gate."
	done

AzaleaTown_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 15,  9, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_B1F, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4

	db 1 ; coord events
	coord_event 10, 16, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene1

	db 9 ; bg events
	bg_event 19,  9, BGEVENT_READ, AzaleaTownSign
	bg_event 10,  9, BGEVENT_READ, KurtsHouseSign
	bg_event 14, 15, BGEVENT_READ, AzaleaGymSign
	bg_event 29,  7, BGEVENT_READ, SlowpokeWellSign
	bg_event 19, 13, BGEVENT_READ, CharcoalKilnSign
	bg_event 16,  9, BGEVENT_READ, AzaleaTownPokecenterSign
	bg_event 22,  5, BGEVENT_READ, AzaleaTownMartSign
	bg_event  3,  9, BGEVENT_READ, AzaleaTownIlextForestSign
	bg_event 31,  6, BGEVENT_ITEM, AzaleaTownHiddenFullHeal

	db 11 ; object events
	object_event 19, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownCooltrainerScript, EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event 15, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event  7,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaTownYoungsterScript, -1
	object_event  8, 17, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 18,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 29,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 15, 15, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event  8,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhiteApricornTree, -1
	object_event 15, 16, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_AZALEA_TOWN
	object_event 30, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownRocket2Script, EVENT_SLOWPOKE_WELL_ROCKETS
