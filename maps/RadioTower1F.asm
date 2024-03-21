	object_const_def ; object_event constants
	const RADIOTOWER1F_RIVAL
	const RADIOTOWER1F_DIRECTOR
	const RADIOTOWER1F_SHERLES
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_ROCKET2
	const RADIOTOWER1F_ROCKET3
	const RADIOTOWER1F_ROCKET4
	const RADIOTOWER1F_ENGINEER
	const RADIOTOWER1F_ENGINEER2
	const RADIOTOWER1F_POLICE
	const RADIOTOWER1F_BLACKBELT
	const RADIOTOWER1F_SYLVEON
	const RADIOTOWER1F_WOBBUFFET
	const RADIOTOWER1F_RIVAL2

RadioTower1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_RADIOTOWER1F_DIRECTOR

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

RadioTowerDirector1:
	applymovement PLAYER, PlayerTowerMovement1
	applymovement PLAYER, PlayerTowerMovement2
	sjump ContinueWithDirector

RadioTowerDirector2:
	applymovement PLAYER, PlayerTowerMovement1
	applymovement PLAYER, PlayerTowerMovement3
	sjump ContinueWithDirector

RadioTowerDirector3:
	applymovement PLAYER, PlayerTowerMovement1
	applymovement PLAYER, PlayerTowerMovement4
	sjump ContinueWithDirector

RadioTowerDirector4:
	applymovement PLAYER, PlayerTowerMovement1
	applymovement PLAYER, PlayerTowerMovement5
	sjump ContinueWithDirector

ContinueWithDirector:
	turnobject PLAYER, DOWN
	applymovement RADIOTOWER1F_DIRECTOR, DirectorMovesUpMovement
	opentext
	writetext ThankYouClearBellText
	waitbutton
	takeitem CLEAR_BELL
	writetext GaveUpClearBellText
	waitbutton
	writetext HaveAWingText
	waitbutton
	closetext
	opentext
	writetext CanWeReallyText1
	waitbutton
	closetext
	sjump YesYesOfCourse

YesYesOfCourse:
	opentext
	writetext YesYesOfCourseText
	buttonsound
	loadmenu RainbowOrSilverWingMenu
	verticalmenu
	closewindow
	ifequal 1, .RainbowWing
	ifequal 2, .SilverWing
	end

.RainbowWing:
	verbosegiveitem RAINBOW_WING
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	sjump BeautifulWing

.SilverWing:
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	closetext
	sjump BeautifulWing

BeautifulWing:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .CoolWing
	opentext
	writetext ItsSoPrettyText
	waitbutton
	closetext
	sjump TalkToMrPokemon

.CoolWing:
	opentext
	writetext ItsCoolText
	waitbutton
	closetext
	sjump TalkToMrPokemon

TalkToMrPokemon:
	opentext
	writetext GoTalkToMrPokemonText
	waitbutton
	closetext
	turnobject RADIOTOWER1F_RIVAL2, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext DahliaSeeYaText
	waitbutton
	closetext
	applymovement RADIOTOWER1F_RIVAL2, RadioTowerRivalLeavesMovement
	disappear RADIOTOWER1F_RIVAL2
	playsound SFX_EXIT_BUILDING
	setevent EVENT_GOLDENROD_TOWER_RIVAL_2
	sjump SherlesAppearsGoldenrodTower

SherlesAppearsGoldenrodTower:
	pause 30
	moveobject RADIOTOWER1F_SHERLES, 9, 15
	playsound SFX_ENTER_DOOR
	appear RADIOTOWER1F_SHERLES
	applymovement RADIOTOWER1F_SHERLES, SherlesMovesToYouMovement
	turnobject RADIOTOWER1F_SHERLES, RIGHT
	opentext
	writetext YouAgainText
	waitbutton
	closetext
	applymovement RADIOTOWER1F_SHERLES, SherlesMovesIntoPlaceMovement
	setevent EVENT_LIGHTHOUSE_SHERLES
	clearevent EVENT_GOLDENROD_TOWER_SHERLES
	clearevent EVENT_GOLDENROD_GYM_RIVAL_1
	setscene SCENE_DEFAULT
	end

RadioTower1FRivalScript:
	faceplayer
	opentext
	writetext IllHealYouGoldenrodTowerText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext RadioTower1FRivalText
	waitbutton
	closetext
	turnobject RADIOTOWER1F_RIVAL, RIGHT
	end

RadioTower1FDirectorScript:
	jumptextfaceplayer RadioTower1FDirectorText

RadioTower1FSherlesScript:
	jumptextfaceplayer RadioTower1FSherlesText

RadioTower1FGruntMScript:
	faceplayer
	opentext
	writetext RadioTower1FGruntMText
	waitbutton
	closetext
	turnobject RADIOTOWER1F_ROCKET, LEFT
	end

