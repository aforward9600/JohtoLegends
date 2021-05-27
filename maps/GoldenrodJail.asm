	object_const_def ; object_event constants
	const GOLDENRODJAIL_OFFICER
	const GOLDENRODJAIL_ROCKET
	const GOLDENRODJAIL_BURGLAR

GoldenrodJail_MapScripts:
	db 0  ; scene scripts

	db 0 ; callbacks

GoldenrodJailOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PORYGON_R
	iftrue .RocketInJail
	writetext PlentyOfCrimeLatelyText
	waitbutton
	closetext
	end

.RocketInJail:
	writetext GotHimselfCaughtText
	waitbutton
	closetext
	end

PlentyOfCrimeLatelyText:
	text "The chief has been"
	line "pretty busy as of"
	cont "late."

	para "There's plenty of"
	line "crime recently,"
	cont "and there's not"
	cont "much time to goof"
	cont "off."

	para "If you see anyone"
	line "suspicious, let us"
	cont "know, OK?"
	done

GotHimselfCaughtText:
	text "You're not going"
	line "to believe this!"

	para "We caught one of"
	line "those guys that"
	cont "were involved in"
	cont "the Lighthouse"
	cont "invasion!"

	para "He says he quit"
	line "before that, but"
	cont "we found him in"
	cont "the uniform."

	para "Oh well."

	para "Guess he should"
	line "have gotten rid"
	cont "of his uniform"
	cont "beforehand."
	done

GoldenrodJail_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 12, GOLDENROD_CITY, 5
	warp_event  3, 12, GOLDENROD_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodJailOfficerScript, -1
	object_event  4,  3, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_JAILED_ROCKET
	object_event 10,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
