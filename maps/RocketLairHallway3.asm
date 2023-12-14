	object_const_def
	const ROCKETLAIRHALLWAY3_RIVAL
	const ROCKETLAIRHALLWAY3_MIYAMOTO
	const ROCKETLAIRHALLWAY3_OFFICER

RocketLairHallway3_MapScripts:
	db 2 ; scene scripts
	scene_script .dummy0 ; SCENE_DEFAULT
	scene_script .dummy1 ; SCENE_FINISHED

	db 0 ; callback

.dummy0:
	end

.dummy1:
	end

RocketLairHallway3_Event1:
	applymovement PLAYER, Hallway3PlayerMovement1
	sjump RocketLairHallwayMiyamoto

RocketLairHallway3_Event2:
	applymovement PLAYER, Hallway3PlayerMovement2
	sjump RocketLairHallwayMiyamoto

RocketLairHallway3_Event3:
	applymovement PLAYER, Hallway3PlayerMovement3
	sjump RocketLairHallwayMiyamoto

RocketLairHallway3_Event4:
	applymovement PLAYER, Hallway3PlayerMovement4
RocketLairHallwayMiyamoto:
	applymovement PLAYER, Hallway3PlayerMovement5
	special FadeOutMusic
	pause 15
	opentext
	writetext IDidItText
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DracoMusicStart
	playmusic MUSIC_DAHLIA_ENCOUNTER
	sjump .AfterRivalMusic

.DracoMusicStart:
	playmusic MUSIC_RIVAL_ENCOUNTER
.AfterRivalMusic:
	turnobject ROCKETLAIRHALLWAY3_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext DidYouSeeText
	waitbutton
	closetext
	turnobject ROCKETLAIRHALLWAY3_RIVAL, UP
	turnobject PLAYER, UP
	pause 15
	opentext
	writetext CongratulationsKidText
	waitbutton
	closetext
	pause 20
	applymovement ROCKETLAIRHALLWAY3_MIYAMOTO, MiyamotoLeavesLairMovement
	disappear ROCKETLAIRHALLWAY3_MIYAMOTO
	turnobject ROCKETLAIRHALLWAY3_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext ThisIsItText
	waitbutton
	closetext
	pause 15
	applymovement ROCKETLAIRHALLWAY3_RIVAL, Hallway3PlayerMovement2
	turnobject PLAYER, UP
	applymovement ROCKETLAIRHALLWAY3_RIVAL, RivalLeavesHallway2Movement
	playsound SFX_EXIT_BUILDING
	disappear ROCKETLAIRHALLWAY3_RIVAL
	setevent EVENT_MADAME_BOSS_ROOM_SHERLES
	setevent EVENT_MADAME_BOSS_ROOM_RIVAL_2
	setscene SCENE_FINISHED
	pause 30
	special FadeOutMusic
	pause 30
	special RestartMapMusic
	end

RocketLairHallway3OfficerScript:
	jumptextfaceplayer RocketLairHallway3OfficerText

Hallway3PlayerMovement1:
	step UP
	step RIGHT
	step_end

Hallway3PlayerMovement2:
	step UP
	step_end

Hallway3PlayerMovement3:
	step UP
	step LEFT
	step_end

Hallway3PlayerMovement4:
	step UP
	step LEFT
	step LEFT
	step_end

Hallway3PlayerMovement5:
	step UP
	step UP
	step_end

MiyamotoLeavesLairMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

RivalLeavesHallway2Movement:
	step UP
	step UP
	step_end

IDidItText:
	text "<RIVAL>:…………………"
	line "I…"

	para "…I did it…"
	done

DidYouSeeText:
	text "<RIVAL>: Did you"
	line "see it?"

	para "I did it!"

	para "I defeated her!"
	done

CongratulationsKidText:
	text "Miyamoto: I"
	line "thought you were"
	cont "familiar."

	para "To think you were"
	line "that little kid"
	cont "from back then."

	para "You really have"
	line "become stronger"
	cont "than I expected."

	para "<RIVAL>: Yeah,"
	line "yeah."

	para "Now that I've"
	line "beaten you, give"
	cont "me the key!"

	para "Miyamoto: What"
	line "key?"

	para "<RIVAL>: Don't play"
	line "dumb!"

	para "The key to Lugia"
	line "and Ho-Oh's tanks!"

	para "Miyamoto: Oh, that"
	line "key."

	para "Sorry, don't have"
	line "it."

	para "<RIVAL>: What? You"
	line "don't have it?"

	para "What do you mean?"

	para "Aren't you the"
	line "boss here?"

	para "Miyamoto: Oh, no."

	para "You must be"
	line "mistaken."

	para "I'm not the boss."

	para "I'm merely a"
	line "manager of sorts."

	para "The boss likes to"
	line "keep her identity"
	cont "a mystery."

	para "She's through that"
	line "door there if"

	para "you're so eager to"
	line "meet her."

	para "Don't say I didn't"
	line "warn you though."

	para "She may hate"
	line "#mon, but she's"
	cont "more than willing"
	cont "to use them."

	para "Now, if you'll"
	line "excuse me, I have"
	cont "important business"
	cont "elsewhere."

	para "This time, I'll be"
	line "far away from"
	cont "here, so luckily,"
	cont "I won't be seeing"
	cont "you again."

	para "Later."
	done

ThisIsItText:
	text "…Well, this is it…"

	para "We have to do"
	line "this…"

	para "For their sakes…"

	para "I'm going in."

	para "Follow my lead."
	done

RocketLairHallway3OfficerText:
	text "Have you ever seen"
	line "so many gaudy"
	cont "Persian statues?"

	para "Someone really"
	line "needed an interior"
	cont "decorator!"
	done

RocketLairHallway3_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 15, ROCKET_LAIR_HALLWAY_2, 3
	warp_event  5, 15, ROCKET_LAIR_HALLWAY_2, 4
	warp_event  4,  0, ROCKET_LAIR_BOSS_ROOM, 1
	warp_event  5,  0, ROCKET_LAIR_BOSS_ROOM, 2

	db 4 ; coord_events
	coord_event 3,  6, SCENE_DEFAULT, RocketLairHallway3_Event1
	coord_event 4,  6, SCENE_DEFAULT, RocketLairHallway3_Event2
	coord_event 5,  6, SCENE_DEFAULT, RocketLairHallway3_Event3
	coord_event 6,  6, SCENE_DEFAULT, RocketLairHallway3_Event4

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCKET_LAIR_HALLWAY_3_RIVAL
	object_event  5,  2, SPRITE_MIYAMOTO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCKET_LAIR_HALLWAY_3_MIYAMOTO
	object_event  4,  9, SPRITE_OFFICER_JENNY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketLairHallway3OfficerScript, EVENT_HOOH_LUGIA_ROOM_OFFICER
