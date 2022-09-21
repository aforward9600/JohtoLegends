	object_const_def ; object_event constants
	const MAHOGANYMART1F_PHARMACIST
	const MAHOGANYMART1F_BUENA
	const MAHOGANYMART1F_RIVAL
	const MAHOGANYMART1F_SHERLES
	const MAHOGANYMART1F_GRANNY
	const MAHOGANYMART1F_KOGA

MahoganyMart1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_MAHOGANYMART1F_NOTHING
	scene_script .LanceUncoversStaircase ; SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS

	db 3 ; callbacks
	callback MAPCALLBACK_TILES, .MahoganyMart1FStaircase
	callback MAPCALLBACK_OBJECTS, .RivalMoves
	callback MAPCALLBACK_OBJECTS, .SherlesStays

.DummyScene0:
	end

.LanceUncoversStaircase:
	end

.MahoganyMart1FStaircase:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	iftrue .ShowStairs
	return

.ShowStairs:
	changeblock 12, 2, $1e ; stairs
	return

.RivalMoves:
	checkscene SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	iftrue .RivalMovesPlace
	return

.RivalMovesPlace:
	moveobject MAHOGANYMART1F_RIVAL, 10, 4
	return

.SherlesStays:
	checkevent EVENT_MAHOGANY_MART_OWNERS
	iftrue .SherlesLeaves
	moveobject MAHOGANYMART1F_SHERLES, 9, 6
	return

.SherlesLeaves:
	return

MahogayMart1FPharmacistScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_1
	closetext
	end

MahogayMart1FBuenaScript:
	faceplayer
	opentext
	writetext MahogayMart1FBuenaText
	waitbutton
	closetext
	end

SherlesTriesToArrestKoga:
	pause 10
	turnobject MAHOGANYMART1F_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	pause 15
	opentext
	writetext TheresNobodyHereText
	waitbutton
	closetext
	pause 15
	showemote EMOTE_SHOCK, MAHOGANYMART1F_RIVAL, 10
	playsound SFX_EXIT_BUILDING
	turnobject PLAYER, DOWN
	turnobject MAHOGANYMART1F_RIVAL, DOWN
	moveobject MAHOGANYMART1F_SHERLES, 10, 7
	turnobject MAHOGANYMART1F_SHERLES, UP
	appear MAHOGANYMART1F_SHERLES
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	applymovement MAHOGANYMART1F_SHERLES, MovementData_0x6c3f6
	opentext
	writetext ThankGoodnessIFoundYouText
	waitbutton
	closetext
	pause 15
	playsound SFX_EXIT_BUILDING
	pause 10
	moveobject MAHOGANYMART1F_KOGA, 13, 3
	appear MAHOGANYMART1F_KOGA
	showemote EMOTE_SHOCK, MAHOGANYMART1F_SHERLES, 10
	opentext
	writetext TheresOneNowText
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_SHERLES, SherlesMovesRightMovement
	applymovement PLAYER, PlayerMovesOutOfWayMovement
	turnobject PLAYER, RIGHT
	turnobject MAHOGANYMART1F_RIVAL, RIGHT
	applymovement MAHOGANYMART1F_SHERLES, SherlesWalksToKogaMovement
	opentext
	writetext HoldItRightThereNinjaText
	waitbutton
	closetext
	pause 10
	turnobject MAHOGANYMART1F_SHERLES, LEFT
	opentext
	writetext WaitWhatWasThatText
	waitbutton
	closetext
	pause 10
	turnobject MAHOGANYMART1F_SHERLES, RIGHT
	opentext
	writetext MyApologiesText
	waitbutton
	closetext
	opentext
	writetext DontWorryAboutItText
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_KOGA, KogaLeavesMartMovement
	disappear MAHOGANYMART1F_KOGA
	playsound SFX_EXIT_BUILDING
	setevent EVENT_MART_KOGA
	pause 10
	turnobject MAHOGANYMART1F_SHERLES, LEFT
	opentext
	writetext IllKeepInvestigatingText
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_SHERLES, SherlesMovesIntoPlaceAgainMovement
	turnobject PLAYER, DOWN
	turnobject MAHOGANYMART1F_RIVAL, UP
	opentext
	writetext MaybeWeShouldLeaveText
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_RIVAL, RivalLeavesMartMovement
	disappear MAHOGANYMART1F_RIVAL
	playsound SFX_EXIT_BUILDING
	setevent EVENT_MART_RIVAL
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setscene SCENE_MAHOGANYMART1F_NOTHING
	clearevent EVENT_MART_SHERLES
	setevent EVENT_CLEARED_RADIO_TOWER
	setevent EVENT_WHIRL_ISLAND_SAGE_2
	setevent EVENT_GOLDENROD_TOWER_SHERLES
	setevent EVENT_BELLCHIME_PATH_ENOKI_PANIC
	pause 10
	special FadeOutMusic
	special RestartMapMusic
	end

MahogayMart1FGrannyScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_2
	closetext
	end

