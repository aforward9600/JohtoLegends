	object_const_def
	const LAKEOFRAGEMART_CLERK1
	const LAKEOFRAGEMART_SUPER_NERD

LakeOfRageMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LakeOfRageMartClerk1Script:
	opentext
	pokemart MARTTYPE_STANDARD, MART_LAKE_OF_RAGE
	closetext
	end

LakeOfRageMartBlackBeltScript:
	jumptextfaceplayer LakeOfRageMartBlackBeltText

LakeOfRageMartBlackBeltText:
	text "If you want to get"
	line "through Mt.Mortar"
	cont "easily, I would"
	cont "buy Repels."

	para "Weaker #mon"
	line "will stay away."
	done

LakeOfRageMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 5
	warp_event  3,  7, LAKE_OF_RAGE, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event,  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageMartClerk1Script, -1
	object_event,  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageMartBlackBeltScript, -1
