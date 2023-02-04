	object_const_def
	const ROCKETLAIRBOSSROOM_RIVAL
	const ROCKETLAIRBOSSROOM_MADAME_BOSS
	const ROCKETLAIRBOSSROOM_SHERLES
	const ROCKETLAIRBOSSROOM_ARTICUNO
	const ROCKETLAIRBOSSROOM_ZAPDOS
	const ROCKETLAIRBOSSROOM_MOLTRES
	const ROCKETLAIRBOSSROOM_QUAGSIRE
	const ROCKETLAIRBOSSROOM_MACHAMP
	const ROCKETLAIRBOSSROOM_PORYGON_Z
	const ROCKETLAIRBOSSROOM_RIVAL_2

RocketLairBossRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .dummy0 ; SCENE_DEFAULT
	scene_script .dummy1 ; SCENE_FINISHED

	db 0 ; callback

.dummy0:
	end

.dummy1:
	end

RocketLairBossRoom_Event1:
	applymovement PLAYER, PlayerMovesRightLair
	checkevent EVENT_BOSS_ROOM_POKEMON
	iftrue PlayerWalksToBoss2
RocketLairBossRoom_Event2:
	checkevent EVENT_BOSS_ROOM_POKEMON
	iftrue PlayerWalksToBoss2
	turnobject PLAYER, RIGHT
	turnobject ROCKETLAIRBOSSROOM_RIVAL, LEFT
	opentext
	writetext YouReadyText
	waitbutton
	closetext
	pause 5
	follow PLAYER, ROCKETLAIRBOSSROOM_RIVAL
	applymovement PLAYER, BossRoomGetIntoPosition1
	sjump PlayerWalksToBoss

RocketLairBossRoom_Event3:
	checkevent EVENT_BOSS_ROOM_POKEMON
	iftrue PlayerWalksToBoss3
	turnobject PLAYER, LEFT
	turnobject ROCKETLAIRBOSSROOM_RIVAL, RIGHT
	opentext
	writetext YouReadyText
	waitbutton
	closetext
	pause 5
	follow PLAYER, ROCKETLAIRBOSSROOM_RIVAL
	applymovement PLAYER, BossRoomGetIntoPosition2
PlayerWalksToBoss:
	applymovement PLAYER, PlayerWalksToBossMovement
	stopfollow
	applymovement ROCKETLAIRBOSSROOM_RIVAL, PlayerMovesRightLair
	applymovement ROCKETLAIRBOSSROOM_RIVAL, BossRoomGetIntoPosition1
	pause 10
	appear ROCKETLAIRBOSSROOM_RIVAL_2
	turnobject ROCKETLAIRBOSSROOM_RIVAL, UP
	moveobject ROCKETLAIRBOSSROOM_RIVAL, 9, 7
	pause 10
	opentext
	writetext YouMustBeTheBossText
	waitbutton
	closetext
	opentext
	writetext ThatsRightText
	waitbutton
	closetext
	disappear ROCKETLAIRBOSSROOM_RIVAL
	disappear ROCKETLAIRBOSSROOM_ARTICUNO
	disappear ROCKETLAIRBOSSROOM_MACHAMP
	disappear ROCKETLAIRBOSSROOM_MOLTRES
	disappear ROCKETLAIRBOSSROOM_PORYGON_Z
	disappear ROCKETLAIRBOSSROOM_QUAGSIRE
	disappear ROCKETLAIRBOSSROOM_ZAPDOS
	sjump MadameBossBattle

PlayerWalksToBoss3:
	applymovement PLAYER, BossRoomGetIntoPosition3
RocketLairBossRoom_Event4:
	applymovement PLAYER, BossRoomGetIntoPosition3
PlayerWalksToBoss2:
	applymovement PLAYER, BossRoomGetIntoPosition1
	applymovement PLAYER, PlayerWalksToBossMovement
	pause 5
	opentext
	writetext BackAgainHuhText
	waitbutton
	closetext
