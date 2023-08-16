	object_const_def ; object_event constants
	const GOLDENRODDEPTSTOREROOF_CLERK
	const GOLDENRODDEPTSTOREROOF_POKEFAN_F
	const GOLDENRODDEPTSTOREROOF_FISHER
	const GOLDENRODDEPTSTOREROOF_TWIN
	const GOLDENRODDEPTSTOREROOF_SUPER_NERD
	const GOLDENRODDEPTSTOREROOF_POKEFAN_M
	const GOLDENRODDEPTSTOREROOF_TEACHER
	const GOLDENRODDEPTSTOREROOF_BUG_CATCHER

GoldenrodDeptStoreRoof_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .CheckSaleChangeBlock
	callback MAPCALLBACK_OBJECTS, .CheckSaleChangeClerk

.CheckSaleChangeBlock:
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .SaleIsOn
	return

.SaleIsOn:
	changeblock 0, 2, $3f ; cardboard boxes
	changeblock 0, 4, $0f ; vendor booth
	return

.CheckSaleChangeClerk:
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .ChangeClerk
	setevent EVENT_GOLDENROD_SALE_OFF
	clearevent EVENT_GOLDENROD_SALE_ON
	return

.ChangeClerk:
	clearevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_GOLDENROD_SALE_ON
	return

GoldenrodDeptStoreRoofClerkScript:
	faceplayer
	opentext
	writetext RooftopSaleStartText
	waitbutton
RooftopSaleLoopScript:
	writetext RooftopSaleText
	special PlaceMoneyTopRight
	loadmenu RooftopSaleMenu
	verticalmenu
	closewindow
	ifequal 1, .KotoraDoll
	ifequal 2, .PikachuBed
	ifequal 3, .MagnaPlant
	ifequal 4, .YellowCarpet
	jump RooftopSaleCancel

.KotoraDoll:
	checkevent EVENT_DECO_KOTORA_DOLL
	iftrue .AlreadyHaveDeco
	checkmoney YOUR_MONEY, 2800
	ifequal HAVE_LESS, RooftopSaleNotEnoughMoney
	writetext RooftopSale_AreYouSureText
	yesorno
	iffalse RooftopSaleCancel
	setevent EVENT_DECO_KOTORA_DOLL
	takemoney YOUR_MONEY, 2800
	jump RooftopSale_FinishScript
	end

.PikachuBed:
	checkevent EVENT_DECO_BED_4
	iftrue .AlreadyHaveDeco
	checkmoney YOUR_MONEY, 3400
	ifequal HAVE_LESS, RooftopSaleNotEnoughMoney
	writetext RooftopSale_AreYouSureText
	yesorno
	iffalse RooftopSaleCancel
	setevent EVENT_DECO_BED_4
	takemoney YOUR_MONEY, 3400
	jump RooftopSale_FinishScript
	end

.MagnaPlant:
	checkevent EVENT_DECO_PLANT_1
	iftrue .AlreadyHaveDeco
	checkmoney YOUR_MONEY, 2500
	ifequal HAVE_LESS, RooftopSaleNotEnoughMoney
	writetext RooftopSale_AreYouSureText
	yesorno
	iffalse RooftopSaleCancel
	setevent EVENT_DECO_PLANT_1
	takemoney YOUR_MONEY, 2500
	jump RooftopSale_FinishScript
	end

.YellowCarpet:
	checkevent EVENT_DECO_CARPET_3
	iftrue .AlreadyHaveDeco
	checkmoney YOUR_MONEY, 3300
	ifequal HAVE_LESS, RooftopSaleNotEnoughMoney
	writetext RooftopSale_AreYouSureText
	yesorno
	iffalse RooftopSaleCancel
	setevent EVENT_DECO_CARPET_3
	takemoney YOUR_MONEY, 3300
	jump RooftopSale_FinishScript
	end

.AlreadyHaveDeco:
	writetext AlreadyHaveDecoText
	waitbutton
	jump RooftopSaleLoopScript

RooftopSaleMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Kotora Doll ¥2800@"
	db "Pikachu Bed ¥3400@"
	db "Magna Plant ¥2500@"
	db "Y. Carpet   ¥3300@"

RooftopSale_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext YouGotDecoText
	waitbutton
	jump RooftopSaleLoopScript

