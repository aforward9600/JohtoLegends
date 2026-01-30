BattleCommand_ShellSmash:
; shellsmash

	call GetUserAbility
	cp CONTRARY
	jr z, .ContraryDefense

	call GetStatsExtra
	inc bc
	ld a, [bc]
	cp 1
	jr nz, .raisedefense

	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp 1
	jr z, .SkipDefense
	jr .raisedefense

.ContraryDefense
	call GetStatsExtra
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raisedefense

	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .SkipDefense

.raisedefense
	farcall BattleCommand_LowerSub
	ld a, $1
	ld [wKickCounter], a
	farcall AnimateCurrentMove
	farcall BattleCommand_RaiseSub
	call AnimateAbilityStatsLower
; Defense
	farcall ResetMiss
	call BattleCommand_SwitchTurn2
	farcall BattleCommand_DefenseDown
	farcall BattleCommand_StatDownMessage

; Special Defense
	farcall ResetMiss
	farcall BattleCommand_SpecialDefenseDown
	farcall BattleCommand_StatDownMessage

	call BattleCommand_SwitchTurn2

.SkipDefense:
; Attack

	call GetUserAbility
	cp CONTRARY
	jr z, .ContraryAttack

	call GetStatsExtra
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raiseattack

	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raiseattack

	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, NoStatRaise
	jr .raiseattack

.ContraryAttack
	call GetStatsExtra
	ld a, [bc]
	cp 1
	jr nz, .raiseattack

	inc bc
	inc bc
	ld a, [bc]
	cp 1
	jr nz, .raiseattack

	inc bc
	ld a, [bc]
	cp 1
	jp z, NoStatRaise

.raiseattack
	call AnimateAbilityStats
	farcall ResetMiss
	farcall BattleCommand_AttackUp2
	farcall BattleCommand_StatUpMessage

; Special Attack
	farcall ResetMiss
	farcall BattleCommand_SpecialAttackUp2
	farcall BattleCommand_StatUpMessage

; Speed
	farcall ResetMiss
	farcall BattleCommand_SpeedUp2
	farcall BattleCommand_StatUpMessage
	jp ResetStatChangeExtra
