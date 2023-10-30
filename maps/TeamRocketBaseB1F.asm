	object_const_def ; object_event constants
	const TEAMROCKETBASEB1F_NINJA1
	const TEAMROCKETBASEB1F_NINJA2
	const TEAMROCKETBASEB1F_NINJA3
	const TEAMROCKETBASEB1F_POKE_BALL1
	const TEAMROCKETBASEB1F_NINJA4
	const TEAMROCKETBASEB1F_POKE_BALL3
	const TEAMROCKETBASEB1F_RIVAL
	const TEAMROCKETBASEB1F_MIYAMOTO
	const TEAMROCKETBASEB1F_POKE_BALL2

TeamRocketBaseB1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

NoSecurityCamera:
	end

ExplodingTrap1:
	checkevent EVENT_EXPLODING_TRAP_1
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_1
	end

ExplodingTrap2:
	checkevent EVENT_EXPLODING_TRAP_2
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_2
	end

ExplodingTrap3:
	checkevent EVENT_EXPLODING_TRAP_3
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_3
	end

ExplodingTrap4:
	checkevent EVENT_EXPLODING_TRAP_4
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_4
	end

ExplodingTrap5:
	checkevent EVENT_EXPLODING_TRAP_5
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_5
	end

ExplodingTrap6:
	checkevent EVENT_EXPLODING_TRAP_6
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_6
	end

ExplodingTrap7:
	checkevent EVENT_EXPLODING_TRAP_7
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_7
	end

ExplodingTrap8:
	checkevent EVENT_EXPLODING_TRAP_8
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_8
	end

ExplodingTrap9:
	checkevent EVENT_EXPLODING_TRAP_9
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_9
	end

ExplodingTrap10:
	checkevent EVENT_EXPLODING_TRAP_10
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_10
	end

ExplodingTrap11:
	checkevent EVENT_EXPLODING_TRAP_11
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_11
	end

ExplodingTrap12:
	checkevent EVENT_EXPLODING_TRAP_12
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_12
	end

ExplodingTrap13:
	checkevent EVENT_EXPLODING_TRAP_13
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_13
	end

ExplodingTrap14:
	checkevent EVENT_EXPLODING_TRAP_14
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_14
	end

ExplodingTrap15:
	checkevent EVENT_EXPLODING_TRAP_15
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_15
	end

ExplodingTrap16:
	checkevent EVENT_EXPLODING_TRAP_16
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_16
	end

ExplodingTrap17:
	checkevent EVENT_EXPLODING_TRAP_17
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_17
	end

ExplodingTrap18:
	checkevent EVENT_EXPLODING_TRAP_18
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_18
	end

ExplodingTrap19:
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	end

ExplodingTrap20:
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_20
	end

ExplodingTrap21:
	checkevent EVENT_EXPLODING_TRAP_21
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_21
	end

ExplodingTrap22:
	checkevent EVENT_EXPLODING_TRAP_22
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_22
	end

VoltorbExplodingTrap:
	special FadeOutPalettes
	cry VOLTORB
	special FadeInPalettes
	setlasttalked -1
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon ELECTRODE, 30
	startbattle
	end

GeodudeExplodingTrap:
	special FadeOutPalettes
	cry GEODUDE
	special FadeInPalettes
	setlasttalked -1
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon GRAVELER, 29
	startbattle
	end

KoffingExplodingTrap:
	special FadeOutPalettes
	cry KOFFING
	special FadeInPalettes
	setlasttalked -1
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon KOFFING, 29
	startbattle
	end

NoExplodingTrap:
	end

RivalConfronts1:
	checkevent EVENT_HIDEOUT_B1F_CONFRONTATION
	iftrue .ConfrontationOver1
	applymovement PLAYER, SecurityCameraMovement1
	turnobject PLAYER, RIGHT
	sjump RivalConfronts3

.ConfrontationOver1:
	end

RivalConfronts2:
	checkevent EVENT_HIDEOUT_B1F_CONFRONTATION
	iftrue .ConfrontationOver2
	applymovement PLAYER, SecurityCameraMovement2
	turnobject PLAYER, RIGHT
	sjump RivalConfronts3

.ConfrontationOver2:
	end
	
