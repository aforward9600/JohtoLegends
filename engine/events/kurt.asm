Kurt_PrintTextWhichApricorn:
	ld hl, .Text
	jp PrintText

.Text:
	; Which APRICORN should I use?
	text_far _WhichApricornText
	text_end

Kurt_PrintTextHowMany:
	ld hl, .Text
	jp PrintText

.Text:
	; How many should I make?
	text_far _HowManyShouldIMakeText
	text_end

SelectApricornForKurt:
	ret

Kurt_SelectApricorn:
	ret

Kurt_SelectQuantity:
	ret

PlaceApricornQuantity:
	ret

Kurt_GetQuantityOfApricorn:
	ret

Kurt_GiveUpSelectedQuantityOfSelectedApricorn:
	ret

Kurt_GetAddressOfApricornQuantity:
	ret

Kurt_GetRidOfItem:
	ret
