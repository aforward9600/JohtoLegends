	object_const_def ; object_event constants
	const VIOLETMART_CLERK
	const VIOLETMART_GRANNY
	const VIOLETMART_COOLTRAINER_M
	const VIOLETMART_CLERK2

VioletMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIOLET
	closetext
	end

VioletMartTMsClerkScript:
	opentext
	pokemart MARTTYPE_TMS, MART_VIOLET_TMS
	closetext
	end

VioletMartDragonTamerFScript:
	jumptextfaceplayer VioletMartDragonTamerFText

VioletMartCooltrainerMScript:
	jumptextfaceplayer VioletMartCooltrainerMText

VioletMartDragonTamerFText:
	text "I've been waiting"
	line "for these TMs!"

	para "These are great!"
	done

VioletMartCooltrainerMText:
	text "The items in these"
	line "marts don't seem"
	cont "to get any better."

	para "I guess that's"
	line "just what happens"
	cont "the further you go."
	done

VioletMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIOLET_CITY, 1
	warp_event  3,  7, VIOLET_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartClerkScript, -1
	object_event  7,  6, SPRITE_DRAGON_TAMER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartDragonTamerFScript, -1
	object_event  5,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletMartCooltrainerMScript, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartTMsClerkScript, -1
