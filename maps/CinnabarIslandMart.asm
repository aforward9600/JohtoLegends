	object_const_def ; object_event constants
	const CINNABARISLANDMART_CLERK
	const CINNABARISLANDMART_COOLTRAINERF

CinnabarIslandMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CinnabarIslandMartClerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CINNABAR_ISLAND
	closetext
	end

CinnabarIslandMartCooltrainerF:
	jumptextfaceplayer CinnabarIslandMartCooltrainerFText

CinnabarIslandMartCooltrainerFText:
	text "Apparently, the"
	line "East coast is"
	cont "haunted."

	para "There have been"
	line "sightings of a"
	cont "ghost, although"
	cont "some people have"
	cont "reported #mon"
	cont "skeletons walking"
	cont "around."

	para "So, I would avoid"
	line "it."

	para "Especially on"
	line "Wednesdays."

	para "That's when it"
	line "seems to show up."
	done

CinnabarIslandMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CINNABAR_ISLAND, 3
	warp_event  3,  7, CINNABAR_ISLAND, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandMartClerk, -1
	object_event  5,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CinnabarIslandMartCooltrainerF, -1