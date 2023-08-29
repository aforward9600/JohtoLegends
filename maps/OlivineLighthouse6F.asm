	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE6F_BYRON
	const OLIVINELIGHTHOUSE6F_MONSTER
	const OLIVINELIGHTHOUSE6F_POKE_BALL
	const OLIVINELIGHTHOUSE6F_MIYAMOTO
	const OLIVINELIGHTHOUSE6F_RIVAL
	const OLIVINELIGHTHOUSE6F_SHERLES
	const OLIVINELIGHTHOUSE6F_MONSTER2

OlivineLighthouse6F_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetBoss ; SCENE_DEFAULT
	scene_script .Dummy0 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .WednesdayByronLighthouse

.MeetBoss:
	playmusic MUSIC_ROCKET_ENCOUNTER
	disappear OLIVINELIGHTHOUSE6F_MONSTER
	setevent EVENT_LIGHTHOUSE_MONSTER
	applymovement PLAYER, MovesUpToMiyamotoMovement
	opentext
	writetext HandItOverText
	waitbutton
	closetext
	opentext
	writetext NeverYouCriminalText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_MIYAMOTO, DOWN
	opentext
	writetext IKnewIdSeeYouText
	waitbutton
	closetext
	winlosstext Miyamoto1WinText, Miyamoto1LossText
	setlasttalked OLIVINELIGHTHOUSE6F_MIYAMOTO
	loadtrainer MYSTERIOUS, MIYAMOTO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext WeArentDoneYetText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	appear OLIVINELIGHTHOUSE6F_RIVAL
	applymovement OLIVINELIGHTHOUSE6F_RIVAL, RivalMovesUpMovement
	turnobject PLAYER, LEFT
	opentext
	writetext HuffHuffText
	waitbutton
	closetext
	turnobject PLAYER, UP
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female1
	opentext
	writetext ThisYourGFText
	waitbutton
	closetext
	opentext
	writetext SilenceText
	waitbutton
	closetext
	opentext
	writetext WhateverWereDoneText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear OLIVINELIGHTHOUSE6F_MIYAMOTO
	pause 15
	special FadeInQuickly
	setevent EVENT_BEAT_LIGHTHOUSE_MIYAMOTO
	waitsfx
	pause 15
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	opentext
	writetext DangSmokeBombsText
	waitbutton
	closetext
	pause 10
	applymovement OLIVINELIGHTHOUSE6F_MONSTER2, RosaMovesMovement
	appear OLIVINELIGHTHOUSE6F_MONSTER
	pause 10
	applymovement OLIVINELIGHTHOUSE6F_MONSTER2, RosaDisappears
	disappear OLIVINELIGHTHOUSE6F_MONSTER2
	clearevent EVENT_LIGHTHOUSE_MONSTER
	cry AMPHAROS
	pause 15
	opentext
	writetext ThisIsRosaText
	waitbutton
	closetext
	applymovement OLIVINELIGHTHOUSE6F_BYRON, ByronLeavesMovement1
	applymovement PLAYER, RivalMovesOutOfWayMovement
	turnobject PLAYER, RIGHT
	turnobject OLIVINELIGHTHOUSE6F_RIVAL, RIGHT
	applymovement OLIVINELIGHTHOUSE6F_BYRON, ByronLeavesMovement1
	turnobject OLIVINELIGHTHOUSE6F_BYRON, LEFT
	opentext
	writetext HeresSurfText
	buttonsound
	giveitem LAPRAS_CALLA
	writetext ReceivedLaprasCallText
	waitsfx
	specialsound
	waitbutton
	itemnotify
	setevent EVENT_GOT_LAPRAS_CALLA
	disappear OLIVINELIGHTHOUSE6F_MONSTER2
	writetext ThatsSurfText
	waitbutton
	closetext
	applymovement OLIVINELIGHTHOUSE6F_BYRON, RosaMovesMovement
	disappear OLIVINELIGHTHOUSE6F_BYRON
	playsound SFX_EXIT_BUILDING
	setevent EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	special FadeOutMusic
	pause 30
	opentext
	writetext SilenceText
	waitbutton
	closetext
	playmusic MUSIC_UNWAVERING_HEART
	turnobject OLIVINELIGHTHOUSE6F_RIVAL, DOWN
	turnobject PLAYER, UP
	sjump .Backstory

