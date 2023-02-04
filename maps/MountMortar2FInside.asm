	object_const_def ; object_event constants
	const MOUNTMORTAR2FINSIDE_POKE_BALL1
	const MOUNTMORTAR2FINSIDE_POKE_BALL2
	const MOUNTMORTAR2FINSIDE_POKE_BALL3
	const MOUNTMORTAR2FINSIDE_POKE_BALL4
	const MOUNTMORTAR2FINSIDE_POKE_BALL5
	const MOUNTMORTAR2FINSIDE_POKE_BALL6
	const MOUNTMORTAR2FINSIDE_BURGLAR

MountMortar2FInside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBurglarLocke:
	trainer BURGLAR, LOCKE, EVENT_BEAT_BURGLAR_LOCKE, BurglarLockeSeenText, BurglarLockeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarLockeAfterBattleText
	waitbutton
	closetext
	end

MountMortar2FInsideMaxPotion:
	itemball MAX_POTION

MountMortar2FInsideRareCandy:
	itemball RARE_CANDY

MountMortar2FInsideTMDefenseCurl:
	itemball TM_VENOSHOCK

MountMortar2FInsideDragonScale:
	itemball DRAGON_SCALE

MountMortar2FInsideElixer:
	itemball ELIXER

MountMortar2FInsideEscapeRope:
	itemball ESCAPE_ROPE

MountMortar2FInsideHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_MOUNT_MORTAR_2F_INSIDE_HIDDEN_FULL_RESTORE

BurglarLockeSeenText:
	text "I came here to"
	line "find someone who"
	cont "will give me an"
	cont "item, but I seem"
	cont "to be lost."
	done

BurglarLockeBeatenText:
	text "Yep, I'm lost."
	done

BurglarLockeAfterBattleText:
	text "Ok, you got me. I"
	line "was actually going"
	cont "to mug them for"
	cont "the item."

	para "I am a burglar,"
	line "after all."
	done

MountMortar2FInside_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 33, MOUNT_MORTAR_1F_OUTSIDE, 4
	warp_event  3,  5, MOUNT_MORTAR_1F_INSIDE, 6

	db 0 ; coord events

	db 1 ; bg events
	bg_event 24,  8, BGEVENT_ITEM, MountMortar2FInsideHiddenFullRestore

	db 7 ; object events
	object_event 28, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideMaxPotion, EVENT_MOUNT_MORTAR_2F_INSIDE_MAX_POTION
	object_event  2, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideRareCandy, EVENT_MOUNT_MORTAR_2F_INSIDE_RARE_CANDY
	object_event 19, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideTMDefenseCurl, EVENT_MOUNT_MORTAR_2F_INSIDE_TM_DEFENSE_CURL
	object_event 16,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideDragonScale, EVENT_MOUNT_MORTAR_2F_INSIDE_DRAGON_SCALE
	object_event  9, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideElixer, EVENT_MOUNT_MORTAR_2F_INSIDE_ELIXER
	object_event 28,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideEscapeRope, EVENT_MOUNT_MORTAR_2F_INSIDE_ESCAPE_ROPE
	object_event 13, 26, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBurglarLocke, -1
