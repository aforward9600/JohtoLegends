	object_const_def ; object_event constants
	const RADIOTOWER1F_RIVAL
	const RADIOTOWER1F_DIRECTOR
	const RADIOTOWER1F_SHERLES
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_ROCKET2
	const RADIOTOWER1F_ROCKET3
	const RADIOTOWER1F_ROCKET4
	const RADIOTOWER1F_ENGINEER
	const RADIOTOWER1F_ENGINEER2
	const RADIOTOWER1F_POLICE
	const RADIOTOWER1F_BLACKBELT
	const RADIOTOWER1F_SYLVEON
	const RADIOTOWER1F_WOBBUFFET

RadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower1FRivalScript:
	faceplayer
	opentext
	writetext RadioTower1FRivalText
	waitbutton
	closetext
	turnobject RADIOTOWER1F_RIVAL, RIGHT
	end

RadioTower1FDirectorScript:
	jumptextfaceplayer RadioTower1FDirectorText

RadioTower1FSherlesScript:
	jumptextfaceplayer RadioTower1FSherlesText

RadioTower1FGruntMScript:
	faceplayer
	opentext
	writetext RadioTower1FGruntMText
	waitbutton
	closetext
	turnobject RADIOTOWER1F_ROCKET, LEFT
	end

RadioTower1FGruntM2Script:
	jumptextfaceplayer RadioTower1FGruntM2Text

RadioTower1FGruntM3Script:
	faceplayer
	opentext
	writetext GruntM3SeenText
	waitbutton
	closetext
	winlosstext GruntM3BeatenText, 0
	loadtrainer GRUNTM, GRUNTM_12
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_GRUNTM_12
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	disappear RADIOTOWER1F_ROCKET3
	playsound SFX_EXIT_BUILDING
	end

RadioTower1FGruntM4Script:
	jumptextfaceplayer RadioTower1FGruntM4Text

RadioTower1FEngineerScript:
	jumptextfaceplayer RadioTower1FEngineerText

RadioTower1FEngineer2Script:
	jumptextfaceplayer RadioTower1FEngineer2Text

RadioTower1FOfficerScript:
	jumptextfaceplayer RadioTower1FOfficerText

RadioTower1FBlackBeltScript:
	jumptextfaceplayer RadioTower1FBlackBeltText

RadioTower1FSylveonScript:
	refreshscreen
	pokepic SYLVEON
	cry SYLVEON
	waitbutton
	closepokepic
	opentext
	writetext TowerSylveonText
	waitbutton
	closetext
	end

RadioTower1FWobbuffetScript:
	refreshscreen
	pokepic WOBBUFFET
	cry WOBBUFFET
	waitbutton
	closepokepic
	opentext
	writetext WobbuffetText
	waitbutton
	closetext
	end

RadioTower1FRivalText:
	text "Don't worry, I got"
	line "this! You go on"
	cont "ahead!"
	done

RadioTower1FDirectorText:
	text "So, if we plant"
	line "the explosives"
	cont "there, then we…"

	para "Hm, yes. That"
	line "should work."
	done

RadioTower1FSherlesText:
	text "Stop hanging"
	line "around here kid,"
	cont "or I'll arrest"
	cont "you."

	para "You're on thin"
	line "ice, now."
	done

RadioTower1FGruntMText:
	text "Why are these kids"
	line "always so tough?"
	done

RadioTower1FGruntM2Text:
	text "Taking over this"
	line "place was a piece"
	cont "of cake!"

	para "What are we even"
	line "here for, though?"

	para "Doesn't look like"
	line "there's anything"
	cont "to steal."
	done

RadioTower1FGruntM3Text:
	text "Let's hope our"
	line "informant was"
	cont "correct, for his"
	cont "sake."
	done

RadioTower1FGruntM4Text:
	text "Quit your yelling."

	para "Nobody's saving you"
	line "today."
	done

RadioTower1FEngineerText:
	text "Help me, please!"

	para "I'm not a trainer!"

	para "I'm just a simple"
	line "engineer!"
	done

RadioTower1FEngineer2Text:
	text "Hey, thanks for"
	line "help back there."

	para "Just don't tell"
	line "anyone I was"
	cont "pleading."

	para "I got a reputation"
	line "to uphold!"
	done

RadioTower1FOfficerText:
	text "Another day,"
	line "another tower."

	para "I'm starting to"
	line "think these guys"
	cont "like towers."

	para "Maybe their hide-"
	line "out is in one?"
	done

TowerSylveonText:
	text "Sylveon: Syyyyyll!"
	done

WobbuffetText:
	text "Wobbuffet: WAAAAH!"

	para "…buffet."
	done

RadioTower1FBlackBeltText:
	text "You can go on"
	line "ahead."

	para "It's you, after-"
	line "all."
	done

GruntM3SeenText:
	text "I got word that"
	line "you'd be here."

	para "We didn't expect"
	line "you to show up so"
	cont "soon!"

	para "I'll take care of"
	line "you right now, so"
	cont "our plan goes off"
	cont "without a hitch!"
	done

GruntM3BeatenText:
	text "Too strong! Gotta"
	line "warn the others…"
	done

GruntM3AfterBattleText:
	text "This won't do…"

	para "Our plan could be"
	line "ruined. The others"
	cont "will have to get"
	cont "rid of you…"
	done

RadioTower1FDirectoryText:
	text "1F RECEPTION"
	line "2F SALES"

	para "3F PERSONNEL"
	line "4F PRODUCTION"

	para "5F DIRECTOR'S"
	line "   OFFICE"
	done

RadioTower1FLuckyChannelSignText:
	text "LUCKY CHANNEL!"

	para "Win with #MON"
	line "ID numbers!"

	para "Trade your #MON"
	line "to collect differ-"
	cont "ent ID numbers!"
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, GOLDENROD_CITY, 11
	warp_event 10, 15, GOLDENROD_CITY, 11
	warp_event 10,  2, RADIO_TOWER_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 13 ; object events
	object_event  8, 11, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FRivalScript, EVENT_GOLDENROD_TOWER_RIVAL
	object_event 16,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FDirectorScript, EVENT_GOLDENROD_TOWER_DIRECTOR
	object_event 15,  4, SPRITE_SHERLES, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FSherlesScript, EVENT_GOLDENROD_TOWER_SHERLES
	object_event 11, 11, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FGruntMScript, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  4,  6, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FGruntM2Script, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 10,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FGruntM3Script, EVENT_BEAT_ROCKET_GRUNTM_12
	object_event 15,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FGruntM4Script, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 16,  4, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FEngineerScript, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  5, 12, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FEngineer2Script, EVENT_GOLDENROD_TOWER_DIRECTOR
	object_event  4,  3, SPRITE_OFFICER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FOfficerScript, EVENT_GOLDENROD_TOWER_POLICE
	object_event 11,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FBlackBeltScript, EVENT_GOLDENROD_TOWER_DIRECTOR
	object_event  9, 11, SPRITE_SYLVEON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FSylveonScript, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 10, 11, SPRITE_WOBBUFFET, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FWobbuffetScript, EVENT_GOLDENROD_TOWER_TAKEOVER
