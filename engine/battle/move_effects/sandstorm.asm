BattleCommand_StartSandstorm:
; startsandstorm

	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .failed

	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	farcall GetUserItem
	ld a, b
	cp HELD_WEATHER_ROCK
	jr z, .WeatherRock
	ld a, 5
	jr .AfterWeatherRock

.WeatherRock
	ld a, 8
.AfterWeatherRock
	ld [wWeatherCount], a
	farcall AnimateCurrentMove
	farcall CalcPlayerStats
	farcall CalcEnemyStats
	ld hl, SandstormBrewedText
	jp StdBattleTextbox

.failed
	farcall AnimateFailedMove
	farcall PrintButItFailed
	ret
