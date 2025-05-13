BattleCommand_StartRain:
; startrain
	ld a, WEATHER_RAIN
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
	ld hl, DownpourText
	jp StdBattleTextbox
