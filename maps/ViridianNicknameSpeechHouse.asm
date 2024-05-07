	object_const_def ; object_event constants
	const VIRIDIANNICKNAMESPEECHHOUSE_POKEFAN_M
	const VIRIDIANNICKNAMESPEECHHOUSE_LASS
	const VIRIDIANNICKNAMESPEECHHOUSE_SPEARY

ViridianNicknameSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianNicknameSpeechHousePokefanMScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .ViridianNicknameSpeechHousePokefanMScript2
	jumptextfaceplayer ViridianNicknameSpeechHousePokefanMText

.ViridianNicknameSpeechHousePokefanMScript2:
	jumptextfaceplayer ViridianNicknameSpeechHousePokefanMText2

ViridianNicknameSpeechHouseLassScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .ViridianNicknameSpeechHouseLassScript2
	jumptextfaceplayer ViridianNicknameSpeechHouseLassText

.ViridianNicknameSpeechHouseLassScript2:
	jumptextfaceplayer ViridianNicknameSpeechHouseLassText2

Speary:
	refreshscreen
	pokepic SPEAROW
	cry SPEAROW
	waitbutton
	closepokepic
	opentext
	writetext SpearyText
	waitbutton
	closetext
	end

ViridianNicknameSpeechHousePokefanMText:
	text "I love my Spearow,"
	line "but with my wife"
	cont "expecting, I don't"
	cont "think Spearow can"
	cont "defend us alone."

	para "Maybe I need a"
	line "Rattata too!"
	done

ViridianNicknameSpeechHousePokefanMText2:
	text "I think I'll still"
	line "get that Rattata!"
	done

ViridianNicknameSpeechHouseLassText:
	text "I'm really nervous"
	line "about bringing a"
	cont "child into this"
	cont "world…"

	para "Especially now…"
	done

ViridianNicknameSpeechHouseLassText2:
	text "Looks like it'll be"
	line "safer to raise a"
	cont "child now."
	done

SpearyText:
	text "Spearow: Ch-chun!"
	done

ViridianNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIRIDIAN_CITY, 2
	warp_event  3,  7, VIRIDIAN_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHousePokefanMScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHouseLassScript, -1
	object_event  5,  2, SPRITE_SPEAROW, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Speary, -1
