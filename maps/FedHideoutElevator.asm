FedHideoutElevator_MapScripts:
	db 0 ; scene scripts

	db ; callbacks

FedHideoutElevatorScript:
	opentext
	checkevent EVENT_ENTERED_ELEVATOR_PASSWORD
	iffalse .NoPasswordEntered
	elevator FedHideoutElevatorData
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
.Done:
	end

.NoPasswordEntered:
	checkevent EVENT_GOT_ELEVATOR_PASSWORD
	iftrue .GotPassword
	writetext NoElevatorPasswordText
	waitbutton
	closetext
	end

.GotPassword:
	writetext EnteredElevatorPasswordText
	waitbutton
	closetext
	setevent EVENT_ENTERED_ELEVATOR_PASSWORD
	pause 5
	playsound SFX_PUSH_BUTTON
	waitsfx
	end

FedHideoutElevatorData:
	db 3 ; floors
	elevfloor FLOOR_B1F, 3, FED_HIDEOUT_B1F
	elevfloor FLOOR_B2F, 3, FED_HIDEOUT_B2F
	elevfloor FLOOR_B4F, 2, FED_HIDEOUT_B4F
	db -1 ; end

NoElevatorPasswordText:
	text "Looks like this"
	line "elevator needs a"
	cont "password…"
	done

EnteredElevatorPasswordText:
	text "<PLAYER> entered"
	line "the password…"

	para "…The panel was"
	line "unlocked!"
	done

FedHideoutElevator_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  2, FED_HIDEOUT_B1F, -1
	warp_event  3,  2, FED_HIDEOUT_B1F, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  1,  1, BGEVENT_READ, FedHideoutElevatorScript

	db 0 ; object events
