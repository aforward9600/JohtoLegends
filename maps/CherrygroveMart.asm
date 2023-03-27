	object_const_def ; object_event constants
	const CHERRYGROVEMART_CLERK
	const CHERRYGROVEMART_GRANNY
	const CHERRYGROVEMART_TWIN
	const CHERRYGROVEMART_CLERK_2

CherrygroveMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

CherrygroveMartTMClerkScript:
	opentext
	pokemart MARTTYPE_TMS, MART_CHERRYGROVE_TMS
	closetext
	end

CherrygroveMartGrannyScript:
	jumptextfaceplayer CherrygroveMartGrannyText

CherrygroveMartTwinScript:
	jumptextfaceplayer CherrygroveMartTwinText

CherrygroveMartGrannyText:
	text "After a while,"
	line "these stores don't"
	cont "seem to have"
	cont "anything different."
	done

CherrygroveMartTwinText:
	text "They sell Flower"
	line "Mail here."

	para "It's perfect for"
	line "a town with"
	cont "cherry blossoms!"
	done

CherrygroveMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 1
	warp_event  3,  7, CHERRYGROVE_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  7,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartGrannyScript, -1
	object_event  2,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMartTwinScript, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartTMClerkScript, -1
