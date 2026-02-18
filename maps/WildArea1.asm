	object_const_def ; object_event constants
	const WILDAREA1_BAOBA

WildArea1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BaobaScript:
	jumptextfaceplayer BaobaText

WildArea1Sign:
	jumptext WildArea1SignText

BaobaText:
	text "Oh, hello there!"

	para "My name is Baoba."

	para "I run the Safari"
	line "Zone in Fuchsia"
	cont "City."

	para "I was able to"
	line "leave Kanto for a"
	cont "little vacation"
	cont "here in Johto."

	para "This area would be"
	line "perfect for a"
	cont "Safari Zone, wou-"
	cont "ldn't you agree?"

	para "To tell you the"
	line "truth, the Safari"
	cont "Zone was the"
	cont "target of vandals"
	cont "recently, and I've"
	cont "had some bouts of"
	cont "depression as a"
	cont "result."

	para "I came here to"
	line "clear my head"
	cont "while my employees"
	cont "fix up the Zone."

	para "My goal was to fi-"
	line "nd someplace that"
	cont "could be a second"
	cont "Safari Zone, and"
	cont "I'd say I found"
	cont "it."
	
	para "With a little bit"
	line "of polish, this"
	cont "wilderness could"
	cont "be a haven for"
	cont "#mon and train-"
	cont "ers."

	para "Maybe someday I"
	line "can fulfill my"
	cont "new dream of a"
	cont "Johto Safari Zone."
	done

WildArea1SignText:
	text "Area 1"

	para "Field #mon"
	line "a-plenty."
	done

WildArea1_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 4, 10, BGEVENT_READ, WildArea1Sign

	db 1 ; object events
	object_event  6,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BaobaScript, -1
