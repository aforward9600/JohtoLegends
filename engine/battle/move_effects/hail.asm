BattleCommand_StartHail:
; starthail

	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr z, .failed

	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	call GetUserItem
	ld a, b
	cp HELD_WEATHER_ROCK
	jr z, .WeatherRock
	ld a, 5
	jr .AfterWeatherRock

.WeatherRock
	ld a, 8
.AfterWeatherRock
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, HailStartsText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