RooftopSaleCancel:
	writetext RooftopSaleComeAgainText
	waitbutton
	closetext
	end

RooftopSaleNotEnoughMoney:
	writetext NotEnoughMoneyRooftopSaleText
	waitbutton
	closetext
	end

GoldenrodDeptStoreRoofPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanFText

GoldenrodDeptStoreRoofFisherScript:
	faceplayer
	opentext
	writetext GoldenrodDeptStoreRoofFisherText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_FISHER, UP
	end

GoldenrodDeptStoreRoofTwinScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTwinText

GoldenrodDeptStoreRoofSuperNerdScript:
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdOhWowText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, UP
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, RIGHT
	end

GoldenrodDeptStoreRoofPokefanMScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanMText

GoldenrodDeptStoreRoofTeacherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTeacherText

GoldenrodDeptStoreRoofBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofBugCatcherText

Binoculars1:
	jumptext Binoculars1Text

Binoculars2:
	jumptext Binoculars2Text

Binoculars3:
	jumptext Binoculars3Text

PokeDollVendingMachine:
	opentext
PokeDollVendingMachineLoopScript:
	writetext PokeDollVendingMachineText
	special PlaceMoneyTopRight
	loadmenu PokeDollVendingMachineMenu
	verticalmenu
	closewindow
	ifequal 1, .Clefairy
	ifequal 2, .Swablu
	ifequal 3, .Poliwag
	ifequal 4, .Skarmini
	jump PokeDollVendingMachineCancel

.Clefairy:
	checkevent EVENT_DECO_CLEFAIRY_DOLL
	iftrue .AlreadyHaveDecorItem
	checkmoney YOUR_MONEY, 2000
	ifequal HAVE_LESS, PokeDollVendingMachineNotEnoughMoney
	writetext PokeDollVendingMachine_AreYouSureText
	yesorno
	iffalse PokeDollVendingMachineCancel
	setevent EVENT_DECO_CLEFAIRY_DOLL
	takemoney YOUR_MONEY, 2000
	jump PokeDollVendingMachine_FinishScript
	end

.Swablu:
	checkevent EVENT_DECO_SWABLU_DOLL
	iftrue .AlreadyHaveDecorItem
	checkmoney YOUR_MONEY, 3000
	ifequal HAVE_LESS, PokeDollVendingMachineNotEnoughMoney
	writetext PokeDollVendingMachine_AreYouSureText
	yesorno
	iffalse PokeDollVendingMachineCancel
	setevent EVENT_DECO_SWABLU_DOLL
	takemoney YOUR_MONEY, 3000
	jump PokeDollVendingMachine_FinishScript
	end

.Poliwag:
	checkevent EVENT_DECO_POLIWAG_DOLL
	iftrue .AlreadyHaveDecorItem
	checkmoney YOUR_MONEY, 4000
	ifequal HAVE_LESS, PokeDollVendingMachineNotEnoughMoney
	writetext PokeDollVendingMachine_AreYouSureText
	yesorno
	iffalse PokeDollVendingMachineCancel
	setevent EVENT_DECO_POLIWAG_DOLL
	takemoney YOUR_MONEY, 4000
	jump PokeDollVendingMachine_FinishScript
	end

.Skarmini:
	checkevent EVENT_DECO_SKARMINI_DOLL
	iftrue .AlreadyHaveDecorItem
	checkmoney YOUR_MONEY, 1500
	ifequal HAVE_LESS, PokeDollVendingMachineNotEnoughMoney
	writetext PokeDollVendingMachine_AreYouSureText
	yesorno
	iffalse PokeDollVendingMachineCancel
	setevent EVENT_DECO_SKARMINI_DOLL
	takemoney YOUR_MONEY, 1500
	jump PokeDollVendingMachine_FinishScript
	end

.AlreadyHaveDecorItem:
	writetext AlreadyHaveDecorItemText
	waitbutton
	jump PokeDollVendingMachineLoopScript

PokeDollVendingMachineMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Clefairy  ¥2000@"
	db "Swablu    ¥3000@"
	db "Poliwag   ¥4000@"
	db "Skarmini  ¥1500@"

PokeDollVendingMachine_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext YouGotDollText
	waitbutton
	jump PokeDollVendingMachineLoopScript

PokeDollVendingMachineCancel:
	closetext
	end

