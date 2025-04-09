Core2_NewTurnEndEffects:
	call HandleLeftovers
	call HandleMysteryberry
	call HandleDefrost
	call HandleSafeguard
	call HandleScreens
	call HandleRoost
	ret

HandleLeftovers:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .DoEnemyFirst
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.DoEnemyFirst:
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn
.do_it

	; Aqua Ring heals 1/16 of max HP every turn if active
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVar
	bit SUBSTATUS_AQUA_RING, a
	jr z, .aqua_ring_done
	ld hl, AQUA_RING
	call GetMoveIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	call .do_recovery
	; fallthrough
.aqua_ring_done
	callfar GetUserItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld a, b
	cp HELD_LEFTOVERS
	ret nz

.do_recovery
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonHP

.got_hp
; Don't restore if we're already at max HP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	jr nz, .restore
	ld a, [hl]
	cp c
	ret z

.restore
	farcall GetSixteenthMaxHP
	farcall SwitchTurnCore
	farcall RestoreHP
	farcall SwitchTurnCore
	ld hl, RecoveredWithSomethingText
	jp StdBattleTextbox

HandleMysteryberry:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .DoEnemyFirst
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.DoEnemyFirst:
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn

.do_it
	callfar GetUserItem
	ld a, b
	cp HELD_RESTORE_PP
	jr nz, .quit
	ld hl, wPartyMon1PP
	ld a, [wCurBattleMon]
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, wPartyMon1Moves
	ld a, [wCurBattleMon]
	call GetPartyLocation
	ldh a, [hBattleTurn]
	and a
	jr z, .wild
	ld de, wWildMonPP
	ld hl, wWildMonMoves
	ld a, [wBattleMode]
	dec a
	jr z, .wild
	ld hl, wOTPartyMon1PP
	ld a, [wCurOTMon]
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, wOTPartyMon1Moves
	ld a, [wCurOTMon]
	call GetPartyLocation

.wild
	ld c, $0
.loop
	ld a, [hl]
	and a
	jr z, .quit
	ld a, [de]
	and PP_MASK
	jr z, .restore
	inc hl
	inc de
	inc c
	ld a, c
	cp NUM_MOVES
	jr nz, .loop

.quit
	ret

.restore
	; lousy hack
	ld a, [hl]
	push hl
	call GetMoveIndexFromID
	ld a, h
	if HIGH(SKETCH)
		cp HIGH(SKETCH)
	else
		and a
	endc
	ld a, l
	pop hl
	ld b, 5
	jr nz, .not_sketch
	cp LOW(SKETCH)
	jr nz, .not_sketch
	ld b, 1
.not_sketch
	ld a, [de]
	add b
	ld [de], a
	push bc
	push bc
	ld a, [hl]
	ld [wTempByteValue], a
	ld de, wBattleMonMoves - 1
	ld hl, wBattleMonPP
	ldh a, [hBattleTurn]
	and a
	jr z, .player_pp
	ld de, wEnemyMonMoves - 1
	ld hl, wEnemyMonPP
.player_pp
	inc de
	pop bc
	ld b, 0
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	pop de
	pop bc

	ld a, [wTempByteValue]
	cp [hl]
	jr nz, .skip_checks
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerSubStatus5]
	jr z, .check_transform
	ld a, [wEnemySubStatus5]
.check_transform
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .skip_checks
	ld a, [de]
	add b
	ld [de], a
.skip_checks
	callfar GetUserItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	xor a
	ld [hl], a
	farcall GetPartymonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .consume_item
	ld a, [wBattleMode]
	dec a
	jr z, .skip_consumption
	farcall GetOTPartymonItem

.consume_item
	xor a
	ld [hl], a

.skip_consumption
	call GetItemName
	farcall SwitchTurnCore
	farcall ItemRecoveryAnim
	farcall SwitchTurnCore
	ld hl, BattleText_UserRecoveredPPUsing
	jp StdBattleTextbox

