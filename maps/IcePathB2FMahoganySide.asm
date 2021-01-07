	object_const_def ; object_event constants
	const ICEPATHB2FMAHOGANYSIDE_POKE_BALL1
	const ICEPATHB2FMAHOGANYSIDE_POKE_BALL2

IcePathB2FMahoganySide_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcePathB2FMahoganySideIceHeal:
	itemball ICE_HEAL

IcePathB2FMahoganySideIceStone:
	itemball ICE_STONE

IcePathB2FMahoganySideHiddenCarbos:
	hiddenitem CARBOS, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_HIDDEN_CARBOS

IcePathB2FMahoganySide_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17,  1, ICE_PATH_B1F, 2
	warp_event  9, 11, ICE_PATH_B3F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  0, 15, BGEVENT_ITEM, IcePathB2FMahoganySideHiddenCarbos

	db 2 ; object events
	object_event 17, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FMahoganySideIceHeal, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_FULL_HEAL
	object_event  0, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FMahoganySideIceStone, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_MAX_POTION
