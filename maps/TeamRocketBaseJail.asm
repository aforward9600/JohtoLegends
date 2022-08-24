	object_const_def ; object_event constants
	const TEAMROCKETBASEJAIL_RIVAL
	const TEAMROCKETBASEJAIL_ARIANA
	const TEAMROCKETBASEJAIL_KOGA

TeamRocketBaseJail_MapScripts:
	db 0 ; scene_scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CloseDoor

.CloseDoor:
	checkevent EVENT_KOGA_SAVES_YOU_FROM_JAIL
	iftrue .KeepDoorOpen
	changeblock  4,  2, $42 ; Change to Locked Door
	return

.KeepDoorOpen:
	return

TeamRocketBaseJailRivalScript:
	checkevent EVENT_CHECKED_JAIL_DOOR
	iftrue .BeginEscape
	faceplayer
	opentext
	writetext UghHowAreYouText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_RIVAL_IN_JAIL
	end

.BeginEscape:
	faceplayer
	opentext
	writetext HowWillWeGetOutText
	waitbutton
	closetext
	disappear TEAMROCKETBASEJAIL_ARIANA
	playsound SFX_WALL_OPEN
	showemote EMOTE_SHOCK, PLAYER, 15
	showemote EMOTE_SHOCK, TEAMROCKETBASEJAIL_RIVAL, 15
	readvar VAR_FACING
	ifequal UP, .MovePlayerJail1
	ifequal DOWN, .MovePlayerJail2
	ifequal LEFT, .DontMovePlayer

.MovePlayerJail1:
	applymovement PLAYER, MovePlayerJail1
	sjump .DontMovePlayer

.MovePlayerJail2:
	applymovement PLAYER, MovePlayerJail2
.DontMovePlayer:
	turnobject PLAYER, UP
	turnobject TEAMROCKETBASEJAIL_RIVAL, UP
	playsound SFX_ENTER_DOOR
	moveobject TEAMROCKETBASEJAIL_ARIANA, 4, 2
	appear TEAMROCKETBASEJAIL_ARIANA
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement TEAMROCKETBASEJAIL_ARIANA, ArianaShowsUpMovement
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .LittleBoyfriend
	writetext PersianDahliaText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEJAIL_ARIANA, ArianaLeavesMovement
	disappear TEAMROCKETBASEJAIL_ARIANA
	playsound SFX_EXIT_BUILDING
	pause 30
	moveobject TEAMROCKETBASEJAIL_ARIANA, 3, 16
	waitsfx
	special RestartMapMusic
	sjump .KogaAppears

.LittleBoyfriend:
	writetext PersianDracoText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEJAIL_ARIANA, ArianaLeavesMovement
	disappear TEAMROCKETBASEJAIL_ARIANA
	playsound SFX_EXIT_BUILDING
	pause 30
	moveobject TEAMROCKETBASEJAIL_ARIANA, 3, 16
	special RestartMapMusic
.KogaAppears:
	turnobject TEAMROCKETBASEJAIL_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext NowWhatText
	waitbutton
	closetext
	pause 30
	playsound SFX_WALL_OPEN
	turnobject PLAYER, UP
	turnobject TEAMROCKETBASEJAIL_RIVAL, UP
	playsound SFX_ENTER_DOOR
	pause 15
	moveobject TEAMROCKETBASEJAIL_KOGA, 4, 2
	appear TEAMROCKETBASEJAIL_KOGA
	applymovement TEAMROCKETBASEJAIL_KOGA, ArianaShowsUpMovement
	opentext
	writetext DontSpeakText
	waitbutton
	closetext
	setevent EVENT_KOGA_SAVES_YOU_FROM_JAIL
	changeblock  4,  2, $4d ; Change to Unlocked Door
	applymovement TEAMROCKETBASEJAIL_KOGA, ArianaLeavesMovement
	disappear TEAMROCKETBASEJAIL_KOGA
	playsound SFX_EXIT_BUILDING
	moveobject TEAMROCKETBASEJAIL_KOGA, 3, 16
	pause 30
	opentext
	writetext WedBetterGetGoingText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEJAIL_RIVAL, RivalLeavesJailMovement
	disappear TEAMROCKETBASEJAIL_RIVAL
	playsound SFX_EXIT_BUILDING
	setevent EVENT_ROCKET_JAIL_RIVAL
	setevent EVENT_HIDEOUT_B3F_KOGA
	end

LockedDoor:
	checkevent EVENT_KOGA_SAVES_YOU_FROM_JAIL
	iftrue .DoorIsUnlocked
	checkevent EVENT_TALKED_TO_RIVAL_IN_JAIL
	iftrue .TriggerRivalScene
	opentext
	writetext DoorIsLockedText
	waitbutton
	closetext
	end

.DoorIsUnlocked:
	opentext
	writetext DoorIsUnlockedText
	waitbutton
	closetext
	end

.TriggerRivalScene:
	opentext
	setevent EVENT_CHECKED_JAIL_DOOR
	writetext DoorIsLockedText
	waitbutton
	closetext
	end

