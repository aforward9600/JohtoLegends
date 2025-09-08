	object_const_def ; object_event constants
	const CHERRYGROVEPOKECENTER1F_NURSE
	const CHERRYGROVEPOKECENTER1F_GENTLEMAN
	const CHERRYGROVEPOKECENTER1F_TEACHER

CherrygrovePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygrovePokecenter1FNurseScript:
	jumpstd pokecenternurse

CherrygrovePokecenter1FGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MADAME_BOSS
	iftrue .BeatRockets
	writetextend CherrygrovePokecenter1FGentlemanText

.BeatRockets:
	writetextend CherrygrovePokecenter1FGentlemanText2

CherrygrovePokecenter1FTeacherScript:
	jumptextfaceplayer CherrygrovePokecenter1FTeacherText

HiddenAbilityChangeScript:
	faceplayer
	opentext
	checkitem ABILITY_PILL
	iftrue .AskAbilityPill
	writetextend BringMeAnAbilityPill

.AskAbilityPill
	writetext ChangeAbilityText
	yesorno
	iffalse .Cancel
	takeitem ABILITY_PILL
	writetext WhichPokemonAbility
	waitbutton
	special HiddenAbilityChange
	closetext
	end

.Cancel
	writetextend HiddenAbilityCancelText

CherrygrovePokecenter1FGentlemanText:
	text "Shh!"

	para "I'm working for"
	line "the police!"

	para "I've heard reports"
	line "of odd people"
	cont "dressed all in"
	cont "black near here."

	para "Let me know if"
	line "you see anything."
	done

CherrygrovePokecenter1FGentlemanText2:
	text "So you're the one"
	line "who took out the"
	cont "criminals!"

	para "Great job, kid!"
	done

CherrygrovePokecenter1FTeacherText:
	text "Terrible stuff"
	line "happening in Kanto"
	cont "right now."

	para "It's been like that"
	line "for a few years."

	para "I hope someone can"
	line "help them soon."
	done

BringMeAnAbilityPill:
	text "I've developed a"
	line "method of bringing"
	cont "out a #mon's"
	cont "hidden ability."

	para "Bring an Ability"
	line "Pill to me and I"
	cont "can show you."
	done

ChangeAbilityText:
	text "I see you have an"
	line "Ability Pill."

	para "Will you let me"
	line "bring out your"
	cont "#mon's hidden"
	cont "ability?"

	para "I can also reset"
	line "their ability to"
	cont "their first one."

	para "Once you agree,"
	line "there is no going"
	cont "back."
	
	para "Will you proceed?"
	done

WhichPokemonAbility:
	text "Which #mon will"
	line "have their"
	cont "ability changed?"
	done

HiddenAbilityCancelText:
	text "Very well."
	done

CherrygrovePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CHERRYGROVE_CITY, 2
	warp_event  4,  7, CHERRYGROVE_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FNurseScript, -1
	object_event  5,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FGentlemanScript, -1
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FTeacherScript, -1
	object_event  7,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HiddenAbilityChangeScript, -1
