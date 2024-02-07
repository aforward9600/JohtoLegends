	object_const_def ; object_event constants
	const BLUESHOUSE_DAISY
	const BLUESHOUSE_BLUESMOM

BluesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisyScript:
	jumptextfaceplayer HiImDaisyText

DaisysMomScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .DaisysMomScript2
	writetext DaisysMomText
	waitbutton
	closetext
	end
.DaisysMomScript2:
	writetext DaisysMomText2
	waitbutton
	closetext
	end

HiImDaisyText:
	text "Hi! I'm Daisy!"
	done

DaisysMomText:
	text "My boyfriend is on"
	line "a journey with his"
	cont "childhood friend"
	cont "from next door."

	para "I'm not too worried"
	line "about him."

	para "They're both strong"
	line "trainers."

	para "Getting back is a"
	line "different issue…"
	done

DaisysMomText2:
	text "I just got word."

	para "They're both on"
	line "their way back."

	para "Thank goodness."
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, RedsHouse1FTV

	db 2 ; object events
	object_event  6,  4, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
	object_event  2,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisysMomScript, -1
