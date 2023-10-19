	object_const_def ; object_event constants
	const FUCHSIAGYM_KOGA
	const FUCHSIAGYM_NINJA_F_1
	const FUCHSIAGYM_NINJA_F_2
	const FUCHSIAGYM_NINJA_M_1
	const FUCHSIAGYM_NINJA_M_2

FuchsiaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FuchsiaGymKogaScript:
	checkflag ENGINE_SOULBADGE
	iftrue .FightDone
	faceplayer
	opentext
	writetext KogaText_Welcome
	waitbutton
	closetext
	winlosstext KogaText_LossText, KogaText_LastMonText
	loadtrainer KOGA, KOGA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KOGA
	setevent EVENT_BEAT_LASS_DANA3
	setevent EVENT_BEAT_PICNICKER_LACY
	setevent EVENT_BEAT_CAMPER_BARRY
	opentext
	writetext Text_ReceivedSoulBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE
	sjump .AfterBattle
.FightDone:
	faceplayer
	opentext
.AfterBattle:
	checkevent EVENT_GOT_TM06_TOXIC
	iftrue .AfterTM
	writetext KogaText_ToxicSpeech
	buttonsound
	verbosegiveitem TM_TOXIC
	iffalse .AfterTM
	setevent EVENT_GOT_TM06_TOXIC
.AfterTM:
	writetext KogaText_Ready
	waitbutton
	closetext
	end

KogaText_LastMonText:
	text "A ninja is always"
	line "prepared!"
	done

LassLindaScript:
	trainer LASS, LINDA, EVENT_BEAT_LASS_DANA3, LassLindaBeforeText, LassLindaBeatenText, 0, .Script

.Script:
	writetext LassLindaAfterText
	waitbutton
	closetext
	end

PicnickerCindyScript:
	trainer PICNICKER, LACY, EVENT_BEAT_PICNICKER_LACY, PicnickerCindyBeforeText, PicnickerCindyBeatenText, 0, .Script

.Script:
	writetext PicnickerCindyAfterText
	waitbutton
	closetext
	end

CamperBarryScript:
	trainer CAMPER, BARRY, EVENT_BEAT_CAMPER_BARRY, CamperBarryBeforeText, CamperBarryBeatenText, 0, .Script

.Script:
	writetext CamperBarryAfterText
	waitbutton
	closetext
	end

FuchsiaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JANINE
	iftrue .FuchsiaGymGuyWinScript
	writetext FuchsiaGymGuyText
	waitbutton
	closetext
	end

.FuchsiaGymGuyWinScript:
	writetext FuchsiaGymGuyWinText
	waitbutton
	closetext
	end

FuchsiaGymStatue:
	checkflag ENGINE_SOULBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, JANINE, JANINE1
	jumpstd gymstatue2

Movement_NinjaSpin:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

KogaText_Welcome:
	text "Koga: It's been a"
	line "while, <PLAYER>."

	para "Even though the"
	line "clan I was born"
	cont "into branded me a"
	cont "traitor, our"
	cont "sister clan here"
	cont "accepted me as one"
	cont "of their own."

	para "I wish that I was"
	line "able to wish you"
	cont "a warm welcome,"

	para "but you've seen"
	line "what has befallen"
	cont "our city, have you"
	cont "not?"

	para "The Federation has"
	line "brought terror to"
	cont "Fuchsia City, and"
	cont "sadly, nothing has"
	cont "been done."

	para "I am not a native,"
	line "but I feel it is"
	cont "my duty to help"
	cont "this city."

	para "…So, you seek a"
	line "new Gym Leader to"
	cont "rid this land of"
	cont "the terror that"
	cont "plagues it?"

	para "I see…"

	para "Before I arrived,"
	line "the Feds had"
	cont "already ravaged"
	cont "the city."

	para "The Leader was my"
	line "cousin, and the"
	cont "jonin of the clan."

	para "…He did not make"
	line "it…"

	para "…Nor did many"
	line "others who guarded"
	cont "this place…"

	para "We are all that is"
	line "left of the once"
	cont "glorious Fuchsia"
	cont "Clan…"

	para "I was appointed"
	line "new jonin, but so"
	cont "far, I have done"
	cont "nothing to help"
	cont "the people…"

	para "That changes right"
	line "here, right now."

	para "If you are seeking"
	line "a Gym Leader,"

	para "then seek no"
	line "further!"

	para "I, ninja master"
	line "Koga, except this"
	cont "burden!"

	para "Come and test me!"

	para "See if I am worthy"
	line "of such a title!"
	done

