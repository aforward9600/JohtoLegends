	object_const_def ; object_event constants
	const CINNABARISLANDGYM_BLAINE
	const CINNABARISLANDGYM_SUPER_NERD_1
	const CINNABARISLANDGYM_SUPER_NERD_2
	const CINNABARISLANDGYM_SUPER_NERD_3
	const CINNABARISLANDGYM_BURGLAR_1
	const CINNABARISLANDGYM_BURGLAR_2
	const CINNABARISLANDGYM_BURGLAR_3

CinnabarIslandGym_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .GymShutters

.GymShutters:
	checkevent EVENT_ANSWERED_QUESTION_1
	iftrue .Skip1
	changeblock 16, 6, $55 ; Left Shutter
	changeblock 19, 6, $56 ; Right Shutter
.Skip1:
	checkevent EVENT_ANSWERED_QUESTION_2
	iftrue .Skip2
	changeblock 12, 6, $53 ; Shutter2
.Skip2:
	checkevent EVENT_ANSWERED_QUESTION_3
	iftrue .Skip3
	changeblock 12, 12, $53 ; Shutter3
.Skip3:
	checkevent EVENT_ANSWERED_QUESTION_4
	iftrue .Skip4
	changeblock 6, 16, $54 ; Shutter4
.Skip4:
	checkevent EVENT_ANSWERED_QUESTION_5
	iftrue .Skip5
	changeblock 4, 12, $53 ; Shutter5
.Skip5:
	checkevent EVENT_ANSWERED_QUESTION_6
	iftrue .Skip6
	changeblock 4, 6, $53 ;Shutter6
.Skip6:
	return

CinnabarGymBlaine:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .BlainePost
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, BlaineLastMonText
	loadtrainer BLAINE, BLAINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_SUPER_NERD_ALBERT
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	setevent EVENT_DECO_PLANT_2
	writetext BlaineVolcanoBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

.BlainePost:
	checkflag ENGINE_JOEY
	iffalse .BlaineRematch
	writetext BlainePostText
	waitbutton
	closetext
	end

.BlaineRematch:
	writetext BlaineRematchText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, BlaineLastMonText
	loadtrainer BLAINE, BLAINE1
	startbattle
	reloadmapafterbattle
	opentext
	writetext BlaineAfterRematchText
	waitbutton
	closetext
	setflag ENGINE_JOEY
	end
	

BlaineLastMonText:
	text "We're still hot!"
	done

TrainerSuperNerdAlbert:
	trainer SUPER_NERD, ALBERT_SUPER_NERD, EVENT_BEAT_SUPER_NERD_ALBERT, SuperNerdAlbertSeenText, SuperNerdAlbertBeatenText, 0, .Script

.Script:
	checkevent EVENT_ANSWERED_QUESTION_1
	iftrue .BeatAlbert
	pause 30
	playsound SFX_ENTER_DOOR
	changeblock 16, 6, $4d ; Left Shutter
	changeblock 19, 6, $4e ; Right Shutter
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_1
	end

.BeatAlbert:
	opentext
	writetext SuperNerdAlbertAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdDaisuke:
	trainer SUPER_NERD, DAISUKE, EVENT_BEAT_SUPER_NERD_DAISUKE, SuperNerdDaisukeSeenText, SuperNerdDaisukeBeatenText, 0, .Script

.Script:
	checkevent EVENT_ANSWERED_QUESTION_5
	iftrue .BeatDaisuke
	pause 30
	playsound SFX_ENTER_DOOR
	changeblock 4, 12, $40 ; Shutter3
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_5
	end

.BeatDaisuke:
	opentext
	writetext SuperNerdDaisukeAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdJosef:
	trainer SUPER_NERD, JOSEF, EVENT_BEAT_SUPER_NERD_JOSEF, SuperNerdJosefSeenText, SuperNerdJosefBeatenText, 0, .Script

