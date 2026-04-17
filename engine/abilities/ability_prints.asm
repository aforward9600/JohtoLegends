; Gets our ability for the stats screen
CalcAbility_StatsScreen:
	; Preserve HL and BC
	push hl
	push bc

;	ld de, ENGINE_ABILITIES_OFF
;	farcall CheckEngineFlag
;	jr nc, .NoAbility

	; Target the relevant mon.
	ld hl, wTempMonSpecies
	ld a, [hl]
	ld bc, wTempMonCaughtAbility - wTempMonSpecies
	add hl, bc
	ld c, a
	call GetAbility
	pop bc
	pop hl
	ret

.NoAbility:
	ld a, NO_ABILITY
	pop bc
	pop hl
	ret

; Prints the ability for our stats screen
; Blended mix of code from Delta, MAE, and PC
PrintAbility:
	ld de, .AbilityString1
	hlcoord 1, 8
	call PlaceString
	call CalcAbility_StatsScreen
	ld hl, AbilityNames
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 4, 9
	call PlaceString
	call CalcAbility_StatsScreen
	push bc
	ld bc, AbilityDescriptions
	ld l, a
	ld h, 0
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop bc
	hlcoord 1, 10
	jp PlaceString

.AbilityString1:
	db "Ability:@"
INCLUDE "data/abilities/names.asm"
INCLUDE "data/abilities/descriptions.asm"

FarLoadAbilityName::
	ld a, b
Ability_LoadAbilityName:
    ld hl, AbilityNames
    call GetNthString
    ld d, h
    ld e, l
    ld hl, wStringBuffer1
.loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .loop
    ret

AnimateUserAbility::
	ldh a, [hBattleTurn]
	and a
	jr z, AnimatePlayerAbility
	jr AnimateEnemyAbility

AnimateOppAbility::
	ldh a, [hBattleTurn]
	and a
	jr z, AnimateEnemyAbility
AnimatePlayerAbility::
	ldh a, [hBattleTurn]
	and a
	jr z, .Animate
	call BattleCommand_SwitchTurnAbilities
	call .Animate
	jp BattleCommand_SwitchTurnAbilities

.Animate:
	xor a
	ld a, [wPlayerAbility]
	call Ability_LoadAbilityName
	ld d, 55
	jr AnimateAbility

AnimateEnemyAbility::
	ldh a, [hBattleTurn]
	and a
	jr nz, .Animate
	call BattleCommand_SwitchTurnAbilities
	call .Animate
	jp BattleCommand_SwitchTurnAbilities

.Animate
	xor a
	ld a, [wEnemyAbility]
	call Ability_LoadAbilityName
	ld d, 19
AnimateAbility:
	push de
	ld hl, wStringBuffer1
	ld de, wStringBufferBattle
	ld bc, 19
	call CopyBytes
	pop de
	ld a, d
	add 40
	ld e, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	call .SetupBox

	call .SetupWindow
	ld hl, rIE
	set LCD_STAT, [hl]

	ld a, LOW(rWX)
	ldh [hLCDCPointer], a
	xor a
	ldh [hWY], a
	ld a, $a7
	ldh [hWX], a

	call .SlideIn
	ld c, 60
	call DelayFrames
	call .SlideOut

	ld hl, rIE
	res LCD_STAT, [hl]
	ld a, 7
	ldh [hWX], a
	ld a, 144
	ldh [hWY], a
	xor a
	ldh [hLCDCPointer], a
	ld hl, wTilemap5RowBackup
	ld de, wTileMap
	ld bc, SCREEN_WIDTH * 5
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

.SetupBox:
	push de
	ld hl, wTileMap
	ld de, wTilemap5RowBackup
	ld bc, SCREEN_WIDTH * 5
	call CopyBytes
	hlcoord 0, 0
	lb bc, 3, 12
	call Textbox
	ldh a, [hBattleTurn]
	and a
	ld de, wBattleMonNick
	jr z, .got_name
	ld de, wEnemyMonNick
.got_name
	hlcoord 1, 1
	call PlaceString
	ld a, "'s"
	ld [bc], a
	ld de, wStringBufferBattle
	hlcoord 1, 3
	call PlaceString

	ld a, 3
	ldh [hBGMapMode], a
	ld c, 4
	call DelayFrames
	ld a, 4
	ldh [hBGMapMode], a
	ld c, 4
	call DelayFrames

	pop de
	ret

.SetupWindow:
	ld hl, wLYOverrides
	ld a, $a7
	ld bc, SCREEN_HEIGHT_PX
	jp ByteFill

.SlideIn:
	call DelayFrame
	ld c, 14
.SlideIn_Loop:
	ldh a, [rLY]
	cp $60
	jr nz, .SlideIn_Loop

	ld l, d
	ld h, HIGH(wLYOverrides)
	ld a, e
	sub d
	ld b, a
.SlideIn_Loop2:
	ld a, [hl]
	sub 8
	ld [hli], a
	dec b
	jr nz, .SlideIn_Loop2

	call DelayFrame
	dec c
	jr nz, .SlideIn_Loop
	ret

.SlideOut:
	call DelayFrame
	ld c, 14
.SlideOut_Loop:
	ldh a, [rLY]
	cp $60
	jr nz, .SlideOut_Loop

	ld l, d
	ld h, HIGH(wLYOverrides)
	ld a, e
	sub d
	ld b, a
.SlideOut_Loop2:
	ld a, [hl]
	add 8
	ld [hli], a
	dec b
	jr nz, .SlideOut_Loop2

	call DelayFrame
	dec c
	jr nz, .SlideOut_Loop
	ret
