	object_const_def ; object_event constants
	const MOVEDELETERSHOUSE_SUPER_NERD
	const MOVEDELETERSHOUSE_LASS

MoveDeletersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MoveDeleter:
	checkevent EVENT_GOT_A_POKEMON_FROM_MASTER
	iftrue .MoveDeletionScript
	jumptextfaceplayer MoveDeleterNoMonText

.MoveDeletionScript:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end

MaxDVsSetter:
	faceplayer
	opentext
	writetext EnterPasswordText
	buttonsound
	special AskForPasswordInMap
	writetext IsThisPasswordCorrect
	yesorno
	iffalse .DontGivePassword
	scall CheckForPassword
	scall ReturnToMoveDeletersHouse
	checkevent EVENT_PASSWORD_CHEATER
	iftrue .SetCheater
	checkevent EVENT_PASSWORD_SHINY
	iftrue .SetShiny
	checkevent EVENT_PASSWORD_MONOCHROME
	iftrue .SetMonochrome
;	checkevent EVENT_PASSWORD_NO_MONOCHROME
;	iftrue .SetNoMonochrome
	checkevent EVENT_PASSWORD_SINGULAR
	iftrue .SetSingular
.NoPassword
	writetext NoPasswordText
	waitbutton
	closetext
	end

.SetCheater:
	checkitem CANDY_POUCH
	iftrue .NoPassword
	writetext HereIsCandyPouchText
	buttonsound
	verbosegiveitem CANDY_POUCH
	closetext
	clearevent EVENT_PASSWORD_CHEATER
	end

.SetShiny:
	writetext ShinyPokemonText
	waitbutton
	closetext
	clearevent EVENT_PASSWORD_SHINY
	end

.SetMonochrome:
	writetext MonochromeText
	waitbutton
	closetext
	clearevent EVENT_PASSWORD_MONOCHROME
	end

;.SetNoMonochrome:
;	writetext NoMonochromeText
;	waitbutton
;	closetext
;	clearevent EVENT_PASSWORD_NO_MONOCHROME
;	end

.SetSingular:
	checkevent EVENT_PASSWORD_SET_3
	iftrue .NoPassword
	writetext SingularTextMoveDeleter
	waitbutton
	closetext
	setevent EVENT_PASSWORD_SET_3
	end

.DontGivePassword:
	scall ReturnToMoveDeletersHouse
	writetext TryPasswordLaterText
	waitbutton
	closetext
	end

ReturnToMoveDeletersHouse:
	callasm .ReturnToMoveDeletersHouse
	end

.ReturnToMoveDeletersHouse:
	call ReturnToMapWithSpeechTextbox
	ret

CheckForPassword:
	callasm .shinypassword
	iftrue .shinypassword2
	callasm .cheaterpassword
	iftrue .cheaterpassword2
	callasm .monochromepassword
	iftrue .monochromepassword2
;	callasm .nomonochromepassword
;	iftrue .nomonochromepassword2
	callasm .singularpassword
	iftrue .singularpassword2
	end

.shinypassword:
	xor a
	ld [wScriptVar], a
	ld de, ShinyPassword
	jp .FinishPassword

.shinypassword2:
	setevent EVENT_PASSWORD_SHINY
	setflag ENGINE_SHINY_PASSWORD
	end

.cheaterpassword:
	xor a
	ld [wScriptVar], a
	ld de, CheaterPassword
	jp .FinishPassword

.cheaterpassword2:
	setevent EVENT_PASSWORD_CHEATER
	setflag ENGINE_ACTIVATED_MAX_DVS
	end

.monochromepassword:
	xor a
	ld [wScriptVar], a
	ld de, MonochromePassword
	jp .FinishPassword

.monochromepassword2:
	callasm SetMonochrome
	setevent EVENT_PASSWORD_MONOCHROME
	end

.nomonochromepassword:
	xor a
	ld [wScriptVar], a
	ld de, NoMonochromePassword
	jp .FinishPassword

.nomonochromepassword2:
	callasm SetNoMonochrome
	setevent EVENT_PASSWORD_NO_MONOCHROME
	ret

.singularpassword2:
	setevent EVENT_PASSWORD_SINGULAR
	setflag ENGINE_4F
	end

.singularpassword:
	xor a
	ld [wScriptVar], a
	ld de, SingularPassword
.FinishPassword:
	ld hl, wRedsName
	ld c, 4
	call CompareBytes
	ret nz
	ld a, 1
	ld [wScriptVar], a
	ret

ShinyPassword:
	db "MASUDA"

CheaterPassword:
	db "CHEATER"

MonochromePassword:
	db "MONOCHROME"

SingularPassword:
	db "SINGULAR"

NoMonochromePassword:
	db "RESETCOLOR"

SetMonochrome:
	ld hl, wRedsName
	ld de, wMomsName
	ld bc, NAME_LENGTH
	jp CopyBytes

SetNoMonochrome:
	ld hl, wRedsName
	ld de, wMomsName
	ld bc, NAME_LENGTH
	jp CopyBytes

MoveDeletersHouseBookshelf:
	jumpstd genericsink

MoveDeleterTelevision:
	jumpstd televisionscript

MoveDeleterNoMonText:
	text "Um… Oh, yes, I'm"
	line "the Move Deleter."

	para "I can make #mon"
	line "forget moves."

	para "Shall I make a"
	line "#mon forget?"

	para "....Hey!"

	para "You don't even"
	line "have a #mon!"
	done

EnterPasswordText:
	text "Please say the"
	line "password."
	done

NoPasswordText:
	text "That is not a"
	line "valid password."
	done

TryPasswordLaterText:
	text "Feel free to come"
	line "back with a new"
	cont "password."
	done

HereIsCandyPouchText:
	text "All #mon you"
	line "have will have"
	cont "higher stats."

	para "Also, take this."

	para "I am silently"
	line "judging you."
	done

ShinyPokemonText:
	text "Different colored"
	line "#mon will"
	cont "appear more often."
	done

SingularTextMoveDeleter:
	text "You cannot obtain"
	line "any more #mon."
	done

MonochromeText:
	text "Go outside and the"
	line "world will appear"
	cont "less colorful."
	done

NoMonochromeText:
	text "Go outside and the"
	line "world will appear"
	cont "more colorful."
	done

IsThisPasswordCorrect:
	text "Is this password"
	line "correct?"
	done

MoveDeletersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BLACKTHORN_CITY, 6
	warp_event  5,  7, BLACKTHORN_CITY, 6

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  4,  1, BGEVENT_READ, MoveDeleterTelevision

	db 2 ; object events
	object_event  3,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
	object_event  6,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MaxDVsSetter, -1