.Female1:
	opentext
	writetext ThisYourBFText
	waitbutton
	closetext
	opentext
	writetext SilenceText
	waitbutton
	closetext
	opentext
	writetext WhateverWereDoneText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear OLIVINELIGHTHOUSE6F_MIYAMOTO
	pause 15
	special FadeInQuickly
	setevent EVENT_BEAT_LIGHTHOUSE_MIYAMOTO
	waitsfx
	playmapmusic
	opentext
	writetext DangSmokeBombsText
	waitbutton
	closetext
	pause 10
	applymovement OLIVINELIGHTHOUSE6F_MONSTER2, RosaMovesMovement
	appear OLIVINELIGHTHOUSE6F_MONSTER
	pause 10
	applymovement OLIVINELIGHTHOUSE6F_MONSTER2, RosaDisappears
	disappear OLIVINELIGHTHOUSE6F_MONSTER2
	clearevent EVENT_LIGHTHOUSE_MONSTER
	cry AMPHAROS
	pause 15
	opentext
	writetext ThisIsRosaText
	waitbutton
	closetext
	applymovement OLIVINELIGHTHOUSE6F_BYRON, ByronLeavesMovement1
	applymovement PLAYER, RivalMovesOutOfWayMovement
	turnobject PLAYER, RIGHT
	turnobject OLIVINELIGHTHOUSE6F_RIVAL, RIGHT
	applymovement OLIVINELIGHTHOUSE6F_BYRON, ByronLeavesMovement1
	turnobject OLIVINELIGHTHOUSE6F_BYRON, LEFT
	opentext
	writetext HeresSurfText
	buttonsound
	giveitem LAPRAS_CALLA
	writetext ReceivedLaprasCallText
	waitsfx
	specialsound
	waitbutton
	itemnotify
	disappear OLIVINELIGHTHOUSE6F_MONSTER2
	setevent EVENT_GOT_LAPRAS_CALLA
	writetext ThatsSurfText
	waitbutton
	closetext
	applymovement OLIVINELIGHTHOUSE6F_BYRON, RosaMovesMovement
	playsound SFX_EXIT_BUILDING
	disappear OLIVINELIGHTHOUSE6F_BYRON
	setevent EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	special FadeOutMusic
	pause 30
	opentext
	writetext SilenceText
	waitbutton
	closetext
	playmusic MUSIC_UNWAVERING_HEART
	turnobject OLIVINELIGHTHOUSE6F_RIVAL, DOWN
	turnobject PLAYER, UP
	sjump .Backstory

.Backstory:
	opentext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Dragonite
	writetext TyranitarText
	waitbutton
	closetext
	sjump .RivalLeaves
.Dragonite:
	writetext DragoniteText
	waitbutton
	closetext
	sjump .RivalLeaves

.RivalLeaves:
	applymovement OLIVINELIGHTHOUSE6F_RIVAL, RivalLeavesMovement
	playsound SFX_EXIT_BUILDING
	special FadeOutMusic
	disappear OLIVINELIGHTHOUSE6F_RIVAL
	pause 30
	special RestartMapMusic
	setevent EVENT_LIGHTHOUSE6F_RIVAL1
.SherlesAppears:
	pause 15
	playsound SFX_ENTER_DOOR
	appear OLIVINELIGHTHOUSE6F_SHERLES
	applymovement OLIVINELIGHTHOUSE6F_SHERLES, SherlesApproachesMovement
	turnobject OLIVINELIGHTHOUSE6F_SHERLES, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext YoureHereTooText
	waitbutton
	closetext
	applymovement OLIVINELIGHTHOUSE6F_SHERLES, RosaMovesMovement
	playsound SFX_EXIT_BUILDING
	disappear OLIVINELIGHTHOUSE6F_SHERLES
	setevent EVENT_LIGHTHOUSE6F_SHERLES
	clearevent EVENT_LIGHTHOUSE_SHERLES
	setevent EVENT_CIANWOOD_CITY_GYM_RIVAL1
	clearevent EVENT_LIGHTHOUSE_CIVILLIANS
	setevent EVENT_LIGHTHOUSE2F_RIVAL1
	setevent EVENT_LIGHTHOUSE_ROCKETS
	setevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_SHERLES
	setscene SCENE_FINISHED
	end

.Dummy0:
	end

.WednesdayByronLighthouse:
	checkevent EVENT_BEAT_LIGHTHOUSE_MIYAMOTO
	iftrue .WillByronAppear
	appear OLIVINELIGHTHOUSE6F_BYRON
	return

.WillByronAppear:
	checkevent EVENT_BEAT_BYRON
	iftrue .IsItWednesdayLighthouse
	disappear OLIVINELIGHTHOUSE6F_BYRON
	return

.IsItWednesdayLighthouse:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .AppearByron
	disappear OLIVINELIGHTHOUSE6F_BYRON
	return

