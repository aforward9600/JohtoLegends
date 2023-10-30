	object_const_def ; object_event constants
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd picturebookshelf

WardensGranddaughterText1:
	text "My father is the"
	line "Safari Zone"
	cont "Warden."

	para "At least he was…"

	para "The vandalism of"
	line "the Safari Zone"
	cont "took a toll on his"
	cont "mental state……"

	para "He went to Johto"
	line "a while back to"
	cont "clear his mind."

	para "He had enough"
	line "money to get to"
	cont "Johto, even with"
	cont "the embargo up."
	done

WardensGranddaughterText2:
	text "I hope he's doing"
	line "well."

	para "I haven't heard"
	line "from him in a"
	cont "while…"
	done

WardenPhotoText:
	text "It's a photo of a"
	line "grinning old man"

	para "who's surrounded"
	line "by #mon."
	done

SafariZonePhotoText:
	text "It's a photo of a"
	line "huge grassy plain"

	para "with rare #mon"
	line "frolicking in it."
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
