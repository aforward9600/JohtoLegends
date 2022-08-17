	object_const_def ; object_event constants
	const WILDAREA4_YOUNGSTER
	const WILDAREA4_CYNTHIA

WildArea4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea4Youngster:
	jumptextfaceplayer DontLikeSandText

WildArea4CynthiaScript:
	playmusic MUSIC_CYNTHIA_ENCOUNTER
	faceplayer
	opentext
	writetext HaveThisGibleText
	yesorno
	iffalse .DidntTakeGible
	special GiveShuckle
	iffalse .partyfullGible
	writetext TakeCareOfGibleText
	buttonsound
	waitsfx
	writetext GotGibleText
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_GOT_SHUCKIE
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear WILDAREA4_CYNTHIA
	pause 15
	setevent EVENT_WILD_AREA_CYNTHIA
	clearevent EVENT_RUINS_OF_ALPH_CYNTHIA
	special FadeInQuickly
	special FadeOutMusic
	pause 5
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.DidntTakeGible
	writetext ComeBackAnyTimeText
	waitbutton
	closetext
	special FadeOutMusic
	pause 5
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.partyfullGible
	writetext CynthiaPartyIsFullText
	waitbutton
	closetext
	special FadeOutMusic
	pause 5
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

WildArea4Sign:
	jumptext WildArea4SignText

DontLikeSandText:
	text "I don't like sand."

	para "It's coarse and"
	line "and rough and"
	cont "irritating and"
	cont "it gets every-"
	cont "where."

	para "So why am I"
	line "here?"

	para "I want a Cacnea."
	done

HaveThisGibleText:
	text "We meet again."

	para "The Wild Area is"
	line "full of unique"
	cont "and beautiful"
	cont "#mon."

	para "Some #mon here"
	line "are quite rare,"
	cont "such as this"
	cont "Gible I have."

	para "I raised this one"
	line "from an Egg along-"
	cont "side my other one."

	para "I don't want it to"
	line "feel neglected, so"
	cont "would you please"
	cont "take it?"
	done

CynthiaPartyIsFullText:
	text "How do you expect"
	line "to carry this"
	cont "Gible if your"
	cont "party is full?"
	done

TakeCareOfGibleText:
	text "Thank you."

	para "Take good care"
	line "of Gible for me."

	para "I'll be heading"
	line "to the Ruins of"
	cont "Alph next."

	para "Hopefully that"
	line "guy still isn't"
	cont "rambling about"
	cont "punching trees."

	para "Maybe the next"
	line "time we meet,"
	cont "Gible will be"
	cont "stronger."

	para "Farewell."
	done

GotGibleText:
	text "<PLAYER> received a"
	line "Gible!"
	done

ComeBackAnyTimeText:
	text "I'll be here when-"
	line "ever you want"
	cont "this Gible."

	para "I'm not going"
	line "anywhere."
	done

WildArea4SignText:
	text "Area 4"

	para "A man-made desert"
	line "for #mon to"
	cont "enjoy."
	done

WildArea4_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  6, WILD_AREA_1, 7
	warp_event 13,  7, WILD_AREA_1, 8
	warp_event  6,  0, WILD_AREA_5, 3
	warp_event  7,  0, WILD_AREA_5, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 9, 2, BGEVENT_READ, WildArea4Sign

	db 2 ; object events
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WildArea4Youngster, -1
	object_event  8,  5, SPRITE_CYNTHIA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WildArea4CynthiaScript, EVENT_WILD_AREA_CYNTHIA
