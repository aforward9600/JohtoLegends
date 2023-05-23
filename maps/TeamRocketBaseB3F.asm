	object_const_def ; object_event constants
	const TEAMROCKETBASEB3F_NINJA3
	const TEAMROCKETBASEB3F_NINJA4
	const TEAMROCKETBASEB3F_KOGA
	const TEAMROCKETBASEB3F_ARIANA
	const TEAMROCKETBASEB3F_RIVAL
	const TEAMROCKETBASEB3F_NINJA2
	const TEAMROCKETBASEB3F_NINJA1
	const TEAMROCKETBASEB3F_ROCKET3
	const TEAMROCKETBASEB3F_SILVER
	const TEAMROCKETBASEB3F_POKE_BALL1
	const TEAMROCKETBASEB3F_POKE_BALL2
	const TEAMROCKETBASEB3F_POKE_BALL3
	const TEAMROCKETBASEB3F_POKE_BALL4
	const TEAMROCKETBASEB3F_POKE_BALL5

TeamRocketBaseB3F_MapScripts:
	db 4 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB3F_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

TeamRocketBaseB3FRocketScript:
	opentext
	writetext TeamRocketBaseB3FRocketText
	waitbutton
	closetext
	end

RocketBaseBossLeft:
	applymovement PLAYER, MovementData_0x6e133
	sjump RocketBaseBoss

RocketBaseBossRight:
	applymovement PLAYER, MovementData_0x6e13a
RocketBaseBoss:
	pause 15
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_ARIANA, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TEAMROCKETBASEB3F_ARIANA, DOWN
	opentext
	writetext HideoutB3FArianaBeforeText
	waitbutton
	closetext
	moveobject TEAMROCKETBASEB3F_RIVAL, 6, 10
	appear TEAMROCKETBASEB3F_RIVAL
	applymovement TEAMROCKETBASEB3F_RIVAL, MovementData_0x6e142
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ArianaInsultsDraco
	writetext HideoutB3FArianaDahliaText
	waitbutton
	closetext
	sjump .HideoutArianaBattle

.ArianaInsultsDraco:
	writetext HideoutB3FArianaDracoText
	waitbutton
	closetext
.HideoutArianaBattle:
	winlosstext Ariana3BeatenText, Ariana3LastMonText
	setlasttalked TEAMROCKETBASEB3F_ARIANA
	loadtrainer ARIANA, ARIANA_3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_HIDEOUT_ARIANA
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ArianaHatesDraco
	writetext HideoutArianaDahliaAfterText
	waitbutton
	closetext
	sjump .KogaStopsAriana

.ArianaHatesDraco:
	writetext HideoutArianaDracoAfterText
	waitbutton
	closetext
.KogaStopsAriana:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_ARIANA, 15
	turnobject TEAMROCKETBASEB3F_ARIANA, LEFT
	opentext
	writetext ArianaWhosThereText
	waitbutton
	closetext
	pause 15
	turnobject PLAYER, LEFT
	turnobject TEAMROCKETBASEB3F_RIVAL, LEFT
	appear TEAMROCKETBASEB3F_KOGA
	applymovement TEAMROCKETBASEB3F_KOGA, MovementData_0x6e144
	playsound SFX_TACKLE
	turnobject PLAYER, UP
	turnobject TEAMROCKETBASEB3F_RIVAL, UP
	opentext
	writetext WhatDoYouThinkYoureDoingText
	waitbutton
	closetext
	opentext
	writetext IAmNoLongerAPawnText
	waitbutton
	closetext
	opentext
	writetext AlrightIllTellYouText
	waitbutton
	closetext
	turnobject, TEAMROCKETBASEB3F_KOGA, DOWN
	opentext
	writetext WeHaveThePasswordText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_KOGA, MovementData_0x6e147
	disappear TEAMROCKETBASEB3F_KOGA
	turnobject PLAYER, LEFT
	turnobject TEAMROCKETBASEB3F_RIVAL, RIGHT
	opentext
	writetext GoodThingHesOnOurSideText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalEnterMovement
	disappear TEAMROCKETBASEB3F_RIVAL
	moveobject TEAMROCKETBASEB3F_RIVAL, 5, 14
	appear TEAMROCKETBASEB3F_RIVAL
	setevent EVENT_HIDEOUT_B3F_KOGA
	clearevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_LEARNED_RATICATE_TAIL
	setscene SCENE_TEAMROCKETBASEB3F_NOTHING
	end

