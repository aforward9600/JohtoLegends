	object_const_def ; object_event constants
	const CELADONMANSION3F_COOLTRAINER_M
	const CELADONMANSION3F_GYM_GUY
	const CELADONMANSION3F_SUPER_NERD
	const CELADONMANSION3F_FISHER

CeladonMansion3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GameFreakGameDesignerScript:
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	readvar VAR_DEXUNCAUGHT
	iffalse .CompletedPokedex ; ignore Mew and Celebi
	waitbutton
	closetext
	end

.CompletedPokedex:
	buttonsound
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	buttonsound
	special Diploma
	writetext GameFreakGameDesignerAfterDiplomaText
	waitbutton
	closetext
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end

mountvesuviusScript:
	jumptextfaceplayer mountvesuviusText

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitbutton
	closetext
	end

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalse .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitbutton
	closetext
	end

.CancelPrinting:
; unused
	writetext GameFreakGraphicArtistErrorText
	waitbutton
	closetext
	end

Ax6Script:
	jumptextfaceplayer Ax6Text

CardboardBoxScript:
	jumptextfaceplayer CardboardBoxText

GameFreakCharacterDesignerScript:
	jumptextfaceplayer GameFreakCharacterDesignerText

CeladonMansion3FDevRoomSign:
	jumptext CeladonMansion3FDevRoomSignText

CeladonMansion3FDrawing:
	jumptext CeladonMansion3FDrawingText

CeladonMansion3FGameProgram:
	jumptext CeladonMansion3FGameProgramText

CeladonMansion3FReferenceMaterial:
	jumptext CeladonMansion3FReferenceMaterialText

RangiScript:
	jumptextfaceplayer RangiText

GameFreakGameDesignerText:
	text "Is that right?"

	para "I'm the Game"
	line "Designer!"

	para "Filling up your"
	line "Journal is tough,"
	cont "but don't give up!"

	para "There is something"
	line "that seems odd to"
	cont "me."

	para "I only remember"
	line "251 #mon in"
	cont "this game."

	para "Where did all of"
	line "these other ones"
	cont "come from?"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "Wow! Excellent!"
	line "You completed your"
	cont "Journal!"

	para "Congratulations!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "…"
	done

GameFreakGameDesignerAfterDiplomaText:
	text "As a reward, I'm"
	line "going to tell you"
	cont "a secret!"

	para "Apparently, in the"
	line "future, a method"
	cont "to find Shiny"
	cont "#mon more"
	cont "easily will be"
	cont "discovered!"

	para "It's called the"
	line "MASUDA Method!"

	para "I don't think it"
	line "will work in this"
	cont "game, however."
	done

GameFreakGraphicArtistText:
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "I drew you!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "Oh, you completed"
	line "your #dex?"

	para "Want me to print"
	line "out your DIPLOMA?"
	done

GameFreakGraphicArtistRefusedText:
	text "Give me a shout if"
	line "you want your"
	cont "Diploma printed."
	done

GameFreakGraphicArtistErrorText:
	text "Something's wrong."
	line "I'll have to can-"
	cont "cel printing."
	done

Ax6Text:
	text "Who, me? I'm ax6!"

	para "I made the 16-bit"
	line "modifications to"
	cont "#mon Crystal!"

	para "You'd only have 253"
	line "#mon and 254"
	cont "moves without my"
	cont "work!"
	done

CardboardBoxText:
	text "I'm cardboardbox!"

	para "We would have a"
	line "lot of game-"
	cont "breaking glitches"
	cont "without me!"

	para "I got the Physical"
	line "Special Split to"
	cont "work with 16-bit,"
	cont "as well as the"
	cont "evolution moves!"
	done

mountvesuviusText:
	text "I'm mountvesuvius!"

	para "I helped fix a few"
	line "issues Ferropexola"
	cont "wasn't smart enough"
	cont "to handle!"

	para "…Don't tell him I"
	line "said that!"
	done

GameFreakCharacterDesignerText:
	text "Aren't the TWINS"
	line "adorable?"

	para "JASMINE's pretty"
	line "too."

	para "Oh, I love them!"
	done

CeladonMansion3FDevRoomSignText:
	text "Johto Legends"
	line "Development Room"
	done

CeladonMansion3FDrawingText:
	text "Dear <PLAYER>,"

	para "I'm sorry I can't"
	line "be in the"
	cont "Development Room."

	para "I am currently out"
	line "on business."

	para "I'm certain we'll"
	line "meet in your"
	cont "travels."

	para "When we meet, we"
	line "will see who is"
	cont "more powerful."

	para "I look forward to"
	line "it."

	para "Sincerely,"
	line "Ferropexola."
	done

CeladonMansion3FGameProgramText:
	text "Note to self:"

	para "Nerf Geodude."

	para "DemICE was having"
	line "entirely too much"
	cont "fun with it."
	done

CeladonMansion3FReferenceMaterialText:
	text "It's a picture of"
	line "an angry nerd with"
	cont "the caption:"

	para "What were they"
	line "thinking?"

	para "Seems like someone"
	line "is annoyed at"
	cont "their own design"
	cont "choices."
	done

RangiText:
	text "Hi, I'm Rangi!"

	para "I helped Ferro out"
	line "with some of the"
	cont "code."

	para "#mon Polished"
	line "Crystal was a big"
	cont "inspiration for"
	cont "Johto Legends, so"
	cont "you should play it"
	cont "when you get the"
	cont "chance!"
	done

CeladonMansion3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, CELADON_MANSION_ROOF, 1
	warp_event  1,  0, CELADON_MANSION_2F, 2
	warp_event  6,  0, CELADON_MANSION_2F, 3
	warp_event  7,  0, CELADON_MANSION_ROOF, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  5,  8, BGEVENT_UP, CeladonMansion3FDevRoomSign
	bg_event  4,  3, BGEVENT_UP, CeladonMansion3FDrawing
	bg_event  1,  6, BGEVENT_UP, CeladonMansion3FGameProgram
	bg_event  1,  3, BGEVENT_UP, CeladonMansion3FReferenceMaterial

	db 5 ; object events
	object_event  4,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, mountvesuviusScript, -1
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CardboardBoxScript, -1
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Ax6Script, -1
	object_event  0,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  1,  5, SPRITE_SCIENTIST_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RangiScript, -1
