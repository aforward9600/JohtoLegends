	object_const_def ; object_event constants
	const FUCHSIACITY_ROUGHNECK
	const FUCHSIACITY_LASS
	const FUCHSIACITY_GRAMPS
	const FUCHSIACITY_FRUIT_TREE
	const FUCHSIACITY_SNORLAX
	const FUCHSIACITY_POKEFAN_M_2
	const FUCHSIACITY_FISHING_GURU
	const FUCHSIACITY_BIKER
	const FUCHSIACITY_LAPRAS
	const FUCHSIACITY_DELINQUENT
	const FUCHSIACITY_LASS2
	const FUCHSIACITY_YOUNGSTER
	const FUCHSIACITY_TEACHER

FuchsiaCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	return

FuchsiaCityRoughneck:
	checkevent EVENT_BEAT_KOGA
	iftrue .FuchsiaCityRoughneck2
	jumptextfaceplayer FuchsiaCityRoughneckText

.FuchsiaCityRoughneck2:
	jumptextfaceplayer FuchsiaCityRoughneckText2

FuchsiaCityLass:
	checkevent EVENT_FUCHSIA_CITY_LAPRAS
	iffalse .FuchsiaCityLass2Script
	jumptextfaceplayer FuchsiaCityLassText

.FuchsiaCityLass2Script:
	jumptextfaceplayer FuchsiaCityLassText2

FuchsiaCityLass2:
	jumptextfaceplayer FuchsiaCityLass2Text

FuchsiaCityGramps:
	checkevent EVENT_BEAT_KOGA
	iftrue .FuchsiaCityGramps2
	jumptextfaceplayer FuchsiaCityGrampsText

.FuchsiaCityGramps2:
	jumptextfaceplayer FuchsiaCityGrampsText2

FuchsiaCityTeacher:
	jumptextfaceplayer FuchsiaCityTeacherText

FuchsiaCitySnorlax:
	opentext
	writetext SnorlaxIsSleepingText
	waitbutton
	checkevent EVENT_TALKED_WITH_MR_FUJI
	iftrue .WakeUpSnorlax
	closetext
	end

.WakeUpSnorlax:
	writetext WakeUpSnorlaxText
	yesorno
	iffalse .DontWakeUpSnorlax
	closetext
	special FadeOutMusic
	pause 15
	playsound SFX_POKEFLUTE
	waitsfx
	pause 5
	special RestartMapMusic
	pause 5
	opentext
	writetext SnorlaxWokeUpText
	waitbutton
	closetext
	pause 5
	cry SNORLAX
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 70
	startbattle
	ifequal LOSE, .NotBeaten
	disappear FUCHSIACITY_SNORLAX
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtSnorlax
	setevent EVENT_BEAT_SNORLAX
	end

.DontWakeUpSnorlax:
	closetext
	end

.NotBeaten:
	reloadmapafterbattle
	end

.CaughtSnorlax:
	setevent EVENT_CAUGHT_SNORLAX
	end

FuchsiaCityPokefanM2:
	faceplayer
	opentext
	checkevent EVENT_DECO_BIG_SNORLAX_DOLL
	iftrue .GotSnorlaxDoll
	checkevent EVENT_VERMILION_CITY_SNORLAX
	iftrue .GetSnorlaxDoll
	writetext ThatSnorlaxIsThereText
	waitbutton
	closetext
	end

.GetSnorlaxDoll:
	writetext GiveSnorlaxDollText
	buttonsound
	waitsfx
	setevent EVENT_DECO_BIG_SNORLAX_DOLL
	writetext PlayerGotSnorlaxDollText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	pause 15
.GotSnorlaxDoll:
	checkevent EVENT_VERMILION_CITY_SNORLAX
	iffalse .SnorlaxIsBack
	writetext HowsThatSnorlaxDollText
	waitbutton
	closetext
	end

.SnorlaxIsBack:
	writetext SnorlaxIsBackText
	waitbutton
	closetext
	end

FuchsiaCityFishingGuru:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .FuchsiaCityFishingGuru2
	jumptextfaceplayer FuchsiaCityFishingGuruText

.FuchsiaCityFishingGuru2:
	jumptextfaceplayer FuchsiaCityFishingGuruText2