RadioTower1FGruntM2Script:
	jumptextfaceplayer RadioTower1FGruntM2Text

RadioTower1FGruntM3Script:
	faceplayer
	opentext
	writetext GruntM3SeenText
	waitbutton
	closetext
	winlosstext GruntM3BeatenText, 0
	loadtrainer GRUNTM, GRUNTM_12
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_GRUNTM_12
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	disappear RADIOTOWER1F_ROCKET3
	playsound SFX_EXIT_BUILDING
	end

RadioTower1FGruntM4Script:
	jumptextfaceplayer RadioTower1FGruntM4Text

RadioTower1FEngineerScript:
	jumptextfaceplayer RadioTower1FEngineerText

RadioTower1FEngineer2Script:
	jumptextfaceplayer RadioTower1FEngineer2Text

RadioTower1FOfficerScript:
	jumptextfaceplayer RadioTower1FOfficerText

RadioTower1FBlackBeltScript:
	jumptextfaceplayer RadioTower1FBlackBeltText

RadioTower1FSylveonScript:
	refreshscreen
	pokepic SYLVEON
	cry SYLVEON
	waitbutton
	closepokepic
	opentext
	writetext TowerSylveonText
	waitbutton
	closetext
	end

RadioTower1FWobbuffetScript:
	refreshscreen
	pokepic WOBBUFFET
	cry WOBBUFFET
	waitbutton
	closepokepic
	opentext
	writetext WobbuffetText
	waitbutton
	closetext
	end

PlayerTowerMovement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

PlayerTowerMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

PlayerTowerMovement3:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

PlayerTowerMovement4:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

PlayerTowerMovement5:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RadioTowerRivalLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step_end

SherlesMovesToYouMovement:
	step UP
	step LEFT
	step UP
	step UP
	step UP
	step_end

SherlesMovesIntoPlaceMovement:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_resume

RainbowOrSilverWingMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 6, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 2 ; items
	db "Rainbow@"
	db "Silver@"

DirectorMovesUpMovement:
	step UP
	step_resume

RadioTower1FRivalText:
	text "Don't worry, I got"
	line "this! You go on"
	cont "ahead!"
	done

RadioTower1FDirectorText:
	text "So, if we plant"
	line "the explosives"
	cont "there, then we…"

	para "Hm, yes. That"
	line "should work."
	done

RadioTower1FSherlesText:
	text "Stop hanging"
	line "around here kid,"
	cont "or I'll arrest"
	cont "you."

	para "You're on thin"
	line "ice, now."
	done

RadioTower1FGruntMText:
	text "Why are these kids"
	line "always so tough?"
	done

RadioTower1FGruntM2Text:
	text "Taking over this"
	line "place was a piece"
	cont "of cake!"

	para "What are we even"
	line "here for, though?"

	para "Doesn't look like"
	line "there's anything"
	cont "to steal."
	done

RadioTower1FGruntM3Text:
	text "Let's hope our"
	line "informant was"
	cont "correct, for his"
	cont "sake."
	done

RadioTower1FGruntM4Text:
	text "Quit your yelling."

	para "Nobody's saving you"
	line "today."
	done

RadioTower1FEngineerText:
	text "Help me, please!"

	para "I'm not a trainer!"

	para "I'm just a simple"
	line "engineer!"
	done

RadioTower1FEngineer2Text:
	text "Hey, thanks for"
	line "help back there."

	para "Just don't tell"
	line "anyone I was"
	cont "pleading."

	para "I got a reputation"
	line "to uphold!"
	done

RadioTower1FOfficerText:
	text "Another day,"
	line "another tower."

	para "I'm starting to"
	line "think these guys"
	cont "like towers."

	para "Maybe their hide-"
	line "out is in one?"
	done

TowerSylveonText:
	text "Sylveon: Syyyyyll!"
	done

WobbuffetText:
	text "Wobbuffet: WAAAAH!"

	para "…buffet."
	done

RadioTower1FBlackBeltText:
	text "You can go on"
	line "ahead."

	para "It's you, after-"
	line "all."
	done

GruntM3SeenText:
	text "I got word that"
	line "you'd be here."

	para "We didn't expect"
	line "you to show up so"
	cont "soon!"

	para "I'll take care of"
	line "you right now, so"
	cont "our plan goes off"
	cont "without a hitch!"
	done

GruntM3BeatenText:
	text "Too strong! Gotta"
	line "warn the others…"
	done

GruntM3AfterBattleText:
	text "This won't do…"

	para "Our plan could be"
	line "ruined. The others"
	cont "will have to get"
	cont "rid of you…"
	done

ThankYouClearBellText:
	text "Thanks to you two,"
	line "my tower is safe,"
	cont "as is my bell!"

	para "Please, return it"
	line "to me."
	done

