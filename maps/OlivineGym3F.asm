	object_const_def ; object_event constants
	const OLIVINEGYM3F_ENGINEER

OlivineGym3F_MapScripts:
	db 2 ; scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Elevators3F

.DummyScene0:
	end

.DummyScene1:
	end

.Elevators3F:
	checkevent EVENT_GYM_NINTH_ELEVATOR
	iftrue .NinthElevator2
	return

.NinthElevator2:
	changeblock 16, 2, $97
	return

TrainerEngineerRudy:
	trainer ENGINEER, RUDY, EVENT_BEAT_ENGINEER_RUDY, EngineerRudySeenText, EngineerRudyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetextend EngineerRudyAfterBattleText

EighthElevator:
	scall OlivineElevatorEffect
	clearevent EVENT_GYM_EIGHTH_ELEVATOR
	warp OLIVINE_GYM_2F, 2, 12
	end

NinthElevator:
	scall OlivineElevatorEffect
	setevent EVENT_GYM_NINTH_ELEVATOR
	warp OLIVINE_GYM_2F, 15, 3
	end

EngineerRudySeenText:
	text "You're almost to"
	line "the top floor."

	para "How 'bout a battle"
	line "before you face"
	cont "the leader?"
	done

EngineerRudyBeatenText:
	text "I'd say you're"
	line "ready for Byron!"
	done

EngineerRudyAfterBattleText:
	text "The lifts were his"
	line "idea."

	para "We had a big part"
	line "in building them."
	done

OlivineGym3F_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 2 ; coord events
	coord_event  3, 12, SCENE_DEFAULT, EighthElevator
	coord_event 16,  3, SCENE_DEFAULT, NinthElevator

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  0, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerEngineerRudy, -1
