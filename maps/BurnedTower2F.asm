	object_const_def ; object_event constants
	const BURNEDTOWER2F_POKE_BALL
	const BURNEDTOWER2F_ROCK
	const BURNEDTOWER2F_TWIN

BurnedTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BurnedTower2FHPUp:
	itemball FIRE_STONE

BurnedTower2FRockScript:
	jumpstd smashrock

BurnedTower2FTwinScript:
	faceplayer
	opentext
	writetext IWantMommyText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear BURNEDTOWER2F_TWIN
	pause 15
	special FadeInQuickly
	setevent EVENT_BURNED_TOWER_2F_TWIN
	setmapscene ECRUTEAK_CITY, SCENE_ECRUTEAK_MOTHER
	end

IWantMommyText:
	text "Waaaaah!"

	para "I want my mommy!"

	para "Sniff..."

	para "Huh?"
	line "You got rid of the"
	cont "rocks?"

	para "Oh, thank you!"

	para "I shouldn't have"
	line "come here."

	para "Those rocks fell"
	line "after I climbed up"
	cont "here."

	para "I won't disobey"
	line "mommy again!"

	para "I'll go see her!"
	done

BurnedTower2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5, 13, BURNED_TOWER_1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 15,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTower2FHPUp, EVENT_BURNED_TOWER_2F_FIRE_STONE
	object_event  5,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTower2FRockScript, -1
	object_event  8,  8, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTower2FTwinScript, EVENT_BURNED_TOWER_2F_TWIN
