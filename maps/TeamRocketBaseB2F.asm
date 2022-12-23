	object_const_def ; object_event constants
	const TEAMROCKETBASEB2F_NINJA2
	const TEAMROCKETBASEB2F_ARCHER
	const TEAMROCKETBASEB2F_RIVAL
	const TEAMROCKETBASEB2F_DRAGON
	const TEAMROCKETBASEB2F_POKE_BALL2
	const TEAMROCKETBASEB2F_GRANNY
	const TEAMROCKETBASEB2F_PHARMACIST
	const TEAMROCKETBASEB2F_NINJA3
	const TEAMROCKETBASEB2F_NINJA
	const TEAMROCKETBASEB2F_NINJA4
	const TEAMROCKETBASEB2F_POKE_BALL
	const TEAMROCKETBASEB2F_POKE_BALL_2

TeamRocketBaseB2F_MapScripts:
	db 4 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB2F_ELECTRODES
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB2F_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .TransmitterDoorCallback

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.TransmitterDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftrue .OpenDoor
	return

.OpenDoor:
	changeblock 14, 12, $07 ; floor
	return

RocketBaseCantLeaveScript:
	checkevent EVENT_HIDEOUT_WINGS
	iftrue .RivalArrivesForWings
	opentext
	writetext CantLeaveWithoutWingsText
	waitbutton
	closetext
	pause 15
	applymovement PLAYER, MovementData_0x6d271
	end

.RivalArrivesForWings:
	moveobject, TEAMROCKETBASEB2F_RIVAL, 17, 14
	appear TEAMROCKETBASEB2F_RIVAL
	applymovement TEAMROCKETBASEB2F_RIVAL, MovementData_0x6d212
	turnobject TEAMROCKETBASEB2F_RIVAL, UP
	turnobject PLAYER, DOWN
.RivalGetsWingBack:
	opentext
	writetext YouFoundTheWingsText
	waitbutton
	closetext
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GiveSilverWingBack
	opentext
	writetext GaveBackRainbowWingText
	waitbutton
	closetext
	takeitem RAINBOW_WING
	sjump .HaveYouSeenHer

.GiveSilverWingBack:
	opentext
	writetext GaveSilverWingText
	waitbutton
	closetext
	takeitem SILVER_WING
.HaveYouSeenHer:
	opentext
	writetext HaveYouSeenHerText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_RIVAL, MovementData_0x6d212
	disappear TEAMROCKETBASEB2F_RIVAL
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	setscene SCENE_TEAMROCKETBASEB2F_NOTHING
	setevent EVENT_HIDEOUT_B3F_RIVAL
	end

RocketBaseCantLeaveScriptDown:
	checkevent EVENT_HIDEOUT_WINGS
	iftrue .RivalArrivesForWings
	opentext
	writetext CantLeaveWithoutWingsText
	waitbutton
	closetext
	pause 15
	applymovement PLAYER, MovementData_0x6d271
	end

.RivalArrivesForWings:
	moveobject, TEAMROCKETBASEB2F_RIVAL, 17, 13
	appear TEAMROCKETBASEB2F_RIVAL
	applymovement TEAMROCKETBASEB2F_RIVAL, MovementData_0x6d212
	turnobject TEAMROCKETBASEB2F_RIVAL, DOWN
	turnobject PLAYER, UP
.RivalGetsWingBack:
	opentext
	writetext YouFoundTheWingsText
	waitbutton
	closetext
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GiveSilverWingBack
	opentext
	writetext GaveBackRainbowWingText
	waitbutton
	closetext
	takeitem RAINBOW_WING
	sjump .HaveYouSeenHer

.GiveSilverWingBack:
	opentext
	writetext GaveSilverWingText
	waitbutton
	closetext
	takeitem SILVER_WING
.HaveYouSeenHer:
	opentext
	writetext HaveYouSeenHerText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_RIVAL, MovementData_0x6d212
	disappear TEAMROCKETBASEB2F_RIVAL
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	setscene SCENE_TEAMROCKETBASEB2F_NOTHING
	setevent EVENT_HIDEOUT_B3F_RIVAL
	end

HideoutGrannyScript:
	jumptextfaceplayer HideoutGrannyText