MartSherlesScript:
	faceplayer
	opentext
	writetext MartSherlesText
	waitbutton
	closetext
	end

MartRival:
	jumptextfaceplayer EmptyHuhText

BrokenRadio:
	jumptext BrokenRadioText

MovementData_0x6c3f6:
	big_step UP
	big_step UP
	step_end

SherlesMovesRightMovement:
	big_step RIGHT
	step_end

PlayerMovesOutOfWayMovement:
	big_step UP
	big_step LEFT
	step_end

SherlesWalksToKogaMovement:
	big_step UP
	big_step UP
	big_step RIGHT
	step_end

KogaLeavesMartMovement:
	step UP
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step_end

SherlesMovesIntoPlaceAgainMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end

RivalLeavesMartMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

UnknownText_0x6c414:
	text "Hello, kiddo!"

	para "How would you like"
	line "some Ragecandybar?"

	para "It's the thing to"
	line "eat in Mahogany!"
	done

MahogayMart1FPharmacistText_LanceEntered:
	text "Arrgh… You found"
	line "the secret stair-"
	cont "way…"
	done

MahogayMart1FBuenaText:
	text "Hm? Their whole"
	line "stock seems"
	cont "different."
	done

TheresNobodyHereText:
	text "Hm…"

	para "That weird shop"
	line "keep is gone…"

	para "Maybe he was one"
	line "of them?"
	done

ThankGoodnessIFoundYouText:
	text "I found you two!"

	para "Thank goodness!"

	para "I received a"
	line "report that two"
	cont "teens disappeared"
	cont "from Route 34."

	para "Tell me, what"
	line "happened?"

	para "………………………………………………"
	
	para "So, you were kid-"
	line "napped by ninjas?"

	para "And they're with"
	line "those black-"
	cont "clothed people"
	cont "from before?"

	para "………………Normally,"
	line "I'd say that's"
	cont "crazy, but after"
	cont "recent events,"

	para "it's most likely"
	line "true."

	para "<PLAYER>, I'd like"
	line "to apologize for"
	cont "my earlier"
	cont "suspicions."

	para "You're as much as"
	line "a victim as others"
	cont "in this whole"
	cont "situation."
	done

MartSherlesText:
	text "Hm…"

	para "Ninjas, huh?"
	done

TheresOneNowText:
	text "Hold on!"

	para "There's one of"
	line "those ninjas"
	cont "right now!"
	done

HoldItRightThereNinjaText:
	text "Hold it right"
	line "there, ninja!"

	para "You're under"
	line "arrest for"
	cont "kidnapping!"

	para "Among other"
	line "things!"
	done

WaitWhatWasThatText:
	text "……………Wait,"
	line "what was that?"

	para "He's the one"
	line "that saved you?"

	para "……………Ah, I see…"
	done

MyApologiesText:
	text "My apologies, sir."

	para "I almost made a"
	line "terrible mistake."
	done

DontWorryAboutItText:
	text "Koga: Don't worry"
	line "about it."

	para "I am just glad"
	line "that I was able to"
	cont "help them, even"
	cont "if it led to me"
	cont "abandoning my"
	cont "clan…"

	para "I must go now."

	para "They will try to"
	line "find me, now that"
	cont "I am branded as a"
	cont "traitor."

	para "Perhaps our sister"
	line "clan in Fuchsia"
	cont "will accept me."

	para "I hope to meet"
	line "again someday."

	para "Farewell."
	done

IllKeepInvestigatingText:
	text "You two should get"
	line "out of here."

	para "Try to leave this"
	line "mess to us."

	para "I'll start an"
	line "investigation"
	cont "here, so you can"
	cont "come back if you"
	cont "need to talk to"
	cont "someone."
	done

MaybeWeShouldLeaveText:
	text "………Maybe we should"
	line "leave now."

	para "I'm going to Bell"
	line "Tower, like Mr."
	cont "#mon said."

	para "See you."
	done

EmptyHuhText:
	text "Empty, huh?"
	done

BrokenRadioText:
	text "Oh, a radio!"

	para "……Aw……"
	line "It's broken…"
	done

MahoganyMart1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9,  7, MAHOGANY_TOWN, 1
	warp_event 10,  7, MAHOGANY_TOWN, 1
	warp_event 13,  3, TEAM_ROCKET_BASE_B1F, 1

	db 1 ; coord events
	coord_event 11,  4, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS, SherlesTriesToArrestKoga

	db 1 ; bg events
	bg_event  6,  1, BGEVENT_READ, BrokenRadio

	db 6 ; object events
	object_event 10,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahogayMart1FPharmacistScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  8,  6, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahogayMart1FBuenaScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  0,  0, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MartRival, EVENT_MART_RIVAL
	object_event  9,  6, SPRITE_SHERLES, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MartSherlesScript, EVENT_MART_SHERLES
	object_event  7,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahogayMart1FGrannyScript, EVENT_MAHOGANY_MART_OWNERS
	object_event  0,  0, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MART_KOGA
