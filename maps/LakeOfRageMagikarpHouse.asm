	object_const_def ; object_event constants
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU1
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU2

LakeOfRageMagikarpHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftrue .GotReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ClearedRocketHideout
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	loadmonindex 1, MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	buttonsound
	waitsfx
	setevent EVENT_DECO_MAGIKARP_DOLL
	writetext PlayerGotMagikarpDollText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
.GotReward:
	writetext MagikarpLengthRaterText_Doll
	waitbutton
	closetext
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

MagikarpLengthOldRodScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext OldRodText_Question
	yesorno
	iffalse .Refused
	writetext OldRodText_Yes
	buttonsound
	verbosegiveitem OLD_ROD
	writetext OldRodText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext OldRodText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext OldRodText_After
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign:
; unused
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

LakeOfRageTelevision:
	jumpstd televisionscript

MagikarpHouseBookshelf:
	jumpstd difficultbookshelf

MagikarpLengthRaterText_LakeOfRageHistory:
	text "Lake of Rage is"
	line "actually a crater"

	para "made by rampaging"
	line "Gyarados."

	para "The crater filled"
	line "up with rainwater"

	para "and the Lake was"
	line "formed."

	para "That's the story"
	line "passed on from my"

	para "Grandpa's great-"
	line "great-grandpa."

	para "There's plenty of"
	line "Magikarp to go"
	cont "around."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Some people try to"
	line "fish for Gyarados,"
	cont "but get too frust-"
	cont "rated to find one."

	para "Understandable,"
	line "really."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "I may yet realize"
	line "my dream of see-"
	cont "ing the world's"
	cont "largest Magikarp."

	para "Do you have a Rod?"
	line "Please help me if"
	cont "you do."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, you have a"
	line "Magikarp! Let's"

	para "see how big that"
	line "baby is."
	done

MagikarpLengthRaterText_Memento:
	text "Wow! This one is"
	line "outstanding!"

	para "I tip my hat to"
	line "you!"

	para "Take this as a"
	line "memento!"
	done

MagikarpLengthRaterText_Bonus:
	text "The record is the"
	line "important thing."

	para "Think of that as"
	line "a bonus!"
	done

MagikarpLengthRaterText_TooShort:
	text "Wow! This one is"
	line "outstanding!"

	para "…I wish I could"
	line "say that, but I've"

	para "seen a bigger one"
	line "before."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "What? That's not a"
	line "Magikarp!"
	done

MagikarpLengthRaterText_Refused:
	text "Oh… So you didn't"
	line "get one good"

	para "enough to show me?"
	line "Maybe next time."
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "Current Record"

	para "@"
	text_ram wStringBuffer3
	text " caught by"
	line "@"
	text_ram wStringBuffer4
	text_end

	text_end ; unused

OldRodText_Question:
	text "This is a great"
	line "fishing spot."

	para "You saw people"
	line "fishing? How"
	cont "about you?"

	para "Would you like one"
	line "of my Rods?"
	done

OldRodText_Yes:
	text "Heh, that's good"
	line "to hear."

	para "Now you're an"
	line "angler too!"
	done

OldRodText_GiveOldRod:
	text "Fishing is great!"

	para "If there's water,"
	line "be it the sea or a"

	para "stream, try out"
	line "your Rod."
	done

OldRodText_No:
	text "Oh. That's rather"
	line "disappointing…"
	done

OldRodText_After:
	text "Yo, kid. How are"
	line "they biting?"
	done

PlayerGotMagikarpDollText:
	text "<PLAYER> received"
	line "Magikarp Doll!"
	done

MagikarpLengthRaterText_Doll:
	text "That's a Magikarp"
	line "Doll!"

	para "Display it with"
	line "pride!"
	done

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, LakeOfRageTelevision

	db 2 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
	object_event  5,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthOldRodScript, -1
