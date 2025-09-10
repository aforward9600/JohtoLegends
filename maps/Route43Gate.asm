ROUTE43GATE_TOLL EQU 1000

	object_const_def ; object_event constants
	const ROUTE43GATE_OFFICER

Route43Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OfficerScript_GuardWithSludgeBomb:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM36_SLUDGE_BOMB
	iftrue .GotSludgeBomb
	writetext OfficerText_FoundTM
	buttonsound
	verbosegiveitem TM_POWERUPPUNCH
	setevent EVENT_GOT_TM36_SLUDGE_BOMB
	closetext
	end

.GotSludgeBomb:
	writetextend OfficerText_AvoidGrass

OfficerText_FoundTM:
	text "You're the first"
	line "person to come to"
	cont "this new gate!"

	para "Here, I want you"
	line "have this TM!"
	done

Text_ReceivedTM30:
	text "<PLAYER> received"
	line "TM58."
	done

OfficerText_AvoidGrass:
	text "It's PowerUpPunch!"
	line "Your #mon gets"
	cont "stronger with each"
	cont "hit!"
	done

Route43Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_43, 4
	warp_event  5,  0, ROUTE_43, 5
	warp_event  4,  7, ROUTE_43, 3
	warp_event  5,  7, ROUTE_43, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OfficerScript_GuardWithSludgeBomb, -1