.Script:
	checkevent EVENT_ANSWERED_QUESTION_3
	iftrue .BeatJosef
	pause 30
	playsound SFX_ENTER_DOOR
	changeblock 12, 12, $40 ; Shutter3
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_3
	end

.BeatJosef:
	opentext
	writetext SuperNerdJosefAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarErik:
	trainer BURGLAR, BURGLAR_ERIK, EVENT_BEAT_BURGLAR_ERIK, BurglarErikSeenText, BurglarErikBeatenText, 0, .Script

.Script:
	checkevent EVENT_ANSWERED_QUESTION_2
	iftrue .BeatErik
	pause 30
	playsound SFX_ENTER_DOOR
	changeblock 12, 6, $40 ; Shutter2
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_2
	end

.BeatErik:
	opentext
	writetext BurglarErikAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarKidd:
	trainer BURGLAR, KIDD, EVENT_BEAT_BURGLAR_KIDD, BurglarKiddSeenText, BurglarKiddBeatenText, 0, .Script

.Script:
	checkevent EVENT_ANSWERED_QUESTION_6
	iftrue .BeatKidd
	pause 30
	playsound SFX_ENTER_DOOR
	changeblock 4, 6, $40 ; Shutter6
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_6
	end

.BeatKidd:
	opentext
	writetext BurglarKiddAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarArsene:
	trainer BURGLAR, ARSENE, EVENT_BEAT_BURGLAR_ARSENE, BurglarArseneSeenText, BurglarArseneBeatenText, 0, .Script

.Script:
	checkevent EVENT_ANSWERED_QUESTION_4
	iftrue .BeatErik
	pause 30
	playsound SFX_ENTER_DOOR
	changeblock 6, 16, $40 ; Shutter4
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_4
	end

.BeatErik:
	opentext
	writetext BurglarArseneAfterBattleText
	waitbutton
	closetext
	end

Question1:
	opentext
	checkevent EVENT_ANSWERED_QUESTION_1
	iftrue .AnsweredQuestion1
	writetext AnswerThisQuestionText
	waitbutton
	writetext Question1Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_LEVEL_UP
	waitsfx
	writetext RightAnswerText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 16, 6, $4d ; Left Shutter
	changeblock 19, 6, $4e ; Right Shutter
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_1
	setevent EVENT_BEAT_SUPER_NERD_ALBERT
	end

.AnsweredQuestion1:
	writetext AlreadyAnsweredQuestionText
	waitbutton
	closetext
	end

.WrongAnswer:
	playsound SFX_WRONG
	waitsfx
	writetext WrongAnswerText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_SUPER_NERD_1, CinnabarGymMoveLeft
	readvar VAR_FACING
	ifequal LEFT, .MakePlayerFaceDown
	turnobject PLAYER, RIGHT
	sjump .FightAlbert

.MakePlayerFaceDown:
	turnobject PLAYER, DOWN
	turnobject CINNABARISLANDGYM_SUPER_NERD_1, UP
.FightAlbert:
	opentext
	writetext SuperNerdAlbertSeenText
	waitbutton
	closetext
	setlasttalked CINNABARISLANDGYM_SUPER_NERD_1
	winlosstext SuperNerdAlbertBeatenText, 0
	loadtrainer SUPER_NERD, ALBERT_SUPER_NERD
	startbattle
	reloadmapafterbattle
	opentext
	writetext SuperNerdAlbertAfterBattleText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_SUPER_NERD_1, CinnabarGymMoveRight
	turnobject CINNABARISLANDGYM_SUPER_NERD_1, DOWN
	pause 15
	playsound SFX_ENTER_DOOR
	changeblock 16, 6, $4d ; Left Shutter
	changeblock 19, 6, $4e ; Right Shutter
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_1
	setevent EVENT_BEAT_SUPER_NERD_ALBERT
	end

Question2:
	opentext
	checkevent EVENT_ANSWERED_QUESTION_2
	iftrue .AnsweredQuestion2
	writetext AnswerThisQuestionText
	waitbutton
	writetext Question2Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_LEVEL_UP
	waitsfx
	writetext RightAnswerText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 12, 6, $40 ; Shutter2
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_2
	end

