	object_const_def ; object_event constants
	const GOLDCRYSTALHOUSE_MOM
	const GOLDCRYSTALHOUSE_NEIGHBOR
	const GOLDCRYSTALHOUSE_CRYSTAL ; if male
	const GOLDCRYSTALHOUSE_GOLD ; if female

GoldCrystalHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .Epilogue ; SCENE_DEFAULT
	scene_script .Dummy0   ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HidePlayerMtSilver

.Epilogue:
	prioritysjump .EpilogueScript
	end

.EpilogueScript:
	opentext
	writetext EpilogueNeighborText
	waitbutton
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .FemaleEpilogue
	writetext RivalEpilogueText
	waitbutton
	closetext
	pause 15
	playsound SFX_ENTER_DOOR
	appear GOLDCRYSTALHOUSE_GOLD
	applymovement GOLDCRYSTALHOUSE_GOLD, GoldCrystalWalksDown
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, GOLDCRYSTALHOUSE_MOM, 15
	turnobject GOLDCRYSTALHOUSE_GOLD, LEFT
	applymovement GOLDCRYSTALHOUSE_MOM, GoldCrystalHouseMomMovement1
	opentext
	writetext OhGoldText
	waitbutton
	writetext PokegearText
	waitbutton
	closetext
	pause 15
	playmusic MUSIC_NEW_BARK_TOWN
	applymovement GOLDCRYSTALHOUSE_GOLD, GoldCrystalWalksOut
	playsound SFX_EXIT_BUILDING
	disappear GOLDCRYSTALHOUSE_GOLD
	pause 15
	applymovement GOLDCRYSTALHOUSE_MOM, GoldCrystalHouseMomMovement2
	pause 15
	opentext
	writetext PlayerText
	waitbutton
	closetext
	pause 60
	setscene SCENE_FINISHED
	special FadeBlackQuickly
	applymovement PLAYER, GoldCrystalPlayerAppears
	credits
	return

.FemaleEpilogue:
	writetext PlayerEpilogueText
	waitbutton
	closetext
	pause 15
	playsound SFX_ENTER_DOOR
	appear GOLDCRYSTALHOUSE_CRYSTAL
	applymovement GOLDCRYSTALHOUSE_CRYSTAL, GoldCrystalWalksDown
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, GOLDCRYSTALHOUSE_MOM, 15
	turnobject GOLDCRYSTALHOUSE_CRYSTAL, LEFT
	applymovement GOLDCRYSTALHOUSE_MOM, GoldCrystalHouseMomMovement1
	opentext
	writetext OhCrystalText
	waitbutton
	writetext PokegearText
	waitbutton
	closetext
	pause 15
	playmusic MUSIC_NEW_BARK_TOWN
	applymovement GOLDCRYSTALHOUSE_CRYSTAL, GoldCrystalWalksOut
	playsound SFX_EXIT_BUILDING
	disappear GOLDCRYSTALHOUSE_CRYSTAL
	pause 15
	applymovement GOLDCRYSTALHOUSE_MOM, GoldCrystalHouseMomMovement2
	pause 15
	opentext
	writetext RivalText
	waitbutton
	closetext
	pause 60
	setscene SCENE_FINISHED
	special FadeBlackQuickly
	credits
	applymovement PLAYER, GoldCrystalPlayerAppears
	return

.Dummy0:
	end

.HidePlayerMtSilver:
	changeblock 6, 4, $31
	changeblock 6, 2, $32
	return

HidePlayerMtSilverMovement:
	hide_person
	step_end

EpilogueNeighborText:
	text "Neighbor: Wow!"

	para "That was an"
	line "incredible story!"

	para "Who knew there was"
	line "a Champion and a"
	cont "hero living in our"
	cont "town?"

	para "You both are such"
	line "inspirations!"
	done

RivalEpilogueText:
	text "<RIVAL>: Oh,"
	line "you're too kind!"

	para "It was quite the"
	line "journey, and I was"
	cont "lucky to share it"
	cont "with the one I"
	cont "loved."

	para "Those days are"
	line "long gone, and I'm"
	cont "simply enjoying my"
	cont "time raising Gold."
	done

PlayerEpilogueText:
	text "<PLAYER>: Oh,"
	line "you're too kind!"

	para "It was quite the"
	line "journey, and I was"
	cont "lucky to share it"
	cont "with the one I"
	cont "loved."

	para "Those days are"
	line "long gone, and I'm"
	cont "simply enjoying my"
	cont "time raising Kris."
	done

OhGoldText:
	text "Oh, Gold…! Our"
	line "neighbor, Prof."

	para "Elm, was looking"
	line "for you."
	done

OhCrystalText:
	text "Oh, Kris…! Our"
	line "neighbor, Prof."

	para "Elm, was looking"
	line "for you."
	done

PokegearText:
	text "He said he wanted"
	line "you to do some-"
	cont "thing for him."

	para "Oh! I almost for-"
	line "got! Your #mon"

	para "Gear is back from"
	line "the repair shop."

	para "Here you go!"

	para "#mon Gear, or"
	line "just #Gear."

	para "It's essential if"
	line "you want to be a"
	cont "good trainer."

	para "By the way, do you"
	line "know how to use"
	cont "the Phone?"

	para "I'll read the"
	line "instructions."

	para "Turn the #Gear"
	line "on and select the"
	cont "Phone icon."

	para "The numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"

	para "Prof.Elm is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done

PlayerText:
	text "<RIVAL>: ………………"

	para "…<PLAYER>…"

	para "…If only you were"
	line "still here…"

	para "…You'd be proud of"
	line "our child…"

	para "…I know it…"
	done

RivalText:
	text "<PLAYER>: ………………"

	para "…<RIVAL>…"

	para "…If only you were"
	line "still here…"

	para "…You'd be proud of"
	line "our child…"

	para "…I know it…"
	done

GoldCrystalWalksDown:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

GoldCrystalHouseMomMovement1:
	step RIGHT
	step_end

GoldCrystalWalksOut:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldCrystalHouseMomMovement2:
	step DOWN
	step_end

GoldCrystalPlayerAppears:
	show_person
	step_end

GoldCrystalHouse_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  0, SPRITE_CRYSTAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EPILOGUE_CRYSTAL
	object_event  9,  0, SPRITE_GOLD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EPILOGUE_GOLD