MovePlayerJail1:
	step RIGHT
	step UP
	step_end

MovePlayerJail2:
	step RIGHT
	step DOWN
	step_end

ArianaShowsUpMovement:
	step DOWN
	step DOWN
	step_end

ArianaLeavesMovement:
	step UP
	step UP
	step_end

RivalLeavesJailMovement:
	step UP
	step UP
	step RIGHT
	step UP
	step_end

UghHowAreYouText:
	text "Ugh…"

	para "That hurt…"

	para "How are you hold-"
	line "ing up, <PLAYER>?"

	para "Someone knocked me"
	line "out, and I woke up"
	cont "in this room."

	para "Any idea what's"
	line "going on?"

	para "We need to get"
	line "out of here before"
	cont "we end up worse"
	cont "off then we"
	cont "already are."
	done

HowWillWeGetOutText:
	text "The door's locked,"
	line "and there's no"
	cont "other way out."

	para "How will we get"
	line "out?"
	done

PersianDahliaText:
	text "Well, well, well!"

	para "Look what the"
	line "Persian dragged"
	cont "in!"

	para "<RIVAL>: You!"

	para "I remember you!"

	para "Ariana: Oh, do"
	line "you?"

	para "I'm flattered,"
	line "really."

	para "Regardless, you're"
	line "here, and you're"
	cont "not going any-"
	cont "where."

	para "You've both been"
	line "thorough thorns"
	cont "in our sides, and"
	cont "you'll remain here"
	cont "until we no longer"
	cont "need you."

	para "<RIVAL>: Wait, my"
	line "wing!"

	para "What did you do"
	line "with it?!"

	para "Ariana: Oh, you"
	line "mean that old"
	cont "feather?"

	para "Don't worry, we're"
	line "keeping it nice"
	cont "and safe, until we"
	cont "have use of it."

	para "We took yours too,"
	line "so don't bother"
	cont "searching your"
	cont "bag for it."

	para "Now, if you'll"
	line "excuse me, young"
	cont "lovebirds, I have"
	cont "more important"
	cont "business to attend"
	cont "to."

	para "<RIVAL>: You know"
	line "we're older than"
	cont "you, right?"

	para "Ariana: Shut up!"

	para "I'll give you and"
	line "your boyfriend"
	cont "matching black"
	cont "eyes if you keep"
	cont "it up!"

	para "Ugh, I'm done"
	line "here!"
	done

PersianDracoText:
	text "Well, well, well!"

	para "Look what the"
	line "Persian dragged"
	cont "in!"

	para "<RIVAL>: You!"

	para "I remember you!"

	para "Ariana: Oh, do"
	line "you?"

	para "I'm flattered,"
	line "really."

	para "Regardless, you're"
	line "here, and you're"
	cont "not going any-"
	cont "where."

	para "You've both been"
	line "thorough thorns"
	cont "in our sides, and"
	cont "you'll remain here"
	cont "until we no longer"
	cont "need you."

	para "<RIVAL>: Wait, my"
	line "wing!"

	para "What did you do"
	line "with it?!"

	para "Ariana: Oh, you"
	line "mean that old"
	cont "feather?"

	para "Don't worry, we're"
	line "keeping it nice"
	cont "and safe, until we"
	cont "have use of it."

	para "We took yours too,"
	line "so don't bother"
	cont "searching your"
	cont "bag for it."

	para "Now, if you'll"
	line "excuse me, young"
	cont "lovebirds, I have"
	cont "more important"
	cont "business to attend"
	cont "to."

	para "<RIVAL>: You know"
	line "we're older than"
	cont "you, right?"

	para "Ariana: Shut up!"

	para "I'll give you and"
	line "your girlfriend"
	cont "matching black"
	cont "eyes if you keep"
	cont "it up!"

	para "Ugh, I'm done"
	line "here!"
	done

NowWhatText:
	text "Now what?"

	para "We need to get"
	line "out of here and"
	cont "find the wings!"
	done

DontSpeakText:
	text "Do not speak."

	para "I am here to"
	line "rescue you."

	para "My name is Koga."

	para "I am a member of"
	line "the Mahogany Ninja"
	cont "clan."

	para "At least I was,"
	line "until recently."

	para "When we allied"
	line "ourselves with the"
	cont "devils in black, I"
	cont "started to doubt"
	cont "our cause."

	para "Kidnapping teens"
	line "is where I draw"
	cont "the line."

	para "Come."

	para "And be careful."

	para "Members of the"
	line "clan will be all"
	cont "over."
	done

WedBetterGetGoingText:
	text ".................."

	para "We'd better get"
	line "going."
	done

DoorIsLockedText:
	text "The door is"
	line "locked…"
	done

DoorIsUnlockedText:
	text "The door is"
	line "unlocked."
	done

TeamRocketBaseJail_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  2, TEAM_ROCKET_BASE_B3F, 5

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  2, BGEVENT_READ, LockedDoor

	db 3 ; object events
	object_event  3,  5, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseJailRivalScript, EVENT_ROCKET_JAIL_RIVAL
	object_event  3, 16, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  3, 16, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
