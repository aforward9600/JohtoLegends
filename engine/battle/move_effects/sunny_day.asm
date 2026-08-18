BattleCommand_StartSun:
; startsun
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	farcall SpeedAbilitiesBoth
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
	ld hl, SunGotBrightText
	jp StdBattleTextbox
