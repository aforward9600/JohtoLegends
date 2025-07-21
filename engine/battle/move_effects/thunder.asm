BattleCommand_ThunderAccuracy:
; thunderaccuracy

	call CheckCloudNine
	ret z
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	inc hl
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr z, .rain
	cp WEATHER_SUN
	cp WEATHER_HAIL
	ret nz
	ld [hl], 50 percent + 1
	ret

.rain
	; Redundant with CheckHit guranteeing hit
	ld [hl], 100 percent
	ret
