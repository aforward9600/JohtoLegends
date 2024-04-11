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
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .KogaPost
	checkflag ENGINE_SOULBADGE
	iftrue .FightDone
	writetext KogaText_Welcome
	waitbutton
	closetext
	winlosstext KogaText_LossText, KogaText_LastMonText
	loadtrainer KOGA, KOGA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KOGA
	setevent EVENT_BEAT_FNINJA_F1
	setevent EVENT_BEAT_FNINJA_F2
	setevent EVENT_BEAT_FNINJA_M1
	setevent EVENT_BEAT_FNINJA_M2
	opentext
	writetext Text_ReceivedSoulBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE
	sjump .AfterBattle
.FightDone:
.AfterBattle:
	checkevent EVENT_GOT_TM06_TOXIC
	iftrue .AfterTM
	opentext
	writetext KogaText_ToxicSpeech
	buttonsound
	checkitem TM_TOXIC
	iftrue .AlreadyGotTM
	verbosegiveitem TM_TOXIC
	iffalse .AfterTM
	setevent EVENT_GOT_TM06_TOXIC
	setevent EVENT_DECO_BED_2
	opentext
.AfterTM:
	writetext KogaText_Ready
	waitbutton
	closetext
	end

.AlreadyGotTM:
	opentext
	writetext AlreadyGotTMText
	waitbutton
	closetext
	setevent EVENT_GOT_TM06_TOXIC
	setevent EVENT_DECO_BED_2
	opentext
	sjump .AfterTM

.KogaPost:
	checkflag ENGINE_JOSE
	iffalse .KogaRematch
	writetext KogaPostGameText
	waitbutton
	closetext
	end

.KogaRematch:
	writetext KogaRematchText
	waitbutton
	closetext
	winlosstext KogaText_LossText, KogaText_LastMonText
	loadtrainer KOGA, KOGA1
	startbattle
	reloadmapafterbattle
	opentext
	writetext KogaRematchAfterText
	waitbutton
	closetext
	setflag ENGINE_JOSE
	end

KogaText_LastMonText:
	text "A ninja is always"
	line "prepared!"
	done

FuchsiaGymNinjaF1:
	trainer FNINJA_F, FNINJA_F_1, EVENT_BEAT_FNINJA_F1, FuchsiaGymNinjaF1BeforeText, FuchsiaGymNinjaF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FuchsiaGymNinjaF1AfterText
	waitbutton
	closetext
	end

FuchsiaGymNinjaF2:
	trainer FNINJA_F, FNINJA_F_2, EVENT_BEAT_FNINJA_F2, FuchsiaGymNinjaF2BeforeText, FuchsiaGymNinjaF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FuchsiaGymNinjaF2AfterText
	waitbutton
	closetext
	end

FuchsiaGymNinjaM1:
	trainer FNINJA_M, FNINJA_M_1, EVENT_BEAT_FNINJA_M1, FuchsiaGymNinjaM1BeforeText, FuchsiaGymNinjaM1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FuchsiaGymNinjaM1AfterText
	waitbutton
	closetext
	end

FuchsiaGymNinjaM2:
	trainer FNINJA_M, FNINJA_M_2, EVENT_BEAT_FNINJA_M2, FuchsiaGymNinjaM2BeforeText, FuchsiaGymNinjaM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FuchsiaGymNinjaM2AfterText
	waitbutton
	closetext
	end

FuchsiaGymStatue:
	jumptext FuchsiaGymStatueText

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

	para "If only I was able"
	line "to wish you a warm"
	cont "welcome,"

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

	para "I was appointed as"
	line "the new jonin, but"
	cont "so far, I have"
	cont "done nothing to"
	cont "help the people…"

	para "That changes right"
	line "here, right now."

	para "If you are seeking"
	line "a Gym Leader,"

	para "then seek no"
	line "further!"

	para "I, ninja master"
	line "Koga, accept this"
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

	para "Ninjas have used"
	line "this technique for"
	cont "centuries."

	para "Use it well!"
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

