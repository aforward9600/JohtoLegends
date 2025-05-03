	object_const_def ; object_event constants
	const BERRYCAFE_BARISTA
	const BERRYCAFE_POKEFANM
	const BERRYCAFE_LASS
	const BERRYCAFE_CLERK
	const BERRYCAFE_SCHOOLBOY
	const BERRYCAFE_DAISY

BerryCafe_MapScripts:
	db 0  ; scene scripts

	db 0 ; callbacks

BerryCafeBaristaScript:
	opentext
	writetext BerryCafeBaristaIntroText
	waitbutton
.FirstMenu
	loadmenu BerryCafeMenuMenu
	verticalmenu
	closewindow
	ifequal 1, .Fighting
	ifequal 2, .Flying
	ifequal 3, .Poison
	ifequal 4, .Ground
	ifequal 5, .Rock
	ifequal 6, .Bug
	ifequal 7, .Next1
	sjump .Cancel

.Next1:
	loadmenu BerryCafeMenuMenu2
	verticalmenu
	closewindow
	ifequal 1, .Ghost
	ifequal 2, .Steel
	ifequal 3, .Fire
	ifequal 4, .Water
	ifequal 5, .Grass
	ifequal 6, .Electric
	ifequal 7, .Next2
	sjump .Cancel

.Next2:
	loadmenu BerryCafeMenuMenu3
	verticalmenu
	closewindow
	ifequal 1, .Psychic
	ifequal 2, .Ice
	ifequal 3, .Dark
	ifequal 4, .Fairy
	ifequal 5, .FirstMenu
	sjump .Cancel

.Fighting:
	checkitem RAWST_BERRY, 4
	iffalse .CantMake
	checkitem KELPSY_BERRY, 5
	iffalse .CantMake
	callasm FightingHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem RAWST_BERRY, 4
	takeitem KELPSY_BERRY, 5
	sjump .SetDVs

.Flying:
	checkitem ASPEAR_BERRY, 3
	iffalse .CantMake
	checkitem TAMATO_BERRY, 3
	iffalse .CantMake
	callasm FlyingHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem ASPEAR_BERRY, 3
	takeitem TAMATO_BERRY, 3
	sjump .SetDVs

.Poison:
	checkitem PECHA_BERRY, 5
	iffalse .CantMake
	checkitem GREPA_BERRY, 4
	iffalse .CantMake
	callasm PoisonHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem PECHA_BERRY, 5
	takeitem GREPA_BERRY, 4
	sjump .SetDVs

.Ground:
	checkitem LEPPA_BERRY, 7
	iffalse .CantMake
	checkitem KELPSY_BERRY, 3
	iffalse .CantMake
	callasm GroundHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem LEPPA_BERRY, 7
	takeitem KELPSY_BERRY, 3
	sjump .SetDVs

.Rock:
	checkitem ORAN_BERRY, 8
	iffalse .CantMake
	checkitem QUALOT_BERRY, 4
	iffalse .CantMake
	callasm RockHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem ORAN_BERRY, 8
	takeitem QUALOT_BERRY, 4
	sjump .SetDVs

.Bug:
	checkitem PECHA_BERRY, 5
	iffalse .CantMake
	checkitem POMEG_BERRY, 5
	iffalse .CantMake
	callasm BugHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem PECHA_BERRY, 5
	takeitem POMEG_BERRY, 5
	sjump .SetDVs

.Ghost:
	checkitem CHESTO_BERRY, 5
	iffalse .CantMake
	checkitem HONDEW_BERRY, 4
	iffalse .CantMake
	callasm GhostHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem CHESTO_BERRY, 5
	takeitem HONDEW_BERRY, 4
	sjump .SetDVs

.Steel:
	checkitem SITRUS_BERRY, 5
	iffalse .CantMake
	checkitem QUALOT_BERRY, 6
	iffalse .CantMake
	callasm SteelHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem SITRUS_BERRY, 5
	takeitem QUALOT_BERRY, 6
	sjump .SetDVs

.Fire:
	checkitem RAWST_BERRY, 7
	iffalse .CantMake
	checkitem TAMATO_BERRY, 6
	iffalse .CantMake
	callasm FireHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem RAWST_BERRY, 7
	takeitem TAMATO_BERRY, 6
	sjump .SetDVs