.AppearByron:
	appear OLIVINELIGHTHOUSE6F_BYRON
	return

OlivineLighthouseAmphy:
	faceplayer
	refreshscreen
	pokepic AMPHAROS
	cry AMPHAROS
	waitbutton
	closepokepic
	opentext
	writetext AmphyPaluPaluluText
	waitbutton
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	end

OlivineLighthouse6FByron:
	faceplayer
	opentext
	writetext KeepingRosaCompanyText
	waitbutton
	closetext
	end

OlivineLighthouse6FSuperPotion:
	itemball SUPER_POTION

MovesUpToMiyamotoMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

RivalMovesUpMovement:
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step_end

RosaMovesMovement:
	step DOWN
	step DOWN
	step DOWN
	step_resume

ByronLeavesMovement1:
	step DOWN
	step DOWN
	step_end

RivalMovesOutOfWayMovement:
	step DOWN
	step LEFT
	step_end

RivalLeavesMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

SherlesApproachesMovement:
	step UP
	step UP
	step UP
	step_end

RosaDisappears:
	hide_person
	step_end

HandItOverText:
	text "Hand over the"
	line "#mon and nobody"
	cont "gets hurt."
	done

NeverYouCriminalText:
	text "Never, you"
	line "criminal!"

	para "The #mon in"
	line "this lighthouse is"
	cont "needed to guide"
	cont "ships to safety!"

	para "I would never"
	line "hand it over to"
	cont "the likes of you!"

	para "……Huh?"

	para "Hey, kid!"

	para "Get out of here!"

	para "It isn't safe!"
	done

IKnewIdSeeYouText:
	text "Hmph."

	para "I knew I'd see you"
	line "again."

	para "You remember me?"

	para "I am Miyamoto, and"
	line "I am the leader of"
	cont "this group."

	para "I had hoped we"
	line "would meet again,"
	cont "under better"
	cont "circumstances."

	para "You messed up our"
	line "plans at Bell"
	cont "Tower, and I can't"
	cont "forgive that."

	para "Prepare for your"
	line "demise."
	done

Miyamoto1WinText:
	text "You're better than"
	line "I remember."
	done

Miyamoto1LossText:
	text "A miscalcutation,"
	line "to be sure."
	done

WeArentDoneYetText:
	text "Don't think that"
	line "this changes any-"
	cont "thing."

	para "We're not done"
	line "yet, but for now,"
	cont "this mission is"
	cont "over."

	para "I've got all the"
	line "intel I need for"
	cont "now."
	done

HuffHuffText:
	text "Huff…Huff…"

	para "Sorry, <PLAYER>,"
	line "stairs aren't my"
	cont "strong-point."

	para "…Huh? Is that?…"
	done

ThisYourGFText:
	text "Who is this?"

	para "Your little"
	line "girlfriend?"
	done

ThisYourBFText:
	text "Who is this?"

	para "Your little"
	line "boyfriend?"
	done

SilenceText:
	text ".................."
	done

WhateverWereDoneText:
	text "What's the matter?"

	para "Meowth got your"
	line "tongue?"

	para "Well, whatever."
	line "I'm done here."
	cont "Later."
	done

DangSmokeBombsText:
	text "Cough! Cough!"

	para "Ugh, dang smoke"
	line "bombs!"

	para "Well, at least"
	line "they're gone!"

	para "Thanks little"
	line "hero!"

	para "Your name is?"

	para "…So, <PLAYER> is"
	line "it? Well met!"

	para "I'm Byron, the"
	line "Leader of the"
	cont "Olivine City Gym."

	para "Those fiends tried"
	line "to take the #-"
	cont "mon of the light-"
	cont "house."

	para "Come on out."
	done

ThisIsRosaText:
	text "This is Rosa the"
	line "Ampharos."

	para "She's the source"
	line "of light for ships"
	cont "to travel safely."

	para "Why they wanted"
	line "her, I can't tell."

	para "Thanks to you,"
	line "she's safe."

	para "You're quite the"
	line "trainer. I take it"
	cont "you're collecting"
	cont "Gym Badges?"

	para "Well, come on down"
	line "to the Gym when"
	cont "you want to take"
	cont "me on."

	para "I need some time"
	line "before the Gym is"
	cont "ready, so go to"
	cont "Cianwood City"
	cont "across the sea"
	cont "first."

	para "There's a Gym"
	line "there as well."

	para "Maybe by then"
	line "I'll be ready to"
	cont "battle."
	done

HeresSurfText:
	text "Oh, before I go,"
	line "here, you can both"
	cont "have one of these."
	done