.AnsweredQuestion2:
	writetext AlreadyAnsweredQuestionText
	waitbutton
	closetext
	end

.WrongAnswer:
	playsound SFX_WRONG
	waitsfx
	writetext WrongAnswerText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_BURGLAR_1, CinnabarGymMoveUp
	readvar VAR_FACING
	ifequal LEFT, .MakePlayerFaceDown
	turnobject CINNABARISLANDGYM_BURGLAR_1, LEFT
	turnobject PLAYER, RIGHT
	sjump .FightErik

.MakePlayerFaceDown:
	turnobject PLAYER, DOWN
.FightErik:
	opentext
	writetext BurglarErikSeenText
	waitbutton
	closetext
	setlasttalked CINNABARISLANDGYM_BURGLAR_1
	winlosstext BurglarErikBeatenText, 0
	loadtrainer BURGLAR, BURGLAR_ERIK
	startbattle
	reloadmapafterbattle
	opentext
	writetext BurglarErikAfterBattleText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_BURGLAR_1, CinnabarGymMoveDown
	turnobject CINNABARISLANDGYM_BURGLAR_1, DOWN
	pause 15
	playsound SFX_ENTER_DOOR
	changeblock 12, 6, $40 ; Shutter2
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_2
	setevent EVENT_BEAT_BURGLAR_ERIK
	end

Question3:
	opentext
	checkevent EVENT_ANSWERED_QUESTION_3
	iftrue .AnsweredQuestion3
	writetext AnswerThisQuestionText
	waitbutton
	writetext Question3Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_LEVEL_UP
	waitsfx
	writetext RightAnswerText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 12, 12, $40 ; Shutter3
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_3
	end

.AnsweredQuestion3:
	writetext AlreadyAnsweredQuestionText
	waitbutton
	closetext
	end

.WrongAnswer:
	playsound SFX_WRONG
	waitsfx
	writetext WrongAnswerText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_SUPER_NERD_2, CinnabarGymMoveLeft
	readvar VAR_FACING
	ifequal LEFT, .MakePlayerFaceDown
	turnobject PLAYER, RIGHT
	sjump .FightJosef

.MakePlayerFaceDown:
	turnobject PLAYER, DOWN
	turnobject CINNABARISLANDGYM_SUPER_NERD_2, UP
.FightJosef:
	opentext
	writetext SuperNerdJosefSeenText
	waitbutton
	closetext
	setlasttalked CINNABARISLANDGYM_SUPER_NERD_2
	winlosstext SuperNerdJosefBeatenText, 0
	loadtrainer SUPER_NERD, JOSEF
	startbattle
	reloadmapafterbattle
	opentext
	writetext SuperNerdJosefAfterBattleText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_SUPER_NERD_2, CinnabarGymMoveRight
	turnobject CINNABARISLANDGYM_SUPER_NERD_2, DOWN
	pause 15
	playsound SFX_ENTER_DOOR
	changeblock 12, 12, $40 ; Shutter3
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_3
	setevent EVENT_BEAT_SUPER_NERD_JOSEF
	end

Question4:
	opentext
	checkevent EVENT_ANSWERED_QUESTION_4
	iftrue .AnsweredQuestion4
	writetext AnswerThisQuestionText
	waitbutton
	writetext Question4Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_LEVEL_UP
	waitsfx
	writetext RightAnswerText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 6, 16, $40 ; Shutter4
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_4
	end

.AnsweredQuestion4:
	writetext AlreadyAnsweredQuestionText
	waitbutton
	closetext
	end

.WrongAnswer:
	playsound SFX_WRONG
	waitsfx
	writetext WrongAnswerText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_BURGLAR_2, CinnabarGymMoveLeft
	readvar VAR_FACING
	ifequal LEFT, .MakePlayerFaceDown
	turnobject PLAYER, RIGHT
	sjump .FightArsene

