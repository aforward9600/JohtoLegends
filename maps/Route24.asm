	object_const_def ; object_event constants
	const ROUTE24_ROCKET

Route24_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24RoughneckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SENSATIONAL_SISTERS
	iftrue .Route24RoughneckAfter
	writetext Route24RoughneckText1
	waitbutton
	closetext
	end

.Route24RoughneckAfter:
	writetext Route24RoughneckText2
	waitbutton
	closetext
	end

Route24RoughneckText1:
	text "Sorry, but I'm not"
	line "up to battling"
	cont "today."

	para "I'm just enjoying"
	line "the fresh air."
	done

Route24RoughneckText2:
	text "You know, maybe I"
	line "should quit the"
	cont "Feds and find a"
	cont "new career."
	done

Route24_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8,  7, SPRITE_ROUGHNECK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RoughneckScript, -1
