	object_const_def ; object_event constants
	const BLACKTHORNGYM2F_DRAGONTAMER_M
	const BLACKTHORNGYM2F_DRAGONTAMER_F
	const BLACKTHORNGYM2F_BOULDER1
	const BLACKTHORNGYM2F_BOULDER2
	const BLACKTHORNGYM2F_BOULDER3
	const BLACKTHORNGYM2F_BOULDER4
	const BLACKTHORNGYM2F_BOULDER5
	const BLACKTHORNGYM2F_BOULDER6
	const BLACKTHORNGYM2F_DRAGONTAMER_F2

BlackthornGym2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 5, BLACKTHORNGYM2F_BOULDER1, .Boulder1
	stonetable 3, BLACKTHORNGYM2F_BOULDER2, .Boulder2
	stonetable 4, BLACKTHORNGYM2F_BOULDER3, .Boulder3
	db -1 ; end

.Boulder1:
	disappear BLACKTHORNGYM2F_BOULDER1
	sjump .Fall

.Boulder2:
	disappear BLACKTHORNGYM2F_BOULDER2
	sjump .Fall

.Boulder3:
	disappear BLACKTHORNGYM2F_BOULDER3
	sjump .Fall

.Fall:
	pause 30
	scall .FX
	opentext
	writetextend BlackthornGym2FBoulderFellText

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end

BlackthornGymBoulder:
	jumpstd strengthboulder

TrainerDragonTamerMDarius:
	trainer DRAGON_TAMER_M, DARIUS, EVENT_BEAT_DRAGON_TAMER_M_DARIUS, DragonTamerMDariusSeenText, DragonTamerMDariusBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext DragonTamerMDariusAfterBattleText

TrainerDragonTamerfDaria:
	trainer DRAGON_TAMER_F, DARIA, EVENT_BEAT_DRAGON_TAMER_F_DARIA, DragonTamerfDariaSeenText, DragonTamerfDariaBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext DragonTamerfDariaAfterBattleText

TrainerDragonTamerfDora:
	trainer DRAGON_TAMER_F, DORA, EVENT_BEAT_DRAGON_TAMER_F_DORA, DragonTamerfDoraSeenText, DragonTamerfDoraBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext DragonTamerfDoraAfterBattleText

DragonTamerMDariusSeenText:
	text "I have a few"
	line "#mon not seen"
	cont "often."
	done

DragonTamerMDariusBeatenText:
	text "Pretty cool, huh?"
	done

DragonTamerMDariusAfterBattleText:
	text "They are from the"
	line "Hoenn region."

	para "They were a gift"
	line "from the Master."
	done

DragonTamerfDariaSeenText:
	text "I'm good friends"
	line "with Clair."

	para "We've trained"
	line "together for some"
	cont "time now."
	done

DragonTamerfDariaBeatenText:
	text "You're stronger"
	line "than Clair!"
	done

DragonTamerfDariaAfterBattleText:
	text "She has a bit of a"
	line "temper when she"
	cont "loses."

	para "I guess I'm better"
	line "than her at that!"
	done

BlackthornGym2FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

DragonTamerfDoraSeenText:
	text "Lance is a pretty"
	line "tough guy."

	para "I think he could"
	line "be Champion one"
	cont "day."
	done

DragonTamerfDoraBeatenText:
	text "Maybe you will be"
	line "too!"
	done

DragonTamerfDoraAfterBattleText:
	text "He's pretty humble,"
	line "so he usually just"
	cont "brushes off my"
	cont "compliments."
	done

BlackthornGym2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  1,  7, BLACKTHORN_GYM_1F, 3
	warp_event  7,  9, BLACKTHORN_GYM_1F, 4
	warp_event  2,  5, BLACKTHORN_GYM_1F, 5 ; hole
	warp_event  8,  7, BLACKTHORN_GYM_1F, 6 ; hole
	warp_event  8,  3, BLACKTHORN_GYM_1F, 7 ; hole

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  4,  1, SPRITE_DRAGON_TAMER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerDragonTamerMDarius, -1
	object_event  4, 11, SPRITE_DRAGON_TAMER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerDragonTamerfDaria, -1
	object_event  8,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	object_event  2,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	object_event  6, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	object_event  3,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
	object_event  6,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
	object_event  8, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
	object_event  1, 10, SPRITE_DRAGON_TAMER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerDragonTamerfDora, -1
