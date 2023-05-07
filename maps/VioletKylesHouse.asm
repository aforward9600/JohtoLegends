	object_const_def ; object_event constants
	const VIOLETKYLESHOUSE_POKEFAN_M
	const VIOLETKYLESHOUSE_KYLE

VioletKylesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletKylesHousePokefanMScript:
	faceplayer
	opentext
	writetext WannaBuyAConsoleText
	waitbutton
ConsoleSalesLoopScript:
	writetext ConsoleSalesText
	special PlaceMoneyTopRight
	loadmenu ConsoleSalesMenu
	verticalmenu
	closewindow
	ifequal 1, .Famicom
	ifequal 2, .SNES
	ifequal 3, .N64
	ifequal 4, .VirtualBoy
	jump ConsoleSalesCancel

.Famicom:
	checkevent EVENT_DECO_FAMICOM
	iftrue .AlreadyHaveConsole
	checkmoney YOUR_MONEY, 14800
	ifequal HAVE_LESS, ConsoleSalesNotEnoughMoney
	writetext ConsoleSales_AreYouSureText
	yesorno
	iffalse ConsoleSalesCancel
	setevent EVENT_DECO_FAMICOM
	takemoney YOUR_MONEY, 14800
	jump ConsoleSales_FinishScript
	end

.SNES:
	checkevent EVENT_DECO_SNES
	iftrue .AlreadyHaveConsole
	checkmoney YOUR_MONEY, 25000
	ifequal HAVE_LESS, ConsoleSalesNotEnoughMoney
	writetext ConsoleSales_AreYouSureText
	yesorno
	iffalse ConsoleSalesCancel
	setevent EVENT_DECO_SNES
	takemoney YOUR_MONEY, 25000
	jump ConsoleSales_FinishScript
	end

.N64:
	checkevent EVENT_DECO_N64
	iftrue .AlreadyHaveConsole
	checkmoney YOUR_MONEY, 25000
	ifequal HAVE_LESS, ConsoleSalesNotEnoughMoney
	writetext ConsoleSales_AreYouSureText
	yesorno
	iffalse ConsoleSalesCancel
	setevent EVENT_DECO_N64
	takemoney YOUR_MONEY, 25000
	jump ConsoleSales_FinishScript
	end

.VirtualBoy:
	checkevent EVENT_DECO_VIRTUAL_BOY
	iftrue .AlreadyHaveConsole
	checkmoney YOUR_MONEY, 24000
	ifequal HAVE_LESS, ConsoleSalesNotEnoughMoney
	writetext ConsoleSales_AreYouSureText
	yesorno
	iffalse ConsoleSalesCancel
	setevent EVENT_DECO_VIRTUAL_BOY
	takemoney YOUR_MONEY, 24000
	jump ConsoleSales_FinishScript
	end

.AlreadyHaveConsole:
	writetext AlreadyHaveConsoleText
	waitbutton
	jump ConsoleSalesLoopScript

ConsoleSalesMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "NES     ¥14800@"
	db "SNES    ¥25000@"
	db "N64     ¥25000@"
	db "VB      ¥24000@"

ConsoleSales_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext YouGotConsoleText
	waitbutton
	jump ConsoleSalesLoopScript

ConsoleSalesCancel:
	writetext IllStillHaveThemText
	waitbutton
	closetext
	end

ConsoleSalesNotEnoughMoney:
	writetext NotEnoughMoneyConsoleText
	waitbutton
	closetext
	end

Kyle:
	faceplayer
	opentext
	trade NPC_TRADE_KYLE
	waitbutton
	closetext
	end

VioletKylesHousePokefanMText:
	text "I'll be sad to see"
	line "that Rapidash go,"

	para "but it's my kid's"
	line "#mon, not mine."

	para "He's free to trade"
	line "however he wants."
	done

WannaBuyAConsoleText:
	text "Hey there!"

	para "I've got some"
	line "video game"
	cont "consoles here for"
	cont "sale!"
	done

ConsoleSalesText:
	text "You interested in"
	line "one?"
	done

IllStillHaveThemText:
	text "Aw, fine."

	para "I'll still have"
	line "them if you"
	cont "change your mind."
	done

ConsoleSales_AreYouSureText:
	text "This one, yes?"
	done

NotEnoughMoneyConsoleText:
	text "Hey!"

	para "You trying to pull"
	line "something?"
	done

AlreadyHaveConsoleText:
	text "I already sold you"
	line "you that one!"
	done

YouGotConsoleText:
	text "Thank you!"

	para "I'll send this to"
	line "your house!"
	done

VioletKylesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, VIOLET_CITY, 6
	warp_event  4,  7, VIOLET_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletKylesHousePokefanMScript, -1
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Kyle, -1
