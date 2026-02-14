BattleCommand_DireClaw:
	call BattleRandom
	cp 33 percent + 1
	jr c, .EffectSporePoison
	call BattleRandom
	cp 50 percent + 1
	jr c, .EffectSporeSleep
	farcall BattleCommand_ParalyzeTarget
	ret

.EffectSporePoison:
	farcall BattleCommand_PoisonTarget
	ret

.EffectSporeSleep:
	farcall BattleCommand_SleepHit
	ret
