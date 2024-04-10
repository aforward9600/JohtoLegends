	object_const_def ; object_event constants
	const MOUNTMOON_DRAGON_TAMER_M
	const MOUNTMOON_DRAGON_TAMER_F

MountMoon_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DragonTamerMDarby:
	trainer DRAGON_TAMER_M, DARBY, EVENT_BEAT_DRAGON_TAMER_M_DARBY, DragonTamerMDarbySeenText, DragonTamerMDarbyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DragonTamerMDarbyAfterText
	waitbutton
	closetext
	end

DragonTamerFDoris:
	trainer DRAGON_TAMER_F, DORIS_TAMER, EVENT_BEAT_DRAGON_TAMER_F_DORIS, DragonTamerFDorisSeenText, DragonTamerFDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DragonTamerFDorisAfterText
	waitbutton
	closetext
	end

DragonTamerMDarbySeenText:
	text "<PLAYER>, is that"
	line "you?"

	para "Wow, you've grown"
	line "up!"
	done

DragonTamerMDarbyBeatenText:
	text "Just as strong as"
	line "I remember!"
	done

DragonTamerMDarbyAfterText:
	text "Doris and I have"
	line "been here since"
	cont "the takeover began"
	cont "two years ago."

	para "We came here to"
	line "rebuild after the"
	cont "war,"

	para "but now we're"
	line "stuck here."

	para "We'll have to help"
	line "rebuild again"
	cont "after all this…"
	done

DragonTamerFDorisSeenText:
	text "<PLAYER>! It's been"
	line "years since we've"
	cont "seen each other!"
	done

DragonTamerFDorisBeatenText:
	text "You've gotten"
	line "stronger!"
	done

DragonTamerFDorisAfterText:
	text "Darby and I have"
	line "been stuck here"
	cont "since then."

	para "We help keep Mt."
	line "Moon safe from the"
	cont "Feds, alongside"
	cont "the Clefairy."

	para "I hope we can go"
	line "home and see the"
	cont "Master and every-"
	cont "one else soon…"
	done

MountMoon_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  3,  3, ROUTE_3, 1
	warp_event 15, 15, ROUTE_4, 1
	warp_event 13,  3, MOUNT_MOON, 7
	warp_event 15, 11, MOUNT_MOON, 8
	warp_event 25,  5, MOUNT_MOON_SQUARE, 1
	warp_event 25, 15, MOUNT_MOON_SQUARE, 2
	warp_event 25,  3, MOUNT_MOON, 3
	warp_event 25, 13, MOUNT_MOON, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  5, SPRITE_DRAGON_TAMER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, DragonTamerMDarby, -1
	object_event  6, 13, SPRITE_DRAGON_TAMER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, DragonTamerFDoris, -1
