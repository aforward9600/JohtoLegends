	object_const_def ; object_event constants
	const SEVENISLANDMART_CLERK
	const SEVENISLANDMART_DRAGON_TAMER_M

SevenIslandMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SevenIslandMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SEVEN_ISLAND
	closetext
	end

SevenIslandMartDragonTamerMScript:
	jumptextfaceplayer SevenIslandMartDragonTamerMText

SevenIslandMartDragonTamerMText:
	text "We live in harmony"
	line "with Larvitar,"
	cont "Pupitar and"
	cont "Tyranitar here."

	para "Our ancestors"
	line "revered them."
	done

SevenIslandMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SEVEN_ISLAND, 5
	warp_event  3,  7, SEVEN_ISLAND, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevenIslandMartClerkScript, -1
	object_event  7,  2, SPRITE_DRAGON_TAMER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SevenIslandMartDragonTamerMScript, -1
