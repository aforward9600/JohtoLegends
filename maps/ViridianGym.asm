	object_const_def ; object_event constants
	const VIRIDIANGYM_GIOVANNI
	const VIRIDIANGYM_GYM_GUY

ViridianGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, GiovanniLastMonText
	loadtrainer GIOVANNI, GIOVANNI1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GIOVANNI
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	setevent EVENT_CERULEAN_GYM_LEADERS
	setevent EVENT_PEWTER_GYM_FLINT
	setevent EVENT_CELADON_GYM_ERIKA
	setevent EVENT_VERMILION_GYM_SURGE
	setevent EVENT_FUCSHIA_GYM_KOGA
	setevent EVENT_SAFFRON_GYM_SABRINA
	setevent EVENT_FIGHTING_DOJO_MASTER
	setevent EVENT_CINNABAR_GYM_BLAINE
	setevent EVENT_DECO_CARPET_4
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear VIRIDIANGYM_GIOVANNI
	pause 15
	special FadeInQuickly
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

ViridianGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GIOVANNI
	iftrue .ViridianGymGuyWinScript
	writetext ViridianGymGuyText
	waitbutton
	closetext
	end

.ViridianGymGuyWinScript:
	writetext ViridianGymGuyWinText
	waitbutton
	closetext
	end

GiovanniLastMonText:
	text "This raw strength…"

	para "I see…"
	done

LeaderBlueBeforeText:
	text "Giovanni: I must"
	line "apologize for the"
	cont "lack of room."

	para "This is the best"
	line "place in the city"
	cont "to battle."

	para "So, you want me to"
	line "be a Gym Leader?"

	para "…Heh."

	para "Very well then."

	para "I must say, it's"
	line "been a while since"
	cont "I've been excited"
	cont "to battle."

	para "Yes, quite a while"
	line "indeed…"

	para "…Sorry, lost in a"
	line "memory there for a"
	cont "second."

	para "I, Giovanni,"
	line "accept this test!"
	done

LeaderBlueWinText:
	text "Giovanni: I see"
	line "how you became a"
	cont "Chamion!"
	done

Text_ReceivedEarthBadge:
	text "Giovanni received"
	line "Earthbadge."
	done

LeaderBlueAfterText:
	text "Giovanni: …So this"
	line "was the badge of"
	cont "my predecessor…"

	para "I like it."

	para "Green, like the"
	line "plants that grow"
	cont "upon the earth."

	para "Alright, you've"
	line "assembled the"
	cont "strongest trainers"
	cont "in Kanto."

	para "It's time we ended"
	line "this little war."

	para "I will gather the"
	line "rest and meet you"
	cont "their hideout in"
	cont "Celadon City."

	para "Don't be late!"
	done

LeaderBlueEpilogueText:
	text "BLUE: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done

ViridianGymGuyText:
	text "Yo, CHAMP in"
	line "making!"

	para "How's it going?"
	line "Looks like you're"
	cont "on a roll."

	para "The GYM LEADER is"
	line "a guy who battled"

	para "the CHAMPION three"
	line "years ago."

	para "He's no pushover."

	para "Give it everything"
	line "you've got!"
	done

ViridianGymGuyWinText:
	text "Man, you are truly"
	line "tough…"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  3, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuyScript, EVENT_VIRIDIAN_GYM_TRAINERS
