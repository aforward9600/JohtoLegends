	object_const_def ; object_event constants
	const AZALEAGYM_KURT
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUY

AzaleaGym_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .KurtSaturdayGym

.KurtSaturdayGym:
	checkevent EVENT_BEAT_KURT
	iftrue .IsItSaturdayGym
	appear AZALEAGYM_KURT
	return

.IsItSaturdayGym:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .KurtDisappears
	appear AZALEAGYM_KURT
	return

.KurtDisappears:
	disappear AZALEAGYM_KURT
	return

AzaleaGymKurtScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KURT
	iftrue .FightDone
	writetext KurtText_DangSilph
	waitbutton
	closetext
	winlosstext KurtText_NoRespect, KurtText_Respect
	loadtrainer KURT, KURT1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KURT
	setevent EVENT_DECO_CYNDAQUIL_DOLL
	opentext
	writetext BeatenKurtText
	waitbutton
	closetext
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	loadmem wLevelCap, 51
	readvar VAR_BADGES
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	setflag ENGINE_BEAT_KURT
.FightDone:
	checkflag ENGINE_BEAT_KURT
	iffalse .Rematch
	checkevent EVENT_GOT_TM60_X_SCISSOR
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_GINGER_AND_SAM
	setevent EVENT_BEAT_BUG_CATCHER_MARTY
	setevent EVENT_BEAT_BUG_CATCHER_NAT
	setevent EVENT_BEAT_BUG_CATCHER_PETE
	writetext KurtText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_X_SCISSOR
	iffalse .NoRoomForXScissor
	setevent EVENT_GOT_TM60_X_SCISSOR
	writetext KurtText_XScissorSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext KurtText_Retirement
	waitbutton
.NoRoomForXScissor:
	closetext
	end

.Rematch:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .PostGameKurt
	readvar VAR_BADGES
	ifequal 6, .KurtBattle1
	ifequal 7, .KurtBattle2
	ifequal 8, .KurtBattle3
	sjump .KurtBattle3

.KurtBattle1:
	writetext KurtText_Rematch
	waitbutton
	closetext
	winlosstext KurtText_NoRespect, KurtText_Respect
	loadtrainer KURT, KURT1
	startbattle
	reloadmapafterbattle
	sjump AfterKurtRematch

.KurtBattle2:
	writetext KurtText_Rematch
	waitbutton
	closetext
	winlosstext KurtText_NoRespect, KurtText_Respect
	loadtrainer KURT, KURT2
	startbattle
	reloadmapafterbattle
	sjump AfterKurtRematch

.KurtBattle3:
	writetext KurtText_Rematch
	waitbutton
	closetext
	winlosstext KurtText_NoRespect, KurtText_Respect
	loadtrainer KURT, KURT3
	startbattle
	reloadmapafterbattle
	sjump AfterKurtRematch

.PostGameKurt:
	writetext KurtText_PostGame
	waitbutton
	closetext
	winlosstext KurtText_NoRespect, KurtText_Respect
	loadtrainer KURT, KURT4
	startbattle
	reloadmapafterbattle
	sjump AfterKurtRematch

AfterKurtRematch:
	opentext
	writetext KurtText_BeatenAgain
	waitbutton
	closetext
	setflag ENGINE_BEAT_KURT
	end

AzaleaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerTwinsGingerandsam1:
	trainer TWINS, GINGERANDSAM1, EVENT_BEAT_TWINS_GINGER_AND_SAM, TwinsGingerandsam1SeenText, TwinsGingerandsam1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsGingerandsam1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsGingerandsam2:
	trainer TWINS, GINGERANDSAM2, EVENT_BEAT_TWINS_GINGER_AND_SAM, TwinsGingerandsam2SeenText, TwinsGingerandsam2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsGingerandsam2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherNat:
	trainer BUG_CATCHER, NAT, EVENT_BEAT_BUG_CATCHER_NAT, BugCatcherNatSeenText, BugCatcherNatBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherNatAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherPete:
	trainer BUG_CATCHER, PETE, EVENT_BEAT_BUG_CATCHER_PETE, BugCatcherPeteSeenText, BugCatcherPeteBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherPeteAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherMarty:
	trainer BUG_CATCHER, MARTY, EVENT_BEAT_BUG_CATCHER_MARTY, BugCatcherMartySeenText, BugCatcherMartyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherMartyAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_KURT
	iftrue .AzaleaGymGuyWinScript
	opentext
	writetext AzaleaGymGuyText
	waitbutton
	closetext
	end

.AzaleaGymGuyWinScript:
	opentext
	writetext AzaleaGymGuyWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkevent EVENT_CLEARED_TIN_TOWER
	iftrue .RivalBeatGym
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue4
.Beaten:
	gettrainername STRING_BUFFER_4, KURT, KURT1
	jumpstd gymstatue3
.RivalBeatGym:
	gettrainername STRING_BUFFER_4, KURT, KURT1
	jumpstd gymstatue5

