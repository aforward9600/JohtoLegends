	object_const_def ; object_event constants
	const WILDAREACAVE_HIKER

WildAreaCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildAreaCaveHiker:
	jumptextfaceplayer WildAreaCaveHikerText

WildAreaCaveSign:
	jumptext WildAreaCaveSignText

WildAreaCaveHikerText:
	text "I've always wanted"
	line "a Dunsparce, but"
	cont "it feels like it's"

	para "only a 1 percent"
	line "chance of finding"
	cont "one."

	para "Maybe I should"
	line "hike over to"
	cont "Dark Cave and find"
	cont "one…"
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

	db 1 ; object events
	object_event  9,  5, SPRITE_HIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaCaveHiker, -1
