	object_const_def ; object_event constants
	const CELADONCAFE_SUPER_NERD
	const CELADONCAFE_ROUGHNECK1
	const CELADONCAFE_DAISY1
	const CELADONCAFE_ROUGHNECK2
	const CELADONCAFE_DAISY2
	const CELADONCAFE_FISHER
	const CELADONCAFE_TEACHER
	const CELADONCAFE_BUG_CATCHER
	const CELADONCAFE_POKEFANF

CeladonCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonCafeChef:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CeladonCafeChef2
	writetext ChefText_Eatathon
	waitbutton
	closetext
	end

.CeladonCafeChef2:
	writetext SuperNerdText_FedsGone
	waitbutton
	closetext
	end

CeladonCafeFisher1:
	opentext
	writetext Fisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CeladonCafeFisher
	writetext Fisher1Text_Concentration
	waitbutton
	closetext
	turnobject CELADONCAFE_ROUGHNECK1, LEFT
	end

.CeladonCafeFisher:
	writetext FisherText_Text1
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER, RIGHT
	end

CeladonCafeFisher2:
	opentext
	writetext Fisher2Text_GulpChew
	waitbutton
	closetext
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CeladonCafeTeacher1
	writetext Fisher2Text_Quantity
	waitbutton
	closetext
	turnobject CELADONCAFE_DAISY1, RIGHT
	end

.CeladonCafeTeacher1:
	writetext TeacherText_Finally
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

CeladonCafeFisher3:
	opentext
	writetext Fisher3Text_MunchMunch
	waitbutton
	closetext
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CeladonCafeBugCatcher
	writetext Fisher3Text_GoldenrodIsBest
	waitbutton
	closetext
	turnobject CELADONCAFE_ROUGHNECK2, RIGHT
	end

.CeladonCafeBugCatcher:
	writetext BugCatcherText_Restaurant
	waitbutton
	closetext
	turnobject CELADONCAFE_BUG_CATCHER, RIGHT
	end

CeladonCafeTeacher:
	opentext
	writetext TeacherText_CrunchCrunch
	waitbutton
	closetext
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CeladonCafePokefanF
	writetext TeacherText_KeepEating
	waitbutton
	closetext
	turnobject CELADONCAFE_DAISY2, LEFT
	end

.CeladonCafePokefanF:
	writetext PokefanFText_MyBoy
	waitbutton
	closetext
	turnobject CELADONCAFE_POKEFANF, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

CeladonCafeTrashcan:
	checkevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	iftrue .TrashEmpty
	giveitem LEFTOVERS
	iffalse .PackFull
	opentext
	getitemname STRING_BUFFER_3, LEFTOVERS
	writetext FoundLeftoversText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	end

.PackFull:
	opentext
	getitemname STRING_BUFFER_3, LEFTOVERS
	writetext FoundLeftoversText
	buttonsound
	writetext NoRoomForLeftoversText
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd trashcan

ChefText_Eatathon:
	text "Ugh…"

	para "I hate these guys"
	line "so much!"

	para "They eat all my"
	line "food, scare away"
	cont "other customers,"
	cont "and they don't tip!"

	para "What jerks!"
	done

Fisher1Text_Snarfle:
	text "…Snarfle, chew…"
	done

Fisher1Text_Concentration:
	text "You can't have my"
	line "food! Go away!"
	done

Fisher2Text_GulpChew:
	text "…Gulp… Chew…"
	done

Fisher2Text_Quantity:
	text "This place is a"
	line "dump, but it's the"
	cont "best food in town."

	para "Take what you get,"
	line "I guess."
	done

Fisher3Text_MunchMunch:
	text "Munch, munch…"
	done

Fisher3Text_GoldenrodIsBest:
	text "I'm gonna sic my"
	line "#mon on you if"
	cont "you don't get"
	cont "outta here!"
	done

TeacherText_CrunchCrunch:
	text "Crunch… Crunch…"
	done

TeacherText_KeepEating:
	text "This stuff is too"
	line "greasy!"

	para "I'm watching my"
	line "figure after all!"
	done

EatathonContestPosterText:
	text "Eatathon Contest!"
	line "No time limit!"

	para "A battle without"
	line "end! The biggest"

	para "muncher gets it"
	line "all for free!"

	para "There's a notice at"
	line "the bottom."

	para "Contest on hold"
	line "due to unfortunate"
	cont "circumstances."

	para "Aw man!"
	done

FoundLeftoversText:
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

NoRoomForLeftoversText:
	text "But <PLAYER> can't"
	line "hold another item…"
	done

FisherText_Text1:
	text "This food is the"
	line "best in Kanto!"

	para "It's been so long"
	line "since I've had a"
	cont "bite!"
	done

TeacherText_Finally:
	text "Finally, good food"
	line "again!"

	para "The Feds won't"
	line "bother us again!"
	done

BugCatcherText_Restaurant:
	text "Where's my toy?"
	done

PokefanFText_MyBoy:
	text "I don't have the"
	line "heart to tell my"
	cont "son that there are"
	cont "no toys here."
	done

SuperNerdText_FedsGone:
	text "Those awful Feds"
	line "are gone, and now"
	cont "my regulars are"
	cont "back!"

	para "Things are looking"
	line "up for me!"
	done

CeladonCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  7, CELADON_CITY, 8
	warp_event  7,  7, CELADON_CITY, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, EatathonContestPoster
	bg_event  7,  1, BGEVENT_READ, CeladonCafeTrashcan

	db 9 ; object events
	object_event  9,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCafeChef, -1
	object_event  4,  6, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, EVENT_SAFFRON_CITY_FEDS
	object_event  1,  7, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, EVENT_SAFFRON_CITY_FEDS
	object_event  1,  2, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, EVENT_SAFFRON_CITY_FEDS
	object_event  4,  3, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, EVENT_SAFFRON_CITY_FEDS
	object_event  1,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  4,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  4,  7, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, EVENT_SAFFRON_CITY_CIVILLIANS