HandleDefrost:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .enemy_first
	call .do_player_turn
	jr .do_enemy_turn

.enemy_first
	call .do_enemy_turn
.do_player_turn
	ld a, [wBattleMonStatus]
	bit FRZ, a
	ret z

	ld a, [wPlayerJustGotFrozen]
	and a
	ret nz

	call BattleRandom
	cp 10 percent
	ret nc
	xor a
	ld [wBattleMonStatus], a
	ld a, [wCurBattleMon]
	ld hl, wPartyMon1Status
	call GetPartyLocation
	ld [hl], 0
	call UpdateBattleHuds
	call SetEnemyTurn
	ld hl, DefrostedOpponentText
	jp StdBattleTextbox

.do_enemy_turn
	ld a, [wEnemyMonStatus]
	bit FRZ, a
	ret z
	ld a, [wEnemyJustGotFrozen]
	and a
	ret nz
	call BattleRandom
	cp 10 percent
	ret nc
	xor a
	ld [wEnemyMonStatus], a

	ld a, [wBattleMode]
	dec a
	jr z, .wild
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	call GetPartyLocation
	ld [hl], 0
.wild

	call UpdateBattleHuds
	call SetPlayerTurn
	ld hl, DefrostedOpponentText
	jp StdBattleTextbox

HandleSafeguard:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .player1
	call .CheckPlayer
	jr .CheckEnemy

.player1
	call .CheckEnemy
.CheckPlayer:
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret z
	ld hl, wPlayerSafeguardCount
	dec [hl]
	ret nz
	res SCREENS_SAFEGUARD, a
	ld [wPlayerScreens], a
	xor a
	jr .print

.CheckEnemy:
	ld a, [wEnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret z
	ld hl, wEnemySafeguardCount
	dec [hl]
	ret nz
	res SCREENS_SAFEGUARD, a
	ld [wEnemyScreens], a
	ld a, $1

.print
	ldh [hBattleTurn], a
	ld hl, BattleText_SafeguardFaded
	jp StdBattleTextbox

HandleScreens:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .Both
	call .CheckPlayer
	jr .CheckEnemy

.Both:
	call .CheckEnemy

.CheckPlayer:
	call SetPlayerTurn
	ld de, .Your
	call .Copy
	ld hl, wPlayerScreens
	ld de, wPlayerLightScreenCount
	jr .TickScreens

.CheckEnemy:
	call SetEnemyTurn
	ld de, .Enemy
	call .Copy
	ld hl, wEnemyScreens
	ld de, wEnemyLightScreenCount

.TickScreens:
	bit SCREENS_LIGHT_SCREEN, [hl]
	call nz, .LightScreenTick
	bit SCREENS_REFLECT, [hl]
	call nz, .ReflectTick
	ret

.Copy:
	ld hl, wStringBuffer1
	jp CopyName2

.Your:
	db "Your@"
.Enemy:
	db "Enemy@"

.LightScreenTick:
	ld a, [de]
	dec a
	ld [de], a
	ret nz
	res SCREENS_LIGHT_SCREEN, [hl]
	push hl
	push de
	ld hl, BattleText_MonsLightScreenFell
	call StdBattleTextbox
	pop de
	pop hl
	ret

.ReflectTick:
	inc de
	ld a, [de]
	dec a
	ld [de], a
	ret nz
	res SCREENS_REFLECT, [hl]
	ld hl, BattleText_MonsReflectFaded
	jp StdBattleTextbox

HandleRoost:
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .player1
	call .CheckPlayer
	jr .CheckEnemy

.player1
	call .CheckEnemy
.CheckPlayer:
	ld a, [wPlayerSubStatus5]
	res SUBSTATUS_ROOSTING, a
	ld [wPlayerSubStatus5], a
	ret
	
.CheckEnemy:
	ld a, [wEnemySubStatus5]
	res SUBSTATUS_ROOSTING, a
	ld [wEnemySubStatus5], a
	ret