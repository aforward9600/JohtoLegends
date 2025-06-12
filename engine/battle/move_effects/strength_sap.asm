BattleCommand_StrengthSap:
; strength sap

; get opponents attack stat
    ld hl, wBattleMonAttack
    ldh a, [hBattleTurn]
    and a
    jr nz, .got_target
    ld hl, wEnemyMonAttack
.got_target
    ld b, [hl]
    inc hl
    ld c, [hl]

; lower opponents attack
    push bc
    call StrengthSap_AttackDown
    and a
    jr nz, .fail
    farcall AnimateCurrentMove
    farcall BattleCommand_StatDownMessage
    jr .restorehp
.fail
    farcall BattleCommand_StatDownFailText
    pop bc
    ret

.restorehp
; restore HP by value of opponents attack before it was lowered
    pop bc
    call BattleCommand_SwitchTurn2
    ld hl, RestoreHP
    ld a, BANK("Battle Core")
    rst FarCall
    call BattleCommand_SwitchTurn2
    call UpdateUserInParty
    call RefreshBattleHuds
    ld hl, RegainedHealthText
    jp StdBattleTextbox

StrengthSap_AttackDown:
; Useful because Strength Sap ignores substitute

    ld a, ATTACK
    ld [wLoweredStat], a

; check mist
    ld a, BATTLE_VARS_SUBSTATUS4_OPP
    call GetBattleVar
    bit SUBSTATUS_MIST, a
    jp nz, .mist

	call CheckNeutralGas
	jr z, .SkipHyperCutter
	call GetUserAbility
	cp MOLD_BREAKER
	jr z, .SkipHyperCutter
	call GetTargetAbility
	cp HYPER_CUTTER
	jr z, .AttackDropSkip
	cp CLEAR_BODY
	jr z, .AttackDropSkip
.SkipHyperCutter
    ld hl, wEnemyStatLevels
    ldh a, [hBattleTurn]
    and a
    jr z, .GetStatLevel
    ld hl, wPlayerStatLevels

.GetStatLevel:
; Attempt to lower the stat.
    ld a, [wLoweredStat]
    and $f
    ld c, a
    ld b, 0
    add hl, bc
    ld b, [hl]
    dec b
    jp z, .CantLower

    ld a, [wAttackMissed]
    and a
    jr nz, .failed

    ld a, [wEffectFailed]
    and a
    jr nz, .failed

    ld [hl], b
    push hl
    ld hl, wEnemyMonAttack + 1
    ld de, wEnemyStats
    ldh a, [hBattleTurn]
    and a
    jr z, .DoEnemy
    ld hl, wBattleMonAttack + 1
    ld de, wPlayerStats
.DoEnemy
    call TryLowerStat2
    pop hl
    jr z, .CouldntLower

.Hit
    xor a
    ld [wFailedMessage], a
    ret

.CouldntLower
    inc [hl]
.CantLower
    ld a, 3
    ld [wFailedMessage], a
    ld a, 1
    ld [wAttackMissed], a
    ret

.failed
    ld a, 1
    ld [wFailedMessage], a
    ld [wAttackMissed], a
    ret

.mist
    ld a, 2
    ld [wFailedMessage], a
    ld a, 1
    ld [wAttackMissed], a
    ret

.AttackDropSkip
	farcall AnimateCurrentMove
	jp BattleCommand_StrengthSap.restorehp