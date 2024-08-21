	object_const_def ; object_event constants
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BUENA
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonGymErikaScript:
	showemote EMOTE_SLEEP, CELADONGYM_ERIKA, 30
	pause 10
	showemote EMOTE_SLEEP, CELADONGYM_ERIKA, 30
	pause 10
	showemote EMOTE_SLEEP, CELADONGYM_ERIKA, 30
	pause 10
	showemote EMOTE_SHOCK, CELADONGYM_ERIKA, 15
	pause 10
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .ErikaRematch
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, ErikaLastMonText
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	opentext
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue .GotGigaDrain
	writetext ErikaExplainTMText
	buttonsound
	checkitem TM_ENERGY_BALL
	iftrue .AlreadyGotEnergyBall
	verbosegiveitem TM_ENERGY_BALL
	iffalse .GotGigaDrain
	setevent EVENT_GOT_TM19_GIGA_DRAIN
	setevent EVENT_DECO_LOTAD_DOLL
.GotGigaDrain:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

.AlreadyGotEnergyBall:
	writetext AlreadyGotEnergyBallText
	waitbutton
	closetext
	setevent EVENT_GOT_TM19_GIGA_DRAIN
	setevent EVENT_DECO_LOTAD_DOLL
	opentext
	sjump .GotGigaDrain

.ErikaRematch:
	checkflag ENGINE_BETH
	iftrue .ErikaPost
	writetext ErikaRematchText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, ErikaLastMonText
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	opentext
	writetext ErikaRematchDefeatText
	waitbutton
	closetext
	setflag ENGINE_BETH
	end

.ErikaPost:
	writetext ErikaPostText
	waitbutton
	closetext
	end

ErikaLastMonText:
	text "Erika: My last"
	line "#mon?"

	para "I hardly noticed…"
	done

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd gymstatue2

ErikaBeforeBattleText:
	text "Erika: Oh…"
	line "My apologies…"

	para "I really dozed off"
	line "there for a while…"

	para "My name is Erika."

	para "I'm the greenhouse"
	line "owner here…"

	para "Is there something"
	line "you needed from"
	cont "me?"

	para "…You're looking"
	line "for a Gym Leader?"

	para "I'm afraid we don't"
	line "have one anymore…"

	para "We're not sure"
	line "where they went…"

	para "…You want to fight"
	line "the Feds?"

	para "It's a nice goal…"

	para "…If you need a"
	line "replacement, then"
	cont "perhaps I could be"
	cont "of assistence?"

	para "…I'm not that bad"
	line "of a trainer, if I"
	cont "do say so…"

	para "How about it?"
	done

ErikaBeatenText:
	text "Erika: Wait…"

	para "You're the #mon"
	line "League Champion?"

	para "That explains your"
	line "strength…"
	done

PlayerReceivedRainbowBadgeText:
	text "Erika received"
	line "RainbowBadge."
	done

ErikaExplainTMText:
	text "Erika: This Badge"
	line "is so pretty…"

	para "I'll be tending to"
	line "the gardens here"
	cont "until it's time."

	para "Oh, you should"
	line "probably take this"
	cont "TM I had lying"
	cont "around."

	para "It's Energy Ball."

	para "It can lower the"
	line "opponent's Sp.Def…"
	done

ErikaAfterBattleText:
	text "Erika: Mm…"

	para "Flowers need water"
	line "everyday to grow"
	cont "strong…"

	para "Just like #mon"
	line "need love…"
	done

LassMichelleSeenText:
	text "Don't just barge in"
	line "here!"

	para "We don't know if"
	line "you're a Fed or"
	cont "not!"
	done

LassMichelleBeatenText:
	text "Help!"
	done

LassMichelleAfterBattleText:
	text "I guess you're not"
	line "one of those Feds."

	para "You're too clean!"
	done

PicnickerTanyaSeenText:
	text "Those Feds are"
	line "such idiots!"

	para "They took over a"
	line "whole city, but a"
	cont "little tree stops"
	cont "them from getting"
	cont "in here!"
	done

PicnickerTanyaBeatenText:
	text "You're no idiot!"
	done

PicnickerTanyaAfterBattleText:
	text "That tree outside"
	line "blocks the path to"
	cont "our greenhouse."

	para "They still haven't"
	line "gotten past it!"
	done

BeautyJuliaSeenText:
	text "Do you have any"
	line "business with the"
	cont "lady of the"
	cont "greenhouse?"
	done

BeautyJuliaBeatenText:
	text "I guess you do!"
	done

BeautyJuliaAfterBattleText:
	text "Lady Erika doesn't"
	line "waking from a nap"
	cont "unless it's really"
	cont "important."
	done

TwinsJoAndZoe1SeenText:
	text "Lady Erika is so"
	line "kind!"

	para "She teaches us how"
	line "to battle when she"
	cont "isn't napping!"
	done

TwinsJoAndZoe1BeatenText:
	text "Wah!"
	done

TwinsJoAndZoe1AfterBattleText:
	text "Can you teach us"
	line "too?"
	done

TwinsJoAndZoe2SeenText:
	text "Back off!"

	para "This is our"
	line "greenhouse!"
	done

TwinsJoAndZoe2BeatenText:
	text "No! Go away!"
	done

TwinsJoAndZoe2AfterBattleText:
	text "I guess you're not"
	line "so bad…"

	para "Hurt the flowers,"
	line "and Lady Erika"
	cont "will beat you!"
	done

AlreadyGotEnergyBallText:
	text "Erika: …Oh?"

	para "You already have"
	line "that TM?"

	para "Very well…"

	para "I'll be here when"
	line "you need me…"
	done

ErikaRematchText:
	text "Erika:…Oh, hello"
	line "again, <PLAYER>…"

	para "I must have dozed"
	line "off again…"

	para "Some plants will"
	line "do that to you…"

	para "…Would you like to"
	line "battle again?"

	para "I could use the"
	line "practice…"
	done

ErikaRematchDefeatText:
	text "Erika: …Oh, did I"
	line "lose again?"

	para "…Oh well…"

	para "…It was still a"
	line "good time…"

	para "…As far as I can"
	line "tell…"
	done

ErikaPostText:
	text "Erika: …Looks like"
	line "we'll have a lot"
	cont "of cleaning up to"
	cont "do in the city…"

	para "Maybe after a nap…"
	done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, CELADON_CITY, 7
	warp_event  5, 17, CELADON_CITY, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	db 6 ; object events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  2,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
