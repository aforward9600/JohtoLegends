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
	db 2 ; scene scripts
	scene_script .FaceSuicune ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 2 ; callbacks
;	callback MAPCALLBACK_OBJECTS, .NPCsCallback
	callback MAPCALLBACK_TILES, .StairsCallback
	callback MAPCALLBACK_NEWMAP, .LoadReservedIDs

.FaceSuicune:
	end

.DummyScene:
	end

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

.LoadReservedIDs:
	loadmonindex 1, RAIKOU
	loadmonindex 2, ENTEI
	loadmonindex 3, SUICUNE
	return

.FaceBeasts:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .FoughtSuicune
	appear TINTOWER1F_EUSINE
	loadmonindex 0, RAIKOU
	special MonCheck
	iftrue .NoRaikou
	appear TINTOWER1F_EUSINE
	sjump .CheckEntei

.NoRaikou:
	disappear TINTOWER1F_EUSINE
.CheckEntei:
	loadmonindex 0, ENTEI
	special MonCheck
	iftrue .NoEntei
	appear TINTOWER1F_EUSINE
	sjump .BeastsDone

.NoEntei:
	disappear TINTOWER1F_EUSINE
.BeastsDone:
	return

.FoughtSuicune:
	disappear TINTOWER1F_EUSINE
	disappear TINTOWER1F_EUSINE
	disappear TINTOWER1F_EUSINE
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	return

.StairsCallback:
	checkevent EVENT_OPEN_TIN_TOWER
	iftrue .DontHideStairs
	changeblock 10, 2, $09 ; floor
.DontHideStairs:
	return

.SuicuneBattle:
	applymovement PLAYER, TinTowerPlayerMovement1
	pause 15
	loadmonindex 0, RAIKOU
	special MonCheck
	iftrue .Next1 ; if player caught Raikou, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_EUSINE, TinTowerRaikouMovement1
	turnobject PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_EUSINE, TinTowerRaikouMovement2
	disappear TINTOWER1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	loadmonindex 0, ENTEI
	special MonCheck
	iftrue .Next2 ; if player caught Entei, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_EUSINE, TinTowerEnteiMovement1
	turnobject PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_EUSINE, TinTowerEnteiMovement2
	disappear TINTOWER1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	turnobject PLAYER, UP
	pause 10
	applymovement PLAYER, TinTowerPlayerMovement2
	applymovement TINTOWER1F_EUSINE, TinTowerSuicuneMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_EUSINE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_NOTHING
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_NOTHING
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_NOTHING
	setscene SCENE_FINISHED
	clearevent EVENT_SET_WHEN_FOUGHT_HO_OH
	reloadmapafterbattle
	pause 20
	turnobject PLAYER, DOWN
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_EUSINE, 10, 15
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, MovementData_0x1851ec
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE1, 9, 15
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, MovementData_0x1851f5
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE2, 9, 15
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, MovementData_0x1851fb
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE3, 9, 15
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, MovementData_0x1851fe
	turnobject PLAYER, RIGHT
	opentext
	writetext TinTowerEusineSuicuneText
	waitbutton
	closetext
	applymovement TINTOWER1F_EUSINE, MovementData_0x1851f1
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special FadeOutMusic
	pause 20
	playmapmusic
	end

TinTower1FSage1Script:
	jumptextfaceplayer TinTower1FSage1Text

TinTower1FSage2Script:
	jumptextfaceplayer TinTower1FSage2Text

TinTower1FSage3Script:
	jumptextfaceplayer TinTower1FSage3Text

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
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage6Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage6Text2

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

TinTowerEusineSuicuneText:
	text "EUSINE: Awesome!"
	line "Too awesome, even!"

	para "I've never seen a"
	line "battle that great."

	para "That was truly"
	line "inspiring to see."

	para "SUICUNE was tough,"
	line "but you were even"

	para "more incredible,"
	line "<PLAYER>."

	para "I heard SUICUNE's"
	line "mystic power"

	para "summons a rainbow-"
	line "colored #MON."

	para "Maybe, just maybe,"
	line "what went on today"

	para "will cause that"
	line "#MON to appear."

	para "I'm going to study"
	line "the legends more."

	para "Thanks for showing"
	line "me that fantastic"
	cont "battle."

	para "Later, <PLAYER>!"
	done

TinTower1FSage1Text:
	text "According to"
	line "legend…"

	para "When the souls of"
	line "#MON and humans"

	para "commune, from the"
	line "heavens descends a"

	para "#MON of rainbow"
	line "colors…"

	para "Could it mean the"
	line "legendary #MON"

	para "are testing us"
	line "humans?"
	done

TinTower1FSage2Text:
	text "When the BRASS"
	line "TOWER burned down,"

	para "three nameless"
	line "#MON were said"

	para "to have perished."
	line "It was tragic."

	para "However…"

	para "A rainbow-colored"
	line "#MON…"

	para "In other words…"

	para "HO-OH descended"
	line "from the sky and"

	para "gave new life to"
	line "the three #MON."

	para "They are…"

	para "SUICUNE, ENTEI and"
	line "RAIKOU."

	para "That is what they"
	line "say."
	done

TinTower1FSage3Text:
	text "The two TOWERS are"
	line "said to have been"

	para "built to foster"
	line "friendship and"

	para "hope between #-"
	line "MON and people."

	para "That was 700 years"
	line "ago, but the ideal"

	para "still remains"
	line "important today."
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

	para "About 150 years"
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

TinTowerEusineHoOhTextFemale:
	text "Welcome, young"
	line "trainer."

	para "Your friend,"
	line "Draco told me"
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

	para "About 150 years"
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

TinTower1FSage4Text2:
	text "The legendary"
	line "#MON are said"

	para "to embody three"
	line "powers…"

	para "The lightning that"
	line "struck the TOWER."

	para "The fire that"
	line "burned the TOWER."

	para "And the rain that"
	line "put out the fire…"
	done

TinTower1FSage5Text3:
	text "When the legendary"
	line "#MON appeared…"

	para "They struck terror"
	line "in those who saw"
	cont "their rise."

	para "And…"

	para "Some even took to"
	line "futile attacks."

	para "The legendary"
	line "#MON, knowing"

	para "their own power,"
	line "fled, ignoring the"
	cont "frightened people."
	done

TinTower1FSage6Text2:
	text "Of the legendary"
	line "#MON, SUICUNE"

	para "is said to be the"
	line "closest to HO-OH."

	para "I hear there may"
	line "also be a link to"

	para "#MON known as"
	line "UNOWN."

	para "The #MON UNOWN"
	line "must be sharing a"

	para "cooperative bond"
	line "with SUICUNE."
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

TinTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, BELLCHIME_PATH, 3
	warp_event 10, 15, BELLCHIME_PATH, 3
	warp_event 10,  2, TIN_TOWER_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	;object_event  9,  9, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_SUICUNE
	;object_event  7,  9, SPRITE_RAIKOU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_RAIKOU
	;object_event 12,  9, SPRITE_ENTEI, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_ENTEI
	object_event  9,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TinTowerEusine, EVENT_TIN_TOWER_1F_EUSINE
	object_event 10, 11, SPRITE_PERSIAN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TinTower1FPersianScript, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  9, 11, SPRITE_POLIWRATH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTower1FPoliwrathScript, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  8, 11, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FRivalScript, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 11, 11, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FRocket1Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  8,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 14,  2, SPRITE_SHERLES, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  4,  9, SPRITE_ROCKET, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FRocket2Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FRocket3Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
