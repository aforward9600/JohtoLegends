	object_const_def ; object_event constants
	const COPYCATSHOUSE1F_POKEFAN_M
	const COPYCATSHOUSE1F_POKEFAN_F
	const COPYCATSHOUSE1F_CLEFAIRY

CopycatsHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CopycatsHouse1FPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .ReturnedMachinePart
	writetext CopycatsHouse1FPokefanMText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CopycatsHouse1FPokefanMText2
	waitbutton
	closetext
	end

CopycatsHouse1FPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .ReturnedMachinePart
	writetext CopycatsHouse1FPokefanFText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CopycatsHouse1FPokefanFText2
	waitbutton
	closetext
	end

CopycatsHouse1FBlisseyScript:
	refreshscreen
	pokepic CHANSEY
	cry CHANSEY
	waitbutton
	closepokepic
	opentext
	writetext CopycatsHouse1FBlisseyText
	waitbutton
	closetext
	end

CopycatsHouse1FPokefanMText:
	text "We want to have a"
	line "child someday,"

	para "but these Feds"
	line "make it too"
	cont "dangerous to"
	cont "start a family."
	done

CopycatsHouse1FPokefanMText2:
	text "Maybe we can start"
	line "our family soon."
	done

CopycatsHouse1FPokefanFText:
	text "I wouldn't want to"
	line "raise a daughter"
	cont "in this region"
	cont "right now…"
	done

CopycatsHouse1FPokefanFText2:
	text "I really hope we"
	line "have a girl."
	done

CopycatsHouse1FBlisseyText:
	text "Chansey: Chans!"
	done

CopycatsHouse1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFFRON_CITY, 7
	warp_event  3,  7, SAFFRON_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanMScript, -1
	object_event  5,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanFScript, -1
	object_event  6,  6, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FBlisseyScript, -1
