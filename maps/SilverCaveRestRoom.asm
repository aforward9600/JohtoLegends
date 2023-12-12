	object_const_def ; object_event constants
	const SILVERCAVERESTROOM_FIRE

SilverCaveRestRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtSilverFire:
	jumptext MtSilverFireText

SilverCaveSleepingBag:
	jumptext SilverCaveSleepingBagText

SilverCaveRadio:
	opentext
	writetext SilverCaveRadioText
	waitbutton
	closetext
	pause 30
	playsound SFX_PECK
	pause 30
	opentext
	writetext SilverCaveRadioText2
	waitbutton
	closetext
	pause 40
	playsound SFX_PECK
	pause 30
	opentext
	writetext SilverCaveRadioText3
	waitbutton
	closetext
	end

MtSilverFireText:
	text "This fire was lit"
	line "recently."
	done

SilverCaveSleepingBagText:
	text "Seems like it was"
	line "recently used."
	done

SilverCaveRadioText:
	text "There is a tape"
	line "player here."

	para "There are a few"
	line "tapes."
	done

SilverCaveRadioText2:
	text "Day XX: I finally"
	line "made it to Mt."
	cont "Silver."

	para "It wasn't easy to"
	line "slip past security"
	cont "with the embargo"
	cont "up, but it will be"
	cont "worth it."

	para "I'm recording these"
	line "and transmitting"
	cont "them to you, boss."

	para "If something were"
	line "to happen to me,"

	para "tell Jessie I love"
	line "her, and that I'm"
	cont "sorry."

	para "My mission is to"
	line "find Mew."
	
	para "I was there on the"
	line "original mission,"
	cont "and I caught a"
	cont "glimpse of it."

	para "There have been"
	line "Mew sightings here"
	cont "on the mountain."

	para "This will be the"
	line "greatest mission"
	cont "of my life."

	para "I cannot fail."

	para "This was the final"
	line "mission she gave"
	cont "me."

	para "I'll report back"
	line "with news."

	para "Day XX: I saw it"
	line "up on a ridge"
	cont "yesterday, but it"
	cont "vanished before I"
	cont "could catch it."

	para "A snowstorm made"
	line "it impossible to"
	cont "get closer."

	para "Mew had to have"
	line "created the storm"
	cont "to keep me from"
	cont "it."

	para "It will be ours."

	para "Day XX: Another"
	line "failed attempt."

	para "It retreats to a"
	line "cave up on the"
	cont "ridge, but the"
	cont "cave seems to move"
	cont "around."

	para "It's in a different"
	line "location each time"
	cont "I see it, and it"
	cont "becomes a wall"
	cont "when I get close."

	para "It's taunting me."

	para "Mew must be ours."

	para "Day XX: This time,"
	line "I nearly fell off"
	cont "a cliff while I"
	cont "was chasing it."

	para "It put that cliff"
	line "there, I know it."

	para "I'm so close to"
	line "catching it."

	para "I'll bring it back,"
	line "or die trying."

	para "Even if I freeze,"
	line "I won't give up."
	done

SilverCaveRadioText3:
	text "The tapes have"
	line "ended."
	done

SilverCaveRestRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  5, SILVER_CAVE_ROOM_2, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2,  2, BGEVENT_READ, SilverCaveSleepingBag
	bg_event  2,  5, BGEVENT_READ, SilverCaveRadio

	db 1 ; object events
	object_event  5,  3, SPRITE_FIRE, SPRITEMOVEDATA_0C, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MtSilverFire, -1
