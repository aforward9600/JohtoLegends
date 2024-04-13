	object_const_def ; object_event constants
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_BLACK_BELT2
	const FIGHTINGDOJO_BLACK_BELT3

FightingDojo_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FightingDojoKoichi:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .AlreadyBeatBikerBossKoichi
	checkevent EVENT_BEAT_SABRINA
	iftrue .AlreadyBeatSabrina
	checkevent EVENT_BEAT_KOICHI
	iftrue .AlreadyBeatKoichi
	writetext KoichiIntroText
	waitbutton
	closetext
	winlosstext KoichiWonText, KoichiLastMonText
	loadtrainer KARATE_KING, KOICHI
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KOICHI
	setevent EVENT_SAFFRON_CITY_BLACK_BELT
	opentext
	writetext YoureGivingMeBadgeText
	buttonsound
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .NoRoomForDynamicpunch
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	waitbutton
	closetext
	end

.AlreadyBeatKoichi:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iffalse .GetTM01
	writetext GoAndFaceSabrinaText
	waitbutton
	closetext
	end

.AlreadyBeatSabrina:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iffalse .GetTM01
	writetext KoichiAfterText
	waitbutton
	closetext
	end

.NoRoomForDynamicpunch:
	writetext NoRoomForDynamicpunchText
	waitbutton
	closetext
	end

.AlreadyBeatBikerBossKoichi:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iffalse .GetTM01
	writetext KoichiAfterEpilogueText
	waitbutton
	closetext
	end

.GetTM01:
	writetext HereIsTM01Text
	buttonsound
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .NoRoomForDynamicpunch
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	waitbutton
	closetext
	end

TrainerBlackbeltHiroshi:
	trainer BLACKBELT_T, HIROSHI, EVENT_BEAT_BLACKBELT_HIROSHI, BlackbeltHiroshiSeenText, BlackbeltHiroshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltHiroshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltTanabe:
	trainer BLACKBELT_T, TANABE, EVENT_BEAT_BLACKBELT_TANABE, BlackbeltTanabeSeenText, BlackbeltTanabeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltTanabeAfterText
	waitbutton
	closetext
	end

FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoFocusBand:
	itemball FOCUS_BAND

SaffronGymStatue:
	jumpstd gymstatue1

FightingDojoSign1Text:
	text "What goes around"
	line "comes around!"
	done

FightingDojoSign2Text:
	text "Enemies on every"
	line "side!"
	done

KoichiIntroText:
	text "Welcome, Champion"
	line "<PLAYER>!"

	para "I heard you are"
	line "searching for a"
	cont "Gym Leader to take"
	cont "on the Feds with!"

	para "No need to look"
	line "any further!"

	para "As the former Gym"
	line "Leader, I am the"
	cont "best in Saffron"
	cont "City!"

	para "Don't believe me?"

	para "Then test me!"
	done

KoichiWonText:
	text "Fallen in defeat"
	line "again…"
	done

KoichiLastMonText:
	text "We must hold on…"
	done

YoureGivingMeBadgeText:
	text "Koichi: So, what"
	line "do you think?"

	para "Strong, huh?"

	para "So, may I have a"
	line "badge?"

	para "…No, I understand…"

	para "I turned tail when"
	line "my city needed me…"

	para "I don't deserve to"
	line "be Gym Leader…"

	para "…Tell you what."

	para "Next door is the"
	line "Psychic Institute."

	para "There you'll find"
	line "a much better"
	cont "trainer than I."

	para "Even if you give a"
	line "badge to her, know"
	cont "that I'll follow"
	cont "you into battle."

	para "I need to redeem"
	line "myself."

	para "Go on."

	para "…Oh, wait! Before"
	line "you go, have this!"

	para "I used to give"
	line "these out whenever"
	cont "a challenger beat"
	cont "me."

	para "It's TM01,"
	line "Dynamicpunch!"

	para "It doesn't hit"
	line "very often, but it"
	cont "confuses when it"
	cont "does!"
	done

GoAndFaceSabrinaText:
	text "Go on and face"
	line "her."

	para "I think she'll be"
	line "quite a match for"
	cont "you."
	done

KoichiAfterText:
	text "I think we're ready"
	line "to move on the"
	cont "Feds."

	para "Just let us know"
	line "when."
	done

BlackbeltHiroshiSeenText:
	text "Hut!"

	para "Come at me!"
	done

BlackbeltHiroshiAfterText:
	text "I have nothing"
	line "else to say."
	done

BlackbeltHiroshiBeatenText:
	text "Failed, I have!"
	done

BlackbeltTanabeSeenText:
	text "Hiyah!"

	para "Fight me!"
	done

BlackbeltTanabeBeatenText:
	text "Aigh!"

	para "My foot!"
	done

BlackbeltTanabeAfterText:
	text "I have nothing"
	line "else to say."
	done

NoRoomForDynamicpunchText:
	text "There is no room"
	line "for this!"
	done

HereIsTM01Text:
	text "Koichi: Welcome"
	line "back, Champion."

	para "I apologize for"
	line "not giving you"
	cont "this before."

	para "I honestly just"
	line "forgot."

	para "This is TM01,"
	line "Dynamicpunch!"

	para "It doesn't hit too"
	line "often, but when it"
	cont "does, it confuses!"
	done

KoichiAfterEpilogueText:
	text "Koichi: I still"
	line "feel like I haven't"
	cont "redeemed myself"
	cont "yet."

	para "I do not deserve"
	line "to be Gym Leader"
	cont "at the present."

	para "I shall dedicate"
	line "myself to my"
	cont "training,"

	para "and when I am"
	line "strong enough,"

	para "I shall engage in"
	line "combat with the"
	cont "young Sabrina,"

	para "and together, we"
	line "shall decide who"
	cont "is worthy!"
	done
	

FightingDojo_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, SAFFRON_CITY, 1
	warp_event  5, 11, SAFFRON_CITY, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  4,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign2
	bg_event  2,  9, BGEVENT_READ, SaffronGymStatue
	bg_event  7,  9, BGEVENT_READ, SaffronGymStatue

	db 3 ; object events
	object_event  4,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoKoichi, -1
	object_event  7,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltHiroshi, -1
	object_event  2,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltTanabe, -1

