	object_const_def ; object_event constants
	const ROUTE37_POKEFAN_F
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3
	const ROUTE37_OFFICER

Route37_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Sunny

.Sunny:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	return

.SunnyAppears:
	appear ROUTE37_SUNNY
	return

TrainerPokefanFEthel:
	trainer POKEFANF, ETHEL1, EVENT_BEAT_POKEFANF_ETHEL, PokefanFEthelSeenText, PokefanFEthelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanFEthelRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_BEAUTY_ENCOUNTER
	writetext PokefanFEthelLetsDoItText
	waitbutton
	winlosstext PokefanFEthelBeatenText, 0
	loadtrainer POKEFANF, ETHEL1
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext PokefanFEthelRefusedText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	buttonsound
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	buttonsound
	sjump .next
.Kris:
	writetext SunnyGivesGiftText2
	buttonsound
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

OfficerTobyScript:
	faceplayer
	opentext
	checktime NITE
	iffalse .NoFight
	checkevent EVENT_BEAT_OFFICER_TOBY
	iftrue .AfterScript
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerTobySeenText
	waitbutton
	closetext
	winlosstext OfficerTobyWinText, 0
	loadtrainer OFFICER, TOBY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_TOBY
	closetext
	end

.AfterScript:
	writetext OfficerTobyAfterText
	waitbutton
	closetext
	end

.NoFight:
	writetext OfficerTobyDaytimeText
	waitbutton
	closetext
	end

Route37Sign:
	jumptext Route37SignText

Route37FruitTree1:
	fruittree FRUITTREE_ROUTE_37_1

Route37FruitTree2:
	fruittree FRUITTREE_ROUTE_37_2

Route37FruitTree3:
	fruittree FRUITTREE_ROUTE_37_3

Route37HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

PokefanFEthelSeenText:
	text "I'll show you my"
	line "darling #mon!"
	done

PokefanFEthelBeatenText:
	text "Isn't my #mon"
	line "just precious?"
	done

PokefanFEthelRematchText:
	text "You came to see my"
	line "#mon again?"
	done

PokefanFEthelLetsDoItText:
	text "Come on, my"
	line "Togepi!"
	done

PokefanFEthelRefusedText:
	text "Fine!"

	para "I didn't want to"
	line "show you my #-"
	cont "mon anyway!"
	done

MeetSunnyText:
	text "Hi!"

	para "I'm known as the"
	line "Week Lady!"

	para "And no, it has"
	line "nothing to do"
	cont "with strength,"

	para "I hear that joke"
	line "enough."
	done

SunnyGivesGiftText1:
	text "Here, I want you"
	line "to have this!"
	done

SunnyGivesGiftText2:
	text "Here, I want you"
	line "to have this!"
	done

SunnyGaveGiftText:
	text "It's a Magnet!"

	para "A #mon that"
	line "knows electric"

	para "moves should hold"
	line "it."

	para "I know that it"
	line "powers up"
	cont "electric moves!"
	done

SunnySundayText:
	text "Come again"
	line "sometime!"

	para "I can't give you"
	line "another item, but"
	cont "I enjoy company!"
	done

SunnyNotSundayText:
	text "Today's not"
	line "Sunday!"
	done

OfficerTobySeenText:
	text "Halt!"

	para "Are you a tree?"

	para "Oh, you're just"
	line "a trainer."

	para "May as well have"
	line "a battle."
	done

OfficerTobyWinText:
	text "I suppose a tree"
	line "would have been an"
	cont "easier opponent."
	done

OfficerTobyAfterText:
	text "There have been"
	line "reports of violent"
	cont "trees in the area."

	para "They're quite hard"
	line "to believe, but I"
	cont "was sent to"
	cont "investigate."
	done

OfficerTobyDaytimeText:
	text "Careful now."

	para "You might get"
	line "assaulted by a"
	cont "tree on this"
	cont "Route."
	done

Route37SignText:
	text "Route 37"

	para "Pokefan Ethel"
	line "wants to show"
	cont "off her #mon!"
	done

Route37_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  3, BGEVENT_READ, Route37Sign
	bg_event  4,  2, BGEVENT_ITEM, Route37HiddenEther

	db 6 ; object events
	object_event  6,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPokefanFEthel, -1
	object_event 13,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree1, -1
	object_event 16,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 16,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree2, -1
	object_event 15,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree3, -1
	object_event 16, 12, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficerTobyScript, -1
