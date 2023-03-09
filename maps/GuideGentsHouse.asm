	object_const_def ; object_event constants
	const GUIDEGENTSHOUSE_LASS

GuideGentsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GuideGentsHouseGuideGent:
	jumptextfaceplayer GuideGentsHouseGuideGentText

GuideGentsHouseBookshelf:
	jumpstd magazinebookshelf

GuideGentsHouseGuideGentText:
	text "My grandfather is"
	line "the old man at the"
	cont "edge of the city."

	para "He likes guiding"
	line "people around,"
	cont "even though he"
	cont "doesn't get paid."

	para "They started"
	line "calling him the"
	cont "Guide Gent, and"
	cont "he liked it so"
	cont "much, he put it on"
	cont "the sign in front."

	para "It's a little"
	line "embarassing, but"
	cont "he likes it."
	done

GuideGentsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 4
	warp_event  3,  7, CHERRYGROVE_CITY, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, GuideGentsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, GuideGentsHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, CherrygroveTelevision

	db 1 ; object events
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GuideGentsHouseGuideGent, -1
