	object_const_def ; object_event constants
	const CLIFFSEDGEGATE_ENGINEER1
	const CLIFFSEDGEGATE_ENGINEER2
	const CLIFFSEDGEGATE_POKE_BALL

CliffsEdgeGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MakeBridgesPriorityGate

.MakeBridgesPriorityGate:
	setmapscene ROUTE_47, SCENE_DEFAULT
	return

CliffsEdgeGateEngineer1Script:
	jumptextfaceplayer CliffsEdgeGateEngineer1Text

CliffsEdgeGateEngineer2Script:
	jumptextfaceplayer CliffsEdgeGateEngineer2Text

CliffsEdgeGateItemScript:
	itemball DUSK_STONE

CliffsEdgeGateSign:
	jumptext CliffsEdgeGateSignText

CliffsEdgeGateEngineer1Text:
	text "We're planning on"
	line "modernizing this"
	cont "gate, so it's more"
	cont "inviting."

	para "You can go right"
	line "on through to"
	cont "Route 47."
	done

CliffsEdgeGateEngineer2Text:
	text "We'll be building"
	line "stairs up the"
	cont "cliff."

	para "Take that ladder"
	line "there to get up"
	cont "to Route 47."

	para "We've installed"
	line "fences to insure"
	cont "that no one else"
	cont "falls over."
	done

CliffsEdgeGateSignText:
	text "Cliff's Edge Gate"
	line "Cianwood City -"
	cont "Route 47"
	done

CliffsEdgeGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 21,  7, CIANWOOD_CITY, 8
	warp_event 13,  5, CLIFFS_EDGE_GATE, 3
	warp_event  6,  5, CLIFFS_EDGE_GATE, 2
	warp_event  6, 16, ROUTE_47, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19,  4, BGEVENT_READ, CliffsEdgeGateSign

	db 3 ; object events
	object_event 18,  7, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CliffsEdgeGateEngineer1Script, -1
	object_event 12,  6, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CliffsEdgeGateEngineer2Script, -1
	object_event 10, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CliffsEdgeGateItemScript, EVENT_CLIFFS_EDGE_GATE_ITEM
