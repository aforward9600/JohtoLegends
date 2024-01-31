	object_const_def ; object_event constants
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_HEX_MANIAC1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_HEX_MANIAC2
	const SAFFRONGYM_YOUNGSTER2

SaffronGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .SabrinaPost
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, SabrinaLastMonText
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_HEX_MANIAC_BECKY
	setevent EVENT_BEAT_HEX_MANIAC_LILLITH
	setevent EVENT_BEAT_PSYCHIC_CHRIS
	setevent EVENT_BEAT_PSYCHIC_JEREMY
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	setevent EVENT_DECO_BED_3
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

.SabrinaPost:
	checkflag ENGINE_REENA
	iffalse .SabrinaRematch
	writetext SabrinaPostText
	waitbutton
	closetext
	end

.SabrinaRematch:
	writetext SabrinaRematchText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, SabrinaLastMonText
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	opentext
	writetext SabrinaAfterRematchText
	waitbutton
	closetext
	setflag ENGINE_REENA
	end

SabrinaLastMonText:
	text "I did not foresee"
	line "this…"
	done

TrainerHexManiacBecky:
	trainer HEX_MANIAC, BECKY, EVENT_BEAT_HEX_MANIAC_BECKY, HexManiacBeckySeenText, HexManiacBeckyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HexManiacBeckyAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicChris:
	trainer PSYCHIC_T, CHRIS_PSYCHIC, EVENT_BEAT_PSYCHIC_CHRIS, PsychicChrisSeenText, PsychicChrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicChrisAfterBattleText
	waitbutton
	closetext
	end

TrainerHexManiacLillith:
	trainer HEX_MANIAC, LILLITH, EVENT_BEAT_HEX_MANIAC_LILLITH, HexManiacLillithSeenText, HexManiacLillithBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HexManiacLillithAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJeremy:
	trainer PSYCHIC_T, JEREMY_PSYCHIC, EVENT_BEAT_PSYCHIC_JEREMY, PsychicJeremySeenText, PsychicJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJeremyAfterBattleText
	waitbutton
	closetext
	end

SabrinaIntroText:
	text "Sabrina: I knew"
	line "you were coming…"

	para "You, who has"
	line "conquered the"
	cont "#mon League."

	para "You seek my power"
	line "to fight the Feds."

	para "While I don't"
	line "enjoy battling,"

	para "I despise harming"
	line "innocents."

	para "The Federation's"
	line "reign of tyranny"
	cont "must end."

	para "If you must test"
	line "my power, then so"
	cont "so be it!"
	done

SabrinaWinLossText:
	text "Sabrina: Your"
	line "power…"

	para "It far exceeds"
	line "what I foresaw…"

	para "This is the power"
	line "of a Champion…"
	done

ReceivedMarshBadgeText:
	text "Sabrina received"
	line "MarshBadge."
	done

SabrinaMarshBadgeText:
	text "Sabrina: Quite a"
	line "pretty badge."

	para "Not at all what I"
	line "expected from"
	cont "Koichi."

	para "Regardless, I will"
	line "be sure to use my"
	cont "psychic power in"
	cont "the fight against"
	cont "the Federation."

	para "Call upon me, and"
	line "we shall not lose."
	done

SabrinaFightDoneText:
	text "Sabrina: …I am"
	line "meditating to"
	cont "become stronger."

	para "Please do not"
	line "disturb me until"
	cont "it is time."
	done

HexManiacBeckySeenText:
	text "Come and show me"
	line "your power!"
	done

HexManiacBeckyBeatenText:
	text "It's over 9,000!"
	done

HexManiacBeckyAfterBattleText:
	text "What is the source"
	line "of your power?"
	done

PsychicChrisSeenText:
	text "Hmmm…"

	para "Yes, I see…"

	para "…Whah!"

	para "Geez, you scared"
	line "me!"
	done

PsychicChrisBeatenText:
	text "You're scary!"
	done

PsychicChrisAfterBattleText:
	text "I was meditating"
	line "as you interrupted"
	cont "me."

	para "That's why I"
	line "jumped."
	done