MadameBossBattle:
	setlasttalked ROCKETLAIRBOSSROOM_MADAME_BOSS
	winlosstext MadameBossWinText, MadameBossLastMonText
	loadtrainer MADAME_BOSS, BOSS
	startbattle
	reloadmapafterbattle
	pause 5
	opentext
	writetext ICantLoseText
	waitbutton
	closetext
	turnobject ROCKETLAIRBOSSROOM_MADAME_BOSS, LEFT
	pause 5
	turnobject ROCKETLAIRBOSSROOM_MADAME_BOSS, RIGHT
	pause 5
	turnobject ROCKETLAIRBOSSROOM_MADAME_BOSS, LEFT
	pause 5
	special FadeOutMusic
	pause 30
	playmusic MUSIC_UNWAVERING_HEART
	pause 5
	opentext
	writetext YouDontHaveToDoThisText
	waitbutton
	closetext
	turnobject ROCKETLAIRBOSSROOM_MADAME_BOSS, DOWN
	opentext
	writetext ShutUpKidText
	waitbutton
	closetext
	pause 5
	appear ROCKETLAIRBOSSROOM_SHERLES
	applymovement ROCKETLAIRBOSSROOM_SHERLES, RocketLairSherlesMovement
	turnobject ROCKETLAIRBOSSROOM_SHERLES, RIGHT
	turnobject ROCKETLAIRBOSSROOM_MADAME_BOSS, LEFT
	opentext
	writetext YoureUnderArrestLairText
	waitbutton
	closetext
	pause 10
	turnobject ROCKETLAIRBOSSROOM_MADAME_BOSS, LEFT
	pause 5
	turnobject ROCKETLAIRBOSSROOM_MADAME_BOSS, RIGHT
	pause 5
	turnobject ROCKETLAIRBOSSROOM_MADAME_BOSS, LEFT
	pause 5
	turnobject ROCKETLAIRBOSSROOM_MADAME_BOSS, RIGHT
	pause 5
	turnobject ROCKETLAIRBOSSROOM_MADAME_BOSS, LEFT
	opentext
	writetext ThisCantBeText
	waitbutton
	closetext
	pause 10
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROCKETLAIRBOSSROOM_MADAME_BOSS
	disappear ROCKETLAIRBOSSROOM_SHERLES
	pause 15
	special FadeInQuickly
	pause 10
	turnobject PLAYER, RIGHT
	turnobject ROCKETLAIRBOSSROOM_RIVAL_2, LEFT
	opentext
	writetext WeFinallyDidItText
	waitbutton
	closetext
	pause 5
	applymovement ROCKETLAIRBOSSROOM_RIVAL_2, RivalMovesToTableMovement
	turnobject PLAYER, UP
	turnobject ROCKETLAIRBOSSROOM_RIVAL_2, DOWN
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	pause 20
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	pause 20
	applymovement ROCKETLAIRBOSSROOM_RIVAL_2, RivalMovesBackToYouMovement
	turnobject ROCKETLAIRBOSSROOM_RIVAL_2, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext GotTheKeyText
	waitbutton
	closetext
	applymovement ROCKETLAIRBOSSROOM_RIVAL_2, RivalLeavesBossRoomMovement
	disappear ROCKETLAIRBOSSROOM_RIVAL_2
	setevent EVENT_BEAT_MADAME_BOSS
	setevent EVENT_LAIR_GRUNTS
	setevent EVENT_HIDEOUT_EIN
	clearevent EVENT_HOOH_LUGIA_ROOM_OFFICER
	pause 15
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	setscene SCENE_FINISHED
	setevent EVENT_VICTORY_ROAD_GATE_RIVAL_2
	setevent EVENT_VICTORY_ROAD_GATE_OAK
	setevent EVENT_VICTORY_ROAD_GATE_RIVAL
	setmapscene VICTORY_ROAD_GATE, SCENE_VICTORY_ROAD_GATE_GUARD
	checkevent EVENT_GOT_SILVER_WING
	iftrue .RemoveRival3
	clearevent EVENT_HOOH_LUGIA_ROOM_RIVAL3
	end

.RemoveRival3:
	clearevent EVENT_HOOH_LUGIA_ROOM_RIVAL2
	end

MadameBossLastMonText:
	text "What?!"

	para "My last one?!"

	para "These #mon are"
	line "pathetic!"
	done

RocketLairRival:
	jumptextfaceplayer YouReadyText

MadameBossDesk:
	jumptext MadameBossDeskText

PlayerMovesRightLair:
	step RIGHT
	step_end

BossRoomGetIntoPosition1:
	step UP
	step_end

BossRoomGetIntoPosition2:
	step UP
	step LEFT
	step LEFT
	step_end

BossRoomGetIntoPosition3:
	step LEFT
	step_end

PlayerWalksToBossMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketLairSherlesMovement:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