FuchsiaCityBiker:
	checkevent EVENT_BEAT_KOGA
	iftrue .FuchsiaCityBiker2
	jumptextfaceplayer FuchsiaCityBikerText

.FuchsiaCityBiker2:
	jumptextfaceplayer FuchsiaCityBikerText2

FuchsiaCityDelinquentScript:
	checkevent EVENT_BEAT_KOGA
	iftrue .FuchsiaCityDelinquentScript2
	jumptextfaceplayer FuchsiaCityDelinquentText

.FuchsiaCityDelinquentScript2:
	jumptextfaceplayer FuchsiaCityDelinquentText2

FuchsiaCityYoungster:
	jumptextfaceplayer FuchsiaCityYoungsterText

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

FuchsiaGymBurnedSign:
	jumptext FuchsiaGymBurnedSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

NoLitteringSign:
	jumptext NoLitteringSignText

FuchsiaCityPokecenterSign:
	jumpstd pokecentersign

FuchsiaCityMartSign:
	jumpstd martsign

FuchsiaCityFruitTree:
	fruittree FRUITTREE_FUCHSIA_CITY

FuchsiaCityRoughneckText:
	text "Hehehe!"

	para "The Leader was"
	line "so easy to take"
	cont "out!"

	para "You'd think a"
	line "ninja would have"
	cont "put up more of a"
	cont "fight!"
	done


FuchsiaCityRoughneckText2:
	text "That new guy's"
	line "gonna be more of a"
	cont "problem then the"
	cont "old ninja…"
	done

FuchsiaCityLassText:
	text "All the #mon"
	line "were poached or"
	cont "escaped from the"
	cont "zoo when the Feds"
	cont "attacked…"

	para "I hope they're"
	line "alright…"
	done

FuchsiaCityTeacherText:
	text "Perhaps the old"
	line "Gym can be turned"
	cont "into something"
	cont "different."

	para "Like an office for"
	line "the Safari Zone."

	para "Sounds good, yes."
	done

FuchsiaCityGrampsText:
	text "Those ninjas are"
	line "no use!"

	para "We're just waitin'"
	line "around for them to"
	cont "do something about"
	cont "these ruffians,"
	cont "and nothing's been"
	cont "done yet!"

	para "Useless!"
	done

FuchsiaCityGrampsText2:
	text "Those ninjas are"
	line "so useful, don't"
	cont "you agree?"

	para "The town'll be"
	line "clear in no time"
	cont "with them around!"
	done

FuchsiaCitySignText:
	text "Fuchsia City"

	para "Behold! It's"
	line "Passion Pink!"
	done

FuchsiaGymSignText:
	text "Fuchsia City"
	line "#mon Gym"
	cont "Leader: …"

	para "The rest of the"
	line "text is illegible…"
	done

SafariZoneOfficeSignText:
	text "There's a notice"
	line "here…"

	para "The Safari Zone is"
	line "closed until"
	cont "further notice."

	para "There's also some"
	line "graffiti."

	para "Classy…"
	done

WardensHomeSignText:
	text "Safari Zone"
	line "Warden's Home"
	done

SafariZoneClosedSignText:
	text "Home of the"
	line "Fuchsia Ninja clan"

	para "Open to visitors"
	done

NoLitteringSignText:
	text "No littering."

	para "Please take your"
	line "waste with you."
	done

FuchsiaGymBurnedSignText:
	text "The Gym's been"
	line "burned down…"
	done

SnorlaxIsSleepingText:
	text "There is a sleep-"
	line "ing #mon here."
	done

WakeUpSnorlaxText:
	text "Wake it up?"
	done

SnorlaxWokeUpText:
	text "Snorlax woke up!"

	para "It attacked in a"
	line "grumpy rage!"
	done

ThatSnorlaxIsThereText:
	text "All of the #mon"
	line "in the zoo escaped"
	cont "when the Feds took"
	cont "over…"

	para "All of them except"
	line "that lazy pile of"
	cont "lard!"

	para "I wish someone"
	line "would just get it"
	cont "to leave!"
	done