RivalConfronts3:
	special FadeOutMusic
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .RivalConfrontsFemale
	checkevent EVENT_HIDEOUT_B1F_CONFRONTATION
	iftrue .ConfrontationOver3
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue .SkipToBattle
	pause 15
	opentext
	writetext ThatAllYouGotText
	waitbutton
	closetext
	opentext
	writetext DahliaIsSilentText
	waitbutton
	closetext
	opentext
	writetext DahliaSilentAgainText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall NinjaHideoutClear
	disappear TEAMROCKETBASEB1F_NINJA1
	disappear TEAMROCKETBASEB1F_NINJA2
	disappear TEAMROCKETBASEB1F_NINJA3
	disappear TEAMROCKETBASEB1F_NINJA4
	disappear TEAMROCKETBASEB1F_MIYAMOTO
	pause 15
	special FadeInQuickly
.SkipToBattle:
	pause 15
	opentext
	writetext DahliaIsSilentText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_RIVAL, SecurityCameraMovement3
	pause 15
	opentext
	writetext ICouldntDoItText
	waitbutton
	closetext
	special HealParty
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .HideoutDahliaBattleDratini
	winlosstext, HideoutRivalDefeatedText, HideoutRivalLostText
	setlasttalked TEAMROCKETBASEB1F_RIVAL
	loadtrainer DEPRESSED_DAHLIA, DAHLIA_LARVITAR_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .HideoutVictorious1

.HideoutDahliaBattleDratini:
	winlosstext, HideoutRivalDefeatedText, HideoutRivalLostText
	setlasttalked TEAMROCKETBASEB1F_RIVAL
	loadtrainer DEPRESSED_DAHLIA, DAHLIA_DRATINI_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .HideoutVictorious1

.RivalConfrontsFemale:
	checkevent EVENT_HIDEOUT_B1F_CONFRONTATION
	iftrue .ConfrontationOver3
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue .SkipToBattleFemale
	special FadeOutMusic
	pause 15
	opentext
	writetext ThatAllYouGotText
	waitbutton
	closetext
	opentext
	writetext DracoIsSilentText
	waitbutton
	closetext
	opentext
	writetext DracoSilentAgainText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall NinjaHideoutClear
	disappear TEAMROCKETBASEB1F_NINJA1
	disappear TEAMROCKETBASEB1F_NINJA2
	disappear TEAMROCKETBASEB1F_NINJA3
	disappear TEAMROCKETBASEB1F_NINJA4
	disappear TEAMROCKETBASEB1F_MIYAMOTO
	pause 15
	special FadeInQuickly
.SkipToBattleFemale:
	pause 15
	opentext
	writetext DracoIsSilentText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_RIVAL, SecurityCameraMovement3
	pause 15
	opentext
	writetext ICouldntDoItText
	waitbutton
	closetext
	special HealParty
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .HideoutDracoBattleDratini
	winlosstext, HideoutRivalDefeatedText, HideoutRivalLostText
	setlasttalked TEAMROCKETBASEB1F_RIVAL
	loadtrainer DEPRESSED_DRACO, DRACO_LARVITAR_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .HideoutVictorious1

.HideoutDracoBattleDratini:
	winlosstext, HideoutRivalDefeatedText, HideoutRivalLostText
	setlasttalked TEAMROCKETBASEB1F_RIVAL
	loadtrainer DEPRESSED_DRACO, DRACO_DRATINI_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .HideoutVictorious1

.HideoutVictorious1:
	playmusic MUSIC_UNWAVERING_HEART
	pause 15
	opentext
	writetext ThankYouOnceAgainText
	waitbutton
	closetext
	pause 15
	applymovement TEAMROCKETBASEB1F_RIVAL, SecurityCameraMovement4
	playsound SFX_EXIT_BUILDING
	disappear TEAMROCKETBASEB1F_RIVAL
	setevent EVENT_HIDEOUT_B1F_RIVAL
	setevent EVENT_HIDEOUT_B1F_CONFRONTATION
	setevent EVENT_DAY_CARE_MR_POKEMON
	waitsfx
	playmapmusic
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	setmapscene ROUTE_34, SCENE_DEFAULT
	setevent EVENT_ROUTE_34_NINJA
	clearevent EVENT_ROUTE_34_OFFICER
	end

.ConfrontationOver3:
	end

WarpPanelBroke:
	opentext
	writetext WarpPanelBrokeText
	waitbutton
	closetext
	end

NinjaHideoutClear:
	jumpstd ninjahideoutclear

TrainerMNinjaM5:
	trainer MNINJA_M, MNINJA_M5, EVENT_HIDEOUT_NINJA9, MNinjaM5SeenText, MNinjaM5SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB1F_NINJA1
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM5SeenText
	waitbutton
	closetext
	end

TrainerMNinjaF5:
	trainer MNINJA_F, MNINJA_F5, EVENT_HIDEOUT_NINJA10, MNinjaM5SeenText, MNinjaM5SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB1F_NINJA2
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM5SeenText
	waitbutton
	closetext
	end