HideoutArianaScript:
	opentext
	writetext RocketBaseArianaText
	waitbutton
	closetext
	end

Ariana3LastMonText:
	text "How many times are"
	line "you going to be so"
	cont "annoying?!"
	done

HideoutB3FRival:
	faceplayer
	opentext
	writetext IllHealYouB3FText
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
	writetext TheresAPCText
	waitbutton
	closetext
	end

TrainerMNinjaF1:
	trainer MNINJA_F, MNINJA_F1, EVENT_HIDEOUT_NINJA2, MNinjaM1SeenText, MNinjaM1SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB3F_NINJA2
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM1SeenText
	waitbutton
	closetext
	end

TrainerMNinjaF2:
	trainer MNINJA_F, MNINJA_F2, EVENT_HIDEOUT_NINJA3, MNinjaM1SeenText, MNinjaM1SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB3F_NINJA3
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM1SeenText
	waitbutton
	closetext
	end

TrainerMNinjaM1:
	trainer MNINJA_M, MNINJA_M1, EVENT_HIDEOUT_NINJA, MNinjaM1SeenText, MNinjaM1SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB3F_NINJA1
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM1SeenText
	waitbutton
	closetext
	end

TrainerMNinjaM2:
	trainer MNINJA_M, MNINJA_M2, EVENT_HIDEOUT_NINJA4, MNinjaM1SeenText, MNinjaM1SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB3F_NINJA4
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM1SeenText
	waitbutton
	closetext
	end

TeamRocketBaseB3FOathScript:
	jumptext NinjaBookText

TeamRocketBaseB3FProtein:
	itemball PROTEIN

TeamRocketBaseB3FXSpecial:
	itemball X_SPECIAL

TeamRocketBaseB3FFullHeal:
	itemball FULL_HEAL

TeamRocketBaseB3FIceHeal:
	itemball PARLYZ_HEAL

TeamRocketBaseB3FUltraBall:
	itemball GREAT_BALL

MovementData_0x6e133:
	step UP
	step RIGHT
	step UP
	step_end

MovementData_0x6e13a:
	step UP
	step UP
	step_end

MovementData_0x6e142:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x6e144:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6e147:
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RocketBaseRivalEnterMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

TeamRocketBaseB3FRocketText:
	text "zzzz… zzzz…"

	para "(The guard here"
	line "isn't so useful.)"
	done

HideoutB3FArianaBeforeText:
	text "What? You got out?"

	para "Of course you"
	line "would…"

	para "Obnoxious brat!"
	done

HideoutB3FArianaDahliaText:
	text "<RIVAL>: You!"

	para "You're the one"
	line "that left us to"
	cont "rot in that cell!"

	para "Ariana: Your girl-"
	line "friend is here to"
	cont "watch you lose!"

	para "How precious!"

	para "After I'm done"
	line "with you, she'll"
	cont "be a piece of"
	cont "cake!"

	para "<RIVAL>: What was"
	line "that?!"

	para "Go on, <PLAYER>!"
	line "Take her down!"
	done

HideoutB3FArianaDracoText:
	text "<RIVAL>: You!"

	para "You're the one"
	line "that left us to"
	cont "rot in that cell!"

	para "Ariana: Your boy-"
	line "friend is here to"
	cont "watch you lose!"

	para "How precious!"

	para "After I'm done"
	line "with you, he'll"
	cont "be a piece of"
	cont "cake!"

	para "<RIVAL>: Think you"
	line "are funny, do ya?"

	para "Go on, <PLAYER>!"
	line "Take her down!"
	done

Ariana3BeatenText:
	text "ARGH!"

	para "Not again!"
	done

RocketBaseArianaText:
	text "ARGH!"

	para "You traitor!"

	para "I'll get you for"
	line "this!"
	done

MNinjaM1SeenText:
	text "…………………………"
	done

IllHealYouB3FText:
	text "There's a strange"
	line "presence here…"

	para "I'll keep your"
	line "#mon in good"
	cont "health for you."
	done