HideoutB2FArcherScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_HIDEOUT_ARCHER
	iftrue .ArcherBeatenScript
	playmusic MUSIC_ROCKET_ENCOUNTER
	writetext ArcherYouAgainText
	waitbutton
	closetext
	winlosstext UnknownText_0x6d45c, Archer3LastMonText
	setlasttalked TEAMROCKETBASEB2F_ARCHER
	loadtrainer ARCHER, ARCHER_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext HeresPassword2Text
	waitbutton
	closetext
	setevent EVENT_LEARNED_SLOWPOKETAIL
	setevent EVENT_BEAT_HIDEOUT_ARCHER
	end

.ArcherBeatenScript:
	writetext ArcherGoAwayText
	waitbutton
	closetext
	end

TrainerMNinjaF3:
	trainer MNINJA_F, MNINJA_F3, EVENT_HIDEOUT_NINJA6, MNinjaM2SeenText, MNinjaM2SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_NINJA3
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM2SeenText
	waitbutton
	closetext
	end

TrainerMNinjaM3:
	trainer MNINJA_M, MNINJA_M3, EVENT_HIDEOUT_NINJA5, MNinjaM2SeenText, MNinjaM2SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_NINJA
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM2SeenText
	waitbutton
	closetext
	end

TrainerMNinjaM4:
	trainer MNINJA_M, MNINJA_M4, EVENT_HIDEOUT_NINJA8, MNinjaM2SeenText, MNinjaM2SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_NINJA4
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM2SeenText
	waitbutton
	closetext
	end

TrainerMNinjaF4:
	trainer MNINJA_F, MNINJA_F4, EVENT_HIDEOUT_NINJA7, MNinjaM2SeenText, MNinjaM2SeenText, 0, .Script

.Script:
	pause 15
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_NINJA2
	pause 15
	special FadeInQuickly
	endifjustbattled
	opentext
	writetext MNinjaM2SeenText
	waitbutton
	closetext
	end

GoldenrodWorkerScript:
	jumptextfaceplayer GoldenrodWorkerHelpMeText

HideoutWings:
	opentext
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .RainbowWingRecover
	verbosegiveitem SILVER_WING
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .FemaleRainbowWing
	writetext GotRainbowWingText
	giveitem RAINBOW_WING
	waitbutton
	closetext
	setevent EVENT_HIDEOUT_WINGS
	disappear TEAMROCKETBASEB2F_POKE_BALL2
	end

.FemaleRainbowWing:
	writetext GotRainbowWingFemaleText
	giveitem RAINBOW_WING
	waitbutton
	closetext
	setevent EVENT_HIDEOUT_WINGS
	disappear TEAMROCKETBASEB2F_POKE_BALL2
	end

.RainbowWingRecover:
	verbosegiveitem RAINBOW_WING
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .FemaleSilverWing
	writetext GotSilverWingText
	giveitem SILVER_WING
	waitbutton
	closetext
	setevent EVENT_HIDEOUT_WINGS
	disappear TEAMROCKETBASEB2F_POKE_BALL2
	end

.FemaleSilverWing:
	writetext GotSilverWingFemaleText
	giveitem SILVER_WING
	waitbutton
	closetext
	setevent EVENT_HIDEOUT_WINGS
	disappear TEAMROCKETBASEB2F_POKE_BALL2
	end

TeamRocketBaseB2FReloadMap:
	reloadmapafterbattle
	end

TeamRocketBaseB2FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalse .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalse .NeedsPassword
	sjump .OpenSesame

.NeedsPassword:
	writetext UnknownText_0x6dd39
	waitbutton
	closetext
	end

.OpenSesame:
	writetext UnknownText_0x6dd6b
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 14, 12, $07 ; floor
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end

TeamRocketBaseB2FTMThief:
	itemball TM_THIEF

TeamRocketBaseB2FLaprasCallB:
	itemball LAPRAS_CALLB

TeamRocketBaseB2FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL

MovementData_0x6d212:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6d219:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d21f:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

MovementData_0x6d224:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	turn_head DOWN
	step_end

MovementData_0x6d22f:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