TrainerMNinjaM6:
	trainer MNINJA_M, MNINJA_M6, EVENT_HIDEOUT_NINJA11, MNinjaM5SeenText, MNinjaM5SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB1F_NINJA3
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM5SeenText
	waitbutton
	closetext
	end

TrainerMNinjaF6:
	trainer MNINJA_F, MNINJA_F6, EVENT_HIDEOUT_NINJA12, MNinjaM5SeenText, MNinjaM5SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB1F_NINJA4
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM5SeenText
	waitbutton
	closetext
	end

TeamRocketBaseB1FSecurityCamera:
	jumptext TeamRocketBaseB1FSecurityCameraText

TeamRocketBaseB1FBookshelf:
	jumptext NinjaBookText2

TeamRocketBaseB1FSecretSwitch:
	jumptext TeamRocketBaseB1FSecretSwitchText

TeamRocketBaseB1FHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseB1FNugget:
	itemball NUGGET

TeamRocketBaseB1FSludgeBomb:
	itemball TM_SLUDGE_BOMB

TeamRocketBaseB1FRazorFang:
	itemball RAZOR_FANG

TeamRocketBaseB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_TEAM_ROCKET_BASE_B1F_HIDDEN_REVIVE

SecurityCameraMovement1:
	step DOWN
	step_end

SecurityCameraMovement2:
	step UP
	step_end

SecurityCameraMovement3:
	step LEFT
	step_end

SecurityCameraMovement4:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

SecurityCameraMovement5:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

SecurityCameraMovement6:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	step_end

SecurityCameraMovement7:
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step LEFT
	step_end

SecurityCameraMovement8:
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

SecurityCameraMovement9:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

WarpPanelBrokeText:
	text "Whatever this"
	line "panel is, it looks"
	cont "broken."
	done

MNinjaM5SeenText:
	text "………………………"
	done

ThatAllYouGotText:
	text "Miyamoto: That all"
	line "you got?"

	para "I expected more"
	line "out of someone"
	cont "like you."
	done

DracoIsSilentText:
	text "<RIVAL>:………………………"
	done

DahliaIsSilentText:
	text "<RIVAL>:………………………"
	done

ScientistJedSeenText:
	text "This was once a"
	line "ninja hideout."

	para "There are traps to"
	line "confound intruders"
	cont "like you."
	done

HideoutRivalDefeatedText:
	text "……………………………"

	para "…I see…"
	done

HideoutRivalLostText:
	text "…I'm going to lose"
	line "again, aren't I?"
	done

DahliaSilentAgainText:
	text "Miyamoto: Silent"
	line "again, huh?"

	para "Pathetic."

	para "Oh, look who it"
	line "is."

	para "Come to help your"
	line "friend?"

	para "She needs all the"
	line "help she can get,"
	cont "judging by her"
	cont "battle skills."

	para "I'd like to stay"
	line "and have some fun,"
	cont "but I have some"
	cont "business to attend"
	cont "to."

	para "Later."
	done

DracoSilentAgainText:
	text "Miyamoto: Silent"
	line "again, huh?"

	para "Pathetic."

	para "Oh, look who it"
	line "is."

	para "Come to help your"
	line "friend?"

	para "He needs all the"
	line "help he can get,"
	cont "judging by his"
	cont "battle skills."

	para "I'd like to stay"
	line "and have some fun,"
	cont "but I have some"
	cont "business to attend"
	cont "to."

	para "Later."
	done

ICouldntDoItText:
	text "…Sniff…"

	para "D-dang it…"

	para "<PLAYER>, I-"

	para "I couldn't do"
	line "it…"
	
	para "She's too strong"
	line "for me…"

	para "…<PLAYER>, please,"
	line "battle me…"
	
	para "I need to know if"
	line "I'm strong enough…"
	done

ThankYouOnceAgainText:
	text "…Thank you <PLAYER>…"

	para "I know I need to"
	line "get stronger…"

	para "For my #mon's"
	line "sake…"

	para "…Let's go…"

	para "…Let's leave this"
	line "place behind…"
	done

TeamRocketBaseB1FSecurityCameraText:
	text "It's a Persian"
	line "statue…"

	para "There's nothing"
	line "unusual about it…"
	done

TeamRocketBaseB1FSecretSwitchText:
	text "There seems to be"
	line "data on a type of"
	cont "#ball."

	para "It's looks too"
	line "complex for you"
	cont "to understand."
	done

