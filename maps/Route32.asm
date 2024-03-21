	object_const_def ; object_event constants
	const ROUTE32_FISHER1
	const ROUTE32_FISHER2
	const ROUTE32_FISHER3
	const ROUTE32_YOUNGSTER1
	const ROUTE32_COOLTRAINER1
	const ROUTE32_LASS1
	const ROUTE32_YOUNGSTER2
	const ROUTE32_GRAMPS
	const ROUTE32_YOUNGSTER4
	const ROUTE32_FISHER4
	const ROUTE32_POKE_BALL1
	const ROUTE32_FISHER5
	const ROUTE32_FRIEDA
	const ROUTE32_POKE_BALL2

Route32_MapScripts:
	db 0 ; scene scripts
;	scene_script .DummyScene0 ; SCENE_DEFAULT
;	scene_script .DummyScene1 ; SCENE_ROUTE32_OFFER_SLOWPOKETAIL
;	scene_script .DummyScene2 ; SCENE_ROUTE32_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Frieda

.Frieda:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	return

.FriedaAppears:
	appear ROUTE32_FRIEDA
	return

Route32GrampsScript:
	jumptextfaceplayer Route32GrampsText

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	buttonsound
	verbosegiveitem TM_IRON_TAIL
	iffalse .Finish
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	writetext Text_RoarOutro
	waitbutton
.Finish:
	closetext
	end

SlowpokeTailSalesmanScript:
	jumptextfaceplayer SlowPokeTailSalesmanText

TrainerPicnickerLacy:
	trainer PICNICKER, LACY, EVENT_BEAT_PICNICKER_LACY, PicnickerLacySeenText, PicnickerLacyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerLacyAfterText
	waitbutton
	closetext
	end

TrainerFisherJonah:
	trainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJonahAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRalphAfterText
	waitbutton
	closetext
	end

TrainerFisherMarlin:
	trainer FISHER, MARLIN, EVENT_BEAT_FISHER_MARLIN, FisherMarlinSeenText, FisherMarlinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarlinAfterText
	waitbutton
	closetext
	end

TrainerCamperWilliam:
	trainer CAMPER, TODD1, EVENT_BEAT_CAMPER_WILLIAM, CamperWilliamSeenText, CamperWilliamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperWilliamAfterText
	waitbutton
	closetext
	end

TrainerSuperNerdJason:
	trainer SUPER_NERD, SUPER_NERD_JASON, EVENT_BEAT_SUPER_NERD_JASON, SuperNerdJasonSeenText, SuperNerdJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdJasonAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerMRobert:
	trainer COOLTRAINERM, ROBERT1, EVENT_BEAT_COOLTRAINERM_ROBERT, CooltrainerMRobertSeenText, CooltrainerMRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerMRobertAfterText
	waitbutton
	closetext
	end

TrainerBirdKeeperPedro:
	trainer BIRD_KEEPER, PEDRO, EVENT_BEAT_BIRD_KEEPER_PEDRO, BirdKeeperPedroSeenText, BirdKeeperPedroBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .PedroAfterGym
	writetext BirdKeeperPedroAfterText
	waitbutton
	closetext
	end

.PedroAfterGym:
	writetext BirdKeeperPedroAfterGymText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	buttonsound
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	buttonsound
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32GreatBall:
	itemball ESCAPE_ROPE

Route32Repel:
	itemball MAX_REPEL

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokecenterSign:
	jumpstd pokecentersign

Route32HiddenGreatBall:
	hiddenitem DUSK_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem MAX_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION

Route32GrampsText:
	text "Have you come to"
	line "check out the"
	cont "Ruins of Alph?"

	para "Or are you here to"
	line "challenge the Gym"
	cont "Leader?"

	para "Either way, there"
	line "is plenty to do."
	done

SlowPokeTailSalesmanText:
	text "Have you ever"
	line "heard of"
	cont "SlowpokeTail?"

	para "I've heard it's"
	line "tasty, but the"
	cont "idea of cutting"
	cont "off the tail of"

	para "a #mon just"
	line "makes my stomach"
	cont "squirm."
	done

FisherJonahSeenText:
	text "I want to fish"
	line "somewhere else"
	cont "someday."
	done

FisherJonahBeatenText:
	text "I got hooked!"
	done

FisherJonahAfterBattleText:
	text "Yeah, maybe I"
	line "could fish on a"
	cont "boat."

	para "That'd be nice."
	done

FisherRalph1SeenText:
	text "I'm really good at"
	line "both fishing and"
	cont "#mon."

	para "I'm not about to"
	line "lose to any kid!"
	done

FisherRalph1BeatenText:
	text "Tch! I tried to"
	line "rush things…"
	done

FisherRalphAfterText:
	text "Fishing is a life-"
	line "long passion."

	para "#mon are life-"
	line "long friends!"
	done

FisherRalphSwarmText:
	text "One, two, three…"
	line "Muahahaha, what a"

	para "great haul!"
	line "I'm done! Go ahead"

	para "and catch as many"
	line "as you can, kid!"
	done

; --- start a segment of unused text

Route32UnusedFisher1SeenText:
	text "I keep catching"
	line "the same #MON…"

	para "Maybe a battle"
	line "will turn things"
	cont "around for me."
	done

Route32UnusedFisher1BeatenText:
	text "Nothing ever goes"
	line "right for me now…"
	done

Route32UnusedFisher1AfterText:
	text "How come the guy"
	line "next to me catches"
	cont "good #MON?"
	done

Route32UnusedFisher2SeenText:
	text "Heh, I'm on a roll"
	line "today. How about a"
	cont "battle, kid?"
	done

