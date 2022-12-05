	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE4F_ARIANA
	const OLIVINELIGHTHOUSE4F_ROCKET_GIRL
	const OLIVINELIGHTHOUSE4F_OFFICER
	const OLIVINELIGHTHOUSE4F_COOLTRAINERF

OlivineLighthouse4F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

ArianaNorth:
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, OLIVINELIGHTHOUSE4F_ARIANA, 15
	turnobject OLIVINELIGHTHOUSE4F_ARIANA, UP
	turnobject PLAYER, DOWN
	opentext
	writetext LighthouseArianaSeenText
	waitbutton
	closetext
	winlosstext LighthouseArianaBeatenText, LighthouseArianaLossText
	loadtrainer ARIANA, ARIANA_1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LIGHTHOUSE_ARIANA
	opentext
	writetext LighthouseArianaAfterBattleText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

ArianaEast:
	showemote EMOTE_SHOCK, OLIVINELIGHTHOUSE4F_ARIANA, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject PLAYER, LEFT
	opentext
	writetext LighthouseArianaSeenText
	waitbutton
	closetext
	winlosstext LighthouseArianaBeatenText, LighthouseArianaLossText
	loadtrainer ARIANA, ARIANA_1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LIGHTHOUSE_ARIANA
	opentext
	writetext LighthouseArianaAfterBattleText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

LighthouseArianaScript:
	jumptextfaceplayer LighthouseArianaAfterBattleText

TrainerLighthouse4FGruntF:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, Lighthouse4FGruntFSeenText, Lighthouse4FGruntFBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Lighthouse4FGruntFAfterBattleText
	waitbutton
	closetext
	end

Lighthouse4FOfficerScript:
	jumptextfaceplayer Lighthouse4FOfficerText

Lighthouse4FCooltrainerFScript:
	jumptextfaceplayer Lighthouse4FCooltrainerFText

LighthouseArianaSeenText:
	text "Hold it, you slimy"
	line "Rattata."

	para "I've heard good"
	line "things about you,"
	cont "which is bad for"
	cont "us."

	para "You can call me"
	line "Ariana, child."

	para "I'm pretty high up"
	line "up in this little"
	cont "team, despite my"
	cont "age, so don't"
	cont "patronize me!"
	done

LighthouseArianaBeatenText:
	text "You little brat!"
	done

LighthouseArianaLossText:
	text "This can't be!"

	para "My last #mon?"
	done

LighthouseArianaAfterBattleText:
	text "I can't believe"
	line "this!"

	para "I lost to you?"

	para "I lost to a kid?"

	para "....No, it doesn't"
	line "matter that I'm"
	cont "not any older than"
	cont "you!"

	para "Aaagh!"

	para "It's so annoying!"
	done

Lighthouse4FGruntFSeenText:
	text "You don't need to"
	line "bother the higher-"
	cont "ups."

	para "I'll take care of"
	line "you right now!"
	done

Lighthouse4FGruntFBeatenText:
	text "You took care of"
	line "me instead."
	done

Lighthouse4FGruntFAfterBattleText:
	text "The higher-ups"
	line "will have to deal"
	cont "with you now."

	para "Don't say I didn't"
	line "warn you."
	done

Lighthouse4FOfficerText:
	text "You know, they may"
	line "be criminals, but"
	cont "they weren't wrong"

	para "when they were"
	line "talking about this"
	cont "hole here."

	para "It's a serious"
	line "safety issue."
	done

Lighthouse4FCooltrainerFText:
	text "I hope these cops"
	line "leave soon."

	para "This is my favor-"
	line "ite spot for"
	cont "isolation."
	done

OlivineLighthouse4F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 4
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 5
	warp_event  6, 15, OLIVINE_LIGHTHOUSE_5F, 4

	db 2 ; coord events
	coord_event  8,  5, SCENE_DEFAULT, ArianaNorth
	coord_event  9,  6, SCENE_DEFAULT, ArianaEast

	db 0 ; bg events

	db 4 ; object events
	object_event  8,  6, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 3, LighthouseArianaScript, EVENT_LIGHTHOUSE_ROCKETS
	object_event 11,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLighthouse4FGruntF, EVENT_LIGHTHOUSE_ROCKETS
	object_event 10,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lighthouse4FOfficerScript, EVENT_LIGHTHOUSE_SHERLES
	object_event  3, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Lighthouse4FCooltrainerFScript, EVENT_LIGHTHOUSE_CIVILLIANS
