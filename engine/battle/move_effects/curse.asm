BattleCommand_Curse:
; curse

	ld de, wBattleMonType1
	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld de, wEnemyMonType1
	ld bc, wEnemyStatLevels

.go

; Curse is different for Ghost-types.

	ld a, [de]
	cp GHOST
	jr z, .ghost
	inc de
	ld a, [de]
	cp GHOST
	jr z, .ghost

; If no stats can be increased, don't.

	call CheckNeutralGas
	jr z, .SkipContrary

	call GetUserAbility
	cp CONTRARY
	jr z, .Contrary

.SkipContrary
; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, .cantraise
	jr .raise

.Contrary
	ld a, [bc]
	cp 1
	jr nz, .raisecontrary

	inc bc
	ld a, [bc]
	cp 1
	jr nz, .raisecontrary
	jr .cantraise

.raise

; Raise Attack and Defense, and lower Speed.

	inc bc
	ld a, [bc]
	cp 1
	jr nz, .SkipNeutralGas
	call RaiseLowerSubEffect
	jr .ReconveneCurse

.raisecontrary
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .SkipNeutralGas
	call RaiseLowerSubEffect
	jr .ReconveneCurse

.SkipNeutralGas
	call RaiseLowerSubEffect
	call BattleCommand_SwitchTurn
	call BattleCommand_SpeedDown
	call BattleCommand_StatDownMessage
	call BattleCommand_SwitchTurn
.ReconveneCurse
	farcall AnimateAbilityStats
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_DefenseUp
	jp BattleCommand_StatUpMessage

.ghost

; Cut HP in half and put a curse on the opponent.

	call CheckHiddenOpponent
	jr nz, .failed

	call CheckSubstituteOpp
	jr nz, .failed

	call BattleCommand_CheckHit.FlyDigMoves
	jr nz, .failed

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CURSE, [hl]
	jr nz, .failed

	set SUBSTATUS_CURSE, [hl]
	call AnimateCurrentMove
	ld hl, GetHalfMaxHP
	call CallBattleCore
	ld hl, SubtractHPFromUser
	call CallBattleCore
	call UpdateUserInParty
	ld hl, PutACurseText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

.cantraise

; Can't raise either stat.

	ld b, ABILITY + 1
	call GetStatName
	call AnimateFailedMove
	ld hl, WontRiseAnymoreText
	jp StdBattleTextbox

RaiseLowerSubEffect:
	call BattleCommand_LowerSub
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call BattleCommand_RaiseSub
	farcall AnimateAbilityStatsLower
	ret
