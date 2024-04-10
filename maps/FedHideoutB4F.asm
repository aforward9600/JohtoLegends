	object_const_def ; object_event constants
	const FEDHIDEOUTB4F_BIKER_BOSS
	const FEDHIDEOUTB4F_GIOVANNI1
	const FEDHIDEOUTB4F_RIVAL
	const FEDHIDEOUTB4F_DELINQUENT
	const FEDHIDEOUTB4F_GIOVANNI2
	const FEDHIDEOUTB4F_ROUGHNECK
	const FEDHIDEOUTB4F_DRACO ; if player is male
	const FEDHIDEOUTB4F_DAHLIA ; if player is female
	const FEDHIDEOUTB4F_DELINQUENT2
	const FEDHIDEOUTB4F_BIKER1
	const FEDHIDEOUTB4F_BIKER2

FedHideoutB4F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

BikerBossMovement1:
	applymovement PLAYER, PlayerMovesToBikerBoss1Movement
BikerBossMovement2:
	applymovement PLAYER, PlayerMovesToBikerBoss2Movement
	pause 5
	opentext
	writetext BikerBossSeenText
	waitbutton
	closetext
	setlasttalked FEDHIDEOUTB4F_BIKER_BOSS
	winlosstext BikerBossWinText, BikerBossLastMonText
	loadtrainer FED_LEADER, PAXTON
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FED_LEADER_PAXTON
	pause 5
	opentext
	writetext BikerBossAfterText
	waitbutton
	closetext
	pause 5
	opentext
	writetext GiovanniOneKidText
	waitbutton
	closetext
	pause 5
	showemote EMOTE_SHOCK, FEDHIDEOUTB4F_BIKER_BOSS, 15
	pause 5
	turnobject PLAYER, DOWN
	pause 5
	appear FEDHIDEOUTB4F_GIOVANNI1
	applymovement FEDHIDEOUTB4F_GIOVANNI1, PlayerMovesToBikerBoss2Movement
	turnobject PLAYER, LEFT
	applymovement FEDHIDEOUTB4F_GIOVANNI1, GiovanniMovesLeftMovement
	applymovement FEDHIDEOUTB4F_GIOVANNI1, PlayerMovesToBikerBoss2Movement
	turnobject FEDHIDEOUTB4F_GIOVANNI1, RIGHT
	turnobject FEDHIDEOUTB4F_BIKER_BOSS, LEFT
	opentext
	writetext GiovanniDidYouThinkText
	waitbutton
	closetext
	applymovement FEDHIDEOUTB4F_GIOVANNI1, GiovanniMovesDownMovement
	turnobject FEDHIDEOUTB4F_GIOVANNI1, RIGHT
	opentext
	writetext GiovanniYoureDoneText
	waitbutton
	closetext
	pause 15
	opentext
	writetext BikerBossUnderstoodText
	waitbutton
	closetext
	moveobject FEDHIDEOUTB4F_GIOVANNI1, 15, 4
	pause 15
	setevent EVENT_FED_HIDEOUT_NPCS
	clearevent EVENT_SAFFRON_CITY_CIVILLIANS
	setevent EVENT_SAFFRON_CITY_FEDS
	clearevent EVENT_VIRIDIAN_CITY_CIVILLIANS
	clearevent EVENT_CERULEAN_CITY_CIVILLIANS
	clearevent EVENT_PEWTER_CITY_CIVILLIANS
	setevent EVENT_KANTO_POKECENTER_RIVAL
	setevent EVENT_BEAT_BIKER_BOSS
	setscene SCENE_FINISHED
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear FEDHIDEOUTB4F_BIKER_BOSS
	pause 15
	special FadeInQuickly
	pause 15
	applymovement FEDHIDEOUTB4F_GIOVANNI1, GiovanniMovesDown2Movement
	applymovement FEDHIDEOUTB4F_GIOVANNI1, PlayerMovesToBikerBoss1Movement
	opentext
	writetext GiovanniGoodbyeText
	waitbutton
	closetext
	pause 15
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ShowDahlia
	appear FEDHIDEOUTB4F_DRACO
	applymovement PLAYER, HidePlayerHideoutMovement
	applymovement FEDHIDEOUTB4F_DRACO, DoppelgangerLeavesMovement
	disappear FEDHIDEOUTB4F_DRACO
	sjump .HidePlayer