MovementData_0x6d236:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x6d23b:
	fix_facing
	set_sliding
	jump_step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

MovementData_0x6d241:
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_0x6d244:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d248:
	big_step LEFT
	step_end

MovementData_0x6d24a:
	big_step LEFT
	step_end

MovementData_0x6d24c:
	big_step LEFT
	big_step UP
	turn_head LEFT
	step_end

MovementData_0x6d250:
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

MovementData_0x6d254:
	step UP
	step UP
	step UP
	step_end

MovementData_0x6d258:
	step_sleep 8
	step LEFT
	step LEFT
	turn_head UP
	step_sleep 8
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_sleep 8
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

MovementData_0x6d267:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x6d271:
	step RIGHT
	step_end

MovementData_0x6d278:
	step LEFT
	step_end

MovementData_0x6d27a:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6d283:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6d28c:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d299:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d2a4:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

UnknownText_0x6d2ad:
	text "Hold it right"
	line "there!"
	done

Archer3LastMonText:
	text "I'm almost beaten"
	line "again?"
	done

ArcherYouAgainText:
	text "I knew that cell"
	line "couldn't hold you."

	para "Ariana was quite"
	line "naive to think it"
	cont "would work."

	para "Wondering what I'm"
	line "doing here?"

	para "I'm overseeing a"
	line "project, one that"
	cont "you needn't worry"
	cont "about."

	para "These ninjas are"
	line "good at espionage,"
	cont "but aren't very"
	cont "strong trainers."

	para "I believe it's my"
	line "turn to battle"
	cont "you, now."
	done

UnknownText_0x6d45c:
	text "A mere child…"

	para "Have our calcul-"
	line "ations been wrong?"
	done

HeresPassword2Text:
	text "Well, we're about"
	line "done here anyway."

	para "You want your item"
	line "back, correct?"

	para "I suppose I should"
	line "be a good sport,"
	cont "and give you one"
	cont "of the passwords."

	para "It's: And make it"
	line "double."

	para "It's useless with-"
	line "out the other"
	cont "password."
	done

GruntM17SeenText:
	text "The door won't"
	line "open?"

	para "Well, duh."
	line "It has to have a"

	para "password that only"
	line "TEAM ROCKET knows."
	done

GruntM17BeatenText:
	text "What? I lost?"
	done

GruntM17AfterBattleText:
	text "Heh, I'm just a"
	line "GRUNT."

	para "I don't know the"
	line "password. Too bad"
	cont "for you."
	done

GruntM18SeenText:
	text "Oh, a kid? I don't"
	line "really like this,"

	para "but eliminate you"
	line "I must."
	done

GruntM18BeatenText:
	text "I knew I'd lose…"
	done

GruntM18AfterBattleText:
	text "I got wiped out on"
	line "the last mission"
	cont "by a kid too."

	para "When we were ab-"
	line "ducting #MON,"

	para "this kid with long"
	line "red hair and mean-"

	para "looking eyes just"
	line "creamed me…"
	done

GruntM19SeenText:
	text "You rotten little"
	line "pest!"
	done

GruntM19BeatenText:
	text "Grrrr…"
	done

GruntM19AfterBattleText:
	text "Heh, only the boss"
	line "knows the password"
	cont "for that door."

	para "Where's the boss?"
	line "Who knows? Go look"
	cont "for yourself."
	done

UnknownText_0x6dd39:
	text "The door's closed…"

	para "It needs two pass-"
	line "words to open."
	done

UnknownText_0x6dd6b:
	text "The door's closed…"

	para "<PLAYER> entered"
	line "the passwords:"

	para "Prepare for"
	line "trouble!"

	para "And make it"
	line "double!"

	para "The door opened!"
	done

GoldenrodWorkerHelpMeText:
	text "Oh, you've come to"
	line "rescue me!"

	para "I told them about"
	line "that old bell in"
	cont "the tower, but"
	cont "when they came"
	cont "back, it wasn't"
	cont "there!"

	para "I know it was!"

	para "They imprisoned me"
	line "here, and tortured"
	cont "me!"

	para "I swear, I'll"
	line "never snitch"
	cont "again!"
	done

