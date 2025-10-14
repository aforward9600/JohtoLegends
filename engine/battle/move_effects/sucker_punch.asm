BattleCommand_SuckerPunch:
	call CheckOpponentWentFirst2
	jr nz, .failed

	; Now we know that the opponent did pick a move, because otherwise they'd
	; have moved first.
	farcall BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	push af
	farcall BattleCommand_SwitchTurn
	pop af
	and a
	ret nz
.failed
	farcall AnimateFailedMove
	farcall TryPrintButItFailed
	farcall EndMoveEffect
	ret
