	object_const_def ; object_event constants
	const MAHOGANYMART1F_PHARMACIST
	const MAHOGANYMART1F_BUENA
	const MAHOGANYMART1F_LANCE
	const MAHOGANYMART1F_DRAGON
	const MAHOGANYMART1F_GRANNY
	const MAHOGANYMART1F_KOGA

MahoganyMart1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_MAHOGANYMART1F_NOTHING
	scene_script .LanceUncoversStaircase ; SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS

	db 3 ; callbacks
	callback MAPCALLBACK_TILES, .MahoganyMart1FStaircase
	callback MAPCALLBACK_OBJECTS, .RivalMoves
	callback MAPCALLBACK_OBJECTS, .SherlesStays

.DummyScene0:
	end

.LanceUncoversStaircase:
	end

.MahoganyMart1FStaircase:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	iftrue .ShowStairs
	return

.ShowStairs:
	changeblock 12, 2, $1e ; stairs
	return

.RivalMoves:
	checkscene SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	iftrue .RivalMovesPlace
	return

.RivalMovesPlace:
	moveobject MAHOGANYMART1F_LANCE, 10, 4
	return

.SherlesStays:
	checkevent EVENT_MART_SHERLES
	iftrue .SherlesLeaves
	moveobject MAHOGANYMART1F_DRAGON, 9, 6
	return

.SherlesLeaves:
	return

MahogayMart1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHAMPION_LANCE
	iftrue .LanceEntered
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_1
	closetext
	end

.LanceEntered:
	end

MahogayMart1FBuenaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHAMPION_LANCE
	iftrue .LanceEntered
	writetext MahogayMart1FBuenaText
	waitbutton
	closetext
	end

.LanceEntered:
	end

MahoganyMart1FLanceUncoversStaircaseScript:
	pause 15
	opentext
	writetext UnknownText_0x6c52a
	pause 15
	closetext
	playsound SFX_TACKLE
	applymovement MAHOGANYMART1F_DRAGON, MovementData_0x6c3f6
	applymovement MAHOGANYMART1F_BUENA, MovementData_0x6c3fb
	pause 15
	disappear MAHOGANYMART1F_DRAGON
	pause 15
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c407
	opentext
	writetext UnknownText_0x6c549
	waitbutton
	closetext
	follow MAHOGANYMART1F_LANCE, PLAYER
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c40a
	applymovement MAHOGANYMART1F_PHARMACIST, MovementData_0x6c403
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c40e
	stopfollow
	opentext
	writetext UnknownText_0x6c59e
	waitbutton
	showemote EMOTE_SHOCK, MAHOGANYMART1F_PHARMACIST, 10
	playsound SFX_FAINT
	changeblock 10, 2, $1e ; stairs
	reloadmappart
	closetext
	setevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	turnobject MAHOGANYMART1F_LANCE, LEFT
	opentext
	writetext UnknownText_0x6c5ba
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c412
	playsound SFX_EXIT_BUILDING
	disappear MAHOGANYMART1F_LANCE
	setscene SCENE_MAHOGANYMART1F_NOTHING
	waitsfx
	end

MahogayMart1FGrannyScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_2
	closetext
	end

MartSherlesScript:
	faceplayer
	opentext
	writetext MartSherlesText
	waitbutton
	closetext
	end

BrokenRadio:
	jumptext BrokenRadioText

MovementData_0x6c3f6:
	fix_facing
	big_step LEFT
	big_step RIGHT
	remove_fixed_facing
	step_end

MovementData_0x6c3fb:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

MovementData_0x6c403:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

MovementData_0x6c407:
	slow_step LEFT
	turn_head DOWN
	step_end

MovementData_0x6c40a:
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_0x6c40e:
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementData_0x6c412:
	slow_step RIGHT
	step_end

UnknownText_0x6c414:
	text "Hello, kiddo!"

	para "How would you like"
	line "some Ragecandybar?"

	para "It's the thing to"
	line "eat in Mahogany!"
	done

MahogayMart1FPharmacistText_LanceEntered:
	text "Arrgh… You found"
	line "the secret stair-"
	cont "way…"
	done

MahogayMart1FBuenaText:
	text "Hm? Their whole"
	line "stock seems"
	cont "different."
	done

MartSherlesText:
	text "Hm…"

	para "Ninjas, huh?"
	done

UnknownText_0x6c52a:
	text "LANCE: DRAGONITE,"
	line "HYPER BEAM."
	done

UnknownText_0x6c549:
	text "What took you,"
	line "<PLAY_G>?"

	para "Just as I thought,"
	line "that strange radio"

	para "signal is coming"
	line "from here."
	done

UnknownText_0x6c59e:
	text "The stairs are"
	line "right here."
	done

UnknownText_0x6c5ba:
	text "LANCE: <PLAY_G>, we"
	line "should split up to"

	para "check this place."
	line "I'll go first."
	done

BrokenRadioText:
	text "Oh, a radio!"

	para "……Aw……"
	line "It's broken…"
	done

MahoganyMart1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9,  7, MAHOGANY_TOWN, 1
	warp_event 10,  7, MAHOGANY_TOWN, 1
	warp_event 13,  3, TEAM_ROCKET_BASE_B1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  1, BGEVENT_READ, BrokenRadio

	db 6 ; object events
	object_event 10,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahogayMart1FPharmacistScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  8,  6, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahogayMart1FBuenaScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  0,  0, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MART_RIVAL
	object_event  0,  0, SPRITE_SHERLES, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MartSherlesScript, EVENT_MART_SHERLES
	object_event  7,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahogayMart1FGrannyScript, EVENT_MAHOGANY_MART_OWNERS
	object_event  0,  0, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MART_KOGA
