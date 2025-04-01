	object_const_def ; object_event constants
	const INDIGOPLATEAUPOKECENTER1F_NURSE
	const INDIGOPLATEAUPOKECENTER1F_CLERK
	const INDIGOPLATEAUPOKECENTER1F_COOLTRAINER_M
	const INDIGOPLATEAUPOKECENTER1F_GRAMPS
	const INDIGOPLATEAUPOKECENTER1F_ABRA
	const INDIGOPLATEAUPOKECENTER1F_COOLTRAINER_F

IndigoPlateauPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .PrepareElite4

.PrepareElite4:
	setmapscene WILLS_ROOM, SCENE_DEFAULT
	setmapscene KOGAS_ROOM, SCENE_DEFAULT
	setmapscene BRUNOS_ROOM, SCENE_DEFAULT
	setmapscene KARENS_ROOM, SCENE_DEFAULT
	setmapscene LANCES_ROOM, SCENE_DEFAULT
	setmapscene HALL_OF_FAME, SCENE_DEFAULT
	clearevent EVENT_FLORINAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_FLORINAS_ROOM_EXIT_OPEN
	clearevent EVENT_GEN_SURGES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_GEN_SURGES_ROOM_EXIT_OPEN
	clearevent EVENT_MARTHAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_MARTHAS_ROOM_EXIT_OPEN
	clearevent EVENT_AGATHAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_AGATHAS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_FLORINA
	clearevent EVENT_BEAT_ELITE_4_GEN_SURGE
	clearevent EVENT_BEAT_ELITE_4_MARTHA
	clearevent EVENT_BEAT_ELITE_4_AGATHA
	setevent EVENT_CHALLENGER_OAK
	setevent EVENT_CHALLENGER_RIVAL
	setevent EVENT_CHALLENGER_CYNTHIA
	return

IndigoPlateauPokecenter1FNurseScript:
	jumpstd pokecenternurse

IndigoPlateauPokecenter1FClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_INDIGO_PLATEAU
	closetext
	end

IndigoPlateauPokecenter1FCooltrainerMScript:
	jumptextfaceplayer IndigoPlateauPokecenter1FCooltrainerMText

TeleportGuyScript:
	jumptextfaceplayer TeleportGuyText1

IndigoPlateauPokeCenter1FCooltrainerFScript:
	faceplayer
	opentext
	writetext IndigoPlateauPokeCenter1FCooltrainerFText
	waitbutton
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_4F
	closetext
	end

AbraScript:
	refreshscreen
	pokepic ABRA
	cry ABRA
	waitbutton
	closepokepic
	opentext
	writetext AbraText
	waitbutton
	closetext
	end

PlateauRivalMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

PlateauRivalMovement2:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

PlateauRivalLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

IndigoPlateauPokecenter1FCooltrainerMText:
	text "At the #mon"
	line "League, you'll get"

	para "tested by the"
	line "Elite Four."

	para "You have to beat"
	line "them all. If you"

	para "lose, you have to"
	line "start all over!"
	done

TeleportGuyText1:
	text "Ah! You're chal-"
	line "lenging the Elite"

	para "Four? Are you sure"
	line "you're ready?"

	para "If you need to"
	line "train some more,"

	para "my Abra can help"
	line "you."

	para "It can Teleport"
	line "you home."

	para "…Oh, you can just"
	line "fly there."

	para "…Nevermind…"
	done

AbraText:
	text "Abra: Aabra…"
	done

IndigoPlateauPokeCenter1FCooltrainerFText:
	text "Looks like your"
	line "#mon could use"
	cont "some vitamins."
	done

IndigoPlateauPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8, 17, ROUTE_23, 1
	warp_event  9, 17, ROUTE_23, 2
	warp_event  0, 17, POKECENTER_2F, 1
	warp_event  9,  0, WILLS_ROOM, 1
	warp_event  8,  0, WILLS_ROOM, 4

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  3, 13, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FNurseScript, -1
	object_event 14, 13, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FClerkScript, -1
	object_event 13, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FCooltrainerMScript, -1
	object_event  1,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, -1
	object_event  0,  7, SPRITE_ABRA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript, -1
	object_event 13,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokeCenter1FCooltrainerFScript, -1