FuchsiaGymNinjaF1BeforeText:
	text "Koga's kinda cute,"
	line "don't you think?"
	done

FuchsiaGymNinjaF1BeatenText:
	text "I'm sorry, Koga!"
	done

FuchsiaGymNinjaF1AfterText:
	text "Do you think he'll"
	line "notice me if I"
	cont "train hard?"

	para "I'd like that."
	done

FuchsiaGymNinjaM2BeforeText:
	text "Welcome to our"
	line "home, Champion."

	para "You know our new"
	line "jonin, correct?"

	para "Koga speaks highly"
	line "of you."

	para "Let's see how"
	line "strong you are!"
	done

FuchsiaGymNinjaM2BeatenText:
	text "Our jonin's respect"
	line "was not misplaced!"
	done

FuchsiaGymNinjaM2AfterText:
	text "Jonin Koga has"
	line "been a great ally"
	cont "to us since his"
	cont "cousin's passing…"

	para "I can only hope"
	line "that his skills in"
	cont "leadership can"
	cont "restore our clan"
	cont "to its former"
	cont "glory!"
	done

FuchsiaGymNinjaF2BeforeText:
	text "Confused by our"
	line "invisible walls?"

	para "That is the true"
	line "trickery of a"
	cont "ninja!"
	done

FuchsiaGymNinjaF2BeatenText:
	text "I was tricked!"
	done

FuchsiaGymNinjaF2AfterText:
	text "Even with all our"
	line "tricks, we couldn't"
	cont "stop the Feds…"

	para "I still feel shame"
	line "over that day…"

	para "I hope to avenge"
	line "my friends' deaths"
	cont "someday…"
	done

FuchsiaGymNinjaM1BeforeText:
	text "Our sister clan"
	line "turned to evil…"

	para "How unfortunate…"

	para "They would have"
	line "made good allies"
	cont "against the Feds…"
	done

FuchsiaGymNinjaM1BeatenText:
	text "Perhaps you will"
	line "make a good ally."
	done

FuchsiaGymNinjaM1AfterText:
	text "You fought against"
	line "the Mahogany clan,"
	cont "yes?"

	para "My apologies…"

	para "They were deceived"
	line "by silver-tounged"
	cont "demons…"

	para "I do not know what"
	line "became of them"
	cont "after you defeated"
	cont "them…"

	para "The once proud"
	line "Mahogany clan is"
	cont "now gone…"

	para "Koga is all that"
	line "remains of their"
	cont "honor…"

	para "I am proud to call"
	line "him our jonin."
	done

FuchsiaGymStatueText:
	text "Fuchsia Ninja Clan"

	para "Jonin: Koga"
	done

AlreadyGotTMText:
	text "Hm?"

	para "It appears you"
	line "already have this"
	cont "TM."

	para "You're full of"
	line "surprises."
	done

KogaPostGameText:
	text "Koga: My cousin"
	line "has been avenged."

	para "Thank you, my"
	line "friend."
	done

KogaRematchText:
	text "Koga: It is good"
	line "to see you, my"
	cont "friend."

	para "Shall we engage in"
	line "friendly combat?"

	para "I must keep honing"
	line "my skills to"
	cont "protect the city."
	done

KogaRematchAfterText:
	text "Koga: I shall keep"
	line "improving."

	para "I must remain"
	line "strong."

	para "You must continue"
	line "strengthening"
	cont "yourself as well."
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
	object_event  1, 10, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, FuchsiaGymNinjaF2, -1
	object_event  9,  4, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, FuchsiaGymNinjaF1, -1
	object_event  4,  2, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_TRAINER, 1, FuchsiaGymNinjaM1, -1
	object_event  8, 12, SPRITE_NINJA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_TRAINER, 1, FuchsiaGymNinjaM2, -1