GaveUpClearBellText:
	text "<PLAYER> gave away"
	line "the Clear Bell."
	done

HaveAWingText:
	text "Don't worry, there"
	line "is a reward, of"
	cont "course!"

	para "In my possession,"
	line "are two #mon"
	cont "feathers, both"
	cont "from rare #-"
	cont "mon!"

	para "I want each of"
	line "you to have one!"
	done

CanWeReallyText1:
	text "<RIVAL>: Can we"
	line "really?!"
	done

CanWeReallyText2:
	text "<RIVAL>: Can we"
	line "really?!"
	done

YesYesOfCourseText:
	text "Yes, yes, of"
	line "course!"

	para "You risked your"
	line "lives for me, so"
	cont "it is only fair"
	cont "that you receive"
	cont "something so"
	cont "precious!"

	para "Now then, which"
	line "shall you take?"
	done

ItsSoPrettyText:
	text "<RIVAL>: They're so"
	line "pretty, but what"
	cont "kind of #mon"
	cont "are they from?"
	done

ItsCoolText:
	text "<RIVAL>: They're so"
	line "cool, but what"
	cont "kind of #mon"
	cont "are they from?"
	done

GoTalkToMrPokemonText:
	text "I've never been"
	line "quite sure myself,"

	para "but there is"
	line "one person I can"
	cont "think of that"
	cont "could tell you."

	para "His name is Mr."
	line "#mon."

	para "He lives on Route"
	line "30, but I've heard"
	cont "he's actually vis-"
	cont "iting the Day-Care"
	cont "on Route 34."

	para "You had best go"
	line "and talk with him."

	para "Who knows?"

	para "He might give you"
	line "an idea about the"
	cont "origins of those"
	cont "feathers."
	done

DahliaSeeYaText:
	text "<RIVAL>: Sounds"
	line "like a plan."

	para "You go on ahead,"
	line "<PLAYER>."

	para "I still have a"
	line "PlainBadge to"
	cont "earn!"

	para "See ya at the"
	line "Day-Care!"
	done

DracoSeeYaText:
	text "<RIVAL>: Sounds"
	line "like a plan."

	para "You go on ahead,"
	line "<PLAYER>."

	para "I still have a"
	line "PlainBadge to"
	cont "earn!"

	para "See ya at the"
	line "Day-Care!"
	done

YouAgainText:
	text "You again, huh?"

	para "Everytime these"
	line "people show up,"
	cont "you're right"
	cont "there alongside"
	cont "them."

	para "If I find you"
	line "in their company"
	cont "again, I may have"
	cont "to arrest you."

	para "My investigations"
	line "are showing that,"
	cont "whether by coinc-"
	cont "idence or not,"
	cont "you're involved."

	para "Stay out of this,"
	line "got it?"
	done

IllHealYouGoldenrodTowerText:
	text "Need some healing?"
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, GOLDENROD_CITY, 11
	warp_event 10, 15, GOLDENROD_CITY, 11
	warp_event 10,  2, RADIO_TOWER_2F, 2

	db 4 ; coord events
	coord_event  4,  7, SCENE_RADIOTOWER1F_DIRECTOR, RadioTowerDirector1
	coord_event  5,  7, SCENE_RADIOTOWER1F_DIRECTOR, RadioTowerDirector2
	coord_event 14,  6, SCENE_RADIOTOWER1F_DIRECTOR, RadioTowerDirector3
	coord_event 15,  6, SCENE_RADIOTOWER1F_DIRECTOR, RadioTowerDirector4

	db 0 ; bg events

	db 14 ; object events
	object_event  8, 11, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FRivalScript, EVENT_GOLDENROD_TOWER_RIVAL
	object_event  9, 13, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FDirectorScript, EVENT_GOLDENROD_TOWER_DIRECTOR
	object_event 11, 13, SPRITE_SHERLES, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FSherlesScript, EVENT_GOLDENROD_TOWER_SHERLES
	object_event 11, 11, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FGruntMScript, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  4,  6, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FGruntM2Script, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 10,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FGruntM3Script, EVENT_BEAT_ROCKET_GRUNTM_12
	object_event 15,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FGruntM4Script, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 16,  4, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FEngineerScript, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 16,  3, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FEngineer2Script, EVENT_GOLDENROD_TOWER_DIRECTOR
	object_event  4,  3, SPRITE_OFFICER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FOfficerScript, EVENT_GOLDENROD_TOWER_POLICE
	object_event 11,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FBlackBeltScript, EVENT_GOLDENROD_TOWER_DIRECTOR
	object_event  9, 11, SPRITE_SYLVEON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FSylveonScript, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 10, 11, SPRITE_WOBBUFFET, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FWobbuffetScript, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  8, 11, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FRivalScript, EVENT_GOLDENROD_TOWER_RIVAL_2
