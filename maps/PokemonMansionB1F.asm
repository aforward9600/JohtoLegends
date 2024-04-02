	object_const_def ; object_event constants
	const POKEMONMANSIONB1F_DIARY
	const POKEMONMANSIONB1F_SCIENTIST
	const POKEMONMANSIONB1F_GUARD
	const POKEMONMANSIONB1F_BLAINE
	const POKEMONMANSIONB1F_SCIENTIST2
	const POKEMONMANSIONB1F_SCIENTIST3
	const POKEMONMANSIONB1F_GIOVANNI

PokemonMansionB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ShuttersB1F

.DummyScene0:
	end

.DummyScene1:
	end

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
	changeblock 18, 24, $77 ; Close Eyes
	changeblock 20,  2, $77 ; Close Eyes
	reloadmappart
	end

.DidntPressTheButtonB1F:
	writetext NotQuiteYetB1FText
	waitbutton
	closetext
	end

CinnabarVolcanoGuardScript:
	jumptextfaceplayer CinnabarVolcanoGuardText

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

PokemonMansionB1FScientist:
	opentext
	writetext PokemonMansionB1FScientistText
	waitbutton
	closetext
	pause 15
	showemote EMOTE_SHOCK, POKEMONMANSIONB1F_SCIENTIST, 15
	pause 15
	faceplayer
	opentext
	writetext PokemonMansionB1FScientistText2
	loadmonindex 1, MEWTWO
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue HaveMewtwoMansion
	loadmonindex 2, MISSINGNO
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue HaveMissingno
	waitbutton
	closetext
	turnobject POKEMONMANSIONB1F_SCIENTIST, UP
	end

HaveMewtwoMansion:
	waitbutton
	writetext YouHaveMewtwoText
	waitbutton
	closetext
	turnobject POKEMONMANSIONB1F_SCIENTIST, UP
	end

HaveMissingno:
	waitbutton
	writetext YouHaveMissingnoText
	waitbutton
	closetext
	turnobject POKEMONMANSIONB1F_SCIENTIST, UP
	end

PokemonMansionBlaineScript:
	checkevent EVENT_CINNABAR_VOLCANO_GUARD
	iftrue .CheckForFlameDown
	opentext
	writetext PokemonMansionBlaineText1
	waitbutton
	closetext
	pause 15
	showemote EMOTE_SHOCK, POKEMONMANSIONB1F_BLAINE, 15
	pause 15
	faceplayer
	opentext
	writetext PokemonMansionBlaineText2
	waitbutton
	closetext
	disappear POKEMONMANSIONB1F_GUARD
	turnobject POKEMONMANSIONB1F_BLAINE, UP
	end

.CheckForFlameDown:
	faceplayer
	opentext
	checkevent EVENT_GOT_FLAME_DOWN
	iftrue .GotFlameDown
	writetext PokemonMansionBlaineText3
	waitbutton
	closetext
	turnobject POKEMONMANSIONB1F_BLAINE, UP
	end

.GotFlameDown:
	writetext PokemonMansionBlaineText4
	waitbutton
	closetext
	setevent EVENT_OPENED_CINNABAR_GYM
	takeitem FLAME_DOWN
	readvar VAR_FACING
	ifequal LEFT, .BlaineLeavesLeft
	applymovement POKEMONMANSIONB1F_BLAINE, BlaineLeavesRightMovement
	disappear POKEMONMANSIONB1F_BLAINE
	end

.BlaineLeavesLeft:
	applymovement POKEMONMANSIONB1F_BLAINE, BlaineLeavesLeftMovement
	disappear POKEMONMANSIONB1F_BLAINE
	end

PokemonMansionB1FScientist2:
	jumptextfaceplayer PokemonMansionB1FScientistText3

PokemonMansionB1FScientist3:
	faceplayer
	opentext
	checkscene
	iftrue .PokemonMansionB1FScientist32
	writetext PokemonMansionB1FScientist3Text
	waitbutton
	closetext
	end

.PokemonMansionB1FScientist32:
	writetext PokemonMansionB1FScientist3Text2
	waitbutton
	closetext
	end

ScientistStopsYou:
	opentext
	writetext ThatsItThenText
	waitbutton
	closetext
	applymovement POKEMONMANSIONB1F_GIOVANNI, GiovanniLeavesTheBasementMovement
	opentext
	writetext GiovanniOutOfMyWayText
	waitbutton
	closetext
	applymovement PLAYER, PlayerMovesOutOfGiovannisWayMovement
	pause 10
	applymovement POKEMONMANSIONB1F_GIOVANNI, GiovanniLeavesTheBasementMovement2
	disappear POKEMONMANSIONB1F_GIOVANNI
	clearevent EVENT_CINNABAR_MANSION_1F_GIOVANNI
	setscene SCENE_FINISHED
	end

BlaineLeavesLeftMovement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step_end

BlaineLeavesRightMovement:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step_end

ScientistStopsYouMovement:
	step UP
	step_resume

GiovanniLeavesTheBasementMovement:
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step_end

PlayerMovesOutOfGiovannisWayMovement:
	turn_head DOWN
	fix_facing
	step UP
	step UP
	remove_fixed_facing
	turn_head RIGHT
	fix_facing
	step LEFT
	remove_fixed_facing
	step_resume

GiovanniLeavesTheBasementMovement2:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

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