HideoutGrannyText:
	text "Hm? You're here to"
	line "save me?"

	para "Why, thank you."

	para "That's very kind"
	line "of you."

	para "I never knew these"
	line "ninjas were here,"
	cont "and I've owned the"
	cont "store above for"
	cont "many years!"

	para "They're working"
	line "with those people"
	cont "in all black."

	para "They apparently"
	line "were mass-produc-"
	cont "ing something"
	cont "called a Rocket"
	cont "Ball."

	para "I don't know what"
	line "it is, but it"
	cont "sounds dangerous."

	para "They cleared out"
	line "everything here,"
	cont "except that one"
	cont "thing back there."
	done

GotRainbowWingText:
	text "<RIVAL>'s Rainbow"
	line "Wing was in it as"
	cont "well."

	para "Better take it for"
	line "now."
	done

GotRainbowWingFemaleText:
	text "<RIVAL>'s Rainbow"
	line "Wing was in it as"
	cont "well."

	para "Better take it for"
	line "now."
	done

GotSilverWingText:
	text "<RIVAL>'s Silver"
	line "Wing was in it as"
	cont "well."

	para "Better take it for"
	line "now."
	done

GotSilverWingFemaleText:
	text "<RIVAL>'s Silver"
	line "Wing was in it as"
	cont "well."

	para "Better take it for"
	line "now."
	done

CantLeaveWithoutWingsText:
	text "I can't leave"
	line "without getting"
	cont "the wings back."
	done

MNinjaM2SeenText:
	text "…………………………"
	done

ArcherGoAwayText:
	text "You got my pass-"
	line "word. Now go"
	cont "away already."
	done

YouFoundTheWingsText:
	text "Hey, you found"
	line "the wings!"

	para "Great going!"

	para "I'll take mine"
	line "back, if you"
	cont "don't mind!"
	done

GaveSilverWingText:
	text "<PLAYER> returned"
	line "the Silver Wing."
	done

GaveBackRainbowWingText:
	text "<PLAYER> returned"
	line "the Rainbow Wing."
	done

HaveYouSeenHerText:
	text "By the way, have"
	line "you ran into,"
	cont "HER yet?"

	para "I haven't, but"
	line "I'm nervous."

	para "She always shows"
	line "up during these"
	cont "ordeals."

	para "I'll keep an eye"
	line "out for her."

	para "Let's get out"
	line "of this place,"
	cont "before anymore"
	cont "ninjas show up."
	done

TeamRocketBaseB2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3, 14, TEAM_ROCKET_BASE_B1F, 2
	warp_event  3,  2, TEAM_ROCKET_BASE_B3F, 1
	warp_event 27,  2, TEAM_ROCKET_BASE_B3F, 2
	warp_event  3,  6, TEAM_ROCKET_BASE_B3F, 3
	warp_event 27, 14, TEAM_ROCKET_BASE_B3F, 4

	db 2 ; coord events
	coord_event 11, 13, SCENE_DEFAULT, RocketBaseCantLeaveScript
	coord_event 11, 14, SCENE_DEFAULT, RocketBaseCantLeaveScriptDown

	db 3 ; bg events
	bg_event 14, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 15, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 26,  7, BGEVENT_ITEM, TeamRocketBaseB2FHiddenFullHeal

	db 12 ; object events
	object_event 25, 13, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerMNinjaF4, EVENT_HIDEOUT_NINJA7
	object_event 25,  9, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, HideoutB2FArcherScript, EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	object_event  1, 16, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	object_event  9, 13, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HideoutWings, EVENT_HIDEOUT_WINGS
	object_event 13,  7, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HideoutGrannyScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 17,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodWorkerScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 25,  3, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerMNinjaF3, EVENT_HIDEOUT_NINJA6
	object_event  4,  1, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_TRAINER, 1, TrainerMNinjaM3, EVENT_HIDEOUT_NINJA5
	object_event 21, 14, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_TRAINER, 4, TrainerMNinjaM4, EVENT_HIDEOUT_NINJA8
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FTMThief, EVENT_TEAM_ROCKET_BASE_B2F_TM_THIEF
	object_event 20,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FLaprasCallB, EVENT_GOT_HM06_WHIRLPOOL