ThatsSurfText:
	text "That Lapras Call"
	line "will let you call"
	cont "a Lapras so you"
	cont "can ride on it."

	para "You'll need it to"
	line "get to Cianwood"
	cont "City."

	para "See you later,"
	line "hero!"
	done

TyranitarText:
	text "Hey, <PLAYER>."

	para "I'm sorry I froze"
	line "up back there."

	para "I finally"
	line "remembered where"
	cont "I've seen her"
	cont "before. It was 8"
	cont "years ago on Route"
	cont "45."

	para "It was evening,"
	line "I saw her, trying"
	cont "to catch a"
	cont "Larvitar, when its"
	cont "mother tried to"
	cont "stop her."

	para "But when Tyranitar"
	line "attacked her…"

	para "She killed it."

	para "It happened so"
	line "fast, I couldn't"
	cont "process it."

	para "Larvitar ran away,"
	line "and she couldn't"
	cont "find it."

	para "She left, but"
	line "before she did,"
	cont "she turned and"
	cont "smiled at me."

	para "I tried my hardest"
	line "to forget that"
	cont "day, but now it's"
	cont "all come back."

	para "And the Larvitar,"
	line "what do you think"
	cont "happened to it?"

	para "It's right here,"
	line "with me."

	para "Now I just feel"
	line "guilty for not"
	cont "doing anything."

	para "I want to avenge"
	line "Larvitar's mother."

	para "I need to get"
	line "stronger."

	para "And I need your"
	line "help to do so."

	para "I'll keep going on"
	line "until I achieve"
	cont "that goal."

	para "Thanks for listen-"
	line "ing to me."
	done

DragoniteText:
	text "Hey, <PLAYER>."

	para "I'm sorry I froze"
	line "up back there."

	para "I finally"
	line "remembered where"
	cont "I've seen her"
	cont "before. It was 8"
	cont "years ago on Route"
	cont "45."

	para "It was evening,"
	line "I saw her, trying"
	cont "to catch a"
	cont "Dratini, when its"
	cont "mother tried to"
	cont "stop her."

	para "But when Dragonite"
	line "attacked her…"

	para "She killed it."

	para "It happened so"
	line "fast, I couldn't"
	cont "process it."

	para "Dratini ran away,"
	line "and she couldn't"
	cont "find it."

	para "She left, but"
	line "before she did,"
	cont "she turned and"
	cont "smiled at me."

	para "I tried my hardest"
	line "to forget that"
	cont "day, but now it's"
	cont "all come back."

	para "And the Dratini,"
	line "what do you think"
	cont "happened to it?"

	para "It's right here,"
	line "with me."

	para "Now I just feel"
	line "guilty for not"
	cont "doing anything."

	para "I want to avenge"
	line "Dratini's mother."

	para "I need to get"
	line "stronger."

	para "And I need your"
	line "help to do so."

	para "I'll keep going on"
	line "until I achieve"
	cont "that goal."

	para "Thanks for listen-"
	line "ing to me."
	done

YoureHereTooText:
	text "What?"

	para "You're here as"
	line "well?"

	para "Does trouble foll-"
	line "ow you, or do you"
	cont "follow trouble?"

	para "I'm asking you to"
	line "stay out of police"
	cont "business, please."

	para "You could get"
	line "hurt."

	para "I'll be invest-"
	line "igating on the"
	cont "first floor."
	done

AmphyPaluPaluluText:
	text "Rosa: Palu!"
	line "Palulu!"
	done

ReceivedLaprasCallText:
	text "<PLAYER> received"
	line "Lapras CallA."
	done

KeepingRosaCompanyText:
	text "How've you been,"
	line "hero?"

	para "I like to be here"
	line "to keep Rosa"
	cont "company sometimes."

	para "It can be lonely"
	line "up here, after"
	cont "all!"
	done

OlivineLighthouse6F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8,  1, LIGHTHOUSE_ELEVATOR, 1
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_5F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  8, SPRITE_BYRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse6FByron, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	object_event  8,  9, SPRITE_AMPHAROS_P, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseAmphy, EVENT_LIGHTHOUSE_MONSTER
	object_event  3,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse6FSuperPotion, EVENT_OLIVINE_LIGHTHOUSE_6F_SUPER_POTION
	object_event  9, 10, SPRITE_MIYAMOTO, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_LIGHTHOUSE_MIYAMOTO
	object_event  9, 15, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LIGHTHOUSE6F_RIVAL1
	object_event  9, 15, SPRITE_SHERLES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LIGHTHOUSE6F_SHERLES
	object_event  8,  6, SPRITE_AMPHAROS_P, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseAmphy, EVENT_LIGHTHOUSE_MONSTER2
