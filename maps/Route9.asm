	object_const_def ; object_event constants
	const ROUTE9_BIKER1
	const ROUTE9_DELINQUENT1
	const ROUTE9_ROUGHNECK1
	const ROUTE9_BIKER2
	const ROUTE9_DELINQUENT2
	const ROUTE9_ROUGHNECK2

Route9_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBikerAl:
	trainer BIKER, AL, EVENT_BEAT_BIKER_AL, BikerAlSeenText, BikerAlBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerAlAfterBattleText
	waitbutton
	closetext
	end

TrainerDelinquentMarcy:
	trainer DELINQUENT, MARCY, EVENT_BEAT_DELINQUENT_MARCY, DelinquentMarcySeenText, DelinquentMarcyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentMarcyAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdRuss:
	trainer SUPER_NERD, RUSS, EVENT_BEAT_SUPER_NERD_RUSS, SuperNerdRussSeenText, SuperNerdRussBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdRussAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerAntonio:
	trainer BIKER, ANTONIO, EVENT_BEAT_BIKER_ANTONIO, BikerAntonioSeenText, BikerAntonioBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerAntonioAfterBattleText
	waitbutton
	closetext
	end

TrainerDelinquentMakoto:
	trainer DELINQUENT, MAKOTO, EVENT_BEAT_DELINQUENT_MAKOTO, DelinquentMakotoSeenText, DelinquentMakotoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentMakotoAfterBattleText
	waitbutton
	closetext
	end

TrainerRoughneckCarter:
	trainer ROUGHNECK, CARTER_ROUGHNECK, EVENT_BEAT_ROUGHNECK_CARTER, RoughneckCarterSeenText, RoughneckCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckCarterAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

BikerAlSeenText:
	text "You can get some"
	line "sick jumps with"
	cont "these ledges!"
	done

BikerAlBeatenText:
	text "Jump!"
	done

BikerAlAfterBattleText:
	text "Of course, I've"
	line "already trashed"
	cont "three bikes on"
	cont "these ledges."

	para "The next one will"
	line "come out of my"
	cont "salary…"
	done

DelinquentMarcySeenText:
	text "I hate it here!"

	para "The rocks are"
	line "killing my legs!"
	done

DelinquentMarcyBeatenText:
	text "Ahhhh!"
	done

DelinquentMarcyAfterBattleText:
	text "I just wanna go"
	line "home!"
	done

SuperNerdRussSeenText:
	text "Leave me alone!"
	done

SuperNerdRussBeatenText:
	text "You're not one of"
	line "them!"
	done

SuperNerdRussAfterBattleText:
	text "Sorry about that."

	para "I'm researching why"
	line "the trees still"
	cont "haven't recovered"
	cont "from Winter yet."

	para "It's possible that"
	line "pollution from the"
	cont "Feds has prevented"
	cont "the leaves from"
	cont "growing."
	done

BikerAntonioSeenText:
	text "Get lost, kid!"

	para "That #mon at"
	line "the Power Plant"
	cont "is mine!"
	done

BikerAntonioBeatenText:
	text "No! My #mon!"
	done

BikerAntonioAfterBattleText:
	text "Ah, who am I"
	line "kidding?"

	para "I couldn't catch it"
	line "even if I tried…"
	done

DelinquentMakotoSeenText:
	text "Rock Tunnel is so"
	line "boring!"
	done

DelinquentMakotoBeatenText:
	text "This is boring"
	line "too…"
	done

DelinquentMakotoAfterBattleText:
	text "There's nothing to"
	line "do around here…"
	done

RoughneckCarterSeenText:
	text "What're ya doin'"
	line "here?"
	done

RoughneckCarterBeatenText:
	text "Dang it!"
	done

RoughneckCarterAfterBattleText:
	text "There's an old"
	line "Power Plant up"
	cont "ahead that we shut"
	cont "down."

	para "Apparently, there's"
	line "a strong #mon"
	cont "there, but we're"
	cont "not stupid enough"
	cont "to go there."
	done

Route9SignText:
	text "Route 9"

	para "Cerulean City -"
	line "Rock Tunnel"
	done

Route9_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	db 6 ; object events
	object_event 23, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBikerAl, -1
	object_event 39,  8, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerDelinquentMarcy, -1
	object_event 11,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerSuperNerdRuss, -1
	object_event 12, 15, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBikerAntonio, -1
	object_event 28,  3, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerDelinquentMakoto, -1
	object_event 36, 15, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerRoughneckCarter, -1
