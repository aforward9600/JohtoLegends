BattleCommand_Present:
; present

	push bc
	push de
	farcall BattleCommand_Stab
	pop de
	pop bc
	ld a, [wTypeMatchup]
	and a
	jp z, AnimateFailedMovePresent
	ld a, [wAttackMissed]
	and a
	jp nz, AnimateFailedMovePresent

	push bc
	call BattleRandom
	ld b, a
	ld hl, PresentPower
	ld c, 0
.next
	ld a, [hli]
	cp -1
	jr z, .heal_effect
	cp b
	jr nc, .got_power
	inc c
	inc hl
	jr .next

.got_power
	ld a, c
	ld [wPresentPower], a
	farcall AnimateCurrentMoveEitherSide
	ld d, [hl]
	pop bc
	ret

.heal_effect
	pop bc
	ld a, 3
	ld [wPresentPower], a
	farcall AnimateCurrentMove
	call BattleCommand_SwitchTurn2
	ld hl, AICheckPlayerMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp_fn_pointer
	ld hl, AICheckEnemyMaxHP
.got_hp_fn_pointer
	ld a, BANK(AICheckPlayerMaxHP) ; aka BANK(AICheckEnemyMaxHP)
	rst FarCall
	jr c, .already_fully_healed

	ld hl, GetQuarterMaxHP
	call CallBattleCore2
	call BattleCommand_SwitchTurn2
	ld hl, RestoreHP
	call CallBattleCore2
	call BattleCommand_SwitchTurn2
	ld hl, RegainedHealthText
	call StdBattleTextbox
	call BattleCommand_SwitchTurn2
	call UpdateOpponentInParty
	jr .do_animation

.already_fully_healed
	call BattleCommand_SwitchTurn2
	farcall _CheckBattleScene
	jr nc, .do_animation
	farcall AnimateFailedMove
	ld hl, RefusedGiftText
	call StdBattleTextbox
.do_animation
	farcall EndMoveEffect
	ret

AnimateFailedMovePresent:
	farcall AnimateFailedMove
	ret

INCLUDE "data/moves/present_power.asm"