TheresAPCText:
	text "There's a phone in"
	line "the corner there."

	para "I don't know what"
	line "it's for, but you"
	cont "can use it to"
	cont "contact the ADS."

	para "Good luck!"
	done

HideoutArianaDahliaAfterText:
	text "Ariana: Pah!"

	para "Whatever!"

	para "Not like you're"
	line "going to leave"
	cont "here!"

	para "Especially with-"
	line "out the password,"
	cont "that only I know!"

	para "<RIVAL>: You better"
	line "tell us, you"
	cont "witch!"

	para "Ariana: Witch?!"

	para "How dare you, you"
	line "little b…"
	done

HideoutArianaDracoAfterText:
	text "Ariana: Pah!"

	para "Whatever!"

	para "Not like you're"
	line "going to leave"
	cont "here!"

	para "Especially with-"
	line "out the password,"
	cont "that only I know!"

	para "<RIVAL>: You better"
	line "tell us, you"
	cont "witch!"

	para "Ariana: Witch?!"

	para "How dare you, you"
	line "little d…"
	done

ArianaWhosThereText:
	text "Ariana:…!"

	para "Who's there?!"
	done

WhatDoYouThinkYoureDoingText:
	text "Ariana: What do"
	line "you think you're"
	cont "doing?!"

	para "Untie me this"
	line "instant!"

	para "You work for me,"
	line "understand?!"
	done

IAmNoLongerAPawnText:
	text "Koga: I refuse to"
	line "be a pawn in such"
	cont "nefarious schemes."

	para "You will tell us"
	line "the password you"
	cont "know, or else my"
	cont "Weezing shall use"
	cont "Toxic on you."

	para "Can you imagine"
	line "how painful that"
	cont "must be?"

	para "Fufufufufu………"
	done

AlrightIllTellYouText:
	text "Ariana: A-alright,"
	line "I'll tell you!"

	para "The password is:"

	para "Prepare for"
	line "trouble!"

	para "Now let me go!"

	para "H-hey! What are"
	line "you doing?!"

	para "Let me go!"
	done

WeHaveThePasswordText:
	text "Koga: We now have"
	line "the password."

	para "I have overheard"
	line "that there is a"
	cont "second password"
	cont "needed to open"
	cont "the door."

	para "Keep searching"
	line "for it."
	done

GoodThingHesOnOurSideText:
	text "…Good thing he's"
	line "on our side…"

	para "I'm going on"
	line "ahead. We have"
	cont "to find that"
	cont "next password!"
	done

NinjaBookText:
	text "There are a bunch"
	line "of books about"
	cont "ninjas on the"
	cont "shelves here."
	done

TeamRocketBaseB3F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5
	warp_event  4, 17, TEAM_ROCKET_BASE_JAIL, 1
	warp_event  5, 17, TEAM_ROCKET_BASE_JAIL, 1

	db 2 ; coord events
	coord_event 10,  8, SCENE_DEFAULT, RocketBaseBossLeft
	coord_event 11,  8, SCENE_DEFAULT, RocketBaseBossRight

	db 8 ; bg events
	bg_event 10,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 11,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 12,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 13,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  4, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  5, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  6, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  7, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript

	db 14 ; object events
	object_event 21,  8, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerMNinjaF2, EVENT_HIDEOUT_NINJA3
	object_event 22,  2, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_TRAINER, 2, TrainerMNinjaM2, EVENT_HIDEOUT_NINJA4
	object_event  7,  5, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_B3F_KOGA
	object_event 11,  5, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, HideoutArianaScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  5, 14, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HideoutB3FRival, EVENT_HIDEOUT_B3F_RIVAL
	object_event 23, 12, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerMNinjaF1, EVENT_HIDEOUT_NINJA2
	object_event 14, 12, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_TRAINER, 1, TrainerMNinjaM1, EVENT_HIDEOUT_NINJA
	object_event 24, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3FRocketScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  5, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	object_event  1, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FProtein, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	object_event  3, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FXSpecial, EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	object_event 28,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FFullHeal, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	object_event 17,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FIceHeal, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	object_event 23,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FUltraBall, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL
