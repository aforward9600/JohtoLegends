	object_const_def ; object_event constants
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .CinnabarGym

.FlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	return

.CinnabarGym:
	checkevent EVENT_OPENED_CINNABAR_GYM
	iffalse .CloseGym
	return

.CloseGym:
	changeblock 18, 2, $66 ; Closed Door
	return

CinnabarIslandGrampsScript:
	jumptextfaceplayer CinnabarIslandGrampsText

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd pokecentersign

CinnabarIslandLabSign:
	jumptext CinnabarIslandLabSignText

CinnabarGymDoor:
	checkevent EVENT_OPENED_CINNABAR_GYM
	iftrue .DoorUnlocked
	jumptext CinnabarGymDoorLockedText

.DoorUnlocked:
	jumptext CinnabarGymDoorUnlockedText

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandGrampsText:
	text "The fire happened"
	line "so quickly, we"
	cont "didn't have time."

	para "I thought I saw"
	line "something fly out,"
	cont "but I think I was"
	cont "just seeing things"
	cont "quite honestly."
	done

CinnabarIslandGymSignText:
	text "Cinnabar Island"
	line "#mon Gym"
	cont "Leader: …"

	para "The rest of the"
	line "text is illegible…"
	done

CinnabarIslandSignText:
	text "Cinnabar Island"

	para "The Fiery Town of"
	line "Burning Desire"
	done

CinnabarIslandLabSignText:
	text "#mon Lab"

	para "Construction on"
	line "hold"
	done

CinnabarGymDoorLockedText:
	text "The door is"
	line "locked…"
	done

CinnabarGymDoorUnlockedText:
	text "The door is open."
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1
	warp_event  7,  3, POKEMON_MANSION_1F, 2
	warp_event 15, 11, CINNABAR_ISLAND_MART, 1
	warp_event 18,  3, CINNABAR_ISLAND_GYM, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event 13,  3, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  8,  4, BGEVENT_READ, CinnabarIslandSign
	bg_event 11,  5, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandLabSign
	bg_event 18,  3, BGEVENT_READ, CinnabarGymDoor

	db 1 ; object events
	object_event 13,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandGrampsScript, -1
