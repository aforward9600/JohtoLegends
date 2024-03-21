	object_const_def ; object_event constants
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.WiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

WiseTriosRoomSage1Script:
	faceplayer
	opentext
	checkevent EVENT_TIN_TOWER_TAKEOVER
	iftrue .WiseTriosRoomSage1Takeover
	writetext WiseTriosRoomSage1Text
	waitbutton
	closetext
	end

.WiseTriosRoomSage1Takeover:
	writetext WiseTriosRoomSage1TakeoverText
	waitbutton
	closetext
	end

WiseTriosRoomSage2Script:
	faceplayer
	opentext
	checkevent EVENT_TIN_TOWER_TAKEOVER
	iftrue .WiseTriosRoomSage2Takeover
	writetext WiseTriosRoomSage2Text
	waitbutton
	closetext
	end

.WiseTriosRoomSage2Takeover:
	writetext WiseTriosRoomSage2TakeoverText
	waitbutton
	closetext
	end

WiseTriosRoomSage3Script:
	faceplayer
	opentext
	checkevent EVENT_TIN_TOWER_TAKEOVER
	iftrue .WiseTriosRoomSage3Takeover
	writetext WiseTriosRoomSage3Text
	waitbutton
	closetext
	end

.WiseTriosRoomSage3Takeover:
	writetext WiseTriosRoomSage3TakeoverText
	waitbutton
	closetext
	end

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, MovementData_0x98622
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, MovementData_0x98625
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	checkevent EVENT_TIN_TOWER_TAKEOVER
	iftrue .WiseTriosRoomSage1Takeover
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end

.WiseTriosRoomSage1Takeover:
	writetext WiseTriosRoomSage1TakeoverText
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	checkevent EVENT_TIN_TOWER_TAKEOVER
	iftrue .WiseTriosRoomSage2Takeover
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end

.WiseTriosRoomSage2Takeover:
	writetext WiseTriosRoomSage2TakeoverText
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_TIN_TOWER_TAKEOVER
	iftrue .WiseTriosRoomSage3Takeover
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	buttonsound
	closetext
	applymovement WISETRIOSROOM_SAGE6, MovementData_0x98628
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_FINISHED
	clearevent EVENT_TIN_TOWER_1F_EUSINE
	end

.KojiAllowsPassage:
	opentext
	writetext SageKojiAfterBattleFinalText
	waitbutton
	closetext
	end

.WiseTriosRoomSage3Takeover:
	opentext
	writetext WiseTriosRoomSage3TakeoverText
	waitbutton
	closetext
	end

MovementData_0x98622:
	step LEFT
	step LEFT
	step_end

MovementData_0x98625:
	step RIGHT
	step DOWN
	step_end

MovementData_0x98628:
	step RIGHT
	step DOWN
	step_resume

WiseTriosRoomSage1Text:
	text "Astounding…"

	para "SUICUNE, ENTEI and"
	line "RAIKOU have arisen"
	cont "from their sleep…"

	para "Is the legend"
	line "coming true?"
	done

WiseTriosRoomSage2Text:
	text "We train at the"
	line "BURNED TOWER, but"

	para "we've never heard"
	line "of a hole opening"

	para "up there before."
	line "It must have been"

	para "deliberately made"
	line "by someone."
	done

WiseTriosRoomSage3BlocksExitText:
	text "TIN TOWER may be"
	line "entered by those"

	para "bearing ECRUTEAK's"
	line "GYM BADGE."

	para "However, now that"
	line "SUICUNE, RAIKOU"

	para "and ENTEI have"
	line "arisen, I ask you"

	para "to refrain from"
	line "entering!"
	done

WiseTriosRoomSage3Text:
	text "We, the WISE TRIO,"
	line "are the protectors"

	para "of the legendary"
	line "#MON."
	done

SageGakuSeenText:
	text "Welcome, young"
	line "trainer, and owner"
	cont "of the sacred"
	cont "feather."

	para "We, the Wise Trio,"
	line "guard the Bell"
	cont "Tower, waiting for"

	para "a trainer worthy"
	line "of climbing the"
	cont "tower, and thus,"

	para "one worthy of"
	line "facing Ho-Oh, the"

	para "Legendary #mon."

	para "You have come"
	line "seeking knowledge"
	cont "of the Legendary"
	cont "#mon, correct?"

	para "We shall be your"
	line "test, to ascertain"
	cont "if you are worthy"
	cont "of such knowledge."
	done

SageGakuBeatenText:
	text "Stronger than we"
	line "thought? Perhaps…"
	done

SageGakuAfterBattleText:
	text "Your friend has"
	line "already bested us."

	para "I believe that"
	line "both of you are in"
	cont "possession of a"

	para "strength unlike"
	line "any other."
	done

WiseTriosRoomSage1TakeoverText:
	text "Your friend has"
	line "already gone"
	cont "ahead…"

	para "…You two may be"
	line "able to stop them…"
	done

SageMasaSeenText:
	text "Can you be trusted"
	line "with the truth?"

	para "I must ascertain"
	line "your worthiness."
	done

SageMasaBeatenText:
	text "…I will tell you"
	line "the truth…"
	done

SageMasaAfterBattleText:
	text "The sage in Bell"
	line "Tower will tell"

	para "what you seek."
	done

WiseTriosRoomSage2TakeoverText:
	text "…Those who are not"
	line "worthy have taken"
	cont "over the tower…"
	done

SageKojiSeenText:
	text "Let me see your"
	line "power!"
	done

SageKojiBeatenText:
	text "Too strong!"
	line "Why?"
	done

SageKojiAfterBattleQuestionText:
	text "You… are worthy of"
	line "the knowledge that"

	para "has been safe-"
	line "guarded by the"


	para "sages of Ecruteak"
	line "for centuries."

	para "Go on…"
	done

SageKojiAfterBattleSpeechText:
	text "I see…"

	para "We, the WISE TRIO,"
	line "have been given "

	para "the responsibility"
	line "of protecting the"

	para "legendary #MON."
	line "We are to allow"

	para "passage only to"
	line "those people who"

	para "possess the power"
	line "and soul of truth."

	para "Please, do go on"
	line "and enter the TIN"
	cont "TOWER ahead."

	para "SUICUNE will put"
	line "you to the test."
	done

SageKojiAfterBattleFinalText:
	text "Have you begun to"

	para "understand the"
	line "truth?"
	done

WiseTriosRoomSage3TakeoverText:
	text "We were no match"
	line "for them…"
	done

WiseTriosRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  4, BELLCHIME_PATH, 1
	warp_event  7,  5, BELLCHIME_PATH, 2
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	db 1 ; coord events
	coord_event  7,  4, SCENE_DEFAULT, WiseTriosRoom_CannotEnterTinTowerScript

	db 0 ; bg events

	db 6 ; object events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