.MakePlayerFaceDown:
	turnobject PLAYER, DOWN
	turnobject CINNABARISLANDGYM_BURGLAR_2, UP
.FightArsene:
	opentext
	writetext BurglarArseneSeenText
	waitbutton
	closetext
	setlasttalked CINNABARISLANDGYM_BURGLAR_2
	winlosstext BurglarArseneBeatenText, 0
	loadtrainer BURGLAR, ARSENE
	startbattle
	reloadmapafterbattle
	opentext
	writetext BurglarArseneAfterBattleText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_BURGLAR_2, CinnabarGymMoveRight
	turnobject CINNABARISLANDGYM_BURGLAR_2, DOWN
	pause 15
	playsound SFX_ENTER_DOOR
	changeblock 6, 16, $40 ; Shutter4
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_4
	setevent EVENT_BEAT_BURGLAR_ARSENE
	end

Question5:
	opentext
	checkevent EVENT_ANSWERED_QUESTION_5
	iftrue .AnsweredQuestion5
	writetext AnswerThisQuestionText
	waitbutton
	writetext Question5Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_LEVEL_UP
	waitsfx
	writetext RightAnswerText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 12, $40 ; Left Shutter
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_5
	end

.AnsweredQuestion5:
	writetext AlreadyAnsweredQuestionText
	waitbutton
	closetext
	end

.WrongAnswer:
	playsound SFX_WRONG
	waitsfx
	writetext WrongAnswerText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_SUPER_NERD_3, CinnabarGymMoveLeft
	readvar VAR_FACING
	ifequal LEFT, .MakePlayerFaceDown
	turnobject PLAYER, RIGHT
	sjump .FightDaisuke

.MakePlayerFaceDown:
	turnobject PLAYER, DOWN
	turnobject CINNABARISLANDGYM_SUPER_NERD_3, UP
.FightDaisuke:
	opentext
	writetext SuperNerdDaisukeSeenText
	waitbutton
	closetext
	setlasttalked CINNABARISLANDGYM_SUPER_NERD_3
	winlosstext SuperNerdDaisukeBeatenText, 0
	loadtrainer SUPER_NERD, DAISUKE
	startbattle
	reloadmapafterbattle
	opentext
	writetext SuperNerdDaisukeAfterBattleText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_SUPER_NERD_3, CinnabarGymMoveRight
	turnobject CINNABARISLANDGYM_SUPER_NERD_3, DOWN
	pause 15
	playsound SFX_ENTER_DOOR
	changeblock 4, 12, $40 ; Shutter5
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_5
	setevent EVENT_BEAT_SUPER_NERD_DAISUKE
	end

Question6:
	opentext
	checkevent EVENT_ANSWERED_QUESTION_6
	iftrue .AnsweredQuestion6
	writetext AnswerThisQuestionText
	waitbutton
	writetext Question6Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_LEVEL_UP
	waitsfx
	writetext RightAnswerText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 6, $40 ; Shutter6
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_6
	end

.AnsweredQuestion6:
	writetext AlreadyAnsweredQuestionText
	waitbutton
	closetext
	end

.WrongAnswer:
	playsound SFX_WRONG
	waitsfx
	writetext WrongAnswerText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_BURGLAR_3, CinnabarGymMoveLeft
	readvar VAR_FACING
	ifequal LEFT, .MakePlayerFaceDown
	turnobject PLAYER, RIGHT
	sjump .FightKidd

.MakePlayerFaceDown:
	turnobject PLAYER, DOWN
	turnobject CINNABARISLANDGYM_BURGLAR_3, UP