.Water:
	checkitem ORAN_BERRY, 10
	iffalse .CantMake
	callasm WaterHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem ORAN_BERRY, 10
	sjump .SetDVs

.Grass:
	checkitem LUM_BERRY, 8
	iffalse .CantMake
	checkitem POMEG_BERRY, 3
	iffalse .CantMake
	callasm GrassHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem LUM_BERRY, 8
	takeitem POMEG_BERRY, 3
	sjump .SetDVs

.Electric:
	checkitem CHERRI_BERRY, 3
	iffalse .CantMake
	checkitem HONDEW_BERRY, 7
	iffalse .CantMake
	callasm ElectricHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem CHERRI_BERRY, 3
	takeitem HONDEW_BERRY, 7
	sjump .SetDVs

.Psychic:
	checkitem PERSIM_BERRY, 6
	iffalse .CantMake
	checkitem HONDEW_BERRY, 8
	iffalse .CantMake
	callasm PsychicHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem PERSIM_BERRY, 6
	takeitem HONDEW_BERRY, 8
	sjump .SetDVs

.Ice:
	checkitem ASPEAR_BERRY, 7
	iffalse .CantMake
	checkitem GREPA_BERRY, 8
	iffalse .CantMake
	callasm IceHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem ASPEAR_BERRY, 7
	takeitem GREPA_BERRY, 8
	sjump .SetDVs

.Dark:
	checkitem PERSIM_BERRY, 8
	iffalse .CantMake
	checkitem SITRUS_BERRY, 9
	iffalse .CantMake
	callasm DarkHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem PERSIM_BERRY, 8
	takeitem SITRUS_BERRY, 9
	sjump .SetDVs

.Fairy:
	checkitem LUM_BERRY, 9
	iffalse .CantMake
	checkitem GREPA_BERRY, 9
	iffalse .CantMake
	callasm FairyHP
	writetext WillYouBackOutText
	yesorno
	iffalse .Cancel
	takeitem LUM_BERRY, 9
	takeitem GREPA_BERRY, 9
.SetDVs:
	writetext BerryCafeWhichPokemonText
	waitbutton
	special SetMonHiddenPowerDVs
	closetext
	end

.CantMake:
	writetext BerryCafeCantMakeText
	waitbutton
	closetext
	end

.Cancel:
	writetext BerryCafeLaterText
	waitbutton
	closetext
	end

BerryCafeMenuMenu:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 17, 16
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 7 ; items
	db "Protein Shake@"
	db "Pidgey's Milk@"
	db "Ekan's Venom@"
	db "Dirt Cup@"
	db "On the Rocks@"
	db "Bug Juice@"
	db "Next@"

BerryCafeMenuMenu2:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 17, 16
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 7 ; items
	db "Ectoplasm@"
	db "Spinach Shake@"
	db "Fireball Tea@"
	db "Tap Water@"
	db "Hot Leaf Juice@"
	db "Shock Tonic@"
	db "Next@"

BerryCafeMenuMenu3:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 17, TEXTBOX_Y - 0
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "Calming Jasmine@"
	db "Shaved Ice@"
	db "Black Coffee@"
	db "Sparkling Cider@"
	db "Next@"

FightingHP:
	ld a, 1
	jr SetBerryBuffer

FlyingHP:
	ld a, 2
	jr SetBerryBuffer

PoisonHP:
	ld a, 3
	jr SetBerryBuffer

GroundHP:
	ld a, 4
	jr SetBerryBuffer

RockHP:
	ld a, 5
	jr SetBerryBuffer

BugHP:
	ld a, 6
	jr SetBerryBuffer

GhostHP:
	ld a, 7
	jr SetBerryBuffer

SteelHP:
	ld a, 8
	jr SetBerryBuffer

FireHP:
	ld a, 9
	jr SetBerryBuffer

WaterHP:
	ld a, 10
	jr SetBerryBuffer

GrassHP:
	ld a, 11
	jr SetBerryBuffer

ElectricHP:
	ld a, 12
	jr SetBerryBuffer

PsychicHP:
	ld a, 13
	jr SetBerryBuffer

IceHP:
	ld a, 14
	jr SetBerryBuffer

DarkHP:
	ld a, 15
	jr SetBerryBuffer

