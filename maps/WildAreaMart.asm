	object_const_def
	const WILDAREAMART_CLERK1
	const WILDAREAMART_CLERK2
	const WILDAREAMART_BLACK_BELT

WildAreaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildAreaMartClerk1Script:
	opentext
	pokemart MARTTYPE_STANDARD, MART_WILD_AREA
	closetext
	end

WildAreaMartClerk2Script:
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_4F
	closetext
	end

WildAreaMartBlackBeltScript:
	jumptextfaceplayer WildAreaMartBlackBeltText

WildAreaMartBlackBeltText:
	text "I'd stock up on"
	line "plenty of #-"
	cont "balls if I were"
	cont "you."

	para "You don't want to"
	line "run into a nice"
	cont "#mon and not be"
	cont "able to catch it."
	done

WildAreaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, WILD_AREA_OUTSIDE, 2
	warp_event  3,  7, WILD_AREA_OUTSIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event,  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaMartClerk1Script, -1
	object_event,  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaMartClerk2Script, -1
	object_event,  8,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaMartBlackBeltScript, -1
