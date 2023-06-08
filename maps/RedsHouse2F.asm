RedsHouse2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RedsHouse2FN64Script:
	jumptext RedsHouse2FN64Text

RedsHouse2FN64Text:
	text "<PLAYER> played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, REDS_HOUSE_1F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  5, BGEVENT_READ, RedsHouse2FN64Script

	db 0 ; object events
