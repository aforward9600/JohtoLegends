	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE5F_ARCHER
	const OLIVINELIGHTHOUSE5F_ROCKET
	const OLIVINELIGHTHOUSE5F_ROCKET_GIRL
	const OLIVINELIGHTHOUSE5F_POKE_BALL2
	const OLIVINELIGHTHOUSE5F_POKE_BALL3
	const OLIVINELIGHTHOUSE5F_OFFICER
	const OLIVINELIGHTHOUSE5F_TWIN

OlivineLighthouse5F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end
.DummyScene1:
	end

TrainerLighthouseArcher:
	trainer ARCHER, ARCHER_1, EVENT_BEAT_LIGHTHOUSE_ARCHER, LighthouseArcherSeenText, LighthouseArcherBeatenText, LighthouseArcherLostText, .Script

.Script:
	opentext
	writetext LighthouseArcherAfterBattleText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_LIGHTHOUSE6F_SHERLES
	end

TrainerLighthouse5FRocket:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, Lighthouse5FRocketSeenText, Lighthouse5FRocketBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Lighthouse5FRocketAfterBattleText
	waitbutton
	closetext
	end

TrainerLighthouse5FRocketF:
	trainer GRUNTF, GRUNTF_5, EVENT_BEAT_ROCKET_GRUNTF_5, Lighthouse5FRocketFSeenText, Lighthouse5FRocketFBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Lighthouse5FRocketFAfterBattleText
	waitbutton
	closetext
	end

Lighthouse5FOfficerScript:
	jumptextfaceplayer Lighthouse5FOfficerText

Lighthouse5FTwinScript:
	jumptextfaceplayer Lighthouse5FTwinText

OlivineLighthouse5FSuperRepel:
	itemball REPEL

OlivineLighthouse5FTMSwagger:
	itemball TM_DAZZLINGLEAM

OlivineLighthouse5FHiddenHyperPotion:
	hiddenitem SUPER_POTION, EVENT_OLIVINE_LIGHTHOUSE_5F_HIDDEN_HYPER_POTION

ArcherWalks1Movement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

ArcherWalks2Movement:
	step LEFT
	step LEFT
	step LEFT
	step_end

ArcherWalks3Movement:
	step LEFT
	step LEFT
	step_end

ArcherWalks4Movement:
	step LEFT
	step_end

Lighthouse5FRocketSeenText:
	text "Woah, hey there!"

	para "You're not"
	line "supposed to be"
	cont "here!"
	done

Lighthouse5FRocketBeatenText:
	text "Smoked!"
	done

Lighthouse5FRocketAfterBattleText:
	text "Technically, we're"
	line "not supposed to be"
	cont "here, but that's"
	cont "besides the point."

	para "I almost fell down"
	line "that hole over"
	cont "there."

	para "Someone really"
	line "needs to fix this"
	cont "place up."
	done

Lighthouse5FRocketFSeenText:
	text "Welcome to the 5th"
	line "floor!"
	done

Lighthouse5FRocketFBeatenText:
	text "I wish you didn't"
	line "come here."
	done

Lighthouse5FRocketFAfterBattleText:
	text "Just so you know,"
	line "you can't get to"
	cont "the 6th floor from"
	cont "this floor."

	para "On the 4th floor,"
	line "there's a clear"
	cont "lack of mainten-"
	cont "ance."

	para "Who designed this"
	line "mess?"
	done

LighthouseArcherSeenText:
	text "Ah, you're"
	line "<PLAYER>."

	para "You can call me"
	line "Archer."

	para "I'm second in"
	line "command on this"
	cont "little mission."

	para "This will be your"
	line "final intrusion in"
	cont "our plans!"
	done

LighthouseArcherBeatenText:
	text "Extraordinary…"
	done

LighthouseArcherLostText:
	text "I'm not done yet!"

	para "We will succeed!"
	done

LighthouseArcherAfterBattleText:
	text "Hm…"

	para "Even in numbers,"
	line "our strength"
	cont "falters to a lone"
	cont "teenager."

	para "Perhaps more"
	line "research needs"
	cont "to be conducted."

	para "Perhaps the ones"
	line "on Cinnabar can"
	cont "look into it…"

	para "What?"

	para "I was talking to"
	line "myself."

	para "Go on."

	para "The boss is"
	line "waiting."
	done

Lighthouse5FOfficerText:
	text "The only way to"
	line "get out of here is"
	cont "to either go up to"
	cont "the elevator, or"
	cont "drop down a hole."

	para "This place is"
	line "structurally"
	cont "unsound."
	done

Lighthouse5FTwinText:
	text "Uh oh."

	para "I don't think I'm"
	line "supposed to be up"
	cont "here."
	done

OlivineLighthouse5F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_6F, 2
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_4F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_4F, 3
	warp_event  6, 15, OLIVINE_LIGHTHOUSE_4F, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3, 13, BGEVENT_ITEM, OlivineLighthouse5FHiddenHyperPotion

	db 7 ; object events
	object_event 11, 14, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerLighthouseArcher, EVENT_LIGHTHOUSE_ROCKETS
	object_event  6, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerLighthouse5FRocket, EVENT_LIGHTHOUSE_ROCKETS
	object_event 14,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerLighthouse5FRocketF, EVENT_LIGHTHOUSE_ROCKETS
	object_event 17, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FSuperRepel, EVENT_OLIVINE_LIGHTHOUSE_5F_SUPER_REPEL
	object_event  2, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FTMSwagger, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_SWAGGER
	object_event  9, 11, SPRITE_OFFICER_JENNY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lighthouse5FOfficerScript, EVENT_LIGHTHOUSE_SHERLES
	object_event  12, 3, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Lighthouse5FTwinScript, EVENT_LIGHTHOUSE_CIVILLIANS