HexManiacLillithSeenText:
	text "Fufufufu…"
	line "I see it clearly."

	para "I can see your"
	line "future!"
	done

HexManiacLillithBeatenText:
	text "I couldn't see my"
	line "future…"
	done

HexManiacLillithAfterBattleText:
	text "Now your future is"
	line "cloudy to me."
	done

PsychicJeremySeenText:
	text "We aren't bothered"
	line "by the Feds here."

	para "Our powers are"
	line "terrifying."
	done

PsychicJeremyBeatenText:
	text "You're terrifying"
	line "too…"
	done

PsychicJeremyAfterBattleText:
	text "If one of us had"
	line "been the Leader,"

	para "the Feds wouldn't"
	line "have taken over"
	cont "Saffron City."
	done

SabrinaPostText:
	text "Sabrina: I foresee"
	line "a better future"
	cont "for Kanto."

	para "Better than the"
	line "one I saw for the"
	cont "last two years."

	para "Yet, there is"
	line "something that"
	cont "bothers me…"

	para "A new shadow will"
	line "cover the region…"

	para "And a hero of red"
	line "will rise to the"
	cont "challenge."

	para "That is all I can"
	line "see for now."

	para "Let's hope this"
	line "future also is"
	cont "not set."
	done

SabrinaRematchText:
	text "Sabrina: I foresaw"
	line "this reunion."

	para "There is no need"
	line "for further words."

	para "I can only hope"
	line "this battle goes"
	cont "differently than I"
	cont "envisioned."
	done

SabrinaAfterRematchText:
	text "Sabrina: …Most"
	line "unfortunate…"

	para "I was not able to"
	line "change the outcome"
	cont "of our battle."

	para "Perhaps someday a"
	line "battle between us"
	cont "will not go the"
	cont "way I foresee."
	done

SaffronGym_MapEvents:
	db 0, 0 ; filler

	db 32 ; warp events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 15, SAFFRON_GYM, 18
	warp_event 19, 15, SAFFRON_GYM, 19
	warp_event 19, 11, SAFFRON_GYM, 20
	warp_event  1, 11, SAFFRON_GYM, 21
	warp_event  5,  3, SAFFRON_GYM, 22
	warp_event 11,  5, SAFFRON_GYM, 23
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event 19,  3, SAFFRON_GYM, 25
	warp_event 15, 17, SAFFRON_GYM, 26
	warp_event  5, 17, SAFFRON_GYM, 27
	warp_event  5,  9, SAFFRON_GYM, 28
	warp_event  9,  3, SAFFRON_GYM, 29
	warp_event 15,  9, SAFFRON_GYM, 30
	warp_event 15,  5, SAFFRON_GYM, 31
	warp_event  1,  5, SAFFRON_GYM, 32
	warp_event 19, 17, SAFFRON_GYM, 3
	warp_event 19,  9, SAFFRON_GYM, 4
	warp_event  1,  9, SAFFRON_GYM, 5
	warp_event  5,  5, SAFFRON_GYM, 6
	warp_event 11,  3, SAFFRON_GYM, 7
	warp_event  1, 17, SAFFRON_GYM, 8
	warp_event 19,  5, SAFFRON_GYM, 9
	warp_event 15, 15, SAFFRON_GYM, 10
	warp_event  5, 15, SAFFRON_GYM, 11
	warp_event  5, 11, SAFFRON_GYM, 12
	warp_event  9,  5, SAFFRON_GYM, 13
	warp_event 15, 11, SAFFRON_GYM, 14
	warp_event 15,  3, SAFFRON_GYM, 15
	warp_event  1,  3, SAFFRON_GYM, 16
	warp_event 11,  9, SAFFRON_GYM, 17

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, EVENT_SAFFRON_GYM_SABRINA
	object_event 17, 16, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerHexManiacBecky, -1
	object_event  3, 16, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicChris, -1
	object_event  3,  4, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerHexManiacLillith, -1
	object_event 17,  4, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJeremy, -1