PokemonMansionB1FScientistText:
	text "I can't believe"
	line "they both escaped…"

	para "Why didn't 'M(00)"
	line "corrupt anything?"
	done

PokemonMansionB1FScientistText2:
	text "Hey!"

	para "Quit eavesdropping"
	line "on my conversation"
	cont "with myself!"
	done

CinnabarVolcanoGuardText:
	text "Sorry, but you"
	line "can't go in here."

	para "The fire collapsed"
	line "this part of the"
	cont "wall, and it leads"
	cont "to an underground"
	cont "volcano!"
	done

PokemonMansionBlaineText1:
	text "???: He's shutting"
	line "us down now…"

	para "After everything"
	line "we achieved…"

	para "Now what am I"
	line "going to do?"

	para "Fuji…"

	para "I hope you're happy"
	line "wherever you are…"
	done

PokemonMansionBlaineText2:
	text "???: Who are you?"

	para "………Ah, I know you."

	para "Yes, you're the"
	line "Champion."

	para "How could I not"
	line "know you?"

	para "You saved Johto"
	line "from a shady"
	cont "group."

	para "How do I know?"

	para "News travels fast."

	para "I am Blaine, a"
	line "researcher, or a"
	cont "former researcher"
	cont "here, I should"
	cont "say…"

	para "So, what is it"
	line "that you want?"

	para "………You're looking"
	line "for a new Gym"
	cont "Leader to take on"
	cont "the Federation?"

	para "…Well, I suppose I"
	line "am unemployed now."

	para "Tell you what, I'll"
	line "battle you on one"
	cont "condition."

	para "You see that hole"
	line "in the wall back"
	cont "there?"

	para "Go in there, and"
	line "get me some Flame"
	cont "Down."

	para "I'd like to use it"
	line "for some personal"
	cont "tests."

	para "It can be found on"
	line "a #mon covered"
	cont "in flames."

	para "Come back when you"
	line "have it."
	done

PokemonMansionBlaineText3:
	text "Blaine: Catch or"
	line "defeat the #mon"
	cont "to claim the down."
	done

PokemonMansionBlaineText4:
	text "Blaine: You really"
	line "did it."

	para "Impressive."

	para "Yes, this is it."

	para "The natural warmth"
	line "is impressive."

	para "I shall meet you"
	line "at the Gym."

	para "Yes, I was the Gym"
	line "Leader a while"
	cont "ago."

	para "I got absorbed in"
	line "my work here years"
	cont "ago, so I had"
	cont "neglected my job."

	para "Looks like it's"
	line "time I made up for"
	cont "lost time."
	done

PokemonMansionB1FScientistText3:
	text "Where's that tape?"

	para "I need to get rid"
	line "of it now!"

	para "That information"
	line "cannot get out!"
	done

PokemonMansionB1FScientist3Text:
	text "Please don't go"
	line "back there."

	para "Our boss is busy"
	line "talking with our"
	cont "financier."
	done

PokemonMansionB1FScientist3Text2:
	text "You can go on"
	line "through."

	para "Not much to do"
	line "there now."
	done

ThatsItThenText:
	text "???: So, that's it"
	line "then?"

	para "All of that time"
	line "and money, and I"
	cont "get nothing?"

	para "Looks like I'll"
	line "have to finance a"
	cont "more profitable"
	cont "venue!"

	para "Thanks for"
	line "nothing!"
	done

GiovanniOutOfMyWayText:
	text "???: Get out of my"
	line "way."
	done

YouHaveMewtwoText:
	text "…Wait, is that…?"

	para "How do you have"
	line "Mewtwo?"

	para "That EXPERIMENT"
	line "is responsible"
	cont "for this!"

	para "Get out of here!"
	done

YouHaveMissingnoText:
	text "…Wait, is that…?"

	para "How do you have"
	line "Missingno.?"

	para "That EXPERIMENT"
	line "is responsible"
	cont "for this!"

	para "Get out of here!"
	done

PokemonMansionB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23, 22, POKEMON_MANSION_1F, 8
	warp_event  4,  0, CINNABAR_VOLCANO_1F, 1

	db 1 ; coord events
	coord_event 5, 8, SCENE_DEFAULT, ScientistStopsYou

	db 7 ; bg events
	bg_event 18, 25, BGEVENT_READ, PokemonMansionB1FAbraStatue
	bg_event 20,  3, BGEVENT_READ, PokemonMansionB1FAbraStatue
	bg_event  4, 23, BGEVENT_READ, PokemonMansionB1FTank
	bg_event  5, 23, BGEVENT_READ, PokemonMansionB1FTank
	bg_event  4, 13, BGEVENT_READ, PokemonMansionB1FTank
	bg_event  5, 13, BGEVENT_READ, PokemonMansionB1FTank
	bg_event 10,  2, BGEVENT_READ, PokemonMansionB1FRecording

	db 7 ; object events
	object_event 17, 20, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FDiary, -1
	object_event  4, 24, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FScientist, -1
	object_event  4,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CinnabarVolcanoGuardScript, EVENT_CINNABAR_VOLCANO_GUARD
	object_event  5, 14, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokemonMansionBlaineScript, EVENT_POKEMON_MANSION_BLAINE
	object_event 16, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FScientist2, -1
	object_event  4,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonMansionB1FScientist3, -1
	object_event  6, 13, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CINNABAR_MANSION_B1F_GIOVANNI
