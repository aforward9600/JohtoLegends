	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE3F_ROCKET
	const OLIVINELIGHTHOUSE3F_ROCKETF1
	const OLIVINELIGHTHOUSE3F_ROCKET_GIRL
	const OLIVINELIGHTHOUSE3F_POKE_BALL
	const OLIVINELIGHTHOUSE3F_SAILOR
	const OLIVINELIGHTHOUSE3F_OFFICER

OlivineLighthouse3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerOlivineLighthouse3FRocket1:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, OlivineLighthouse3FRocket1SeenText, OlivineLighthouse3FRocket1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext OlivineLighthouse3FRocket1AfterBattleText
	waitbutton
	closetext
	end

TrainerOlivineLighthouse3FRocket2:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, OlivineLighthouse3FRocket2SeenText, OlivineLighthouse3FRocket2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext OlivineLighthouse3FRocket2AfterBattleText
	waitbutton
	closetext
	end

TrainerOlivineLighthouse3FRocketF:
	trainer GRUNTF, GRUNTF_3, EVENT_BEAT_ROCKET_GRUNTF_3, OlivineLighthouse3FRocketFSeenText, OlivineLighthouse3FRocketFBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext OlivineLighthouse3FRocketFAfterBattleText
	waitbutton
	closetext
	end

Lighthouse3FSailorScript:
	jumptextfaceplayer Lighthouse3FSailorText

Lighthouse3FOfficerScript:
	jumptextfaceplayer Lighthouse3FOfficerText

OlivineLighthouse3FEther:
	itemball ETHER

OlivineLighthouse3FRocket1SeenText:
	text "You're starting to"
	line "get on our nerves!"
	done

OlivineLighthouse3FRocket1BeatenText:
	text "How annoying…"
	done

OlivineLighthouse3FRocket1AfterBattleText:
	text "Keep this up, and"
	line "you'll know true"
	cont "pain!"
	done

OlivineLighthouse3FRocket2SeenText:
	text "I'll stop you"
	line "right here and get"
	cont "a promotion!"
	done

OlivineLighthouse3FRocket2BeatenText:
	text "No!"

	para "My promotion!"
	done

OlivineLighthouse3FRocket2AfterBattleText:
	text "I guess I'll just"
	line "have to give my-"
	cont "self a promotion!"
	done

OlivineLighthouse3FRocketFSeenText:
	text "Stop interferring"
	line "with our plans!"
	done

OlivineLighthouse3FRocketFBeatenText:
	text "I failed, just"
	line "like the others."
	done

OlivineLighthouse3FRocketFAfterBattleText:
	text "You're in for a"
	line "rude awakening on"
	cont "the next floor."
	done

Lighthouse3FSailorText:
	text "I come back from a"
	line "trip out to sea,"
	cont "and the lighthouse"
	cont "has officers all"
	cont "over the place."

	para "What happened?"

	para "Did they forget to"
	line "pay their taxes?"
	done

Lighthouse3FOfficerText:
	text "How did those guys"
	line "figure out the"
	cont "layout here?"

	para "It makes no sense."
	done

OlivineLighthouse3F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  9,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerOlivineLighthouse3FRocket1, EVENT_LIGHTHOUSE_ROCKETS
	object_event  5, 12, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerOlivineLighthouse3FRocket2, EVENT_LIGHTHOUSE_ROCKETS
	object_event 13,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerOlivineLighthouse3FRocketF, EVENT_LIGHTHOUSE_ROCKETS
	object_event  8,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
	object_event 15, 13, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lighthouse3FSailorScript, EVENT_LIGHTHOUSE_CIVILLIANS
	object_event  8, 14, SPRITE_OFFICER_JENNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lighthouse3FOfficerScript, EVENT_LIGHTHOUSE_SHERLES
