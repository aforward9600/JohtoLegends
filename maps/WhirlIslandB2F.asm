	object_const_def ; object_event constants
	const WHIRLISLANDB2F_POKE_BALL1
	const WHIRLISLANDB2F_POKE_BALL2
	const WHIRLISLANDB2F_POKE_BALL3
	const WHIRLISLANDB2F_SAGE
	const WHIRLISLANDB2F_SAGE2

WhirlIslandB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandB2FFullRestore:
	itemball FULL_RESTORE

WhirlIslandB2FMaxRevive:
	itemball MAX_REVIVE

WhirlIslandB2FMaxElixer:
	itemball MAX_ELIXER

WhirlIslandSageScript:
	jumptextfaceplayer WhirlIslandSageText

WhirlIslandSage2Script:
	checkevent EVENT_CAUGHT_LUGIA
	iftrue .SafeWithYou
	checkevent EVENT_RIVAL_GIVES_UP_LUGIA
	iftrue .ItsWaitingForYou
	checkevent EVENT_CAUGHT_HO_OH
	iftrue .SafeWithYourFriend
	checkevent EVENT_CLEARED_TIN_TOWER
	iftrue .ICouldntDoAnything
	jumptextfaceplayer WhirlIslandSage2Text

.ICouldntDoAnything:
	jumptextfaceplayer ICouldntDoAnythingText

.SafeWithYou:
	jumptextfaceplayer SafeWithYouText

.SafeWithYourFriend:
	jumptextfaceplayer SafeWithYourFriendText

.ItsWaitingForYou:
	jumptextfaceplayer ItsWaitingForYouText

WhirlIslandSageText:
	text "I'm sorry, but you"
	line "cannot go through"
	cont "here."
	done

WhirlIslandSage2Text:
	text "Welcome, young"
	line "trainer."
	done

ICouldntDoAnythingText:
	text "I'm sorry…"

	para "I couldn't do"
	line "anything to stop"
	cont "them…"
	done

SafeWithYouText:
	text "Lugia is safe with"
	line "you."

	para "I can feel it."
	done

SafeWithYourFriendText:
	text "Lugia is safe with"
	line "your friend."

	para "I can feel it."
	done

ItsWaitingForYouText:
	text "Lugia is waiting"
	line "for you."

	para "Don't disappoint"
	line "it."
	done

WhirlIslandB2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 11,  5, WHIRL_ISLAND_B1F, 7
	warp_event  7, 11, WHIRL_ISLAND_B1F, 8
	warp_event  7, 25, WHIRL_ISLAND_LUGIA_CHAMBER, 1
	warp_event 13, 31, WHIRL_ISLAND_SW, 5

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 10, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FFullRestore, EVENT_WHIRL_ISLAND_B2F_FULL_RESTORE
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FMaxRevive, EVENT_WHIRL_ISLAND_B2F_MAX_REVIVE
	object_event  5, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FMaxElixer, EVENT_WHIRL_ISLAND_B2F_MAX_ELIXER
	object_event  7, 26, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhirlIslandSageScript, EVENT_WHIRL_ISLAND_SAGE_1
	object_event  8, 26, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhirlIslandSage2Script, EVENT_WHIRL_ISLAND_SAGE_2
