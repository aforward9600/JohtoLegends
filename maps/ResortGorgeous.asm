	object_const_def ; object_event constants
	const RESORTGORGEOUS_SCIENTIST
	const RESORTGORGEOUS_YOUNGSTER

ResortGorgeous_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerYoungsterJorge:
	trainer YOUNGSTER, JORGE, EVENT_BEAT_YOUNGSTER_JORGE, YoungsterJorgeSeenText, YoungsterJorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext YoungsterJorgeAfterText

ResortGorgeousScientistScript:
	faceplayer
	opentext
	checkevent EVENT_CAUGHT_REGIELEKI
	iftrue .NoElectricalInterference
	checkevent EVENT_BEAT_REGIELEKI
	iftrue .NoElectricalInterference
	writetextend ResortGorgeousScientistText1

.NoElectricalInterference:
	writetextend ResortGorgeousScientistText2

ResortGorgeousSign:
	jumptext ResortGorgeousSignText

ResortGorgeousHiddenStardust:
	hiddenitem STARDUST, EVENT_RESORT_GORGEOUS_STARDUST

YoungsterJorgeSeenText:
	text "I've been trying to"
	line "Selphy to date me,"

	para "but I'm not rich"
	line "enough!"
	done

YoungsterJorgeBeatenText:
	text "I give up…"
	done

YoungsterJorgeAfterText:
	text "She's too high"
	line "maintenance for"
	cont "me."
	done

ResortGorgeousScientistText1:
	text "There is a lot of"
	line "electrical"
	cont "interference in"
	cont "this cave."

	para "It doesnt' help"
	line "that the openings"
	cont "don't have a"
	cont "logical path."
	done

ResortGorgeousScientistText2:
	text "The interference"
	line "gone now…"

	para "How strange…"
	done

ResortGorgeousSignText:
	text "Selphy's house"
	done

ResortGorgeous_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 25,  9, SELPHYS_HOUSE, 1
	warp_event 42,  9, LOST_CAVE_ENTRANCE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 26, 10, BGEVENT_READ, ResortGorgeousSign
	bg_event  7,  7, BGEVENT_ITEM, ResortGorgeousHiddenStardust

	db 3 ; object events
	object_event 43, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ResortGorgeousScientistScript, -1
	object_event 20,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerYoungsterJorge, -1
	