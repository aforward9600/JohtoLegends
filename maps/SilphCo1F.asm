	object_const_def ; object_event constants
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER
	const SILPHCO1F_GENTLEMAN
	const SILPHCO1F_SCIENTIST
	const SILPHCO1F_GENTLEMAN2
	const SILPHCO1F_GENTLEMAN3

SilphCo1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCoOfficerScript:
	jumptextfaceplayer SilphCoOfficerText

SilphCo1FGentlemanScript:
	jumptextfaceplayer SilphCo1FGentlemanText

SilphCo1FScientistScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .SilphCo1FScientist2
	jumptextfaceplayer SilphCo1FScientistText

.SilphCo1FScientist2:
	jumptextfaceplayer SilphCo1FScientistText2

SilphCo1FGentlemanScript2:
	jumptextfaceplayer SilphCo1FGentlemanText2

SilphElevator:
	jumptext SilphElevatorText

DevonStoneScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHINY_BELDUM
	iftrue .AlreadyGotBeldum
	checkevent EVENT_PASSWORD_SINGULAR
	iftrue .CantGiveBeldum
	writetext DevonStoneText1
	buttonsound
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
.GetBeldum
	writetext GotBeldumText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BELDUM, 5
	scall GiveShinyBeldum
	setevent EVENT_GOT_SHINY_BELDUM
.AlreadyGotBeldum
	writetextend DevonStoneText2

.NoRoom:
	writetextend NoRoomBeldumText

.CantGiveBeldum:
	setevent EVENT_GOT_SHINY_BELDUM
	writetextend CantGiveBeldumText

GiveShinyBeldum:
	jumpstd shinygiftpokemon

SilphCoReceptionistText:
	text "Welcome. This is"
	line "Silph Co.'s Head"
	cont "Office Building."
	done

SilphCoOfficerText:
	text "I'm sorry, but due"
	line "to some recent"
	cont "incidents, no"
	cont "unauthorized"
	cont "personnel are"
	cont "allowed on the"
	cont "upper floors."

	para "We apologize for"
	line "the inconvenience."
	done

SilphElevatorText:
	text "There's a note:"

	para "Authorized"
	line "personnel only."
	done

SilphCo1FGentlemanText:
	text "Silph has been"
	line "mostly spared from"
	cont "the Feds' wrath."

	para "The rumor is that"
	line "the President is"
	cont "paying them off to"
	cont "prevent them from"
	cont "vandalizing and"
	cont "looting."

	para "It's sad, but"
	line "necessary."
	done

SilphCo1FScientistText:
	text "Don't tell anyone,"
	line "but we were the"
	cont "victim of a break-"
	cont "in a while ago."

	para "Several digital-"
	line "made #mon were"
	cont "stolen by some"
	cont "people in black."

	para "Not only that, but"
	line "several prototype"
	cont "Upgrades were also"
	cont "stolen."

	para "Not to mention the"
	line "ultimate ball"
	cont "prototype."

	para "We can't really"
	line "investigate well,"
	cont "due to the Feds."

	para "They may be a part"
	line "of it."
	done

SilphCo1FScientistText2:
	text "Don't tell anyone,"
	line "but we were the"
	cont "victim of a break-"
	cont "in a while ago."

	para "Several digital-"
	line "made #mon were"
	cont "stolen by some"
	cont "people in black."

	para "Not only that, but"
	line "several prototype"
	cont "Upgrades were also"
	cont "stolen."

	para "Not to mention the"
	line "ultimate ball"
	cont "prototype."

	para "Most of the Feds"
	line "are gone now, so"
	cont "there's no point in"
	cont "investigating"
	cont "them."
	done

SilphCo1FGentlemanText2:
	text "I hope we can get"
	line "back to normal"
	cont "soon."

	para "The amount of"
	line "security makes me"
	cont "uncomfortable."
	done

DevonStoneText1:
	text "My name is Devon"
	line "Stone."

	para "I am the owner of"
	line "Devon Corporation"
	cont "in Hoenn."

	para "I came here a few"
	line "years ago to set"
	cont "up a deal with"
	cont "Silph to sell"

	para "#-Balls in"
	line "Hoenn when I got"
	cont "caught up in this"
	cont "embargo."

	para "I haven't seen my"
	line "son Steven since"
	cont "this madness"
	cont "began."

	para "We still exchange"
	line "letters through"
	cont "my Skarmory."

	para "At least I have"
	line "some stones to"
	cont "give him when I"
	cont "return."

	para "…Ah, you're the"
	line "Champion, and you"
	cont "are working to"
	cont "get rid of these"
	cont "ruffians?"

	para "Wonderful! I may"
	line "get to see my son"
	cont "yet again!"

	para "Here, take this"
	line "Beldum!"

	para "I brought it with"
	line "as a bargaining"
	cont "chip for Silph's"

	para "President, but the"
	line "deal went through"
	cont "without needing"
	cont "it."

	para "Please take it!"
	done

DevonStoneText2:
	text "Devon: The thought"
	line "of going home and"
	cont "seeing my son"
	cont "again fills me"
	cont "hope again."
	done

GotBeldumText:
	text "<PLAYER> received"
	line "a Beldum!"
	done

NoRoomBeldumText:
	text "Well, this is a"
	line "predicament!"

	para "You have no room"
	line "for this!"
	done

CantGiveBeldumText:
	text "Ah, my apologies."

	para "I did not realize"
	line "that you cannot"
	cont "accept this gift."
	done

SilphCo1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 17, SAFFRON_CITY, 6
	warp_event 11, 17, SAFFRON_CITY, 6

	db 0 ; coord events

	db 1 ; bg events
	bg_event 21,  0, BGEVENT_READ, SilphElevator

	db 6 ; object events
	object_event  6,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 27,  1, SPRITE_OFFICER_JENNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
	object_event 27, 15, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo1FGentlemanScript, -1
	object_event  1, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo1FScientistScript, -1
	object_event 16,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo1FGentlemanScript2, -1
	object_event 29, 12, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DevonStoneScript, -1