KurtText_DangSilph:
	text "Humph. I'm Kurt,"
	line "Gym Leader of"
	cont "Azalea Town. I"

	para "didn't want to be,"
	line "but that dang"
	cont "Silph Co. put me"

	para "outta business! I"
	line "made the best"
	cont "Balls around, but"

	para "Silph came in with"
	line "their cheap"
	cont "quality ones they"

	para "mass produced! My"
	line "son in Ecruteak"
	cont "City continues my"
	
	para "work as a hobby,"
	line "but I still need"
	cont "to work. That's"
	
	para "why I'm here!"
	line "Alright, enough"
	cont "talk, whipper-"
	
	para "snapper!"
	done

KurtText_NoRespect:
	text "Tch! Kids these"
	line "days! No respect"
	cont "at all!"
	done

BeatenKurtText:
	text "Alright, alright!"
	line "You won, so here!"
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> received"
	line "HiveBadge."
	done

KurtText_HiveBadgeSpeech:
	text "The HiveBadge"
	line "makes all #mon"
	cont "up to Lv 70 obey"

	para "you. Here, take"
	line "this too."
	done

KurtText_XScissorSpeech:
	text "TM60 contains"
	line "X-Scissor."

	para "It's a great move"
	line "for Bug Types!"
	cont "No special effects"

	para "though, so it may"
	line "be boring for a"
	cont "youngster like"

	para "you!"
	done

KurtText_Retirement:
	text "Maybe I can retire"
	line "and rely on my son"

	para "for support. Then"
	line "I can make Balls"

	para "as a hobby. Yeah,"
	line "that sounds nice."
	done

BugCatcherPeteSeenText:
	text "Some people find"
	line "bugs gross,"

	para "but I love 'em!"
	done

BugCatcherPeteBeatenText:
	text "My bugs!"
	done

BugCatcherPeteAfterBattleText:
	text "Don't ask me why."

	para "I just love 'em"
	done

BugCatcherNatSeenText:
	text "You ever seen a"
	line "purple Spinarak?"

	para "I've never seen"
	line "one in real life,"

	para "but I know someone"
	line "who has!"
	done

BugCatcherNatBeatenText:
	text "Wish I had a"
	line "purple Spinarak…"
	done

BugCatcherNatAfterBattleText:
	text "Maybe a purple one"
	line "would evolve into"

	para "a green Ariados…"

	para "Eh, probably not."
	done

BugCatcherMartySeenText:
	text "Weird how we have"
	line "a Bug-type Gym,"

	para "but Slowpoke is"
	line "the town's mascot,"
	cont "huh?"
	done

BugCatcherMartyBeatenText:
	text "How slow can you"
	line "go?"
	done

BugCatcherMartyAfterBattleText:
	text "Guess I shouldn't"
	line "complain about it."

	para "Bug-types are just"
	line "cooler than those"
	cont "dopey Slowpoke!"
	done

TwinsGingerandsam1SeenText:
	text "Sami: Hi! Do you"
	line "like Bug-types?"

	para "I think they're"
	line "adorable!"
	done

TwinsGingerandsam1BeatenText:
	text "Sami & Sam:"
	line "Double dang!"
	done

TwinsGingerandsam1AfterBattleText:
	text "Sami: You must"
	line "think so too!"
	done

TwinsGingerandsam2SeenText:
	text "Sam: Hi! Do you"
	line "like Bug-types?"

	para "I think they're"
	line "strong!"
	done

TwinsGingerandsam2BeatenText:
	text "Sami & Sam:"
	line "Double dang!"
	done

TwinsGingerandsam2AfterBattleText:
	text "Sam: You're strong"
	line "too!"
	done

AzaleaGymGuyText:
	text "How's it going,"
	line "champ in the"
	cont "making? Kurt's a"

	para "Bug Type user!"
	line "Fire, Flying and"
	cont "Rock Types make"

	para "quick work of"
	line "them! He used to"
	cont "make unique #"

	para "Balls out of"
	line "Apricorns, but"
	cont "Silph took most"

	para "of his business,"
	line "so he's a little"
	cont "grouchy!"
	done

AzaleaGymGuyWinText:
	text "You really"
	line "squashed those"

	para "Bugs!....."
	line "Sorry, was that"

	para "too brutal?"
	done

KurtText_Rematch:
	text "You here for a"
	line "rematch?"

	para "Don't hold back!"
	done

KurtText_Respect:
	text "Huh?"

	para "Only 1 left?"

	para "What nonsense is"
	line "this?"
	done

KurtText_BeatenAgain:
	text "Yep, you're just"
	line "as strong as"
	cont "before."

	para "You might be"
	line "stronger than"
	cont "before."
	done

KurtText_PostGame:
	text "Champion, huh?"

	para "That doesn't mean"
	line "much to me!"

	para "I'm still your"
	line "elder, so I'd hope"
	cont "you'd still have"
	cont "respect!"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue

	db 7 ; object events
	object_event  5,  1, SPRITE_KURT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaGymKurtScript, EVENT_AZALEA_GYM_KURT
	object_event  5,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherMarty, -1
	object_event  8,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherNat, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherPete, -1
	object_event  1, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsGingerandsam1, -1
	object_event  2, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsGingerandsam2, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