TeamRocketBaseB1FSwitchOffText:
	text "The switch is"
	line "turned off."
	done

NinjaBookText2:
	text "There are a bunch"
	line "of books about"
	cont "ninjas on the"
	cont "shelves here."
	done

TeamRocketBaseB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 27,  2, MAHOGANY_MART_1F, 3
	warp_event  3, 14, TEAM_ROCKET_BASE_B2F, 1

	db 26 ; coord events
	; There are spots on the floor that trigger a Pokémon battle.
	; Each Pokémon (Voltorb, Koffing, Geodude) knows Selfdestruct.
	coord_event  2,  7, SCENE_DEFAULT, ExplodingTrap1
	coord_event  3,  7, SCENE_DEFAULT, ExplodingTrap2
	coord_event  4,  7, SCENE_DEFAULT, ExplodingTrap3
	coord_event  1,  8, SCENE_DEFAULT, ExplodingTrap4
	coord_event  3,  8, SCENE_DEFAULT, ExplodingTrap5
	coord_event  5,  8, SCENE_DEFAULT, ExplodingTrap6
	coord_event  3,  9, SCENE_DEFAULT, ExplodingTrap7
	coord_event  4,  9, SCENE_DEFAULT, ExplodingTrap8
	coord_event  1, 10, SCENE_DEFAULT, ExplodingTrap9
	coord_event  2, 10, SCENE_DEFAULT, ExplodingTrap10
	coord_event  3, 10, SCENE_DEFAULT, ExplodingTrap11
	coord_event  5, 10, SCENE_DEFAULT, ExplodingTrap12
	coord_event  2, 11, SCENE_DEFAULT, ExplodingTrap13
	coord_event  4, 11, SCENE_DEFAULT, ExplodingTrap14
	coord_event  1, 12, SCENE_DEFAULT, ExplodingTrap15
	coord_event  2, 12, SCENE_DEFAULT, ExplodingTrap16
	coord_event  4, 12, SCENE_DEFAULT, ExplodingTrap17
	coord_event  5, 12, SCENE_DEFAULT, ExplodingTrap18
	coord_event  1, 13, SCENE_DEFAULT, ExplodingTrap19
	coord_event  3, 13, SCENE_DEFAULT, ExplodingTrap20
	coord_event  4, 13, SCENE_DEFAULT, ExplodingTrap21
	coord_event  5, 13, SCENE_DEFAULT, ExplodingTrap22
	coord_event 21,  1, SCENE_DEFAULT, RivalConfronts1
	coord_event 21,  2, SCENE_DEFAULT, RivalConfronts3
	coord_event 21,  3, SCENE_DEFAULT, RivalConfronts2
	coord_event  5, 15, SCENE_DEFAULT, WarpPanelBroke

	db 9 ; bg events
	bg_event 19, 11, BGEVENT_READ, TeamRocketBaseB1FSecretSwitch
	bg_event 24,  1, BGEVENT_UP, TeamRocketBaseB1FSecurityCamera
	bg_event  6,  1, BGEVENT_UP, TeamRocketBaseB1FSecurityCamera
	bg_event  8, 15, BGEVENT_UP, TeamRocketBaseB1FSecurityCamera
	bg_event 22, 15, BGEVENT_UP, TeamRocketBaseB1FSecurityCamera
	bg_event 24,  5, BGEVENT_UP, TeamRocketBaseB1FSecurityCamera
	bg_event 20, 11, BGEVENT_READ, TeamRocketBaseB1FBookshelf
	bg_event 21, 11, BGEVENT_READ, TeamRocketBaseB1FBookshelf
	bg_event  3, 11, BGEVENT_ITEM, TeamRocketBaseB1FHiddenRevive

	db 9 ; object events
	object_event 16, 15, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerMNinjaM5, EVENT_HIDEOUT_NINJA9
	object_event  2,  4, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerMNinjaF5, EVENT_HIDEOUT_NINJA10
	object_event 18, 12, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerMNinjaM6, EVENT_HIDEOUT_NINJA11
	object_event 27,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FHyperPotion, EVENT_TEAM_ROCKET_BASE_B1F_HYPER_POTION
	object_event 19,  6, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TrainerMNinjaF6, EVENT_HIDEOUT_NINJA12
	object_event 21, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FSludgeBomb, EVENT_GOT_TM_SLUDGE_BOMB
	object_event 23,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_B1F_RIVAL
	object_event 25,  2, SPRITE_MIYAMOTO, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_BF1_MIYAMOTO
	object_event  1,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FRazorFang, EVENT_TEAM_ROCKET_BASE_B1F_RAZOR_FANG
