	object_const_def ; object_event constants
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5

Route41_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock:
; unused
	jumpstd smashrock

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

SwimmermCharlieSeenText:
	text "These islands are"
	line "quite somber."

	para "Think there's som-"
	line "ething up with"
	cont "them?"
	done

SwimmermCharlieBeatenText:
	text "Your skills are"
	line "scary!"
	done

SwimmermCharlieAfterBattleText:
	text "I would go in"
	line "there, but these"
	cont "whirlpools are in"
	cont "the way."
	done

SwimmermGeorgeSeenText:
	text "This is my spot!"

	para "Get your own!"
	done

SwimmermGeorgeBeatenText:
	text "Fine."
	done

SwimmermGeorgeAfterBattleText:
	text "You can stay here."

	para "Don't expect any"
	line "hospitality."
	done

SwimmermBerkeSeenText:
	text "I've been chased"
	line "by Tentacruel out"
	cont "here."

	para "Luckily I'm pretty"
	line "fast!"
	done

SwimmermBerkeBeatenText:
	text "Speed will only"
	line "get me so far."
	done

SwimmermBerkeAfterBattleText:
	text "Don't get stung by"
	line "a Tentacruel."

	para "It's not very"
	line "pleasant, unless"
	cont "you're into it."
	done

SwimmermKirkSeenText:
	text "Glub, glub!"
	done

SwimmermKirkBeatenText:
	text "Glub!!"
	done

SwimmermKirkAfterBattleText:
	text "GASP!"

	para "Sorry. I was"
	line "drowning. I'm all"
	cont "better now."
	done

SwimmermMathewSeenText:
	text "There's said to be"
	line "a large, silvery"
	cont "#mon here in"
	cont "the Whirl Islands."
	done

SwimmermMathewBeatenText:
	text "I'm done!"
	done

SwimmermMathewAfterBattleText:
	text "My grandfather"
	line "told me stories of"
	cont "that #mon."

	para "Said he saw it"
	line "himself!"
	done

SwimmerfKayleeSeenText:
	text "Have you ever been"
	line "inside the Whirl"
	cont "Islands?"

	para "Apparently it's"
	line "pitch-black in"
	cont "there."
	done

SwimmerfKayleeBeatenText:
	text "Blackout!"
	done

SwimmerfKayleeAfterBattleText:
	text "Unless you've got"
	line "way to light it up"
	cont "in there, you are"
	cont "not getting very"
	cont "far."

	para "I heard that"
	line "Sprout Tower gives"
	cont "out a useful item."
	done

SwimmerfSusieSeenText:
	text "You look so ele-"
	line "gant, riding your"
	cont "#mon."
	done

SwimmerfSusieBeatenText:
	text "I'm crushed…"
	done

SwimmerfSusieAfterBattleText:
	text "Wasn't there a hit"
	line "song about a boy"
	cont "riding a Lapras?"
	done

SwimmerfDeniseSeenText:
	text "The whirlpools are"
	line "so violent, it's"
	cont "dangerous to go"
	cont "near them."
	done

SwimmerfDeniseBeatenText:
	text "Washed away!"
	done

SwimmerfDeniseAfterBattleText:
	text "Certain Lapras can"
	line "get rid of those"
	cont "Whirlpools."
	done

SwimmerfKaraSeenText:
	text "There's an old man"
	line "stationed in Whirl"
	cont "Islands, but no"
	cont "one knows why."

	para "He refuses to say"
	line "anything."
	done

SwimmerfKaraBeatenText:
	text "You don't say much"
	line "either."
	done

SwimmerfKaraAfterBattleText:
	text "He's so mysterious."

	para "Someone should get"
	line "him to talk."
	done

SwimmerfWendySeenText:
	text "Staryu are so"
	line "pretty. At night,"
	cont "they gather near"
	cont "the water's sur-"
	cont "face."
	done

SwimmerfWendyBeatenText:
	text "Oh, man."
	done

SwimmerfWendyAfterBattleText:
	text "The clusters of"
	line "Staryu light up"
	cont "at the same time."

	para "It's so beautiful,"
	line "it's scary."
	done

Route41_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	db 10 ; object events
	object_event 32,  6, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