.ShowDahlia
	appear FEDHIDEOUTB4F_DAHLIA
	applymovement PLAYER, HidePlayerHideoutMovement
	applymovement FEDHIDEOUTB4F_DAHLIA, DoppelgangerLeavesMovement
	disappear FEDHIDEOUTB4F_DAHLIA
.HidePlayer
	applymovement FEDHIDEOUTB4F_GIOVANNI1, GiovanniMovesDown2Movement
	applymovement FEDHIDEOUTB4F_GIOVANNI1, PlayerMovesToBikerBoss1Movement
	turnobject FEDHIDEOUTB4F_GIOVANNI1, DOWN
	pause 15
	turnobject FEDHIDEOUTB4F_GIOVANNI1, RIGHT
	pause 15
	turnobject FEDHIDEOUTB4F_GIOVANNI1, LEFT
	pause 15
	special FadeOutMusic
	pause 60
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext GiovanniGoodText
	waitbutton
	closetext
	setevent EVENT_FED_HIDEOUT_GIOVANNI
	pause 15
	special FadeBlackQuickly
	applymovement PLAYER, PlayerAppearsMovement
	special ReloadSpritesNoPalettes
	pause 45
	loadmem wLevelCap, 100
	warp CELADON_CITY, 20, 20
	blackoutmod CELADON_CITY
	end

BikerBossLastMonText:
	text "Paxton: This wasn't"
	line "in our deal!"
	done

FedHideoutB4FDelinquent:
	faceplayer
	opentext
	writetext FedHideoutB4FDelinquentText
	waitbutton
	closetext
	turnobject FEDHIDEOUTB4F_DELINQUENT, DOWN
	end

FedHideoutB4FRival:
	faceplayer
	opentext
	writetext FedHideoutB4FRivalText
	waitbutton
	closetext
	turnobject FEDHIDEOUTB4F_RIVAL, UP
	end

FedHideoutB4FGiovanni:
	faceplayer
	opentext
	writetext FedHideoutB4FGiovanniText
	waitbutton
	closetext
	turnobject FEDHIDEOUTB4F_GIOVANNI2, RIGHT
	end

FedHideoutB4FRoughneck:
	faceplayer
	opentext
	writetext FedHideoutB4FRoughneckText
	waitbutton
	closetext
	turnobject FEDHIDEOUTB4F_ROUGHNECK, LEFT
	end

TrainerDelinquentKathy:
	trainer DELINQUENT, KATHY, EVENT_BEAT_DELINQUENT_KATHY, DelinquentKathySeenText, DelinquentKathyBeatenText, 0, .Script

.Script:
	opentext
	writetext DelinquentKathyAfterText
	waitbutton
	closetext
	setevent EVENT_GOT_ELEVATOR_PASSWORD
	end

TrainerBikerBluno:
	trainer BIKER, BLUNO, EVENT_BEAT_BIKER_BLUNO, BikerBlunoSeenText, BikerBlunoBeatenText, 0, .Script

.Script:
	opentext
	writetext BikerBlunoAfterText
	waitbutton
	closetext
	end

TrainerBikerRosso:
	trainer BIKER, ROSSO, EVENT_BEAT_BIKER_ROSSO, BikerRossoSeenText, BikerRossoBeatenText, 0, .Script

.Script:
	opentext
	writetext BikerRossoAfterText
	waitbutton
	closetext
	end

PlayerMovesToBikerBoss1Movement:
	step RIGHT
	step_end

PlayerMovesToBikerBoss2Movement:
	step UP
	step UP
	step UP
	step UP
	step_end

GiovanniMovesLeftMovement:
	step LEFT
	step LEFT
	step_end

GiovanniMovesDownMovement:
	step DOWN
	step DOWN
	step_end

GiovanniMovesDown2Movement:
	step DOWN
	step_end

PlayerAppearsMovement:
	show_person
	step_end

HidePlayerHideoutMovement:
	hide_person
	step_end

DoppelgangerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

BikerBossSeenText:
	text "???: Those idiots!"

	para "I told them to"
	line "guard the hideout,"
	cont "and look what"
	cont "happened!"

	para "Useless, the lot"
	line "of 'em!"

	para "So, Champion."

	para "You really want to"
	line "do this, huh?"

	para "Fine! Let's see if"
	line "you have what it"
	cont "takes!"

	para "I'm Paxton, the"
	line "Federation Leader!"

	para "We had Kanto in"
	line "our hands until"
	cont "you showed up!"

	para "After I dispose of"
	line "you, we'll have to"
	cont "work extra hard to"
	cont "get control back!"

	para "Even if we have to"
	line "burn this whole"
	cont "region to ashes!"

	para "We are the Feds!"

	para "We are the law,"
	line "and everyone will"
	cont "obey us!"

	para "Bring it on!"
	done

