BattleCommand_Avalanche:
; avalanche
; Double damage if the user took damage this turn

; Only works if user goes second
    call CheckOpponentWentFirst
    ret z

; Did the opponent mon damage the user this turn?
    ld hl, wPlayerDamageTaken
    ldh a, [hBattleTurn]
    and a
    jr z, .ok
    ld hl, wEnemyDamageTaken
.ok
    ld a, [hli]
    or [hl]
    ret z

; Double damage, taken from Pursuit
    ld hl, wCurDamage + 1
    sla [hl]
    dec hl
    rl [hl]
    ret nc

    ld a, $ff
    ld [hli], a
    ld [hl], a
    ret
