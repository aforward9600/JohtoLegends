	object_const_def ; object_event constants

EmbeddedTower_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MakeBridgesPriorityTower

.MakeBridgesPriorityTower:
	setmapscene ROUTE_47, SCENE_FINISHED
	return

SpiritombBattle:
	opentext
	writetext AnOddRockText
	waitbutton
	checkitem ODD_KEYSTONE
	iftrue .Battle
	closetext
	end

.Battle
	writetext PlaceOddKeystoneText
	yesorno
	iftrue .Battle2
	closetext
	end

.Battle2
	closetext
	takeitem ODD_KEYSTONE
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	pause 30
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	cry SPIRITOMB
	loadwildmon SPIRITOMB, 35
	startbattle
	ifequal LOSE, .NotBeaten
	reloadmapafterbattle
	end

.NotBeaten
	reloadmapafterbattle
	giveitem ODD_KEYSTONE
	end

AnOddRockText:
	text "There's an odd rock"
	line "with an indent…"
	done

PlaceOddKeystoneText:
	text "Would you like to"
	line "place the Odd"
	cont "Keystone?"
	done

EmbeddedTower_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 23, ROUTE_47, 5
	warp_event 11, 23, ROUTE_47, 5

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10,  9, BGEVENT_READ, SpiritombBattle

	db 0 ; object events
