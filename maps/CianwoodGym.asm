	object_const_def ; object_event constants
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_CHIGUSA
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodGymChigusaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHIGUSA
	iftrue .FightDone
	writetext ChigusaIntroText
	waitbutton
	closetext
	winlosstext ChigusaLossText, 0
	loadtrainer CHIGUSA, CHIGUSA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHIGUSA
	opentext
	writetext BeatenChigusaText
	waitbutton
	closetext
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	readvar VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM08_BULK_UP
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	setevent EVENT_BEAT_CHUCK
	writetext ChigusaExplainBadgeText
	buttonsound
	verbosegiveitem TM_BULK_UP
	iffalse .BagFull
	setevent EVENT_GOT_TM08_BULK_UP
	writetext ChigusaExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChigusaAfterText
	waitbutton
.BagFull:
	closetext
	end

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

TrainerApprenticeChuck:
	trainer CHUCK, CHUCK1, EVENT_BEAT_CHUCK, ChuckSeenText, ChuckBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ChuckAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd strengthboulder

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, CHIGUSA, CHIGUSA1
	jumpstd gymstatue2

ChigusaIntroText:
	text "Heya trainer! I'm"
	line "Chigusa, the"
	cont "Leader of Cianwood"

	para "City! I might be"
	line "young, but I'm the"
	cont "best trainer and"

	para "fighter in here!"
	line "Powerful and"
	cont "elegant, that's"

	para "what I am! I'm"
	line "also the only"
	cont "woman Gym Leader"

	para "in the region! I"
	line "hope to inspire"
	cont "girls around Johto"

	para "to be just as"
	line "strong! Now then,"
	cont "let's do it! My"

	para "#mon will be"
	line "spinning circles"
	cont "around yours!"
	done

ChigusaLossText:
	text "Whoah! Now that's"
	line "elegant!"
	done

BeatenChigusaText:
	text "You're stronger"
	line "than you look!"
	cont "And your #mon"

	para "are more elegant"
	line "than any others"
	cont "I've seen! Here,"

	para "take this"
	line "StormBadge!"
	done

GetStormBadgeText:
	text "<PLAYER> received"
	line "StormBadge."
	done

ChigusaExplainBadgeText:
	text "#mon up to Lv"
	line "40 will obey you."
	cont "Take this TM!"
	done

ChigusaExplainTMText:
	text "It contains Bulk"
	line "Up! Your #mon"
	cont "will increase"

	para "its Attack and"
	line "Defense!"
	done

ChigusaAfterText:
	text "Someday, Chuck"
	line "will run this Gym."
	cont "What he lacks in"

	para "elegance, he makes"
	line "up for in"
	cont "strength! He'll"

	para "make a fine"
	line "Leader! I just"
	cont "hope I will have"

	para "inspired other"
	line "girls to become"
	cont "Gym Leaders by"

	para "the time I'm"
	line "done."
	done

BlackbeltYoshiSeenText:
	text "My #MON and I"
	line "are bound togeth-"
	cont "er by friendship."

	para "Our bond will"
	line "never be broken!"
	done

BlackbeltYoshiBeatenText:
	text "This isn't real!"
	done

BlackbeltYoshiAfterText:
	text "You seem to have a"
	line "strong bond with"
	cont "your #MON too!"
	done

BlackbeltLaoSeenText:
	text "We martial artists"
	line "fear nothing!"
	done

BlackbeltLaoBeatenText:
	text "That's shocking!"
	done

BlackbeltLaoAfterText:
	text "Fighting #MON"
	line "are afraid of psy-"
	cont "chics…"
	done

BlackbeltNobSeenText:
	text "Words are useless."
	line "Let your fists do"
	cont "the talking!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "I lost! "
	line "I'm speechless!"
	done

BlackbeltLungSeenText:
	text "My raging fists"
	line "will shatter your"
	cont "#MON!"
	done

BlackbeltLungBeatenText:
	text "I got shattered!"
	done

BlackbeltLungAfterText:
	text "My #MON lost…"
	line "My… my pride is"
	cont "shattered…"
	done

ChuckSeenText:
	text "So, puny"
	line "challenger! You"
	cont "arrived in front"

	para "of me, Gym Leader"
	line "in training,"
	cont "Chuck, in the"

	para "hopes of battling"
	line "our Leader? Ha!"
	cont "Don't make me"

	para "laugh! My physique"
	line "is perfect! None"
	cont "can match me!"

	para "Well, except"
	line "Chigusa of course,"
	cont "but that's besides"

	para "the point! Eh?"
	line "What does that"
	cont "have to do with"

	para "#mon? Err,"
	line "nothing, I"
	cont "suppose. Sorry. I"

	para "try to trash talk"
	line "and intimidate my"
	cont "opponents like"

	para "Chigusa said I"
	line "should, but I'm"
	cont "insecure. That's"

	para "why I trained my"
	line "body as well as my"
	cont "#mon. This is"

	para "getting awkward"
	line "now, so let's just"
	cont "get to the battle"

	para "now, OK?"
	done

ChuckBeatenText:
	text "Sensei! I have"
	line "failed!"
	done

ChuckAfterText:
	text "Maybe I should"
	line "focus less on"
	cont "training, and more"

	para "on settling down."
	line "That girl outside"
	cont "the Gym that likes"

	para "to watch me train."
	line "She is pretty"
	cont "cute. Maybe I"

	para "should go for it.."
	line "..Well, I can't"
	cont "abandon the Gym,"

	para "since I'm going to"
	line "be Leader someday,"
	cont "but slowing down"

	para "might be good for"
	line "me."
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	db 9 ; object events
	object_event  3,  4, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerApprenticeChuck, -1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	object_event  4,  1, SPRITE_CHIGUSA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, CianwoodGymChigusaScript, -1
	object_event  3,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
