	object_const_def ; object_event constants
	const POKEMONMANSIONB1F_DIARY

PokemonMansionB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ShuttersB1F

.ShuttersB1F:
	checkevent EVENT_POKEMON_MANSION_SWITCH
	iftrue .ShuttersB1FSwitch
	return

.ShuttersB1FSwitch:
	changeblock  4,  8, $14 ; Shutter
	changeblock 16, 16, $14 ; Shutter
	changeblock 26, 16, $0e ; Floor
	changeblock 12, 22, $0e ; Floor
	changeblock 18, 24, $02 ; Open Eyes
	changeblock 20,  2, $02 ; Open Eyes
	return

PokemonMansionB1FAbraStatue:
	opentext
	writetext PokemonMansionPressTheButtonB1FText
	yesorno
	iffalse .DidntPressTheButtonB1F
	writetext WhoWouldntB1FText
	buttonsound
	waitsfx
	playsound SFX_PUSH_BUTTON
	closetext
	checkevent EVENT_POKEMON_MANSION_SWITCH
	iftrue .TurnOffSwitchB1F
	setevent EVENT_POKEMON_MANSION_SWITCH
	changeblock  4,  8, $14 ; Shutter
	changeblock 16, 16, $14 ; Shutter
	changeblock 26, 16, $0e ; Floor
	changeblock 12, 22, $0e ; Floor
	changeblock 18, 24, $02 ; Open Eyes
	changeblock 20,  2, $02 ; Open Eyes
	reloadmappart
	end

.TurnOffSwitchB1F:
	clearevent EVENT_POKEMON_MANSION_SWITCH
	changeblock  4,  8, $0e ; Floor
	changeblock 16, 16, $0e ; Floor
	changeblock 26, 16, $54 ; Shutter
	changeblock 12, 22, $5f ; Shutter
	changeblock 18, 24, $77 ; Open Eyes
	changeblock 20,  2, $77 ; Open Eyes
	reloadmappart
	end

.DidntPressTheButtonB1F:
	writetext NotQuiteYetB1FText
	waitbutton
	closetext
	end

PokemonMansionB1FTank:
	jumptext PokemonMansionB1FTankText

PokemonMansionB1FDiary:
	jumptext PokemonMansionB1FDiaryText

PokemonMansionB1FRecording:
	opentext
	writetext ThereIsATapeText
	waitbutton
	closetext
	pause 30
	special FadeOutMusic
	pause 30
	playsound SFX_PECK
	pause 30
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	opentext
	writetext PokemonMansionB1FRecordingText
	waitbutton
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	writetext M00ConvincedText
	waitbutton
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	writetext OnlyMewtwoRemainsText
	waitbutton
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	writetext ThereIsntMuchTimeText
	waitbutton
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	writetext ThereIsNoEscapeText
	waitbutton
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	writetext ItFoundMeText
	waitbutton
	closetext
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	pause 30
	cry MEWTWO
	waitsfx
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	playsound SFX_EMBER
	pause 40
	playsound SFX_PECK
	pause 30
	opentext
	writetext TheTapeEndedText
	waitbutton
	closetext
	pause 30
	special RestartMapMusic
	end

PokemonMansionPressTheButtonB1FText:
	text "A secret switch!"

	para "Press it?"
	done

WhoWouldntB1FText:
	text "Who wouldn't?"
	done

NotQuiteYetB1FText:
	text "Not quite yet!"
	done

PokemonMansionB1FTankText:
	text "What could have"
	line "been in here?"

	para "There are glass"
	line "shards littering"
	cont "the floor…"
	done

PokemonMansionB1FDiaryText:
	text "Diary; Sept. 1"
	line "Mewtwo is far too"
	cont "powerful."

	para "We have failed to"
	line "curb its vicious"
	cont "tendencies…"
	done

ThereIsATapeText:
	text "There is a tape in"
	line "the player."

	para "Let's listen."
	done

PokemonMansionB1FRecordingText:
	text "I am recording"
	line "this as a warning!"

	para "We were not able"
	line "to control that"
	cont "which we created!"
	done

M00ConvincedText:
	text "'M(00) convinced"
	line "Mewtwo that we are"
	cont "the enemy!"

	para "Mewtwo destroyed"
	line "its holding tank,"
	cont "and attacked us!"

	para "It released 'M(00)"
	line "and now it won't"
	cont "stop…"
	done

OnlyMewtwoRemainsText:
	text "'M(00) is gone,"
	line "and now only"
	cont "Mewtwo remains…"

	para "I can feel the"
	line "fire getting"
	cont "closer!"
	done

ThereIsntMuchTimeText:
	text "There isn't much"
	line "time left…"

	para "I should have"
	line "listened to Dr."
	cont "Fuji…"

	para "I should have left"
	line "when I had the"
	cont "chance…"
	done

ThereIsNoEscapeText:
	text "There is no escape"
	line "for us now…"

	para "We meddled in"
	line "affairs not meant"
	cont "for humans…"

	para "Do not repeat our"
	line "mistakes…"

	para "For your own sake…"
	done

ItFoundMeText:
	text "…It found me…"

	para "…Mewtwo…"

	para "We dreamed of cre-"
	line "ating the world's"
	cont "strongest #mon…"

	para "…And we succeeded…"
	done

TheTapeEndedText:
	text "……The tape ended……"
	done

PokemonMansionB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 23, 22, POKEMON_MANSION_1F, 8
;	warp_event  4,  0, CINNABAR_VOLCANO_1F, 1
;	warp_event  5,  0, CINNABAR_VOLCANO_1F, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event 18, 25, BGEVENT_READ, PokemonMansionB1FAbraStatue
	bg_event 20,  3, BGEVENT_READ, PokemonMansionB1FAbraStatue
	bg_event  4, 23, BGEVENT_READ, PokemonMansionB1FTank
	bg_event  5, 23, BGEVENT_READ, PokemonMansionB1FTank
	bg_event  4, 13, BGEVENT_READ, PokemonMansionB1FTank
	bg_event  5, 13, BGEVENT_READ, PokemonMansionB1FTank
	bg_event 10,  2, BGEVENT_READ, PokemonMansionB1FRecording

	db 1 ; object events
	object_event 17, 20, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FDiary, -1
