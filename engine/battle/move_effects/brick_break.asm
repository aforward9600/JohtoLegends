BattleCommand_BreakScreens:
; breakscreens

	ld hl, wPlayerScreens
	ld de, wPlayerWrapCount
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyScreens
	ld de, wEnemyWrapCount
	jr z, .got_screens_wrap
.got_screens_wrap
	bit SCREENS_LIGHT_SCREEN, [hl]
	jr z, .no_light_screen
	res SCREENS_LIGHT_SCREEN, [hl]
	ld hl, BrokeLightScreenText
	call StdBattleTextbox
.no_light_screen

	ld hl, wPlayerScreens
	ld de, wPlayerWrapCount
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyScreens
	ld de, wEnemyWrapCount
	jr z, .got_screens_wrap_2
.got_screens_wrap_2
	bit SCREENS_REFLECT, [hl]
	jr z, .no_reflect
	res SCREENS_REFLECT, [hl]
	ld hl, BrokeReflectText
	push de
	call StdBattleTextbox
	pop de
.no_reflect

	ld a, [de]
	and a
	ret z
	xor a
	ld [de], a
	ld hl, ReleasedByText
	jp StdBattleTextbox