Route32UnusedFisher2BeatenText:
	text "Oof. I wasn't"
	line "lucky that time."
	done

Route32UnusedFisher2AfterText:
	text "You have to have a"
	line "good ROD if you"

	para "want to catch good"
	line "#MON."
	done

; --- end a segment of unused texts

FisherMarlinSeenText:
	text "Heh, I'm on a roll"
	line "today. How about a"
	cont "battle, kid?"
	done

FisherMarlinBeatenText:
	text "Oof. I wasn't"
	line "lucky that time."
	done

FisherMarlinAfterText:
	text "You have to have a"
	line "good Rod if you"

	para "want to catch good"
	line "#mon."
	done

SuperNerdJasonSeenText:
	text "I'm too afraid to"
	line "explore the Ruins"
	cont "of Alph."

	para "Something about"
	line "that place is"
	cont "creepy."
	done

SuperNerdJasonBeatenText:
	text "Looks like I'm not"
	line "safe here either!"
	done

SuperNerdJasonAfterText:
	text "Losing a #mon"
	line "battle is prefer-"
	cont "able to what could"

	para "happen to me at"
	line "the Ruins."
	done

CooltrainerMRobertSeenText:
	text "You up for a"
	line "battle?"
	done

CooltrainerMRobertBeatenText:
	text "I guess so!"
	done

CooltrainerMRobertAfterText:
	text "Looks like I need"
	line "to improve."
	done

PicnickerLacySeenText:
	text "Picnicking in the"
	line "grass…"

	para "It's so wonderful!"
	done

PicnickerLacyBeatenText:
	text "At least I still"
	line "have my picnic…"
	done

PicnickerLacyAfterText:
	text "Just have to make"
	line "sure no #mon"
	cont "get my food!"
	done

CamperWilliamSeenText:
	text "Let's sit around"
	line "the campfire, and"

	para "sing our campfire"
	line "song!"
	done

CamperWilliamBeatenText:
	text "Our C-A-M-P-F-I-R"
	line "E-S-O-N-G Song!"
	done

CamperWilliamAfterText:
	text "And if you think"
	line "that we can't sing"
	cont "it faster, then"

	para "you're wrong, but"
	line "it would help if"
	cont "you'd just sing"
	cont "along!"
	done

BirdKeeperPedroSeenText:
	text "Have you been to"
	line "the Violet Gym?"

	para "Walker is the best"
	line "Flying trainer in"
	cont "Johto!"
	done

BirdKeeperPedroBeatenText:
	text "I can't compare to"
	line "him or you."
	done

BirdKeeperPedroAfterText:
	text "Go and battle him,"
	line "and you'll be in"
	cont "for a challenge!"
	done

BirdKeeperPedroAfterGymText:
	text "That badge!"

	para "So you beat Walker"
	line "did you?"

	para "You're something"
	line "else!"
	done

Route32UnusedText:
; unused
	text "The fishermen"
	line "yelled at me for"
	cont "bugging them…"
	done

Text_RoarIntro:
	text "You ever want to"
	line "hit something as"
	cont "hard as you can?"

	para "Now your #mon"
	line "can do it!"
	done

Text_RoarOutro:
	text "It's Iron Tail!"
	line "Your #mon goes"
	cont "at the opponent"
	cont "with a hard tail"
	cont "and can drop"
	cont "defense!"

	para "Be careful though."
	line "The accuracy isn't"
	cont "too great."
	done

MeetFriedaText:
	text "Hello, I'm the"
	line "Week Lady!"

	para "Since it's Friday,"
	line "I want you to have"
	cont "this."
	done

FriedaGivesGiftText:
	text "It's a Poison"
	line "Barb!"
	done

FriedaGaveGiftText:
	text "Give it to a"
	line "#mon that has"
	cont "poison-type moves."

	para "Oh!"

	para "It's wicked!"

	para "You'll be shocked"
	line "how good it makes"
	cont "poison moves!"
	done

FriedaFridayText:
	text "Ah, Friday."

	para "What a lovely day,"
	line "don't you think?"
	done

FriedaNotFridayText:
	text "It's not Friday,"
	line "huh?"
	done

Route32SignText:
	text "Route 32"

	para "Violet City -"
	line "Azalea Town"
	done

Route32RuinsSignText:
	text "Ruins Of Alph"
	line "East Entrance"
	done

Route32UnionCaveSignText:
	text "Union Cave"
	line "Ahead"
	done

Route32_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4

	db 0 ; coord events

	db 6 ; bg events
	bg_event 13,  5, BGEVENT_READ, Route32Sign
	bg_event  9,  1, BGEVENT_READ, Route32RuinsSign
	bg_event 10, 84, BGEVENT_READ, Route32UnionCaveSign
	bg_event 12, 73, BGEVENT_READ, Route32PokecenterSign
	bg_event 12, 67, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 11, 40, BGEVENT_ITEM, Route32HiddenSuperPotion

	db 14 ; object events
	object_event 10, 51, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJonah, -1
	object_event 12, 58, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherRalph1, -1
	object_event 11, 43, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMarlin, -1
	object_event 17, 19, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerSuperNerdJason, -1
	object_event  1, 58, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMRobert, -1
	object_event  3, 46, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerLacy, -1
	object_event 11, 31, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperWilliam, -1
	object_event  9,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32GrampsScript, -1
	object_event 11, 82, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperPedro, -1
	object_event  3, 68, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6, 53, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32GreatBall, EVENT_ROUTE_32_GREAT_BALL
	object_event 11, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	object_event 12, 67, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event  3, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32Repel, EVENT_ROUTE_32_REPEL