RivalMovesToTableMovement:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

RivalMovesBackToYouMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

RivalLeavesBossRoomMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MadameBossDeskText:
	text "In the desk, there"
	line "is a picture of"
	cont "the boss and a"
	cont "young man."

	para "Could be her son."
	done

MadameBossWinText:
	text "No…"

	para "No!"

	para "This can't be"
	line "real!"

	para "I can't lose to"
	line "a child!"

	para "Not when we're so"
	line "close!"

	para "My money…"

	para "My power…"

	para "It'll all be gone…"

	para "You…"

	para "You…"
	done

BackAgainHuhText:
	text "Back again, huh?"

	para "I would have"
	line "you'd learn your"
	cont "lesson, but I"
	cont "guess you're a"
	cont "slow learner!"
	done

YouReadyText:
	text "You ready for"
	line "this?"

	para "No turning back"
	line "now."

	para "You take the lead"
	line "this time."
	done

YouMustBeTheBossText:
	text "<RIVAL>: So, you"
	line "must be the boss."
	done

ThatsRightText:
	text "???: And you must"
	line "be the children"
	cont "that have been an"
	cont "annoyance to us."

	para "You may call me"
	line "Madame Boss."

	para "I'm not giving you"
	line "the privilege of"
	cont "knowing my name."

	para "<RIVAL>: Fine,"
	line "'Madame'."

	para "We've got you"
	line "cornered, so you"
	cont "wanna tell us"
	cont "what your deal is?"

	para "Boss: I may as"
	line "well, since you're"
	cont "not leaving here"
	cont "in one piece."

	para "The answer's"
	line "obvious, isn't it?"

	para "Money, and power."

	para "<RIVAL>: That's it?"

	para "That's your big"
	line "plan?"

	para "A get rich-quick"
	line "scheme?"

	para "Boss: I knew a"
	line "child like you"
	cont "wouldn't get it."

	para "Money is every-"
	line "thing, and money"
	cont "gets you power."

	para "We were close to"
	line "ruling Johto,"
	cont "until you came"
	cont "along."

	para "You set us back"
	line "considerably, you"
	cont "know?"

	para "But without you,"
	line "I wouldn't have"
	cont "gotten my hands"
	cont "on so many rare"
	cont "and valuable"
	cont "#mon."

	para "<RIVAL>: You're"
	line "sick, lady. You"
	cont "know that?"

	para "Stealing and"
	line "poaching #mon"
	cont "for profit."

	para "It's disgusting."

	para "#mon are our"
	line "friends, not"
	cont "assets."

	para "Boss: How cute."

	para "You actually think"
	line "I care?"

	para "Newflash: I don't."

	para "#mon are merely"
	line "tools, and they"
	cont "all have their"
	cont "use, the same as"
	cont "people."

	para "You know, you"
	line "remind me a bit"
	cont "of my son."

	para "Idealistic, and"
	line "annoying."

	para "His plans for"
	line "control were so"
	cont "stupid, I had to"
	cont "send him away so"
	cont "he wouldn't"
	cont "bother me anymore."

	para "<RIVAL>: The more"
	line "I hear from you,"
	cont "the more I hate"
	cont "you."

	para "You're completely"
	line "selfish. You care"
	cont "only about money."

	para "It's horrible, and"
	line "yet sad."

	para "I guess the love"
	line "of a child means"
	cont "nothing to you."

	para "You're a shallow,"
	line "empty psychopath,"
	cont "and I'm done"
	cont "talking with you."

	para "Boss: Oh, you're"
	line "done? Finally."

	para "I thought you'd"
	line "never shut up."

	para "Your feeble"
	line "attempts to"
	cont "rile me failed"
	cont "spectacularly."

	para "Now that this"
	line "conversation is"
	cont "over, I think it's"
	cont "time we say"
	cont "farewell."

	para "I'll be sure to"
	line "send your families"
	cont "sympathy cards!"

	para "Let's end this!"
	done

ICantLoseText:
	text "I…can't lose…"

	para "Not like this…"

	para "Not like this!"

	para "I was so close!"

	para "I had so many"
	line "powerful #mon!"

	para "And I still lost!"

	para "To a child, no"
	line "less!"

	para "My dreams…"

	para "Are they just"
	line "that?"

	para "………………"
	done

