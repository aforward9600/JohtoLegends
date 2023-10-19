	object_const_def ; object_event constants
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_PIDGEY
	const MRFUJISHOUSE_MR_FUJI

MrFujisHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MrFujisHousePokefanMScript:
	jumptextfaceplayer MrFujisHousePokefanMText

MrFujisHouseTeacherScript:
	jumptextfaceplayer MrFujisHouseTeacherText

MrFujisHouseMrFuji:
	faceplayer
	opentext
	checkevent EVENT_TALKED_WITH_MR_FUJI
	iftrue .CheckForMewtwo
	writetext MrFujisHouseMrFujiText1
	waitbutton
	closetext
	special FadeOutMusic
	pause 15
	playsound SFX_POKEFLUTE
	waitsfx
	pause 5
	opentext
	writetext LearnedSongOfAwakeningText
	waitbutton
	playsound SFX_GET_TM
	waitsfx
	closetext
	special RestartMapMusic
	setevent EVENT_TALKED_WITH_MR_FUJI
	end

.CheckForMewtwo:
	loadmonindex 1, MEWTWO
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue HaveMewtwo
	checkevent EVENT_SHOWED_MR_FUJI_MEWTWO
	iftrue AlreadyShowedMewtwo
	writetext MrFujisHouseMrFujiText2
	waitbutton
	closetext
	end

HaveMewtwo:
	checkevent EVENT_SHOWED_MR_FUJI_MEWTWO
	iftrue PleaseDontShowAgain
	writetext MrFujisHouseMrFujiText3
	waitbutton
	closetext
	setevent EVENT_SHOWED_MR_FUJI_MEWTWO
	end

AlreadyShowedMewtwo:
	writetext MrFujisHouseMrFujiText4
	waitbutton
	closetext
	end

PleaseDontShowAgain:
	writetext MrFujisHouseMrFujiText5
	waitbutton
	closetext
	end

MrFujisEkans:
	refreshscreen
	pokepic EKANS
	cry EKANS
	waitbutton
	closepokepic
	opentext
	writetext MrFujisEkansText
	waitbutton
	closetext
	end

MrFujisMarowak:
	refreshscreen
	pokepic MAROWAK
	cry MAROWAK
	waitbutton
	closepokepic
	opentext
	writetext MrFujisMarowakText
	waitbutton
	closetext
	end

MrFujisTogepi:
	refreshscreen
	pokepic TOGEPI
	cry TOGEPI
	waitbutton
	closepokepic
	opentext
	writetext MrFujisTogepiText
	waitbutton
	closetext
	end

MrFujisHouseBookshelf:
	jumpstd difficultbookshelf

MrFujisHousePokefanMText:
	text "Those Feds are so"
	line "heartless!"

	para "These poor #mon"
	line "lost their parents"
	cont "and trainers all"
	cont "thanks to them!"

	para "They should all be"
	line "ashamed!"
	done

MrFujisHouseTeacherText:
	text "So many #mon"
	line "have been left"
	cont "orphaned because"
	cont "of the Feds."

	para "Marowak guards the"
	line "other #mon from"
	cont "them."

	para "These #mon are"
	line "prime targets for"
	cont "stealing."
	done

MrFujisEkansText:
	text "Ekans: Hissss!"
	done

MrFujisMarowakText:
	text "Marowak: Maro!"
	line "Wak!"
	done

MrFujisTogepiText:
	text "Togepi: Prrrriiii!"
	done

MrFujisHouseMrFujiText1:
	text "Welcome."

	para "I am Mr. Fuji."

	para "Normally, I woudn't"
	line "let people into my"
	cont "house, but I can"
	cont "sense that you are"
	cont "a kind soul."

	para "So long as you do"
	line "not harm the"
	cont "#mon here,"

	para "you are permitted"
	line "to stay."

	para "In exchange for"
	line "your kindness to"
	cont "#mon, I can"
	cont "teach you a tune"
	cont "to awaken sleeping"
	cont "#mon."

	para "Whistle it, and"
	line "even the heaviest"
	cont "sleeper will wake."
	done

MrFujisHouseMrFujiText2:
	text "A truly dreadful"
	line "situation our"
	cont "region has been in"
	cont "recently."

	para "I do all that I"
	line "can to help out"
	cont "others."

	para "Even if it doesn't"
	line "mean much in the"
	cont "long-run."
	done

MrFujisHouseMrFujiText3:
	text "Mr. Fuji: Hm?"

	para "T-t-that #mon…"

	para "W-where did you"
	line "get it?"

	para "…The cave in"
	line "Cerulean City?"

	para "Of course. It"
	line "sought solitude."

	para "I suppose I should"
	line "tell you the truth"
	cont "about myself."

	para "I am…"

	para "I WAS Dr. Fuji,"
	line "one of the heads"
	cont "of the Mewtwo"
	cont "project."

	para "We sought to"
	line "create the most"
	cont "powerful #mon"
	cont "in the world."

	para "I don't know who"
	line "commissioned us."

	para "We didn't question"
	line "the funding."

	para "They simply wanted"
	line "results."

	para "I studied Mewtwo"
	line "enough to know"
	cont "that it was too"
	cont "dangerous."

	para "I fled before the"
	line "project was done."

	para "After I had heard"
	line "about the mansion"
	cont "on Cinnabar Island"
	cont "blowing up,"

	para "I had feared the"
	line "worst…"

	para "I haven't gone"
	line "back, nor do I"
	cont "want to."

	para "At least my"
	line "creation didn't"
	cont "cause any more"
	cont "destruction."

	para "Please keep this a"
	line "secret."

	para "I just want to"
	line "help people and"
	cont "#mon now."

	para "Just treat Mewtwo"
	line "with the kindness"
	cont "it deserves."

	para "Perhaps you can"
	line "keep its power in"
	cont "check."
	done

MrFujisHouseMrFujiText4:
	text "Mr. Fuji: I live"
	line "every single day"
	cont "in regret for my"
	cont "role in that"
	cont "disaster."

	para "I can only hope"
	line "my good deeds here"
	cont "can cleanse me of"
	cont "my past."
	done

MrFujisHouseMrFujiText5:
	text "Mr. Fuji: Please"
	line "don't bring Mewtwo"
	cont "here again."

	para "I can't bear the"
	line "guilt."
	done

LearnedSongOfAwakeningText:
	text "<PLAYER> learned"
	line "the Song of"
	cont "Awakening!"
	done

MrFujisHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAVENDER_TOWN, 2
	warp_event  3,  7, LAVENDER_TOWN, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, MrFujisHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MrFujisHouseBookshelf

	db 6 ; object events
	object_event  7,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrFujisHousePokefanMScript, -1
	object_event  3,  4, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisHouseTeacherScript, -1
	object_event  7,  4, SPRITE_EKANS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MrFujisEkans, -1
	object_event  5,  5, SPRITE_MAROWAK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MrFujisMarowak, -1
	object_event  1,  3, SPRITE_TOGEPI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MrFujisTogepi, -1
	object_event  4,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisHouseMrFuji, -1
