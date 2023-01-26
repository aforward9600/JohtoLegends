	object_const_def ; object_event constants
	const OLIVINECITY_SAILOR1
	const OLIVINECITY_STANDING_YOUNGSTER
	const OLIVINECITY_SAILOR2
	const OLIVINECITY_GRUNT

OlivineCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_OLIVINE
	return

OlivineCitySailor1Script:
	jumptextfaceplayer OlivineCitySailor1Text

OlivineCityStandingYoungsterScript:
	checkflag ENGINE_STORMBADGE
	iftrue .GoToWildArea
	checkevent EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	iftrue .GoToCianwood
	faceplayer
	opentext
	writetext OlivineCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.GoToWildArea:
	faceplayer
	opentext
	writetext OlivineCityStandingYoungsterGotBadgeText
	waitbutton
	closetext
	end

.GoToCianwood:
	faceplayer
	opentext
	writetext OlivineCityStandingYoungsterGoToCianwoodText
	waitbutton
	closetext
	end

OlivineRocketScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ROCKET_GRUNTM_1
	iftrue .WordFromGrunt
	writetext DoingMaintenanceText
	waitbutton
	closetext
	end

.WordFromGrunt:
	writetext DoingMaintenanceText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OLIVINECITY_GRUNT, 15
	turnobject OLIVINECITY_GRUNT, RIGHT
	opentext
	writetext YeahText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext GotWordFromGruntText
	waitbutton
	closetext
	winlosstext OlivineGruntWinText, 0
	loadtrainer GRUNTM, GRUNTM_2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OLIVINE_GRUNT
	opentext
	writetext ThisIsntGoodText
	waitbutton
	closetext
	applymovement OLIVINECITY_GRUNT, OlivineGruntMovement
	playsound SFX_ENTER_DOOR
	disappear OLIVINECITY_GRUNT
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SWIMMER_GUY
	special LoadUsedSpritesGFX
	setevent EVENT_LIGHTHOUSE_SHERLES
	setevent EVENT_LIGHTHOUSE1F_RIVAL1
	setevent EVENT_LIGHTHOUSE1F_RIVAL2
	setevent EVENT_LIGHTHOUSE_CIVILLIANS
	end

OlivineCitySailor2Script:
	jumptextfaceplayer OlivineCitySailor2Text

OlivineCitySign:
	jumptext OlivineCitySignText

OlivineCityPortSign:
	jumptext OlivineCityPortSignText

OlivineGymSign:
	jumptext OlivineGymSignText

OlivineLighthouseSign:
	jumptext OlivineLighthouseSignText

OlivineCityBattleTowerSign:
	jumptext OlivineCityBattleTowerSignText

OlivineCityPokecenterSign:
	jumpstd pokecentersign

OlivineCityMartSign:
	jumpstd martsign

OlivineSwarmHouseSign:
	jumptext OlivineSwarmHouseSignText

OlivineGruntMovement:
	step UP
	step_end

OlivineCitySailor1Text:
	text "Dark roads are"
	line "dangerous at"
	cont "night."

	para "But in the pitch-"
	line "black of night,"

	para "the sea is even"
	line "more treacherous!"

	para "Without the beacon"
	line "of the Lighthouse"

	para "to guide it, no"
	line "ship can sail."
	done

OlivineCityStandingYoungsterPokegearText:
	text "The Leader isn't"
	line "here right now."

	para "He's at the Light-"
	line "house."

	para "Apparently there's"
	line "been an incident."
	done

OlivineCityStandingYoungsterGoToCianwoodText:
	text "The Gym Leader"
	line "said to not let"
	cont "you in until you"
	cont "get the StormBadge"
	cont "from Cianwood."

	para "Even then, you may"
	line "need to wait a"
	cont "little while long-"
	cont "er."
	done

OlivineCityStandingYoungsterGotBadgeText:
	text "Hey, you got the"
	line "StormBadge! Nice!"

	para "I'd like to let"
	line "you in, but Byron"
	cont "is still getting"
	cont "ready."

	para "Why don't you"
	line "check out the Wild"
	cont "Area in Cianwood"
	cont "to pass the time?"
	done

