	object_const_def ; object_event constants
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_DRAGON_TAMER_M
	const DRAGONSDENB1F_DRAGON_TAMER_F
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_POKE_BALL2
	const DRAGONSDENB1F_POKE_BALL3

DragonsDenB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DRAGONSDENB1F_NOTHING
	scene_script .DummyScene1 ; SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

TrainerCooltrainermJoseph:
	trainer COOLTRAINERM, JOSEPH, EVENT_BEAT_COOLTRAINERM_JOSEPH, CooltrainermJosephSeenText, CooltrainermJosephBeatenText, 0, .Script

.Script:
	opentext
	checkevent EVENT_DECO_RATTATA_DOLL
	iftrue .GotRattataDoll
	writetext CooltrainermJosephRattataDollText
	buttonsound
	waitsfx
	setevent EVENT_DECO_RATTATA_DOLL
	writetext PlayerReceivedRattataDollText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
.GotRattataDoll:
	writetext CooltrainermJosephAfterBattleText
	waitbutton
	closetext
	end

TrainerDragonTamerfDebby:
	trainer DRAGON_TAMER_F, DEBBY, EVENT_BEAT_DRAGON_TAMER_F_DEBBY, DragonTamerfDebbySeenText, DragonTamerfDebbyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DragonTamerfDebbyAfterBattleText
	waitbutton
	closetext
	end

TrainerDragonTamermDylan:
	trainer DRAGON_TAMER_M, DYLAN, EVENT_BEAT_DRAGON_TAMER_M_DYLAN, DragonTamermDylanSeenText, DragonTamermDylanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DragonTamermDylanAfterBattleText
	waitbutton
	closetext
	end

DragonsDenB1FDragonFangScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	itemball DRAGON_FANG

DragonShrineSignpost:
	jumptext DragonShrineSignpostText

DragonsDenB1FTMDragonDance:
	itemball TM_DRAGON_DANCE

DragonsDenB1FMaxElixer:
	itemball MAX_ELIXER

DragonsDenB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

DragonShrineSignpostText:
	text "Dragon Shrine"

	para "A shrine honoring"
	line "the dragon #mon"

	para "said to have lived"
	line "in Dragon's Den."
	done

SilverText_Training1:
	text "…"
	line "What? <PLAYER>?"

	para "…No, I won't"
	line "battle you now…"

	para "My #MON aren't"
	line "ready to beat you."

	para "I can't push them"
	line "too hard now."

	para "I have to be dis-"
	line "ciplined to become"

	para "the greatest #-"
	line "MON trainer…"
	done

SilverText_Training2:
	text "…"

	para "Whew…"

	para "Learn to stay out"
	line "of my way…"
	done

CooltrainermJosephSeenText:
	text "I've got a top-"
	line "percentage"
	cont "Raticate!"
	done

CooltrainermJosephBeatenText:
	text "See!?"
	done

CooltrainermJosephAfterBattleText:
	text "That doll is"
	line "pretty good, don't"
	cont "you think?"
	done

DragonTamerfDebbySeenText:
	text "I'm going to take"
	line "the Dragon Master"
	cont "challenge soon!"

	para "Then I'll be"
	line "recognized as a"
	cont "Dragon Master!"
	done

DragonTamerfDebbyBeatenText:
	text "Maybe I need some"
	line "more practice…"
	done

DragonTamerfDebbyAfterBattleText:
	text "I know I can be a"
	line "master."

	para "I just need to"
	line "believe in myself."
	done

DragonTamermDylanSeenText:
	text "<PLAYER>!"

	para "Welcome to"
	line "Dragon's Den!"

	para "Finally allowed"
	line "in, eh?"
	done

DragonTamermDylanBeatenText:
	text "I can see why!"
	done

DragonTamermDylanAfterBattleText:
	text "It's good to see"
	line "see you among the"
	cont "big leagues!"
	done

Text_FoundDragonFang:
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Text_NoRoomForDragonFang:
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

CooltrainermJosephRattataDollText:
	text "No one's ever been"
	line "able to defeat my"
	cont "top percentage"
	cont "Raticate before!"

	para "You're good!"

	para "Here, have my"
	line "Rattata Doll as a"
	cont "token of my"
	cont "respect!"
	done

PlayerReceivedRattataDollText:
	text "<PLAYER> received"
	line "Rattata Doll!"
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 20,  3, DRAGONS_DEN_1F, 3
	warp_event 19, 29, DRAGON_SHRINE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 18, 24, BGEVENT_READ, DragonShrineSignpost
	bg_event 33, 29, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event 21, 17, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion
	bg_event 31, 15, BGEVENT_ITEM, DragonsDenB1FHiddenMaxElixer

	db 6 ; object events
	object_event 35, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 20,  8, SPRITE_DRAGON_TAMER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerDragonTamermDylan, -1
	object_event  8,  8, SPRITE_DRAGON_TAMER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerDragonTamerfDebby, -1
	object_event  4, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermJoseph, -1
	object_event 30,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FTMDragonDance, EVENT_DRAGONS_DEN_B1F_TM_DRAGON_DANCE
	object_event  5, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FMaxElixer, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
