	object_const_def ; object_event constants
	const ICEPATHB3F_POKE_BALL
	const ICEPATHB3F_ROCK
	const ICEPATHB3F_BUG_CATCHER
	const ICEPATHB3F_NURSE

IcePathB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcePathB3FNevermeltice:
	itemball NEVERMELTICE

IcePathB3FRock:
	jumpstd smashrock

IcePathBugCatcher:
	jumptextfaceplayer IcePath3FNurseRestAWhileText

IcePath3FNurse:
	faceplayer
	opentext
	writetext IcePath3FNurseRestAWhileText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext IcePath3FNurseKeepAtItText
	waitbutton
	closetext
	end

IcePath3FNurseRestAWhileText:
	text "Oh my, your"
	line "#mon look"
	cont "injured!"

	para "Here, let me heal"
	line "your #mon."
	done

IcePath3FNurseKeepAtItText:
	text "Don't give up!"
	done

IcePathB3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  5, ICE_PATH_B2F_MAHOGANY_SIDE, 2
	warp_event 15,  5, ICE_PATH_B2F_BLACKTHORN_SIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB3FNevermeltice, EVENT_ICE_PATH_B3F_NEVERMELTICE
	object_event  9,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB3FRock, -1
	object_event  6,  1, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, IcePathBugCatcher, -1
	object_event  4,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePath3FNurse, -1
