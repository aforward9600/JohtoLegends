	object_const_def ; object_event constants
	const OLIVINEPORT_SAILOR1
	const OLIVINEPORT_FISHING_GURU1
	const OLIVINEPORT_FISHING_GURU2
	const OLIVINEPORT_YOUNGSTER
	const OLIVINEPORT_COOLTRAINER_F

OlivinePort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_OLIVINEPORT_LEAVE_SHIP

	db 0 ; callbacks

.DummyScene0:
	end

.LeaveFastShip:
	end

OlivinePortSailorBeforeHOFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .OlivinePortSailorAfterBiker
	writetext OlivinePortSailorBeforeHOFText
	waitbutton
	closetext
	end

.OlivinePortSailorAfterBiker:
	writetext OlivinePortSailorAfterBikerText
	waitbutton
	closetext
	end

OlivinePortFishingGuru1Script:
	faceplayer
	opentext
	writetext OlivinePortFishingGuru1Text
	waitbutton
	closetext
	turnobject OLIVINEPORT_FISHING_GURU1, UP
	end

OlivinePortFishingGuru2Script:
	faceplayer
	opentext
	writetext OlivinePortFishingGuru2Text
	waitbutton
	closetext
	turnobject OLIVINEPORT_FISHING_GURU2, UP
	end

OlivinePortYoungsterScript:
	faceplayer
	opentext
	writetext OlivinePortYoungsterText
	waitbutton
	closetext
	turnobject OLIVINEPORT_YOUNGSTER, LEFT
	end

OlivinePortCooltrainerFScript:
	faceplayer
	opentext
	writetext OlivinePortCooltrainerFText
	waitbutton
	closetext
	turnobject OLIVINEPORT_COOLTRAINER_F, DOWN
	end

OlivinePortHiddenProtein:
	hiddenitem PROTEIN, EVENT_OLIVINE_PORT_HIDDEN_PROTEIN

UnknownText_0x74a55:
	text "We're departing"
	line "soon. Please get"
	cont "on board."
	done

UnknownText_0x74a80:
	text "Sorry. You can't"
	line "board now."
	done

UnknownText_0x74a9c:
	text "Welcome to FAST"
	line "SHIP S.S.AQUA."

	para "Will you be board-"
	line "ing today?"
	done

UnknownText_0x74ada:
	text "May I see your"
	line "S.S.TICKET?"
	done

UnknownText_0x74af6:
	text "We hope to see you"
	line "again!"
	done

UnknownText_0x74b11:
	text "<PLAYER> flashed"
	line "the S.S.TICKET."

	para "That's it."
	line "Thank you!"
	done

UnknownText_0x74b41:
	text "<PLAYER> tried to"
	line "show the S.S."
	cont "TICKET…"

	para "…But no TICKET!"

	para "Sorry!"
	line "You may board only"

	para "if you have an"
	line "S.S.TICKET."
	done

UnknownText_0x74ba8:
	text "The FAST SHIP will"
	line "sail next Monday."
	done

UnknownText_0x74bce:
	text "The FAST SHIP will"
	line "sail next Friday."
	done

OlivinePortFishingGuru1Text:
	text "Shellder are easy"
	line "to catch here."

	para "They're kind of"
	line "rare elsewhere."
	done

OlivinePortFishingGuru2Text:
	text "How many rods do"
	line "you have?"

	para "Different rods"
	line "catch different"
	cont "#mon."
	done

OlivinePortYoungsterText:
	text "The Corsola have"
	line "lost all their"
	cont "color from the"
	cont "pollution."

	para "Some of us have"
	line "decided to do som-"
	cont "ething about it."

	para "If we clean up the"
	line "waters, it should"
	cont "only take about a"
	cont "decade for the"
	cont "Corsola to regain"
	cont "their colors!"
	done

OlivinePortCooltrainerFText:
	text "There are lots of"
	line "#mon in Kanto."

	para "I wish I could go…"
	done

OlivinePortSailorBeforeHOFText:
	text "Sorry, no boats"
	line "are sailing to"
	cont "Kanto right now."

	para "Nor will any"
	line "boats go to Kanto"
	cont "for a while."

	para "Haven't you heard?"

	para "Roaming gangs of"
	line "bikers have caused"
	cont "such chaos that"
	cont "the League was cut"
	cont "off from the"
	cont "region."

	para "Gyms were burned"
	line "down, Leaders"
	cont "disappeared."

	para "No one knows if"
	line "they're still"
	cont "alive."

	para "Terrible stuff."
	done

OlivinePortSailorAfterBikerText:
	text "I hear that the"
	line "anarchy has begun"
	cont "to settle down in"
	cont "Kanto."

	para "Hopefully we can"
	line "set sail again"
	cont "someday."
	done

OlivinePort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  7, OLIVINE_PORT_PASSAGE, 5
	warp_event  7, 23, FAST_SHIP_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  1, 22, BGEVENT_ITEM, OlivinePortHiddenProtein

	db 5 ; object events
	object_event  7, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortSailorBeforeHOFScript, -1
	object_event  4, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortFishingGuru1Script, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 13, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortFishingGuru2Script, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  2, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortYoungsterScript, -1
	object_event 11, 15, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortCooltrainerFScript, -1
