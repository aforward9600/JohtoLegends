; constants
SPDSPDDV_PERFECT EQU $FF
HP_FIGHTING      EQU $CC
HP_FLYING        EQU $CD
HP_POISON        EQU $CE
HP_GROUND        EQU $CF
HP_ROCK          EQU $DC
HP_BUG           EQU $DD
HP_GHOST         EQU $DE
HP_STEEL         EQU $DF
HP_FIRE          EQU $EC
HP_WATER         EQU $ED
HP_GRASS         EQU $EE
HP_ELECTRIC      EQU $EF
HP_PSYCHIC       EQU $FC
HP_ICE           EQU $FD
HP_DARK          EQU $FE
HP_FAIRY         EQU $FF

SetMonHiddenPowerDVs:
	farcall SelectMonFromParty
	jp c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jp z, .egg

	call IsAPokemon
	jp c, .cancel

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1DVs
	call GetPartyLocation

;	ld c, l
;	ld b, h
;	farcall CheckShininess
;	jp c, .shiny

	ld a, [wBerryCafeBuffer]
	cp 1
	jr z, .HP_Fighting
	cp 2
	jr z, .HP_Flying
	cp 3
	jr z, .HP_Poison
	cp 4
	jr z, .HP_Ground
	cp 5
	jr z, .HP_Rock
	cp 6
	jr z, .HP_Bug
	cp 7
	jr z, .HP_Ghost
	cp 8
	jr z, .HP_Steel
	cp 9
	jr z, .HP_Fire
	cp 10
	jr z, .HP_Water
	cp 11
	jr z, .HP_Grass
	cp 12
	jr z, .HP_Electric
	cp 13
	jr z, .HP_Psychic
	cp 14
	jr z, .HP_Ice
	cp 15
	jr z, .HP_Dark
	; fallthrough
	ld a, HP_FAIRY
	jr .WriteDVs

.HP_Fighting
	ld a, HP_FIGHTING
	jr .WriteDVs

.HP_Flying
	ld a, HP_FLYING
	jr .WriteDVs

.HP_Poison
	ld a, HP_POISON
	jr .WriteDVs

.HP_Ground
	ld a, HP_GROUND
	jr .WriteDVs

.HP_Rock
	ld a, HP_ROCK
	jr .WriteDVs

.HP_Bug
	ld a, HP_BUG
	jr .WriteDVs

.HP_Ghost
	ld a, HP_GHOST
	jr .WriteDVs

.HP_Steel
	ld a, HP_STEEL
	jr .WriteDVs

.HP_Fire
	ld a, HP_FIRE
	jr .WriteDVs

.HP_Water
	ld a, HP_WATER
	jr .WriteDVs

.HP_Grass
	ld a, HP_GRASS
	jr .WriteDVs

.HP_Electric
	ld a, HP_ELECTRIC
	jr .WriteDVs

.HP_Psychic
	ld a, HP_PSYCHIC
	jr .WriteDVs

.HP_Ice
	ld a, HP_ICE
	jr .WriteDVs

.HP_Dark
	ld a, HP_DARK
.WriteDVs
	ld b, SPDSPDDV_PERFECT
	ld [hli], a
	ld [hl], b

	ld de, SFX_MASTER_BALL
	call PlaySFX
	call WaitSFX

	predef CalcMonStats

	ld hl, HiddenPowerDVsSetText
	jp PrintText

.egg
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX

	ld hl, EggSelectedText
	call PrintText
	call WaitPressAorB_BlinkCursor
.finish
	scf
	ret

.cancel
	ld hl, CancelText
	call PrintText
	jr .finish

.shiny
	ld hl, ShinyCafeText
	call PrintText
	jr .finish

EggSelectedText:
	text "Sorry, but an Egg"
	line "can't drink this."
	prompt

ShinyCafeText:
	text "I'm afraid we"
	line "cannot serve this"
	cont "#mon."

	para "It would alter the"
	line "#mon in"
	cont "unexpected ways."
	prompt

CancelText:
	text "Please come again"
	line "soon!"
	prompt

HiddenPowerDVsSetText:
	text "Enjoy your drink!"
	prompt

HiddenAbilityChange:
	farcall SelectMonFromParty
	jp c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jp z, .egg

	call IsAPokemon
	jp c, .cancel

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtAbility
	call GetPartyLocation

	ld a, [hl]
	cp 2
	jp z, .ChangeToFirstAbility
	ld a, 2
.AbilityChanged
	ld [hl], a
	ld hl, AbilityChanged2Text
	jp PrintText

.egg
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX

	ld hl, EggSelectedText
	call PrintText
	call WaitPressAorB_BlinkCursor
.finish
	scf
	ret

.cancel
	ld hl, CancelText
	call PrintText
	jr .finish

.ChangeToFirstAbility
	ld a, 0
	jr .AbilityChanged

AbilityChanged2Text:
	text "Your #mon's"
	line "ability has"
	cont "changed."
	prompt
