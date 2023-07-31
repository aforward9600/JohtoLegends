	object_const_def ; object_event constants
	const ROUTE6SAFFRONGATE_OFFICER

Route6SaffronGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

Route6SaffronGuardScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .ReturnedPart
	writetext Route6SaffronGuardWelcomeText
	waitbutton
	closetext
	end

.ReturnedPart:
	writetext Route6SaffronGuardMagnetTrainText
	waitbutton
	closetext
	end

Route6SaffronGuardWelcomeText:
	text "Watch out for the"
	line "Feds."

	para "They're a nasty"
	line "bunch."
	done

Route6SaffronGuardMagnetTrainText:
	text "We've got two Gym"
	line "Leaders for now?"

	para "What a time to be"
	line "alive."
	done

Route6SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SAFFRON_CITY, 11
	warp_event  5,  0, SAFFRON_CITY, 12
	warp_event  4,  7, ROUTE_6, 2
	warp_event  5,  7, ROUTE_6, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6SaffronGuardScript, -1
