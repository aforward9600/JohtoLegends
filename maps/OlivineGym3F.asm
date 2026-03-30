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
	return

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
	endifjustbattled
	jumptext EngineerRudyAfterBattleText

EighthElevator:
	scall OlivineDownElevator
	clearevent EVENT_GYM_EIGHTH_ELEVATOR
	warp OLIVINE_GYM_2F, 2, 12
	end

NinthElevator:
	scall OlivineDownElevator
	setevent EVENT_GYM_NINTH_ELEVATOR
	warp OLIVINE_GYM_2F, 15, 3
	end

ThirdLift:
	scall OlivineLiftSprite
	changeblock 6, 12, $ac
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymRight3Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 8, 12, $ab
	scall OlivineRestorePlayerSpriteReloadMap
	end

FourthLift:
	scall OlivineLiftSprite
	changeblock 8, 12, $ac
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymLeft3Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 6, 12, $ad
	scall OlivineRestorePlayerSpriteReloadMap
	end

FifthLift:
	scall OlivineLiftSprite
	changeblock 2, 10, $a7
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymUp3Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 2, 8, $b2
	scall OlivineRestorePlayerSpriteReloadMap
	setevent EVENT_OLIVINE_GYM_SECOND_PLATFORM
	end

SixthLift:
	scall OlivineLiftSprite
	changeblock 2, 8, $a6
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymDown3Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 2, 10, $b1
	scall OlivineRestorePlayerSpriteReloadMap
	clearevent EVENT_OLIVINE_GYM_SECOND_PLATFORM
	end

SeventhLift:
	scall OlivineLiftSprite
	changeblock 6, 6, $ac
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymRight5Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 10, 6, $ab
	scall OlivineRestorePlayerSpriteReloadMap
	end

EighthLift:
	scall OlivineLiftSprite
	changeblock 10, 6, $ac
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymLeft5Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 6, 6, $ad
	scall OlivineRestorePlayerSpriteReloadMap
	end

NinthLift:
	scall OlivineLiftSprite
	changeblock 4, 0, $a9
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymRight1Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 4, 0, $b0
	scall OlivineRestorePlayerSpriteReloadMap
	setevent EVENT_OLIVINE_GYM_THIRD_PLATFORM
	end

TenthLift:
	scall OlivineLiftSprite
	changeblock 4, 0, $a9
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymLeft1Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 4, 0, $af
	scall OlivineRestorePlayerSpriteReloadMap
	clearevent EVENT_OLIVINE_GYM_THIRD_PLATFORM
	end

EleventhLift:
	scall OlivineLiftSprite
	changeblock 8, 0, $ae
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymRight2Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 10, 0, $b0
	scall OlivineRestorePlayerSpriteReloadMap
	setevent EVENT_OLIVINE_GYM_FOURTH_PLATFORM
	end

TwelfthLift:
	scall OlivineLiftSprite
	changeblock 10, 0, $a9
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymLeft2Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 8, 0, $a5
	scall OlivineRestorePlayerSpriteReloadMap
	clearevent EVENT_OLIVINE_GYM_FOURTH_PLATFORM
	end

ThirteenthLift:
	scall OlivineLiftSprite
	changeblock 14, 8, $a6
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymDown3Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 14, 10, $b1
	scall OlivineRestorePlayerSpriteReloadMap
	setevent EVENT_OLIVINE_GYM_FIFTH_PLATFORM
	end

FourteenthLift:
	scall OlivineLiftSprite
	changeblock 14, 10, $a7
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymUp3Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 14, 8, $b2
	scall OlivineRestorePlayerSpriteReloadMap
	clearevent EVENT_OLIVINE_GYM_FIFTH_PLATFORM
	end

FifteenthLift:
	scall OlivineLiftSprite
	changeblock 16, 10, $a7
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymUp3Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 16, 8, $b2
	scall OlivineRestorePlayerSpriteReloadMap
	setevent EVENT_OLIVINE_GYM_SIXTH_PLATFORM
	end

SixteenthLift:
	scall OlivineLiftSprite
	changeblock 16, 8, $a6
	reloadmappart
	playsound SFX_ELEVATOR
	applymovement PLAYER, OlivineGymDown3Movement
	playsound SFX_BUMP
	refreshscreen $86
	changeblock 16, 10, $b1
	scall OlivineRestorePlayerSpriteReloadMap
	clearevent EVENT_OLIVINE_GYM_SIXTH_PLATFORM
	end

OlivineGymDown5Movement:
	step DOWN
	step DOWN
OlivineGymDown3Movement:
	step DOWN
	step DOWN
	step DOWN
	step_end

OlivineGymUp5Movement:
	step UP
	step UP
OlivineGymUp3Movement:
	step UP
	step UP
	step UP
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

	db 1 ; object events
	object_event  7,  0, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerEngineerRudy, -1