PokeDollVendingMachineNotEnoughMoney:
	writetext NotEnoughMoneyText
	waitbutton
	closetext
	end

GoldenrodDeptStoreRoofPokefanFText:
	text "Whew, I'm tired."

	para "I sometimes come"
	line "up to the rooftop"

	para "to take a break"
	line "from shopping."
	done

GoldenrodDeptStoreRoofFisherText:
	text "Pardon? Who says"
	line "an adult can't get"
	cont "into this?"

	para "I'm going to be"
	line "back every day to"

	para "collect all the"
	line "dolls!"
	done

GoldenrodDeptStoreRoofTwinText:
	text "They have bargain"
	line "sales here every"
	cont "so often."
	done

GoldenrodDeptStoreRoofSuperNerdOhWowText:
	text "Oh, wow!"
	done

GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText:
	text "Will you quit"
	line "bothering me?"
	done

GoldenrodDeptStoreRoofPokefanMText:
	text "There's something"
	line "I really want, but"

	para "I don't have the"
	line "necessary cash…"

	para "Maybe I'll sell"
	line "off the Berries"
	cont "I've collected…"
	done

GoldenrodDeptStoreRoofTeacherText:
	text "Oh, everything is"
	line "so cheap!"

	para "I bought so much,"
	line "my Pack's crammed!"
	done

GoldenrodDeptStoreRoofBugCatcherText:
	text "I want a Pikachu"
	line "Bed, but I can't"
	cont "afford it."
	done

Binoculars1Text:
	text "These binoculars"
	line "let me see far"

	para "away. Maybe I can"
	line "see my own house."

	para "Is it the one with"
	line "the green roof?"
	done

Binoculars2Text:
	text "Hey! Some trainers"
	line "are battling on"
	cont "the road!"

	para "A #mon fired a"
	line "flurry of leaves!"

	para "That makes me feel"
	line "like battling"
	cont "right now!"
	done

Binoculars3Text:
	text "A Fisher caught a"
	line "lot of Magikarp…"

	para "They're Splashing"
	line "at the same time!"

	para "Look at the water"
	line "going everywhere!"
	done

PokeDollVendingMachineText:
	text "A vending machine"
	line "for #mon dolls?"

	para "Which one do you"
	line "want?"
	done

PokeDollVendingMachine_AreYouSureText:
	text "This one?"
	done

NotEnoughMoneyText:
	text "Not enough money…"
	done

YouGotDollText:
	text "A doll popped out!"
	done

AlreadyHaveDecorItemText:
	text "You've already got"
	line "this doll!"
	done

RooftopSaleStartText:
	text "Welcome to the"
	line "Thursday Sale!"
	
	para "Got some nice"
	line "decorations on"
	cont "sale!"
	done

RooftopSaleText:
	text "What're ya looking"
	line "for?"
	done

NotEnoughMoneyRooftopSaleText:
	text "You can't afford"
	line "this!"
	done

RooftopSale_AreYouSureText:
	text "You sure?"
	done

RooftopSaleComeAgainText:
	text "Come again!"
	done

YouGotDecoText:
	text "Thanks!"

	para "I'll send this to"
	line "your house!"
	done

AlreadyHaveDecoText:
	text "I can't sell you"
	line "what you already"
	cont "have!"
	done

GoldenrodDeptStoreRoof_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  1, GOLDENROD_DEPT_STORE_6F, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event 15,  3, BGEVENT_RIGHT, Binoculars1
	bg_event 15,  5, BGEVENT_RIGHT, Binoculars2
	bg_event 15,  6, BGEVENT_RIGHT, Binoculars3
	bg_event  3,  0, BGEVENT_UP, PokeDollVendingMachine

	db 8 ; object events
	object_event  1,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofClerkScript, EVENT_GOLDENROD_SALE_OFF
	object_event 10,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanFScript, -1
	object_event  2,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofFisherScript, -1
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTwinScript, EVENT_GOLDENROD_SALE_ON
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofSuperNerdScript, EVENT_GOLDENROD_SALE_ON
	object_event  7,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanMScript, EVENT_GOLDENROD_SALE_OFF
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTeacherScript, EVENT_GOLDENROD_SALE_OFF
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofBugCatcherScript, EVENT_GOLDENROD_SALE_OFF
