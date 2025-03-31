	object_const_def ; object_event constants
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3
	const TINTOWER1F_SAGE4
	const TINTOWER1F_SAGE5
	const TINTOWER1F_SAGE6
	const TINTOWER1F_ROCKET2
	const TINTOWER1F_ROCKET3

TinTower1F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
;	callback MAPCALLBACK_OBJECTS, .NPCsCallback
	callback MAPCALLBACK_TILES, .StairsCallback
	callback MAPCALLBACK_NEWMAP, .LoadReservedIDs

;.NPCsCallback:
;	checkevent EVENT_GOT_RAINBOW_WING
;	iftrue .GotRainbowWing
;	checkevent EVENT_BEAT_ELITE_FOUR
;	iffalse .FaceBeasts
;	special BeastsCheck
;	iffalse .FaceBeasts
;	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
;	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
;.GotRainbowWing:
;	checkevent EVENT_FOUGHT_HO_OH
;	iffalse .Done
;	appear TINTOWER1F_EUSINE
;.Done:
;	return

.StairsCallback:
	checkevent EVENT_OPEN_TIN_TOWER
	iftrue .DontHideStairs
	changeblock 10, 2, $09 ; floor
.DontHideStairs:
	return

.LoadReservedIDs:
	return

TinTower1FRocket1Script:
	faceplayer
	opentext
	writetext TinTower1FRocket1Text
	waitbutton
	closetext
	turnobject, TINTOWER1F_SAGE4, LEFT
	end

TinTower1FRivalScript:
	faceplayer
	opentext
	writetext IllHealYouBellTowerText
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
	writetext TinTower1FRivalText
	waitbutton
	closetext
	turnobject, TINTOWER1F_SAGE3, RIGHT
	end

TinTower1FRocket2Script:
	jumptextfaceplayer TinTower1FRocket2Text

TinTower1FRocket3Script:
	jumptextfaceplayer TinTower1FRocket3Text

TinTower1FSage5Script:
	jumptextfaceplayer TinTower1FSage5Text2

TinTower1FSage6Script:
	jumptextfaceplayer TinTower1FSage6Text1

TinTower1FPoliwrathScript:
	refreshscreen
	pokepic POLIWRATH
	cry POLIWRATH
	waitbutton
	closepokepic
	opentext
	writetext TinTower1FPoliwrathText
	waitbutton
	closetext
	end

TinTower1FPersianScript:
	refreshscreen
	pokepic PERSIAN
	cry PERSIAN
	waitbutton
	closepokepic
	opentext
	writetext TinTower1FPersianText
	waitbutton
	closetext
	end

TinTowerEusine:
	faceplayer
	opentext
	checkevent EVENT_CAUGHT_HO_OH
	iftrue .HoOhIsYours
	checkevent EVENT_BEAT_MADAME_BOSS
	iftrue .HoOhIsFree
	checkevent EVENT_CLEARED_TIN_TOWER
	iftrue .HoOhIsGone
	checkevent EVENT_OPEN_ILEX_FOREST
	iftrue .TinTowerSage
	writetext TinTowerEusineHoOhText
	waitbutton
	closetext
	setevent EVENT_OPEN_ILEX_FOREST
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	end

.TinTowerSage:
	checkevent EVENT_TIN_TOWER_TAKEOVER
	iftrue .PleaseHelpUs
	writetext TinTowerSageText
	waitbutton
	closetext
	end

.PleaseHelpUs:
	writetext TinTowerSageHelpUsText
	waitbutton
	closetext
	end

.HoOhIsGone:
	writetext HoOhIsGoneText
	waitbutton
	closetext
	end

.HoOhIsFree:
	writetext HoOhIsFreeText
	waitbutton
	closetext
	end

.HoOhIsYours:
	writetext HoOhIsYoursText
	waitbutton
	closetext
	end

TinTowerPlayerMovement1:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

TinTowerRaikouMovement1:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerRaikouMovement2:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerEnteiMovement1:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerEnteiMovement2:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step LEFT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerSuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerPlayerMovement2:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

MovementData_0x1851ec:
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x1851f1:
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x1851f5:
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x1851fb:
	step UP
	step UP
	step_end

MovementData_0x1851fe:
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end

