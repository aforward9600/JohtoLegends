	object_const_def ; object_event constants
	const ROUTE12SUPERRODHOUSE_ROCKER

Route12SuperRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route12SuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .GotSuperRod
	writetextend OfferSuperRodText

.GotSuperRod:
	writetextend GaveSuperRodText

OfferSuperRodText:
	text "It used to be so"
	line "quiet out here."

	para "Ever since the"
	line "revolution,"
	cont "it's been noisy!"

	para "I just want some"
	line "peace!"
	done

GaveSuperRodText:
	text "Maybe the peace"
	line "and quiet will"
	cont "return soon."
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_12, 1
	warp_event  5,  7, ROUTE_12, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  3, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1
