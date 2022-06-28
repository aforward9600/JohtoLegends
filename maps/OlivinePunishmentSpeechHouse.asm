	object_const_def ; object_event constants
	const OLIVINEPUNISHMENTSPEECHHOUSE_POKEFAN_M
	const OLIVINEPUNISHMENTSPEECHHOUSE_GRANDPA

OlivinePunishmentSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivinePunishmentSpeechHouseDaughter:
	jumptextfaceplayer OlivinePunishmentSpeechHouseDaughterText

OlivinePunishmentSpeechHouseSwarmGuy:
	jumptextfaceplayer OlivinePunishmentSpeechHouseSwarmGuyText

OlivinePunishmentSpeechHouseBookshelf2:
	jumpstd picturebookshelf

OlivinePunishmentSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

SwarmChannel:
	playmusic MUSIC_POKEMON_MARCH
	opentext
	checkflag ENGINE_SWARM
	iftrue .skiprandomswarm
	checkflag ENGINE_MINERALBADGE
	iftrue .Badges4Swarm
	writetext WhatSwarmTodayText
	waitbutton
	random 8
	ifequal 0, .noswarm
	ifequal 1, .yanma
	ifequal 2, .dunsparce
	ifequal 3, .qwilfish
	ifequal 4, .eevee
	ifequal 5, .kangaskhan
	ifequal 6, .gible
	ifequal 7, .sneasel

.Badges4Swarm:
	writetext WhatSwarmTodayText
	waitbutton
	random 10
	ifequal 0, .noswarm
	ifequal 1, .yanma
	ifequal 2, .dunsparce
	ifequal 3, .qwilfish
	ifequal 4, .eevee
	ifequal 5, .kangaskhan
	ifequal 6, .gible
	ifequal 7, .sneasel
	ifequal 8, .magcargo
	ifequal 9, .scyther

.noswarm
	setflag ENGINE_SWARM
	writetext NoSwarmTodayText
	waitbutton
	closetext
	sjump .endswarmchannel

.yanma
	setflag ENGINE_SWARM
	swarm ROUTE_39
	writetext YanmaSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.dunsparce
	setflag ENGINE_SWARM
	swarm DARK_CAVE_NEW_ENTRANCE
	writetext DunsparceSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.qwilfish
	setflag ENGINE_SWARM
	setval FISHSWARM_QWILFISH
	special ActivateFishingSwarm
	writetext QwilfishSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.eevee
	setflag ENGINE_SWARM
	swarm WILD_AREA_2_3
	writetext EeveeSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.kangaskhan
	setflag ENGINE_SWARM
	swarm WILD_AREA_CAVE
	writetext KangaskhanSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.gible
	setflag ENGINE_SWARM
	swarm WILD_AREA_4
	writetext GibleSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.sneasel
	setflag ENGINE_SWARM
	swarm ICE_PATH_B1F
	writetext SneaselSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.magcargo
	setflag ENGINE_SWARM
	swarm BURNED_TOWER_2F
	writetext MagcargoSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.scyther
	setflag ENGINE_SWARM
	swarm NATIONAL_PARK
	writetext ScytherSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.skiprandomswarm
	writetext ThatsAllFolksText
	waitbutton
	closetext
	sjump .endswarmchannel

.endswarmchannel
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	end

OlivinePunishmentSpeechHouseDaughterText:
	text "My father likes to"
	line "watch the Swarm"
	cont "Channel a little"
	cont "too much, to be"
	cont "honest."

	para "It's the only"
	line "thing he watches."

	para "We're probably the"
	line "only house in the"
	cont "region with the"
	cont "channel constantly"
	cont "on."
	done

OlivinePunishmentSpeechHouseSwarmGuyText:
	text "You here to watch"
	line "the Swarm Channel?"

	para "It's great!"

	para "They let you know"
	line "where a swarm of"
	cont "#mon appear!"

	para "It changes every"
	line "day, and sometimes"

	para "you may not get a"
	line "swarm."

	para "I've heard that"
	line "uniquely colored"
	cont "#mon can show"

	para "more often in such"
	line "swarms!"
	done

WhatSwarmTodayText:
	text "Hello everyone!"

	para "Welcome to the"
	line "Swarm Channel!"

	para "Will there be a"
	line "swarm in Johto"
	cont "today?"

	para "Let's find out!"
	done

NoSwarmTodayText:
	text "………………………"

	para "Bad luck,"
	line "trainers…"

	para "No #mon are"
	line "swarming today…"

	para "Better luck"
	line "tomorrow!"
	done

YanmaSwarmText:
	text "………………………"
	
	para "Ah!"

	para "On Route 39, there"
	line "is a swarm of"
	cont "Yanma!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to Route 39"
	line "and catch a Yanma!"
	done

DunsparceSwarmText:
	text "………………………"
	
	para "Ah!"

	para "In Dark Cave near"
	line "Blackthorn City,"
	cont "there is a swarm"
	cont "of Dunsparce!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to Dark Cave"
	line "and catch a"
	cont "Dunsparce!"
	done

QwilfishSwarmText:
	text "………………………"

	para "Ah!"

	para "In the Wild Area,"
	line "there is a swarm"
	cont "of Qwilfish!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to the Wild"
	line "Area and catch a"
	cont "Qwilfish!"
	done

EeveeSwarmText:
	text "………………………"

	para "Ah!"

	para "In the Wild Area,"
	line "there is a swarm"
	cont "of Eevee!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to the Wild"
	line "Area and catch an"
	cont "Eevee!"
	done

KangaskhanSwarmText:
	text "………………………"

	para "Ah!"

	para "In the Wild Area"
	line "cave, there is a"
	cont "swarm of"
	cont "Kangaskhan!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to the Wild"
	line "Area Cave and"
	cont "catch a"
	cont "Kangaskhan!"
	done

GibleSwarmText:
	text "………………………"

	para "Ah!"

	para "In the Wild Area,"
	line "there is a swarm"
	cont "of Gible!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to the Wild"
	line "Area and catch a"
	cont "Gible!"
	done

SneaselSwarmText:
	text "………………………"

	para "Ah!"

	para "In the B1F of Ice"
	line "Path, there is a"
	cont "swarm of Sneasel!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to Ice Path"
	line "and catch a"
	cont "Sneasel!"
	done

MagcargoSwarmText:
	text "………………………"

	para "Ah!"

	para "In the 2F of the"
	line "Burned Tower,"
	cont "there is a swarm"
	cont "of Magcargo!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to Burned"
	line "Tower and catch a"
	cont "Magcargo!"
	done

ScytherSwarmText:
	text "………………………"

	para "Ah!"

	para "In the National"
	line "Forest, there is"
	cont "a swarm of"
	cont "Scyther!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to National"
	line "Forest and catch a"
	cont "Scyther!"
	done

ThatsAllFolksText:
	text "Tune in tomorrow"
	line "for another swarm"
	cont "update!"
	done

OlivinePunishmentSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 4
	warp_event  3,  7, OLIVINE_CITY, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf2
	bg_event  2,  1, BGEVENT_READ, SwarmChannel

	db 2 ; object events
	object_event  1,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDaughter, -1
	object_event  5,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseSwarmGuy, -1
