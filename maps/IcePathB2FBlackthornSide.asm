	object_const_def ; object_event constants
	const ICEPATHB2FBLACKTHORNSIDE_POKE_BALL1
	const ICEPATHB2FBLACKTHORNSIDE_POKE_BALL2
	const ICEPATHB2FBLACKTHORNSIDE_ROCK

IcePathB2FBlackthornSide_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcePathB2FBlackthornSidePotion:
	itemball POTION

IcePathB2FBlackthornSideEscapeRope:
	itemball ESCAPE_ROPE

IcePathB2FBlackthornSideHiddenIceHeal:
	hiddenitem ICE_HEAL, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_HIDDEN_ICE_HEAL

IcePathB2FBlackthornRock:
	jumpstd smashrock

IcePathB2FBlackthornSide_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, ICE_PATH_B1F, 4
	warp_event  3,  3, ICE_PATH_B3F, 2
	warp_event  6,  0, ICE_PATH_B1F, 5

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2, 10, BGEVENT_ITEM, IcePathB2FBlackthornSideHiddenIceHeal

	db 3 ; object events
	object_event  8, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FBlackthornSidePotion, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_POTION
	object_event  5,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FBlackthornSideEscapeRope, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_ESCAPE_ROPE
	object_event  5,  1, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FBlackthornRock, -1