BikerBossWinText:
	text "Paxton: …No."

	para "Everything we've"
	line "worked for…"

	para "It's all gone up in"
	line "smoke…"
	done

BikerBossAfterText:
	text "Paxton: …I don't"
	line "understand…"

	para "We did everything"
	line "she told us to do…"

	para "We burned all of"
	line "the Gyms…"

	para "We chased down"
	line "anyone that got in"
	cont "our way…"

	para "We cut ourselves"
	line "off from the rest"
	cont "of the world…"

	para "We made Kanto into"
	line "the wasteland she"
	cont "wanted…"

	para "Was it not enough?"

	para "Even with all the"
	line "cash she paid us…"

	para "One kid beat us…"
	done

GiovanniOneKidText:
	text "???: It wasn't just"
	line "one kid."
	done

BikerBossYouText:
	text "Paxton: Y-you…"

	para "You're her…"
	done

GiovanniDidYouThinkText:
	text "Giovanni: Did you"
	line "really think it"
	cont "was merely the"
	cont "effort of a lone"
	cont "child that brought"
	cont "you down?"

	para "The combined and"
	line "organized strength"
	cont "of the Champion,"
	cont "and the future Gym"
	cont "Leaders of Kanto"
	cont "took down your"
	cont "disjointed and,"
	cont "quite frankly,"
	cont "ineffective group."
	done

GiovanniYoureDoneText:
	text "Giovanni: Don't"
	line "you see?"

	para "It is not through"
	line "discord and chaos"
	cont "that you rule."

	para "It is order."

	para "You failed to"
	line "effectively use"
	cont "your underlings."

	para "That is why you"
	line "are weak."

	para "Numbers alone can"
	line "only get you so"
	cont "far."

	para "Perhaps you should"
	line "leave now. This"
	cont "victory will lead"
	cont "to a new resolve"
	cont "for the people,"

	para "and I don't think"
	line "you and your pals"
	cont "are going to want"
	cont "to be around when"
	cont "that happens."

	para "Understood?"
	done

BikerBossUnderstoodText:
	text "Paxton: …Yes."

	para "I…I shall go."

	para "There's nothing"
	line "else I can do…"

	para "…I'm sorry, Madame"
	line "Boss."

	para "…I can only hope"
	line "she can forgive me"
	cont "for failing…"

	para "Maybe someone else"
	line "can succeed where"
	cont "I failed…"

	para "Goodbye…Giovanni…"
	done

GiovanniGoodbyeText:
	text "Giovanni: You did"
	line "well, <PLAYER>."

	para "Someday, Kanto can"
	line "restore itself to"
	cont "its former glory."

	para "We can all work"
	line "together to ensure"
	cont "a better future."

	para "As the future Gym"
	line "Leader of Viridian"
	cont "City, you have my"
	cont "word."

	para "I'll help to clean"
	line "up here."

	para "There may be some"
	line "stragglers who"
	cont "didn't get the"
	cont "memo."

	para "You should go and"
	line "deliver the good"
	cont "news to Prof.Oak."

	para "He'll be more than"
	line "happy to hear it."

	para "…Pardon? How did"
	line "Paxton know my"
	cont "name?"

	para "Well, I am the"
	line "richest person in"
	cont "Kanto."

	para "Very few people in"
	line "Kanto don't know"
	cont "my name."

	para "Now, run along."

	para "It's time for the"
	line "adults to finally"
	cont "start to take"
	cont "charge."
	done

GiovanniGoodText:
	text "Giovanni: ………"

	para "I really must"
	line "thank <PLAYER>."

	para "Without them, it"
	line "would have been a"
	cont "lot harder to get"
	cont "rid of Paxton and"
	cont "his goons."

	para "They sure caused a"
	line "mess, and now this"
	cont "region is ripe for"
	cont "the taking."

	para "This time, it won't"
	line "be through chaos."

	para "It won't be from"
	line "the shadows."

	para "We shall strike"
	line "fear and rule"
	cont "through order."

	para "Mother…"

	para "Your plan was"
	line "foolish."

	para "What did you plan"
	line "on doing after the"
	cont "region was starved"
	cont "and broken?"

	para "Rule over nothing?"

	para "You never listened"
	line "to me…"

	para "You always thought"
	line "you were better"
	cont "than me…"

	para "That doesn't matter"
	line "any more…"

	para "From this moment"
	line "on,"

	para "we shall sulk in"
	line "the shadows no"
	cont "longer."

	para "This, is where my"
	line "new empire shall"
	cont "rise."

	para "This, is where"
	line "Team Rocket shall"
	cont "be reborn!"

	para "We will wear our"
	line "identity proudly!"

	para "The people shall"
	line "fear our insignia!"

	para "Team Rocket shall"
	line "control all people"
	cont "and #mon!"

	para "I will be a far"
	line "superior leader"
	cont "than you ever"
	cont "were, Mother…"

	para "That, I assure"
	line "you…"
	done

