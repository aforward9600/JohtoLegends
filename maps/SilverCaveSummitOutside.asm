	object_const_def ; object_event constants
	const SILVERCAVESUMMITOUTSIDE_RIVAL

SilverCaveSummitOutside_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AppearMewCave

.AppearMewCave:
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .MewCaveAppears
	return

.MewCaveAppears:
	changeblock 8, 22, $af
	checkevent EVENT_BEAT_MEW
	iftrue .MewWillNotAppear
	checkevent EVENT_CAUGHT_MEW
	iftrue .MewWillNotAppear
	setmapscene SILVER_CAVE_MEW_ROOM, SCENE_MEW_APPEARS
	return

.MewWillNotAppear:
	setmapscene SILVER_CAVE_MEW_ROOM, SCENE_MEW_GONE
	return

MtSilverSummitRival:
	faceplayer
	opentext
	writetext RivalComeWithMeText
	waitbutton
	closetext
	follow SILVERCAVESUMMITOUTSIDE_RIVAL, PLAYER
	applymovement SILVERCAVESUMMITOUTSIDE_RIVAL, SilverCaveSummitOutsideWalk
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear SILVERCAVESUMMITOUTSIDE_RIVAL
	applymovement PLAYER, SilverCaveSummitOutsideWalk
	playsound SFX_ENTER_DOOR
	disappear PLAYER
	special FadeOutPalettes
	pause 15
	setmapscene MT_SILVER_SUMMIT, SCENE_DEFAULT
	warpfacing UP, MT_SILVER_SUMMIT, 6, 15
	end

SilverCaveSummitOutsideWalk:
	step UP
	step_end

RivalComeWithMeText:
	text "<RIVAL>: It looks"
	line "like we're finally"
	cont "both here, at the"
	cont "top of Mt.Silver."

	para "You wanna know why"
	line "I called you here?"

	para "Come with me, and"
	line "I'll show you."
	done

SilverCaveSummitOutside_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 18, 27, SILVER_CAVE_ITEM_ROOMS, 3
	warp_event  6, 15, MT_SILVER_SUMMIT, 1
	warp_event  8, 23, SILVER_CAVE_MEW_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6, 16, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtSilverSummitRival, -1