FairyHP:
	ld a, 16
	jr SetBerryBuffer

SetBerryBuffer:
	ld [wBerryCafeBuffer], a
	ret

BerryCafeLassScript:
	jumptextfaceplayer BerryCafeLassText

BerryCafeClerkScript:
	jumptextfaceplayer BerryCafeClerkText

BerryCafePokefanMScript:
	jumptextfaceplayer BerryCafePokefanMText

BerryCafeDelinquentScript:
	jumptextfaceplayer BerryCafeDelinquentText

BerryCafeSchoolboyScript:
	jumptextfaceplayer BerryCafeSchoolboyText

BerryCafeMenu:
	jumptext BerryCafeMenuText

BerryCafeBaristaMovesLeft:
	step LEFT
	step_resume

BerryCafeBaristaMovesRight:
	step RIGHT
	step_end

BerryCafeMenuText:
	text "Protein Shake: 4"
	line "Rawst & 5 Kelpsy"

	para "Pidgey's Milk: 3"
	line "Aspear & 3 Tamato"

	para "Ekan's Venom: 5"
	line "Pecha & 4 Grepa"

	para "Dirt Cup: 7 Leppa"
	line "& 3 Kelpsy"

	para "On the Rocks: 8"
	line "Oran & 4 Qualot"

	para "Bug Juice: 5 Pecha"
	line "& 5 Pomeg"

	para "Ectoplasm: 5"
	line "Chesto & 4 Hondew"

	para "Spinach Shake: 5"
	line "Sitrus & 6 Qualot"

	para "Fireball Tea: 7"
	line "Rawst & 6 Tamato"

	para "Tap Water: 10 Oran"

	para "Hot Leaf Juice: 8"
	line "Lum & 3 Pomeg"

	para "Shock Tonic: 3"
	line "Cheri & 7 Hondew"

	para "Calming Jasmine: 6"
	line "Persim & 8 Hondew"

	para "Shaved Ice: 7"
	line "Aspear & 8 Grepa"

	para "Black Coffee: 8"
	line "Persim & 9 Sitrus"

	para "Sparkling Cider: 9"
	line "Lum & 9 Grepa"
	done

BerryCafePokefanMText:
	text "Hot hot hot!"

	para "This Fireball Tea"
	line "is too spicy!"
	done

BerryCafeClerkText:
	text "I'm on my break"
	line "from my job at"
	cont "the Department"
	cont "Store."

	para "I needed Black"
	line "Coffee."
	done

BerryCafeLassText:
	text "This Calming"
	line "Jasmine Tea"
	cont "always helps me"
	cont "relax."
	done

BerryCafeDelinquentText:
	text "Go away! I'm"
	line "enjoying my"
	cont "On the Rocks!"
	done

BerryCafeSchoolboyText:
	text "The drinks here"
	line "don't just change"
	cont "a #mon's Hidden"
	cont "Power,"

	para "but their Special"
	line "and Speed stats"
	cont "can increase!"

	para "It's astounding!"

	para "But its HP might"
	line "decrease, so just"
	cont "be cautious."
	done

BerryCafeBaristaIntroText:
	text "Welcome!"

	para "The berries you'll"
	line "need are on the"
	cont "chalkboard!"

	para "What'll it be?"
	done

BerryCafeLaterText:
	text "Later!"
	done

BerryCafeWhichPokemonText:
	text "Which #mon will"
	line "drink this?"
	done

BerryCafeCantMakeText:
	text "Sorry, but you"
	line "don't have the"
	cont "right berries."
	done

WillYouBackOutText:
	text "You can't get your"
	line "berries back after"
	cont "you agree."

	para "Will you proceed?"
	done

BerryCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  7, GOLDENROD_CITY, 14
	warp_event  7,  7, GOLDENROD_CITY, 14

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  3, BGEVENT_READ, BerryCafeMenu

	db 6 ; object events
	object_event  7,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BerryCafeBaristaScript, -1
	object_event  5,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BerryCafePokefanMScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BerryCafeLassScript, -1
	object_event  9,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BerryCafeClerkScript, -1
	object_event  3,  1, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BerryCafeSchoolboyScript, -1
	object_event 10,  1, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BerryCafeDelinquentScript, -1