FedHideoutB4FRivalText:
	text "<RIVAL>: There"
	line "should be a"
	cont "Delinquent with"
	cont "the elevator"
	cont "password on this"
	cont "floor!"

	para "I don't think it's"
	line "this one."

	para "Maybe it's another"
	line "one?"
	done

FedHideoutB4FDelinquentText:
	text "A former Champion?"

	para "Why do I get the"
	line "hard ones?"
	done

FedHideoutB4FGiovanniText:
	text "Giovanni: Ha!"

	para "I haven't felt this"
	line "alive in years!"

	para "It takes me back…"

	para "Go on!"

	para "Their leader is"
	line "waiting!"
	done

FedHideoutB4FRoughneckText:
	text "How did this guy"
	line "get down here?"

	para "He shouldn't even"
	line "have the password!"

	para "…Wait…is this?"
	done

DelinquentKathySeenText:
	text "You can't use the"
	line "elevator, huh?"

	para "Well, that's too"
	line "bad, buddy!"

	para "I know what the"
	line "password is,"

	para "but you're not"
	line "getting it!"
	done

DelinquentKathyBeatenText:
	text "Alright, alright!"

	para "I'll tell you the"
	line "password if you"
	cont "leave me alone!"
	done

DelinquentKathyAfterText:
	text "The password is:"

	para "REDGREEN1996"

	para "You happy now?"
	done

BikerRossoSeenText:
	text "We'll defend the"
	line "boss's life with"
	cont "our lives!"
	done

BikerRossoBeatenText:
	text "Well, maybe not"
	line "OUR lives…"
	done

BikerRossoAfterText:
	text "It might be worth"
	line "it to go back to"
	cont "Orre…"

	para "Maybe I can find"
	line "work there…"
	done

BikerBlunoSeenText:
	text "I'm the last line"
	line "of defense!"

	para "I can't lose!"
	done

BikerBlunoBeatenText:
	text "I lost…"
	done

BikerBlunoAfterText:
	text "Maybe you're right,"
	line "Rosso…"

	para "Maybe we should"
	line "head back to"
	cont "Orre…"

	para "I think things are"
	line "going to get ugly"
	cont "for us soon…"
	done

FedHideoutB4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 11, 10, FED_HIDEOUT_B3F, 2
	warp_event 16, 15, FED_HIDEOUT_ELEVATOR, 1
	warp_event 17, 15, FED_HIDEOUT_ELEVATOR, 2

	db 2 ; coord events
	coord_event 16, 10, SCENE_DEFAULT, BikerBossMovement1
	coord_event 17, 10, SCENE_DEFAULT, BikerBossMovement2

	db 0 ; bg events

	db 11 ; object events
	object_event 17,  3, SPRITE_BIKER_BOSS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FED_HIDEOUT_LEADER
	object_event 17, 11, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FED_HIDEOUT_GIOVANNI
	object_event  5, 12, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideoutB4FRival, EVENT_FED_HIDEOUT_NPCS
	object_event  5, 11, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FedHideoutB4FDelinquent, EVENT_FED_HIDEOUT_NPCS
	object_event  6, 19, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideoutB4FGiovanni, EVENT_FED_HIDEOUT_NPCS
	object_event  7, 19, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FedHideoutB4FRoughneck, EVENT_FED_HIDEOUT_NPCS
	object_event 17,  6, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FED_HIDEOUT_PLAYER
	object_event 17,  6, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FED_HIDEOUT_PLAYER
	object_event  4,  2, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerDelinquentKathy, EVENT_FED_HIDEOUT_NPCS
	object_event 15, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerBikerRosso, EVENT_FED_HIDEOUT_NPCS
	object_event 18, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBikerBluno, EVENT_FED_HIDEOUT_NPCS
