BattleCommand_AquaRing:
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_AQUA_RING, [hl]
	jr nz, .failed
	set SUBSTATUS_AQUA_RING, [hl]
	farcall AnimateCurrentMove
	ld hl, SurroundedByWaterText
	jp StdBattleTextbox

.failed
	farcall AnimateFailedMove
	farcall PrintButItFailed
	ret