OlivineCityStandingYoungsterPokedexText:
	text "Wow, you have a"
	line "#DEX!"

	para "That is just so"
	line "awesome."
	done

OlivineCitySailor2Text:
	text "The sea is sweet!"

	para "Sunsets on the sea"
	line "are marvelous!"

	para "Sing with me! "
	line "Yo-ho! Blow the"
	cont "man down!…"
	done

DoingMaintenanceText:
	text "Sorry, but we're"
	line "doing maintenance"
	cont "on the Lighthouse"
	cont "right now."

	para "You understand."

	para "Come back later"
	line "if you want to"
	cont "see the sights."
	done

YeahText:
	text "Hm?"

	para "What's that?"

	para "Got a description?"

	para "......."

	para "Got it."
	done

GotWordFromGruntText:
	text "Just got word from"
	line "a co-worker."

	para "You're the one"
	line "that messed with"
	cont "us at Bell Tower."

	para "Sorry, but it"
	line "looks like I'll"
	cont "have to take care"
	cont "of you now."
	done

OlivineGruntWinText:
	text "Not good!"
	done

ThisIsntGoodText:
	text "This isn't good."

	para "The boss isn't"
	line "going to like"
	cont "this."

	para "I better tell"
	line "the others!"
	done

OlivineCitySignText:
	text "Olivine City"

	para "The Port Closest"
	line "to Foreign Lands"
	done

OlivineCityPortSignText:
	text "Olivine Port"
	line "Fast Ship Pier"
	done

OlivineGymSignText:
	text "Olivine City"
	line "#mon Gym"
	cont "Leader: Byron"

	para "The Steel"
	line "Mining Master"
	done

OlivineLighthouseSignText:
	text "Olivine Lighthouse"
	line "Also known as the"
	cont "Glitter Lighthouse"
	done

OlivineSwarmHouseSignText:
	text "Swarm House"

	para "Come on in and"
	line "watch the Swarm"
	cont "Channel on TV!"
	done

OlivineCityBattleTowerSignText:
	text "Battle Tower Ahead"
	line "Opening Now!"
	done

OlivineCityBattleTowerSignText_NotYetOpen:
; unused; originally shown when the Battle Tower was closed
	text "Battle Tower Ahead"
	done

OlivineCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 13, 21, OLIVINE_POKECENTER_1F, 1
	warp_event 10, 11, OLIVINE_GYM_1F, 1
	warp_event 25, 11, OLIVINE_TIMS_HOUSE, 1
	warp_event 29, 11, OLIVINE_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 13, 15, OLIVINE_GOOD_ROD_HOUSE, 1
	warp_event  7, 21, OLIVINE_CAFE, 1
	warp_event 19, 17, OLIVINE_MART, 2
	warp_event 29, 27, OLIVINE_LIGHTHOUSE_1F, 1
	warp_event 19, 27, OLIVINE_PORT_PASSAGE, 1
	warp_event 20, 27, OLIVINE_PORT_PASSAGE, 2

	db 0 ; coord events

	db 8 ; bg events
	bg_event 17, 11, BGEVENT_READ, OlivineCitySign
	bg_event 20, 24, BGEVENT_READ, OlivineCityPortSign
	bg_event  7, 11, BGEVENT_READ, OlivineGymSign
	bg_event 30, 28, BGEVENT_READ, OlivineLighthouseSign
	bg_event  3, 23, BGEVENT_READ, OlivineCityBattleTowerSign
	bg_event 14, 21, BGEVENT_READ, OlivineCityPokecenterSign
	bg_event 20, 17, BGEVENT_READ, OlivineCityMartSign
	bg_event 30, 12, BGEVENT_READ, OlivineSwarmHouseSign

	db 4 ; object events
	object_event 26, 27, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor1Script, -1
	object_event 10, 12, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCityStandingYoungsterScript, EVENT_WILD_AREA_RIVAL_BEAT
	object_event 17, 21, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor2Script, -1
	object_event 29, 28, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineRocketScript, EVENT_BEAT_OLIVINE_GRUNT