IllHealYouBellTowerText:
	text "You doing OK?"

	para "Here, I'll heal"
	line "your #mon."
	done

TinTower1FRocket2Text:
	text "This better not be"
	line "a dud like the"

	para "last two times!"
	done

TinTower1FRocket3Text:
	text "These old guys are"
	line "no match for us!"

	para "…What?"

	para "I can't be proud"
	line "of a victory?"

	para "So what if it was"
	line "just some elderly"
	cont "men?"
	done

TinTower1FSage5Text1:
	text "This will protect"
	line "you. Take it."
	done

TinTower1FSage5Text2:
	text "Man, Legendary"
	line "#mon poached…"

	para "It's hard to"
	line "believe."
	done

TinTower1FSage6Text1:
	text "We'll find them,"
	line "and free those"
	cont "#mon."

	para "Just continue on"
	line "your journey."
	done

TinTowerEusineHoOhText:
	text "Welcome, young"
	line "trainer."

	para "Your friend,"
	line "<RIVAL> told me"
	cont "you'd come."

	para "You wish to know"
	line "the history of the"
	cont "Legendary #mon,"

	para "and I shall tell"
	line "you."

	para "In the past, there"
	line "were two nine-tier"
	cont "towers here."

	para "The Brass Tower,"
	line "which was said to"

	para "awaken #mon,"
	line "and the Bell"
	cont "Tower, where"

	para "#mon were said"
	line "to rest."

	para "The view from the"
	line "tops of the towers"

	para "must have been"
	line "magnificent."

	para "At the time, an"
	line "immense, silver-"

	para "colored #mon"
	line "was said to make"

	para "its roost atop the"
	line "Brass Tower."

	para "However…"

	para "About 135 years"
	line "ago, a lightning"

	para "bolt struck one of"
	line "the towers."

	para "It was engulfed in"
	line "flames that raged"
	cont "for three days."

	para "A sudden downpour"
	line "finally put out"
	cont "the blaze."

	para "And that is how"
	line "the Burned Tower"
	cont "came to be."

	para "What became of"
	line "those #mon?"

	para "Ho-Oh left this"
	line "Tower, waiting for"
	cont "one worthy of its"
	cont "power."

	para "The #mon of"
	line "Brass Tower, Lugia"
	cont "left for the Whirl"
	cont "Islands, where we"
	cont "guard its resting"
	cont "place."

	para "Even though you"
	line "possess a wing of"
	cont "Legendary origin,"

	para "it still isn't"
	line "enough to face"
	cont "them."

	para "Someday, you may"
	line "be able to face"
	cont "them."

	para "Do what you will"
	line "with this"
	cont "knowledge."
	done

TinTowerSageText:
	text "Good luck on your"
	line "journey."
	done

TinTower1FRocket1Text:
	text "Agh!"

	para "Not this kid"
	line "again!"
	done

TinTower1FRivalText:
	text "Don't worry about"
	line "me, <PLAYER>!"

	para "This guy's even"
	line "easier than last"
	cont "time!"
	done

TinTower1FPoliwrathText:
	text "Wrath, wrath!"
	done

TinTower1FPersianText:
	text "Purrrr!"
	done

TinTowerSageHelpUsText:
	text "Please…"

	para "Help us…"
	done

HoOhIsGoneText:
	text "Ho-Oh is gone…"

	para "Taken by those"
	line "monsters…"

	para "I hope we can"
	line "free it…"
	done

HoOhIsFreeText:
	text "Ho-Oh is free now…"

	para "Hopefully it will"
	line "return some day…"
	done

HoOhIsYoursText:
	text "Ho-Oh is yours"
	line "now…"

	para "I know you will"
	line "take good care of"
	cont "it…"
	done

TinTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, BELLCHIME_PATH, 3
	warp_event 10, 15, BELLCHIME_PATH, 3
	warp_event 10,  2, TIN_TOWER_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  9,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TinTowerEusine, EVENT_TIN_TOWER_1F_EUSINE
	object_event 10, 11, SPRITE_PERSIAN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TinTower1FPersianScript, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  9, 11, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTower1FPoliwrathScript, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  8, 11, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FRivalScript, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 11, 11, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FRocket1Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  8,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 14,  2, SPRITE_SHERLES, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  4,  9, SPRITE_ROCKET, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FRocket2Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FRocket3Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