.FightKidd:
	opentext
	writetext BurglarKiddSeenText
	waitbutton
	closetext
	setlasttalked CINNABARISLANDGYM_BURGLAR_3
	winlosstext BurglarKiddBeatenText, 0
	loadtrainer BURGLAR, KIDD
	startbattle
	reloadmapafterbattle
	opentext
	writetext BurglarKiddAfterBattleText
	waitbutton
	closetext
	applymovement CINNABARISLANDGYM_BURGLAR_3, CinnabarGymMoveRight
	turnobject CINNABARISLANDGYM_BURGLAR_3, DOWN
	pause 15
	playsound SFX_ENTER_DOOR
	changeblock 4, 6, $40 ; Shutter6
	reloadmappart
	setevent EVENT_ANSWERED_QUESTION_6
	setevent EVENT_BEAT_BURGLAR_KIDD
	end

CinnabarGymMoveLeft:
	step LEFT
	step_end

CinnabarGymMoveRight:
	step RIGHT
	step_resume

CinnabarGymMoveDown:
	step DOWN
	step_resume

CinnabarGymMoveUp:
	step UP
	step_end

AnswerThisQuestionText:
	text "#mon Quiz! Get"
	line "it right and the"
	cont "door opens to the"
	cont "next room!"

	para "Get it wrong and"
	line "face a trainer!"

	para "If you want to"
	line "conserve your"
	cont "#mon for the"
	cont "Gym Leader…"

	para "Then get it right!"
	line "Here we go!"
	done

Question1Text:
	text "Caterpie evolves"
	line "into Metapod?"
	done

RightAnswerText:
	text "You're absolutely"
	line "correct!"

	para "Go on through!"
	done

WrongAnswerText:
	text "Wrong answer!"
	done

AlreadyAnsweredQuestionText:
	text "You've already"
	line "answered this"
	cont "question."
	done

Question2Text:
	text "The Badge given in"
	line "the Cinnabar Gym"
	cont "is the HeatBadge?"
	done

Question3Text:
	text "Poliwag evolves 3"
	line "times?"
	done

Question4Text:
	text "Are Electric moves"
	line "effective against"
	cont "Ground-type"
	cont "#mon?"
	done

Question5Text:
	text "#mon of the"
	line "same kind and"
	cont "level are not"
	cont "identical?"
	done

Question6Text:
	text "TM28 contains"
	line "Tombstony?"
	done

BlaineIntroText:
	text "Blaine: My quiz"
	line "machines still"
	cont "work, after all"
	cont "this time!"

	para "How did you enjoy"
	line "them?"

	para "I like challenging"
	line "peoples' minds as"
	cont "well as their"
	cont "skills!"

	para "…I feel quite bad"
	line "about not doing my"
	cont "duty as Gym Leader"
	cont "for so long…"

	para "But the time for"
	line "wallowing is done!"

	para "It's time I put the"
	line "past behind me,"
	cont "and look to a"
	cont "brighter future!"

	para "Together, we can"
	line "reach that future!"

	para "Let's get heated!"
	done

BlaineWinLossText:
	text "Burned to ashes…"
	done

ReceivedVolcanoBadgeText:
	text "Blaine received"
	line "the VolcanoBadge!"
	done

BlaineVolcanoBadgeText:
	text "Blaine: It's been a"
	line "while since I've"
	cont "held one of these."

	para "It feels nostalgic"
	line "for me…"

	para "That battle was a"
	line "burning-hot sight"
	cont "to behold!"

	para "I have no doubt we"
	line "can clear the land"
	cont "of those Feds!"

	para "I'll be there when"
	line "you're ready!"
	done

BlaineFightDoneText:
	text "I have no doubt we"
	line "can clear the land"
	cont "of those Feds!"

	para "I'll be there when"
	line "you're ready!"
	done

SuperNerdAlbertSeenText:
	text "I came here to"
	line "study under Blaine"
	cont "and his genius."

	para "I've learned a"
	line "lot!"
	done

SuperNerdAlbertBeatenText:
	text "I didn't learn"
	line "enough!"
	done

SuperNerdAlbertAfterBattleText:
	text "It looks like he's"
	line "gonna start to"
	cont "focus more on his"
	cont "Gym career now."
	done

