	object_const_def ; object_event constants
	const VIRIDIANGYM_GIOVANNI
	const VIRIDIANGYM_COOLTRAINERF
	const VIRIDIANGYM_COOLTRAINERM

ViridianGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .GiovanniPost
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
	setevent EVENT_BEAT_COOLTRAINERF_SOL
	setevent EVENT_BEAT_COOLTRAINERM_BUMI
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	setevent EVENT_CERULEAN_GYM_DAISY
	setevent EVENT_CERULEAN_GYM_LILY
	setevent EVENT_CERULEAN_GYM_VIOLET
	setevent EVENT_PEWTER_GYM_FLINT
	setevent EVENT_CELADON_GYM_ERIKA
	setevent EVENT_VERMILION_GYM_SURGE
	setevent EVENT_FUCHSIA_GYM_KOGA
	setevent EVENT_SAFFRON_GYM_SABRINA
	setevent EVENT_FIGHTING_DOJO_MASTER
	setevent EVENT_CINNABAR_GYM_BLAINE
	setevent EVENT_CELADON_CITY_GUARD
	setevent EVENT_DECO_CARPET_4
	setevent EVENT_KANTO_POKECENTER_RIVAL
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

.GiovanniPost:
	checkflag ENGINE_WADE
	iffalse .GiovanniRematch
	writetext GiovanniPostText
	waitbutton
	closetext
	end

.GiovanniRematch:
	writetext GiovanniRematchText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, GiovanniLastMonText
	loadtrainer GIOVANNI, GIOVANNI1
	startbattle
	reloadmapafterbattle
	opentext
	writetext GiovanniAfterRematchText
	waitbutton
	closetext
	setflag ENGINE_WADE
	end

GiovanniLastMonText:
	text "This raw strength…"

	para "I see…"
	done

TrainerCooltrainerFSol:
	trainer COOLTRAINERF, SOL, EVENT_BEAT_COOLTRAINERF_SOL, CooltrainerFSolSeenText, CooltrainerFSolBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFSolAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerMBumi:
	trainer COOLTRAINERM, BUMI, EVENT_BEAT_COOLTRAINERM_BUMI, CooltrainerMBumiSeenText, CooltrainerMBumiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerMBumiAfterText
	waitbutton
	closetext
	end

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
	cont "Champion!"
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
	text "Giovanni: The Fed"
	line "hideout has been"
	cont "cleaned up of any"
	cont "vermin."

	para "I decided to buy"
	line "it and renovate it"
	cont "into a casino."

	para "After the cities"
	line "are restored, of"
	cont "course."

	para "I figured people"
	line "could use some"
	cont "levity in their"
	cont "lives after this"
	cont "whole ordeal."
	done

CooltrainerFSolSeenText:
	text "I work here part-"
	line "time just moving"
	cont "boxes around."

	para "It's not glamorous,"
	line "but hey, money is"
	cont "money."
	done

CooltrainerFSolBeatenText:
	text "My money!"
	done

CooltrainerFSolAfterText:
	text "That's why I don't"
	line "like losing."

	para "It's a waste of"
	line "money!"
	done

CooltrainerMBumiSeenText:
	text "I'm strengthening"
	line "my body by moving"
	cont "these boxes."

	para "Gotta be strong in"
	line "body and #mon!"
	done

CooltrainerMBumiBeatenText:
	text "Or was it strong"
	line "in body and mind?"
	done

CooltrainerMBumiAfterText:
	text "I guess my mind's"
	line "another thing I"
	cont "gotta work on."
	done

GiovanniPostText:
	text "Giovanni: I just"
	line "bought the old"
	cont "Federation lair"
	cont "from Celadon City."

	para "I plan on opening"
	line "a Game Corner once"
	cont "the city recovers."

	para "I figured that the"
	line "people could use"
	cont "some levity in"
	cont "their lives."
	done

GiovanniRematchText:
	text "Giovanni: Here for"
	line "a rematch?"

	para "Don't hold back!"
	done

GiovanniAfterRematchText:
	text "Giovanni: You"
	line "really didn't hold"
	cont "back!"

	para "Perhaps someday, I"
	line "can be compared to"
	cont "you!"
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  3, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  5, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerFSol, EVENT_VIRIDIAN_GYM_TRAINERS
	object_event  4,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerMBumi, EVENT_VIRIDIAN_GYM_TRAINERS
