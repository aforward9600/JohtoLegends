LighthouseElevator_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LighthouseElevatorScript:
	opentext
	elevator LighthouseElevatorData
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
.Done:
	end

LighthouseElevatorData:
	db 2 ; floors
	elevfloor FLOOR_1F,  4, OLIVINE_LIGHTHOUSE_1F
	elevfloor FLOOR_6F,  1, OLIVINE_LIGHTHOUSE_6F
	db -1 ; end

LighthouseElevator_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, OLIVINE_LIGHTHOUSE_1F, -1
	warp_event  2,  3, OLIVINE_LIGHTHOUSE_1F, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, LighthouseElevatorScript

	db 0 ; object events