GiveSnorlaxDollText:
	text "Nice going!"

	para "Snorlax is gone"
	line "now!"

	para "Take this Snorlax"
	line "Doll!"

	para "I was originally"
	line "going to use it to"
	cont "try and lure it"
	cont "out of the city,"
	cont "but now I don't"
	cont "need it!"
	done

PlayerGotSnorlaxDollText:
	text "<PLAYER> got the"
	line "Snorlax Doll!"
	done

HowsThatSnorlaxDollText:
	text "How's that Snorlax"
	line "Doll?"

	para "Taking up space in"
	line "your room?"
	done

SnorlaxIsBackText:
	text "Dang it!"

	para "That Snorlax is"
	line "back!"

	para "And I already gave"
	line "away my Snorlax"
	cont "Doll!"

	para "You mind getting"
	line "rid of it again?"
	done

FuchsiaCityFishingGuruText:
	text "The Feds broke"
	line "down my fences,"

	para "and now they keep"
	line "using my pond to"
	cont "swim in!"

	para "My pond is for"
	line "#mon, not for"
	cont "people!"
	done

FuchsiaCityFishingGuruText2:
	text "Now that those"
	line "hooligans are gone"
	cont "I can fix up my"
	cont "fences!"
	done

FuchsiaCityBikerText:
	text "I stole the Lapras"
	line "from the zoo!"

	para "You can't have it"
	line "back!"
	done

FuchsiaCityBikerText2:
	text "I should probably"
	line "put this Lapras"
	cont "back…"
	done

FuchsiaCityDelinquentText:
	text "We trashed that"
	line "fishing nerd's"
	cont "house up good!"

	para "That'll teach him"
	line "not to diss our"
	cont "style!"
	done

FuchsiaCityDelinquentText2:
	text "I'm not doin'"
	line "nothin', I swear!"
	done

FuchsiaCityLass2Text:
	text "We should probably"
	line "get to fixing"
	cont "these fences."

	para "They look pretty"
	line "pitiful."
	done

FuchsiaCityLassText2:
	text "The Lapras was"
	line "returned to the"
	cont "zoo."

	para "Hopefully the"
	line "others will be"
	cont "returned."
	done

FuchsiaCityYoungsterText:
	text "When I grow up, I"
	line "want to be a ninja"
	cont "just like Koga!"
	done

FuchsiaCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event 22, 13, SAFARI_ZONE_MAIN_OFFICE, 1
	warp_event  7, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, BILLS_BROTHERS_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE_BETA, 3 ; inaccessible
	warp_event 37, 22, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 23, ROUTE_15_FUCHSIA_GATE, 2
	warp_event  7, 35, ROUTE_19_FUCHSIA_GATE, 1
	warp_event  8, 35, ROUTE_19_FUCHSIA_GATE, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event 21, 15, BGEVENT_READ, FuchsiaCitySign
	bg_event  5, 29, BGEVENT_READ, SafariZoneClosedSign
	bg_event 25, 15, BGEVENT_READ, FuchsiaGymSign
	bg_event 27, 29, BGEVENT_READ, WardensHomeSign
	bg_event 17,  5, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 13, 15, BGEVENT_READ, NoLitteringSign
	bg_event 20, 27, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event  6, 13, BGEVENT_READ, FuchsiaCityMartSign
	bg_event 24, 13, BGEVENT_READ, FuchsiaGymBurnedSign

	db 13 ; object events
	object_event 23, 18, SPRITE_ROUGHNECK, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityRoughneck, EVENT_SAFFRON_CITY_FEDS
	object_event 11,  9, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaCityLass, -1
	object_event 16, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityGramps, -1
	object_event  2,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFruitTree, -1
	object_event 30,  4, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCitySnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 32,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM2, -1
	object_event 31, 22, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFishingGuru, -1
	object_event 11, 20, SPRITE_BIKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityBiker, EVENT_SAFFRON_CITY_FEDS
	object_event  8, 17, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FUCHSIA_CITY_LAPRAS
	object_event 31, 31, SPRITE_DAISY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityDelinquentScript, EVENT_SAFFRON_CITY_FEDS
	object_event 27, 31, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityLass2, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 15, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 22, 18, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, EVENT_SAFFRON_CITY_CIVILLIANS