SuperNerdJosefSeenText:
	text "Cinnabar Island is"
	line "on top of a"
	cont "volcano!"

	para "Cool fact, huh?"
	done

SuperNerdJosefBeatenText:
	text "Oh, you already"
	line "knew that."
	done

SuperNerdJosefAfterBattleText:
	text "It could erupt in"
	line "about 14 years or"
	cont "so."

	para "That's pretty scary"
	line "to be honest."
	done

SuperNerdDaisukeSeenText:
	text "Oxygen is required"
	line "for fire to burn."
	done

SuperNerdDaisukeBeatenText:
	text "Losing makes it"
	line "hard to breathe!"
	done

SuperNerdDaisukeAfterBattleText:
	text "Water and dirt can"
	line "suffocate a fire."
	done

BurglarErikSeenText:
	text "Stealin' wasn't"
	line "payin' the bills,"
	cont "so I went straight"
	cont "and joined this"
	cont "gym."
	done

BurglarErikBeatenText:
	text "My skills don't"
	line "pay the bills!"
	done

BurglarErikAfterBattleText:
	text "I still gotta pay"
	line "the bills, of"
	cont "course."

	para "Livin' ain't cheap!"
	done

BurglarArseneSeenText:
	text "I felt pretty bad"
	line "about lootin' that"
	cont "burnt building."

	para "I decided to make"
	line "myself better and"
	cont "be a Gym trainer!"
	done

BurglarArseneBeatenText:
	text "I can be better!"
	done

BurglarArseneAfterBattleText:
	text "I need to better"
	line "myself, for me and"
	cont "my family."
	done

BurglarKiddSeenText:
	text "Bein' a trainer"
	line "here has its perks"
	cont "ya know!"
	done

BurglarKiddBeatenText:
	text "It beats lootin'!"
	done

BurglarKiddAfterBattleText:
	text "There are health"
	line "benefits here!"

	para "Didn't expect"
	line "that, did you?"
	done

BlainePostText:
	text "Blaine: Once, when"
	line "I was lost in the"
	cont "mountains,"

	para "Moltres descended"
	line "and guided me down"
	cont "the mountain."

	para "It would later"
	line "settle in the"
	cont "Cinnabar Volcano."

	para "I could've caught"
	line "it, but I decided"
	cont "to leave it be."

	para "Moltres gave me a"
	line "different view of"
	cont "#mon."

	para "I just wish I had"
	line "stayed on that"
	cont "path…"

	para "The things I have"
	line "done…"

	para "I will never"
	line "forget what I've"
	cont "done…"
	done

BlaineRematchText:
	text "Blaine: I've been"
	line "looking forward to"
	cont "a hot rematch!"

	para "You'd better have a"
	line "Burn Heal!"
	done

BlaineAfterRematchText:
	text "Blaine: Quite the"
	line "smoking match!"

	para "I'd take my wig off"
	line "to you, but that"
	cont "would be weird!"
	done

CinnabarIslandGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16, 17, CINNABAR_ISLAND, 4
	warp_event 17, 17, CINNABAR_ISLAND, 4

	db 0 ; coord events

	db 6 ; bg events
	bg_event 15,  7, BGEVENT_READ, Question1
	bg_event 11,  1, BGEVENT_READ, Question2
	bg_event  9,  7, BGEVENT_READ, Question3
	bg_event  9, 13, BGEVENT_READ, Question4
	bg_event  1, 13, BGEVENT_READ, Question5
	bg_event  1,  7, BGEVENT_READ, Question6

	db 7 ; object events
	object_event  3,  3, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CinnabarGymBlaine, EVENT_CINNABAR_GYM_BLAINE
	object_event 17,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerSuperNerdAlbert, -1
	object_event 11,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerSuperNerdJosef, -1
	object_event  3, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerSuperNerdDaisuke, -1
	object_event 12,  3, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBurglarErik, -1
	object_event 11, 14, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBurglarArsene, -1
	object_event  3,  8, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBurglarKidd, -1
