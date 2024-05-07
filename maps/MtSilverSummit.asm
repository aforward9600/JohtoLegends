	object_const_def ; object_event constants
	const MTSILVERSUMMIT_RIVAL

MtSilverSummit_MapScripts:
	db 2 ; scene scripts
	scene_script .FinalScene ; SCENE_DEFAULT
	scene_script .Dummy0     ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .NightTime

.NightTime:
	checktime NITE
	iffalse .CheckMorn
	changeblock 0, 0, $36
	changeblock 2, 0, $36
	changeblock 4, 0, $36
	changeblock 6, 0, $36
	changeblock 8, 0, $39
	changeblock 10, 0, $36
	changeblock 12, 0, $36
	return

.CheckMorn:
	checktime MORN
	iffalse .CheckEve
	changeblock 6, 0, $3b
	return

.CheckEve:
	checktime DAY
	iftrue .DoNothing
	changeblock 6, 0, $3d
	return

.DoNothing:
	return

.FinalScene:
	prioritysjump .FinalSceneScript
	end

.FinalSceneScript:
	follow MTSILVERSUMMIT_RIVAL, PLAYER
	applymovement MTSILVERSUMMIT_RIVAL, MtSilverSummitWalk
	stopfollow
	turnobject MTSILVERSUMMIT_RIVAL, UP
	turnobject PLAYER, UP
	pause 60
	opentext
	writetext BeautifulIsntItText
	waitbutton
	closetext
	pause 60
	turnobject MTSILVERSUMMIT_RIVAL, LEFT
	pause 60
	turnobject MTSILVERSUMMIT_RIVAL, UP
	pause 60
	opentext
	checkevent EVENT_COMPLETED_EPILOGUE
	iftrue .LastEpilogue
	checkevent EVENT_GOT_SILVER_WING
	iftrue .ReleasedHoOh
	writetext ReleasedLugiaText
	setevent EVENT_RIVAL_GIVES_UP_LUGIA
	waitbutton
	sjump .ReconvergeFinalScene

.LastEpilogue:
	writetext ThisIsNiceText
	waitbutton
	closetext
	sjump .ReconvergeFinalSceneAgain

.ReleasedHoOh:
	writetext ReleasedHoOhText
	setevent EVENT_RIVAL_GIVES_UP_HO_OH
	waitbutton
.ReconvergeFinalScene:
	writetext GoingToReleaseText
	waitbutton
	closetext
.ReconvergeFinalSceneAgain:
	setscene SCENE_FINISHED
	setevent EVENT_EPILOGUE_GOLD
	setevent EVENT_EPILOGUE_CRYSTAL
	setevent EVENT_COMPLETED_EPILOGUE
	clearevent EVENT_FERROPEXOLA
	setflag ENGINE_SAFARI_ZONE
	setmapscene GOLD_CRYSTAL_HOUSE, SCENE_DEFAULT
	pause 90
	special FadeBlackQuickly
	pause 15
	warpfacing UP, GOLD_CRYSTAL_HOUSE, 6, 4
	return

.Dummy0:
	end

MtSilverSummitWalk:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

BeautifulIsntItText:
	text "<RIVAL>: ………………"

	para "It's beautiful,"
	line "isn't it?"

	para "I just wanted to"
	line "share this moment"
	cont "with you."

	para "Here, at the top"
	line "of the world…"
	done

ReleasedHoOhText:
	text "…I decided to"
	line "release Ho-Oh…"
	done

ReleasedLugiaText:
	text "…I decided to"
	line "release Lugia…"
	done

GoingToReleaseText:
	text "…I felt it would"
	line "be better for it"
	cont "to be free."

	para "What do you think?"

	para "…Yeah, I guess it"
	line "would be for the"
	cont "best."

	para "………………………………………"

	para "…You're planning on"
	line "releasing all of"
	cont "your Legendary"
	cont "#mon someday?"

	para "……You really are a"
	line "good person, huh?"

	para "…I'm glad you're"
	line "here with me."

	para "…………………………"

	para "Let's just stay"
	line "here a little"
	cont "while longer…"

	para "…Together…"
	done

ThisIsNiceText:	
	text "…This was quite"
	line "the journey, huh?"

	para "Who could have"
	line "guessed that we'd"
	cont "save Kanto…"

	para "And now we're here,"
	line "at the top of the"
	cont "world…"

	para "It's cold, but when"
	line "I'm with you,"

	para "it doesn't bother"
	line "me…"

	para "…I'm glad you're"
	line "here with me."

	para "…………………………"

	para "Let's just stay"
	line "here a little"
	cont "while longer…"

	para "…Together…"
	done

MtSilverSummit_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6,  15, SILVER_CAVE_ITEM_ROOMS, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6, 14, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