YouDontHaveToDoThisText:
	text "<RIVAL>: You know,"
	line "you don't have to"
	cont "do this."

	para "Seeing you like"
	line "this, it's quite"
	cont "sad, really."

	para "You had the chance"
	line "to do something"
	cont "great with your"
	cont "life, and this is"
	cont "what you do?"

	para "I feel sorry for"
	line "you, and your son."

	para "If you had cared"
	line "for your son, and"
	cont "your #mon,"
	cont "maybe your life"
	cont "wouldn't have"
	cont "turned out this"
	cont "way."
	done

ShutUpKidText:
	text "Boss: Shut up,"
	line "shut up, shut up,"
	cont "SHUT UP!"

	para "I don't want to"
	line "hear your"
	cont "sancitmonious"
	cont "musings about my"
	cont "life!"

	para "You two have"
	line "ruined me!"

	para "All you had to do"
	line "was sit at home"
	cont "and be good little"
	cont "brats!"
	
	para "But, noooooo!"

	para "You just HAD to"
	line "stick your nose"
	cont "where it didn't"
	cont "belong!"

	para "Without you, I"
	line "would have ruled"
	cont "this region like a"
	cont "queen!"

	para "The police and the"
	line "#mon League"
	cont "would have been"
	cont "powerless against"
	cont "me!"

	para "I could have had"
	line "them all in my"
	cont "pockets!"

	para "And then you two"
	line "waltzed in here"
	cont "like you own the"
	cont "place!"

	para "Do you know how"
	line "insufferable you"
	cont "are?"

	para "Has anyone ever"
	line "told you that?"

	para "They should say it"
	line "more often!"

	para "I…"

	para "I just…"

	para "…sob…"
	done

YoureUnderArrestLairText:
	text "Sherles: Freeze!"

	para "You're under"
	line "arrest!"

	para "#mon poaching,"
	line "stealing,"
	cont "trespassing,"
	cont "kidnapping,"
	cont "and other charges!"
	done

ThisCantBeText:
	text "Boss: No…"

	para "This can't be"
	line "happening…"

	para "My plans…"

	para "My beautiful"
	line "plans…"

	para "They're…"

	para "They're all"
	line "finished."

	para "I…"

	para "………………"
	done

WeFinallyDidItText:
	text "…We did it…"

	para "We finally did it!"

	para "We took them down"
	line "once and for all!"

	para "And by the sounds"
	line "of it, the #mon"
	cont "the boss had will"
	cont "be returned to"
	cont "the wild."

	para "That's a relief"

	para "Now we can get"
	line "that key."
	done

GotTheKeyText:
	text "Here it is."

	para "We can finally"
	line "free Lugia and"
	cont "Ho-Oh."

	para "I'll go on"
	line "ahead and open"
	cont "the tanks."

	para "Meet me there,"
	line "will ya?"
	done

RocketLairBossRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, ROCKET_LAIR_HALLWAY_3, 3
	warp_event  9, 17, ROCKET_LAIR_HALLWAY_3, 4

	db 4 ; coord_events
	coord_event  7, 15, SCENE_DEFAULT, RocketLairBossRoom_Event1
	coord_event  8, 15, SCENE_DEFAULT, RocketLairBossRoom_Event2
	coord_event  9, 15, SCENE_DEFAULT, RocketLairBossRoom_Event4
	coord_event 10, 15, SCENE_DEFAULT, RocketLairBossRoom_Event3

	db 1 ; bg events
	bg_event  8,  5, BGEVENT_READ, MadameBossDesk

	db 10 ; object events
	object_event  9, 15, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketLairRival, EVENT_MADAME_BOSS_ROOM_RIVAL
	object_event  8,  4, SPRITE_BOSS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MADAME_BOSS
	object_event  7, 12, SPRITE_SHERLES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MADAME_BOSS_ROOM_SHERLES
	object_event  4,  1, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BOSS_ROOM_POKEMON
	object_event  6,  1, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BOSS_ROOM_POKEMON
	object_event  8,  1, SPRITE_MOLTRES_P, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BOSS_ROOM_POKEMON
	object_event 10,  1, SPRITE_QUAGSIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BOSS_ROOM_POKEMON
	object_event 12,  1, SPRITE_MACHAMP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BOSS_ROOM_POKEMON
	object_event 14,  1, SPRITE_PORYGON_Z, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BOSS_ROOM_POKEMON
	object_event  9,  7, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MADAME_BOSS_ROOM_RIVAL_2
