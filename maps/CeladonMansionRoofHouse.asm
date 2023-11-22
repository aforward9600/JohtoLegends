	object_const_def ; object_event constants
	const CELADONMANSIONROOFHOUSE_PHARMACIST

CeladonMansionRoofHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_DECO_JIGGLYPUFF_DOLL
	iftrue .GotCurse
	writetext CeladonMansionRoofHousePharmacistIntroText
	buttonsound
	checktime NITE
	iftrue .Night
	writetext CeladonMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext CeladonMansionRoofHousePharmacistStoryText
	setevent EVENT_DECO_JIGGLYPUFF_DOLL
	buttonsound
	waitsfx
	writetext GotJigglypuffDollText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	pause 15
.GotCurse:
	writetext CeladonMansionRoofHousePharmacistCurseText
	waitbutton
	closetext
	end

CeladonMansionRoofHousePharmacistIntroText:
	text "Let me recount a"
	line "terrifying tale…"
	done

CeladonMansionRoofHousePharmacistNotNightText:
	text "Then again, it's"
	line "not as scary while"

	para "it's still light"
	line "outside."

	para "Come back after"
	line "sunset, OK?"
	done

CeladonMansionRoofHousePharmacistStoryText:
	text "Once upon a time,"
	line "there was a little"

	para "girl who was given"
	line "a new Doll…"

	para "She loved the doll"
	line "so much, but at"
	cont "night, she felt"
	cont "watched…"

	para "While at the park"
	line "one day, she lost"
	cont "her doll…"

	para "She was totally"
	line "devastated…"

	para "One night, she had"
	line "woken up to see"
	cont "the doll at the"
	cont "end of her bed…"

	para "It was all dirty…"

	para "It seemed to look"
	line "straight at her…"

	para "Then, it spoke…"

	para "'Why did you leave"
	line "me alone?'"

	para "She screamed and"
	line "ran to her parents"
	cont "in terror…"

	para "When they reached"
	line "her room, the doll"
	cont "was gone…"

	para "All that was left"
	line "was a dirty spot"
	cont "on the bed…"

	para "What happened to"
	line "the cursed doll?"

	para "Why, it's right"
	line "here!"

	para "Now it is your"
	line "burden to bear!"
	done

GotJigglypuffDollText:
	text "<PLAYER> received"
	line "Jigglypuff Doll!"
	done

CeladonMansionRoofHousePharmacistCurseText:
	text "…What?"

	para "Jigglypuff isn't"
	line "scary enough?"

	para "Everyone's a"
	line "critic!"
	done

CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  2, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1
