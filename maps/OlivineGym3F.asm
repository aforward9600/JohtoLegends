	object_const_def ; object_event constants
	const OLIVINEGYM3F_LIFT
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
	checkevent EVENT_OLIVINE_GYM_SECOND_PLATFORM
	iftrue .SecondPlatform
	checkevent EVENT_OLIVINE_GYM_THIRD_PLATFORM
	iftrue .ThirdLift
	checkevent EVENT_OLIVINE_GYM_FOURTH_PLATFORM
	iftrue .FourthLift
	checkevent EVENT_OLIVINE_GYM_FIFTH_PLATFORM
	iftrue .FifthLift
	checkevent EVENT_OLIVINE_GYM_SIXTH_PLATFORM
	iftrue .SixthLift
	return

.NinthElevator2:
	changeblock 16, 2, $97
	checkevent EVENT_OLIVINE_GYM_SECOND_PLATFORM
	iffalse .ThirdLift

.SecondPlatform:
	changeblock 2, 10, $a7
	changeblock 2,  8, $b2
	checkevent EVENT_OLIVINE_GYM_THIRD_PLATFORM
	iffalse .FourthLift

.ThirdLift:
	changeblock 4, 0, $b0
	checkevent EVENT_OLIVINE_GYM_FOURTH_PLATFORM
	iffalse .FifthLift

.FourthLift:
	changeblock 8, 0, $ae
	changeblock 10, 0, $b0
	checkevent EVENT_OLIVINE_GYM_FIFTH_PLATFORM
	iffalse .SixthLift

.FifthLift:
	changeblock 14, 8, $a6
	changeblock 14, 10, $b1
	checkevent EVENT_OLIVINE_GYM_SIXTH_PLATFORM
	iftrue .SixthLift
	sjump .Finish

.SixthLift:
	checkevent EVENT_OLIVINE_GYM_SIXTH_PLATFORM
	iffalse .Finish
	changeblock 16, 10, $a7
	changeblock 16,  8, $b2
.Finish
	return

TrainerEngineerRudy:
	trainer ENGINEER, RUDY, EVENT_BEAT_ENGINEER_RUDY, EngineerRudySeenText, EngineerRudyBeatenText, 0, .Script

.Script:
	refreshscreen $86
	changeblock 14, 8, $b2
	changeblock 14, 10, $a7
	reloadmappart
	endifjustbattled
	jumptext EngineerRudyAfterBattleText

EighthElevator:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 3, 12
	appear OLIVINEGYM3F_LIFT
	changeblock 2, 12, $8c
	scall OlivineDownElevator
	clearevent EVENT_GYM_EIGHTH_ELEVATOR
	warp OLIVINE_GYM_2F, 2, 12
	end

NinthElevator:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 16, 3
	appear OLIVINEGYM3F_LIFT
	changeblock 16, 2, $b3
	scall OlivineDownElevator2
	setevent EVENT_GYM_NINTH_ELEVATOR
	warp OLIVINE_GYM_2F, 15, 3
	end

ThirdLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 6, 12
	appear OLIVINEGYM3F_LIFT
	changeblock 6, 12, $ac
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymRight3Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 8, 12, $ab
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	end

FourthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 9, 12
	appear OLIVINEGYM3F_LIFT
	changeblock 8, 12, $ac
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymLeft3Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 6, 12, $ad
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	end

FifthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 2, 11
	appear OLIVINEGYM3F_LIFT
	changeblock 2, 10, $a7
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymUp3Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 2, 8, $b2
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	setevent EVENT_OLIVINE_GYM_SECOND_PLATFORM
	end

SixthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 2, 8
	appear OLIVINEGYM3F_LIFT
	changeblock 2, 8, $a6
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymDown3Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 2, 10, $b1
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	clearevent EVENT_OLIVINE_GYM_SECOND_PLATFORM
	end

SeventhLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 6, 6
	appear OLIVINEGYM3F_LIFT
	changeblock 6, 6, $ac
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymRight5Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 10, 6, $ab
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	end

EighthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 11, 6
	appear OLIVINEGYM3F_LIFT
	changeblock 10, 6, $ac
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymLeft5Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 6, 6, $ad
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	end

NinthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 4, 1
	appear OLIVINEGYM3F_LIFT
	changeblock 4, 0, $a9
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymRight1Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 4, 0, $b0
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	setevent EVENT_OLIVINE_GYM_THIRD_PLATFORM
	end

TenthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 5, 1
	appear OLIVINEGYM3F_LIFT
	changeblock 4, 0, $a9
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymLeft1Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 4, 0, $af
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	clearevent EVENT_OLIVINE_GYM_THIRD_PLATFORM
	end

EleventhLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 9, 1
	appear OLIVINEGYM3F_LIFT
	changeblock 8, 0, $ae
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymRight2Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 10, 0, $b0
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	setevent EVENT_OLIVINE_GYM_FOURTH_PLATFORM
	end

TwelfthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 11, 1
	appear OLIVINEGYM3F_LIFT
	changeblock 10, 0, $a9
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymLeft2Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 8, 0, $a5
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	clearevent EVENT_OLIVINE_GYM_FOURTH_PLATFORM
	end

ThirteenthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 14, 8
	appear OLIVINEGYM3F_LIFT
	changeblock 14, 8, $a6
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymDown3Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 14, 10, $b1
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	setevent EVENT_OLIVINE_GYM_FIFTH_PLATFORM
	end

FourteenthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 14, 11
	appear OLIVINEGYM3F_LIFT
	changeblock 14, 10, $a7
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymUp3Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 14, 8, $b2
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	clearevent EVENT_OLIVINE_GYM_FIFTH_PLATFORM
	end

FifteenthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 16, 11
	appear OLIVINEGYM3F_LIFT
	changeblock 16, 10, $a7
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymUp3Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 16, 8, $b2
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	setevent EVENT_OLIVINE_GYM_SIXTH_PLATFORM
	end

SixteenthLift:
	refreshscreen
	moveobject OLIVINEGYM3F_LIFT, 16, 8
	appear OLIVINEGYM3F_LIFT
	changeblock 16, 8, $a6
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM3F_LIFT
	applymovement PLAYER, OlivineGymDown3Movement
	stopfollow PLAYER, OLIVINEGYM3F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 16, 10, $b1
	moveobject OLIVINEGYM3F_LIFT, 99, 99
	disappear OLIVINEGYM3F_LIFT
	reloadmappart
	clearevent EVENT_OLIVINE_GYM_SIXTH_PLATFORM
	end

OlivineGymDown5Movement:
	fix_facing
	set_sliding
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymDown3Movement:
	fix_facing
	set_sliding
	step DOWN
	step DOWN
	step DOWN
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymUp5Movement:
	fix_facing
	set_sliding
	step UP
	step UP
	step UP
	step UP
	step UP
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymUp3Movement:
	fix_facing
	set_sliding
	step UP
	step UP
	step UP
	remove_sliding
	remove_fixed_facing
	step_end

EngineerRudySeenText:
	text "You're almost to"
	line "the top floor."

	para "How 'bout a battle"
	line "before you face"
	cont "the leader?"
	done

EngineerRudyBeatenText:
	text "I'd say you're"
	line "ready for Opal!"
	done

EngineerRudyAfterBattleText:
	text "The lifts were her"
	line "idea."

	para "We had a big part"
	line "in building them."
	done

OlivineGym3F_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 16 ; coord events
	coord_event  3, 12, SCENE_DEFAULT, EighthElevator
	coord_event 16,  3, SCENE_DEFAULT, NinthElevator
	coord_event  6, 12, SCENE_DEFAULT, ThirdLift
	coord_event  9, 12, SCENE_DEFAULT, FourthLift
	coord_event  2, 11, SCENE_DEFAULT, FifthLift
	coord_event  2,  8, SCENE_DEFAULT, SixthLift
	coord_event  6,  6, SCENE_DEFAULT, SeventhLift
	coord_event 11,  6, SCENE_DEFAULT, EighthLift
	coord_event  4,  1, SCENE_DEFAULT, NinthLift
	coord_event  5,  1, SCENE_DEFAULT, TenthLift
	coord_event  9,  1, SCENE_DEFAULT, EleventhLift
	coord_event 11,  1, SCENE_DEFAULT, TwelfthLift
	coord_event 14,  8, SCENE_DEFAULT, ThirteenthLift
	coord_event 14, 11, SCENE_DEFAULT, FourteenthLift
	coord_event 16, 11, SCENE_DEFAULT, FifteenthLift
	coord_event 16,  8, SCENE_DEFAULT, SixteenthLift

	db 0 ; bg events

	db 2 ; object events
	object_event 99, 99, SPRITE_LIFT, SPRITEMOVEDATA_LIFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7,  0, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerEngineerRudy, -1
