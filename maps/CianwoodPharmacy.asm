	object_const_def ; object_event constants
	const CIANWOODPHARMACY_PHARMACIST
	const CIANWOODPHARMACY_GRANDMA

CianwoodPharmacy_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

CianwoodPharmacist:
	jumptextfaceplayer CianwoodPharmacistText

PharmacyGrannyScript:
	jumptextfaceplayer CianwoodPharmacyGrandmaText

CianwoodPharmacyBookshelf:
	jumpstd genericsink

CianwoodPharmacistText:
	text "My grandma has a"
	line "Secret Potion, and"
	cont "she's going to"
	cont "teach me someday."
	done

CianwoodPharmacyGrandmaText:
	text "I wish that boy"
	line "would stop talking"
	cont "about the Secret"
	cont "Potion."

	para "It's supposed to be"
	line "a secret!"
	done

CianwoodPharmacy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CIANWOOD_CITY, 4
	warp_event  5,  7, CIANWOOD_CITY, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, CianwoodPharmacyBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodPharmacyBookshelf
	bg_event  4,  1, BGEVENT_READ, CianwoodTelevision

	db 2 ; object events
	object_event  3,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacist, -1
	object_event  6,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PharmacyGrannyScript, -1
