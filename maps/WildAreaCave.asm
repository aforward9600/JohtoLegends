	object_const_def ; object_event constants
	const WILDAREACAVE_HIKER
	const WILDAREACAVE_CHIGUSA

WildAreaCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ChigusaTuesday

.ChigusaTuesday:
	checkevent EVENT_WILD_AREA_RIVAL_BEAT
	iftrue .IsItTuesday
	disappear WILDAREACAVE_CHIGUSA
	return

.IsItTuesday:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .ChigusaAppear
	disappear WILDAREACAVE_CHIGUSA
	return

.ChigusaAppear:
	appear WILDAREACAVE_CHIGUSA
	return

WildAreaCaveHiker:
	jumptextfaceplayer WildAreaCaveHikerText

WildAreaCaveChigusaScript:
	jumptextfaceplayer WildAreaCaveChigusaText

WildAreaCaveSign:
	jumptext WildAreaCaveSignText

WildAreaCaveHikerText:
	text "I've always wanted"
	line "a Kangaskhan, but"
	cont "it feels like it's"

	para "only a 1 percent"
	line "chance of finding"
	cont "one."

	para "Maybe I should"
	line "watch the Swarm"
	cont "Channel and see if"
	cont "one will show up."
	done

WildAreaCaveChigusaText:
	text "I like to train my"
	line "body and #mon"
	cont "here in the caves."

	para "Chuck prefers to"
	line "to train in the"
	cont "Gym instead."

	para "The waterfalls"
	line "around here are"
	cont "quite elegant,"
	cont "don't you think?"
	done

WildAreaCaveSignText:
	text "Wild Area Cave"

	para "A nice, dark"
	line "place for #mon"

	para "to dwell."
	done

WildAreaCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 11, WILD_AREA_2_3, 5
	warp_event  3,  5, WILD_AREA_2_3, 6

	db 0 ; coord events

	db 1 ; bg events
	bg_event 3, 2, BGEVENT_READ, WildAreaCaveSign

	db 2 ; object events
	object_event  9,  5, SPRITE_HIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaCaveHiker, -1
	object_event 10, 10, SPRITE_CHIGUSA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaCaveChigusaScript, EVENT_WILD_AREA_CAVE_CHIGUSA
