	object_const_def ; object_event constants
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_WALKER

SproutTower3F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .WalkerFriday

.WalkerFriday:
	checkevent EVENT_BEAT_WALKER
	iftrue .IsItFriday
	disappear SPROUTTOWER3F_WALKER
	return

.IsItFriday:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .WalkerAppears
	disappear SPROUTTOWER3F_WALKER
	return

.WalkerAppears:
	appear SPROUTTOWER3F_WALKER
	return

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	buttonsound
	verbosegiveitem VOLTORB_CALL
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTowerWalkerScript:
	jumptextfaceplayer SproutTowerWalkerText

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball MAX_POTION

SproutTower3FEscapeRope:
	itemball MIRACLE_SEED

SageLiSeenText:
	text "So good of you to"
	line "come here!"

	para "Sprout Tower is a"
	line "place of training."

	para "People and #mon"
	line "test their bonds"

	para "to build a bright"
	line "future together."

	para "I am the final"
	line "test."

	para "Allow me to check"
	line "the ties between"

	para "your #mon and"
	line "you!"
	done

SageLiBeatenText:
	text "Ah, excellent!"
	done

SageLiTakeThisFlashText:
	text "You should have no"
	line "problem using this"
	cont "item."

	para "Take this Voltorb"
	line "Call."
	done

SageLiFlashExplanationText:
	text "It will illuminate"
	line "even the darkest"
	cont "of all places."
	done

SageLiAfterBattleText:
	text "I hope you learn"
	line "and grow from your"
	cont "journey."
	done

SageJinSeenText:
	text "I train to find"
	line "enlightenment in"
	cont "#mon!"
	done

SageJinBeatenText:
	text "My training is"
	line "incomplete…"
	done

SageJinAfterBattleText:
	text "As #mon grow"
	line "stronger, so does"
	cont "the trainer."

	para "No, wait. As the"
	line "trainer grows"

	para "stronger, so do"
	line "the #mon."
	done

SageTroySeenText:
	text "Let me see how"
	line "much you trust"
	cont "your #mon."
	done

SageTroyBeatenText:
	text "Yes, your trust is"
	line "real!"
	done

SageTroyAfterBattleText:
	text "It is not far to"
	line "the Elder."
	done

SageNealSeenText:
	text "The Elder's item"
	line "lights even pitch-"
	cont "black darkness."
	done

SageNealBeatenText:
	text "It is my head that"
	line "is bright!"
	done

SageNealAfterBattleText:
	text "Let there be light"
	line "on your journey."
	done

SproutTower3FPaintingText:
	text "It's a powerful"
	line "painting of a"
	cont "Bellsprout."
	done

SproutTower3FStatueText:
	text "A #mon statue…"

	para "It looks very"
	line "distinguished."
	done

SproutTowerWalkerText:
	text "I like this tower."

	para "It makes me feel"
	line "like I'm flying"
	cont "with how high up"
	cont "I am."
	done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	db 0 ; coord events

	db 6 ; bg events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	db 7 ; object events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event  7,  3, SPRITE_WALKER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SproutTowerWalkerScript, EVENT_SPROUT_TOWER_WALKER
