	object_const_def ; object_event constants
	const VIRIDIANFOREST_BUG_CATCHER1
	const VIRIDIANFOREST_BUG_CATCHER2
	const VIRIDIANFOREST_BUG_CATCHER3
	const VIRIDIANFOREST_POKE_BALL1
	const VIRIDIANFOREST_POKE_BALL2
	const VIRIDIANFOREST_POKEFAN_F

ViridianForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBugCatcherThor:
	trainer BUG_CATCHER, THOR, EVENT_BEAT_BUG_CATCHER_THOR, BugCatcherThorSeenText, BugCatcherThorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherThorAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherOlly:
	trainer BUG_CATCHER, OLLY, EVENT_BEAT_BUG_CATCHER_OLLY, BugCatcherOllySeenText, BugCatcherOllyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherOllyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDom:
	trainer BUG_CATCHER, DOM, EVENT_BEAT_BUG_CATCHER_DOM, BugCatcherDomSeenText, BugCatcherDomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDomAfterBattleText
	waitbutton
	closetext
	end

ViridianForestPokefanF:
	jumptextfaceplayer ViridianForestPokefanFText

Route2DireHit:
	itemball LEAF_STONE

Route2MaxPotion:
	itemball MAX_POTION

Route2HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_2_HIDDEN_MAX_ETHER

Route2HiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_2_HIDDEN_FULL_HEAL

Route2HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_2_HIDDEN_FULL_RESTORE

Route2HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_2_HIDDEN_REVIVE

ViridianForestSign:
	jumptext ViridianForestSignText

ViridianForestItemSign:
	jumptext ViridianForestItemSignText

ViridianForestLeavingSign:
	jumptext ViridianForestLeavingSignText

BugCatcherThorSeenText:
	text "Those Feds are too"
	line "scared to come in"
	cont "here!"
	done

BugCatcherThorBeatenText:
	text "I'm not scared!"
	done

BugCatcherThorAfterBattleText:
	text "They say they don't"
	line "like the forest"
	cont "because they'll get"
	cont "their boots dirty!"

	para "Cowards!"
	done

BugCatcherOllySeenText:
	text "Bug catching is"
	line "a nice hobby."

	para "Takes the mind off"
	line "of things."
	done

BugCatcherOllyBeatenText:
	text "Losing isn't nice."
	done

BugCatcherOllyAfterBattleText:
	text "Gotta keep myself"
	line "distracted…"

	para "Can't think of"
	line "that day…"
	done

BugCatcherDomSeenText:
	text "…Guess I'll fight…"
	done

BugCatcherDomBeatenText:
	text "Oh well…"
	done

BugCatcherDomAfterBattleText:
	text "Sorry, really not"
	line "up to it right"
	cont "now…"
	done

ViridianForestSignText:
	text "Viridian Forest"
	done

ViridianForestItemSignText:
	text "Some people drop"
	line "items on the"
	cont "ground."
	done

ViridianForestLeavingSignText:
	text "Leaving Viridian"
	line "Forest"
	done

ViridianForestPokefanFText:
	text "This is a nice,"
	line "quiet place to"
	cont "ignore problems."
	done

ViridianForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 16, 45, ROUTE_2, 6
	warp_event 17, 45, ROUTE_2, 7
	warp_event  1,  2, ROUTE_2, 8
	warp_event  2,  2, ROUTE_2, 9

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6, 41, BGEVENT_ITEM, Route2HiddenMaxEther
	bg_event 29, 32, BGEVENT_ITEM, Route2HiddenFullHeal
	bg_event 25,  8, BGEVENT_ITEM, Route2HiddenFullRestore
	bg_event  8,  3, BGEVENT_ITEM, Route2HiddenRevive
	bg_event 18, 42, BGEVENT_READ, ViridianForestSign
	bg_event 16, 32, BGEVENT_READ, ViridianForestItemSign
	bg_event  2,  4, BGEVENT_READ, ViridianForestLeavingSign

	db 6 ; object events
	object_event 11, 41, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherThor, -1
	object_event 26, 24, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherOlly, -1
	object_event 13, 11, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherDom, -1
	object_event  1, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2DireHit, EVENT_ROUTE_2_DIRE_HIT
	object_event 11, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2MaxPotion, EVENT_ROUTE_2_MAX_POTION
	object_event  4, 23, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestPokefanF, -1
