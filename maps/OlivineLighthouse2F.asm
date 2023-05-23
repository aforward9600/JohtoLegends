	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE2F_GRUNTF1
	const OLIVINELIGHTHOUSE2F_GRUNTF2
	const OLIVINELIGHTHOUSE2F_GRUNTF3
	const OLIVINELIGHTHOUSE2F_RIVAL
	const OLIVINELIGHTHOUSE2F_SWINUB
	const OLIVINELIGHTHOUSE2F_RATICATE
	const OLIVINELIGHTHOUSE2F_GENTLEMAN

OlivineLighthouse2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerOlivineLighthouse2FRocketF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, OlivineLighthouse2FRocketF1SeenText, OlivineLighthouse2FRocketF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext OlivineLighthouse2FRocketF1AfterBattleText
	waitbutton
	closetext
	end

TrainerOlivineLighthouse2FRocketF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, OlivineLighthouse2FRocketF2SeenText, OlivineLighthouse2FRocketF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext OlivineLighthouse2FRocketF2AfterBattleText
	waitbutton
	closetext
	end

Lighthouse2FRocketScript:
	faceplayer
	opentext
	writetext ThisKidIsToughText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE2F_GRUNTF3, LEFT
	end

Lighthouse2FRivalScript:
	faceplayer
	opentext
	writetext IllHealYouLighthouseText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext GoOnAheadText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE2F_RIVAL, RIGHT
	end

LighthouseSwinubScript:
	refreshscreen
	pokepic SWINUB
	cry SWINUB
	waitbutton
	closepokepic
	opentext
	writetext LighthouseSwinubText
	waitbutton
	closetext
	end

LighthouseRaticateScript:
	refreshscreen
	pokepic RATICATE
	cry RATICATE
	waitbutton
	closepokepic
	opentext
	writetext LighthouseRaticateText
	waitbutton
	closetext
	end

Lighthouse2FGentlemanScript:
	jumptextfaceplayer Lighthouse2FGentlemanText

OlivineLighthouse2FRocketF1SeenText:
	text "Those men down-"
	line "stairs are so"
	cont "weak!"

	para "I'll show you what"
	line "a real trainer is"
	cont "like!"
	done

OlivineLighthouse2FRocketF1BeatenText:
	text "Dang it!"
	done

OlivineLighthouse2FRocketF1AfterBattleText:
	text "Listen kid!"

	para "Don't mess with"
	line "us!"

	para "You'll be in a"
	line "world of hurt if"
	cont "you do!"
	done

OlivineLighthouse2FRocketF2SeenText:
	text "Go play somewhere"
	line "else!"
	done

OlivineLighthouse2FRocketF2BeatenText:
	text "Seriously?"
	done

OlivineLighthouse2FRocketF2AfterBattleText:
	text "Get out of here!"

	para "The boss isn't"
	line "going to go easy"
	cont "on you!"
	done

ThisKidIsToughText:
	text "Man, this kid is"
	line "tough!"

	para "Who is raising the"
	line "youth these days?"
	done

GoOnAheadText:
	text "Go on ahead, this"
	line "is easy!"
	done

LighthouseSwinubText:
	text "Swinub: Burrurrr!"
	done

LighthouseRaticateText:
	text "Raticate: Rrra-"
	line "rarra!"
	done

Lighthouse2FGentlemanText:
	text "The police are"
	line "here."

	para "I wonder what"
	line "happened?"
	done

IllHealYouLighthouseText:
	text "Hey, are your"
	line "#mon doing"
	cont "alright?"

	para "I'll heal them!"
	done

OlivineLighthouse2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_1F, 3
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_3F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 14,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerOlivineLighthouse2FRocketF1, EVENT_LIGHTHOUSE_ROCKETS
	object_event 14, 10, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerOlivineLighthouse2FRocketF2, EVENT_LIGHTHOUSE_ROCKETS
	object_event 11, 14, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lighthouse2FRocketScript, EVENT_LIGHTHOUSE_ROCKETS
	object_event  8, 14, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lighthouse2FRivalScript, EVENT_LIGHTHOUSE2F_RIVAL1
	object_event  9, 14, SPRITE_SWINUB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LighthouseSwinubScript, EVENT_LIGHTHOUSE_ROCKETS
	object_event 10, 14, SPRITE_RATICATE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LighthouseRaticateScript, EVENT_LIGHTHOUSE_ROCKETS
	object_event 16,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lighthouse2FGentlemanScript, EVENT_LIGHTHOUSE_CIVILLIANS
