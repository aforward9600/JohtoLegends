	object_const_def ; object_event constants
	const ROCKETWAREHOUSE_GRUTNM
	const ROCKETWAREHOUSE_GRUNTF
	const ROCKETWAREHOUSE_ARIANA
	const ROCKETWAREHOUSE_ARCHER

RocketWarehouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RocketWarehouseGrunt:
	trainer GRUNTM, GRUNTM_23, EVENT_BEAT_ROCKET_WAREHOUSE_GRUNTM, RocketWarehouseGruntSeenText, RocketWarehouseGruntBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext RocketWarehouseGruntAfterBattleText

RocketWarehouseGruntF:
	trainer GRUNTF, GRUNTF_15, EVENT_BEAT_ROCKET_WAREHOUSE_GRUNTF, RocketWarehouseGruntFSeenText, RocketWarehouseGruntFBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext RocketWarehouseGruntFAfterBattleText

RocketWarehouseAriana:
	checkevent EVENT_BEAT_ROCKET_WAREHOUSE_ARIANA
	iftrue .RocketWarehouseArianaAfter
	opentext
	writetext RocketWarehouseArianaSeenText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext RocketWarehouseArianaSeenText2
	waitbutton
	closetext
	setlasttalked ROCKETWAREHOUSE_ARIANA
	winlosstext, RocketWarehouseArianaBeatenText, RocketWarehouseArianaLastText
	loadtrainer ARIANA, ARIANA_6
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
.RocketWarehouseArianaAfter:
	opentext
	writetext RocketWarehouseArianaAfterBattleText
	waitbutton
	closetext
	turnobject ROCKETWAREHOUSE_ARIANA, RIGHT
	end

RocketWarehouseArianaLastText:
	text "You really can't"
	line "help being so"
	cont "annoying, can you?"
	done

RocketWarehouseArcher:
	trainer ARCHER, ARCHER_6, EVENT_BEAT_ROCKET_WAREHOUSE_ARCHER, RocketWarehouseArcherSeenText, RocketWarehouseArcherBeatenText, RocketWarehouseArcherLastText, .Script

.Script:
	endifjustbattled
	jumptext RocketWarehouseArcherAfterBattleText

RocketWarehouseArcherLastText:
	text "Yet another"
	line "unfortunate series"
	cont "of events…"
	done

RocketWarehouseGruntSeenText:
	text "Aw, come on!"

	para "We haven't even"
	line "unpacked and set"
	cont "up the floor tiles"
	cont "and there's"
	cont "already an"
	cont "intruder!"
	done

RocketWarehouseGruntBeatenText:
	text "And now I've lost!"

	para "This day can't get"
	line "any worse!"
	done

RocketWarehouseGruntAfterBattleText:
	text "Wait, aren't you"
	line "the one that beat"
	cont "us before?"

	para "This isn't good…"
	done

RocketWarehouseGruntFSeenText:
	text "Looks like we need"
	line "better security!"
	done

RocketWarehouseGruntFBeatenText:
	text "No doubt we need a"
	line "password-protected"
	cont "door."
	done

RocketWarehouseGruntFAfterBattleText:
	text "I'll suggest it to"
	line "Miss Ariana later."
	done

RocketWarehouseArianaSeenText:
	text "……………………………………"

	para "……………Can't you see"
	line "that I'm ignoring"
	cont "you?"

	para "Gah! You're worse"
	line "than a disease!"
	done

RocketWarehouseArianaSeenText2:
	text "Yes, I knew it was"
	line "you."

	para "Who else could it"
	line "be?"

	para "Thanks to you, I've"
	line "been demoted to a"
	cont "mere supervisor!"

	para "You've made me so"
	line "mad so many times,"

	para "I need my revenge!"
	done

RocketWarehouseArianaBeatenText:
	text "I…………ugh………"
	done

RocketWarehouseArianaAfterBattleText:
	text "Please just go"
	line "away…"

	para "There's nothing"
	line "here right now"
	cont "anyway…"
	done

RocketWarehouseArcherSeenText:
	text "It's truly amazing"
	line "how persistent you"
	cont "are."

	para "What drives you to"
	line "oppose us at every"
	cont "opportunity?"

	para "I suppose I'll"
	line "never understand"
	cont "it."

	para "As the interim"
	line "leader of the"
	cont "Sevii Islands"
	cont "branch, I still"
	cont "need to try to"
	cont "eliminate you."
	done

RocketWarehouseArcherBeatenText:
	text "…It would appear"
	line "that victory is"
	cont "impossible against"
	cont "you…"
	done

RocketWarehouseArcherAfterBattleText:
	text "…Shortly after we"
	line "were sent here as"
	cont "punishment,"

	para "I received word"
	line "about Madame Boss's"
	cont "arrest."

	para "It's incredible how"
	line "our powerful and"
	cont "fearless leader"
	cont "was deposed by a"
	cont "mere teenager…"

	para "Morale is at an"
	line "all-time low right"
	cont "now, due to you…"

	para "The only thing we"
	line "can do right now"
	cont "is to continue"
	cont "following orders."

	para "Regardless, there's"
	line "nothing I can do"
	cont "to you."

	para "Just leave…"
	done

RocketWarehouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 19, FIVE_ISLE_MEADOW, 1
	warp_event  9, 19, FIVE_ISLE_MEADOW, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  8, 16, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, RocketWarehouseGrunt, -1
	object_event  7, 14, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, RocketWarehouseGruntF, -1
	object_event  7,  9, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RocketWarehouseAriana, -1
	object_event  7,  3, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, RocketWarehouseArcher, -1