KogaText_LossText:
	text "Koga: …Your skills"
	line "exceed what I have"
	cont "been told…"

	para "An excellent fight"
	line "that was!"
	done

Text_ReceivedSoulBadge:
	text "Koga received"
	line "SoulBadge."
	done

KogaText_ToxicSpeech:
	text "Koga: This was his"
	line "badge, was it not?"

	para "…How beautiful…"

	para "Since I will be"
	line "the next Gym"
	cont "Leader, I suppose"
	cont "I should begin to"
	cont "hand out TMs, like"
	cont "this to victors."

	para "This is Toxic."

	para "The opponent loses"
	line "more and more HP"
	cont "as the battle goes"
	cont "on."
	done

KogaText_Ready:
	text "Koga: I shall be"
	line "ready when the"
	cont "time arrives."

	para "We shall restore"
	line "Kanto to its"
	cont "former glory,"

	para "and free it from"
	line "the oppressors!"
	done

LassAliceBeforeText:
	text "Fufufu!"

	para "I'm JANINE, the"
	line "GYM LEADER!"

	para "No, I'm not!"
	line "Gotcha, sucker!"
	done

LassAliceBeatenText:
	text "I had you fooled…"
	done

LassAliceAfterText:
	text "How will you dis-"
	line "tinguish our real"
	cont "LEADER?"
	done

LassLindaBeforeText:
	text "Fooled you!"
	line "Hahaha!"
	done

LassLindaBeatenText:
	text "Ooh… I lost…"
	line "You're not weak…"
	done

LassLindaAfterText:
	text "Well? Wasn't my"
	line "disguise perfect?"
	done

PicnickerCindyBeforeText:
	text "I'm JANINE!"

	para "How did you know I"
	line "was real?"

	para "Let's battle!"
	done

PicnickerCindyBeatenText:
	text "Darn it!"
	line "I wanted to win!"
	done

PicnickerCindyAfterText:
	text "You must be"
	line "getting tired."
	done

CamperBarryBeforeText:
	text "Wahahaha!"

	para "You betcha!"
	line "I'm JANINE!"
	done

CamperBarryBeatenText:
	text "My disguise was"
	line "right on! Dang!"
	done

CamperBarryAfterText:
	text "Hey, you. Was my"
	line "disguise cute or"
	cont "what, huh?"
	done

FuchsiaGymGuyText:
	text "Yo, CHAMP in"
	line "making!"

	para "Whoops! Take a"
	line "good look around"

	para "you. The trainers"
	line "all look like the"
	cont "LEADER, JANINE."

	para "Which of them is"
	line "the real JANINE?"
	done

FuchsiaGymGuyWinText:
	text "That was a great"
	line "battle, trainer"
	cont "from JOHTO!"
	done

FuchsiaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, FUCHSIA_CITY, 3
	warp_event  5, 17, FUCHSIA_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, FuchsiaGymStatue
	bg_event  6, 15, BGEVENT_READ, FuchsiaGymStatue

	db 5 ; object events
	object_event  5,  9, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, FuchsiaGymKogaScript, EVENT_FUCHSIA_GYM_KOGA
	object_event  1, 10, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 1, LassLindaScript, -1
	object_event  9,  4, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 2, PicnickerCindyScript, -1
	object_event  4,  2, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 1, CamperBarryScript, -1
	object_event  8, 12, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 1, ObjectEvent, -1
