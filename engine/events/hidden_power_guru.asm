HiddenPowerGuru:
	ld hl, Text_HiddenPowerGuyQuestion
	call PrintText
	call YesNoBox
	jr c, .cancel

	ld hl, Text_HiddenPowerGuyWhichMon
	call PrintText
	call JoyWaitAorB

	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	call IsAPokemon
	jr c, .no_mon

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1DVs
	call GetPartyLocation
	ld b, h
	ld c, l
	farcall GetHiddenPowerType
	ld a, e
	ld [wNamedObjectIndexBuffer], a
	predef GetTypeName

	ld hl, Text_HiddenPowerGuyAnswer
	jp PrintText

.cancel
	ld hl, Text_HiddenPowerGuyCancel
	jp PrintText

.egg
	ld hl, Text_HiddenPowerGuyEgg
	jp PrintText

.no_mon
	ld hl, Text_HiddenPowerGuyNoMon
	jp PrintText

Text_HiddenPowerGuyQuestion:
	text_far _HiddenPowerGuyQuestion
	text_end

Text_HiddenPowerGuyWhichMon:
	text_far _HiddenPowerGuyWhichMon
	text_end

Text_HiddenPowerGuyAnswer:
	text_far _HiddenPowerGuyAnswer
	text_end
	
Text_HiddenPowerGuyEgg:
	text_far _HiddenPowerGuyEgg
	text_end

Text_HiddenPowerGuyCancel:
	text_far _HiddenPowerGuyCancel
	text_end

Text_HiddenPowerGuyNoMon:
	text_far _HiddenPowerGuyNoMon
	text_end
