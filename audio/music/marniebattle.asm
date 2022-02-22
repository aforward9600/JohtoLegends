;MIDI made by ryanisthebomb203
;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 5.0.1 (7-Feb-2021)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.

; ============================================================================================================

Music_MarnieBattle:
	musicheader 4, 1, Music_MarnieBattle_Ch1
	musicheader 1, 2, Music_MarnieBattle_Ch2
	musicheader 1, 3, Music_MarnieBattle_Ch3
	musicheader 1, 4, Music_MarnieBattle_Ch4

Music_MarnieBattle_Ch1:
	volume $77
	dutycycle $2
	notetype 12, $a7
	tempo 119
;Bar 1
	octave 3
	intensity $77
	note G_, 2
	note D_, 2
	note A_, 16
	note A_, 11
;Bar 2
	note __, 1
;Bar 3
	note G_, 2
	note D_, 2
	note A_, 16
	note A_, 11
;Bar 4
	note __, 1
;Bar 5
Music_MarnieBattle_Ch1Loop:
	note D_, 2
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A_, 2
	note G_, 2
	note A_, 4
	note D_, 4
;Bar 6
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note F_, 2
;Bar 7
	note __, 2
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note G_, 2
;Bar 8
	note F_, 2
	note C_, 2
	note G_, 2
	note F_, 10
;Bar 9
	note D_, 2
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A_, 2
	note G_, 2
	note A_, 4
	note D_, 4
;Bar 10
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note F_, 2
;Bar 11
	note __, 2
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 2
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 4
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 2
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 16
	note A_, 3
;Bar 12
	note __, 5
;Bar 13
	octave 4
	note D_, 2
	note C_, 2
	note D_, 2
	octave 3
	note A#, 4
	octave 4
	note F_, 4
;Bar 14
	note E_, 2
	note F_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 2
	note F_, 2
;Bar 15
	note G_, 6
	note E_, 16
	note E_, 9
;Bar 16
	note __, 5
;Bar 17
	note D_, 2
	note C_, 2
	note D_, 2
	octave 3
	note A#, 4
	octave 4
	note F_, 4
;Bar 18
	note E_, 2
	note F_, 4
	octave 3
	note A#, 4
	octave 4
	note A_, 4
;Bar 19
	note G_, 6
	octave 5
	note C_, 4
	octave 4
	note E_, 4
	note G_, 4
;Bar 20
	note A_, 2
	note G_, 11
	note __, 5
;Bar 21
	note D_, 2
	note E_, 2
	note F_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note A_, 2
;Bar 22
	note G_, 6
	octave 5
	note C_, 6
	octave 4
	note E_, 4
;Bar 23
	note E_, 2
	note F_, 13
	note __, 16
	note __, 5
;Bar 25
	note D_, 2
	note E_, 2
	note F_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note A_, 2
;Bar 26
	note G_, 6
	octave 5
	note C_, 6
	note E_, 4
;Bar 27
	note E_, 6
	note F_, 9
	note __, 9
;Bar 28
	octave 4
	note A_, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
;Bar 29
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 30
	octave 5
	note C_, 4
	octave 4
	note A#, 2
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 31
	note G_, 4
	note A_, 2
	note D_, 9
	note __, 9
;Bar 32
	note A_, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
;Bar 33
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 34
	octave 5
	note C_, 4
	octave 4
	note A#, 2
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 35
	note G_, 6
	note A_, 9
	note __, 9
;Bar 36
	note A_, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
;Bar 37
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 38
	octave 5
	note C_, 4
	octave 4
	note A#, 2
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 39
	note G_, 4
	note A_, 2
	note D_, 16
	note D_, 2
;Bar 40
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note F_, 2
	note E_, 2
;Bar 41
	note D_, 6
	note A_, 6
	octave 5
	note C_, 6
;Bar 42
	octave 4
	note E_, 6
	note C_, 4
	octave 3
	note A_, 4
;Bar 43
	octave 4
	note C_, 2
	note D_, 4
	note D_, 9
	note __, 16
	note __, 1
;Bar 45
	octave 3
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 2
	note C_, 4
;Bar 46
	note D_, 4
	note G_, 2
	note F_, 4
	note C_, 4
;Bar 47
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 6
;Bar 48
	note C_, 4
	octave 2
	note B_, 10
;Bar 49
	octave 3
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 2
	note C_, 4
;Bar 50
	note D_, 4
	note G_, 2
	note F_, 4
	note C_, 4
;Bar 51
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 6
;Bar 52
	note C_, 4
	octave 2
	note B_, 10
	loopchannel 0, Music_MarnieBattle_Ch1Loop

; ============================================================================================================

Music_MarnieBattle_Ch2:
	dutycycle $1
	notetype 12, $a7
;Bar 1
	octave 2
	intensity $97
	note D_, 16
;Bar 2
	note D_, 16
;Bar 3
	note D_, 16
;Bar 4
	note D_, 16
;Bar 5
Music_MarnieBattle_Ch2Loop:
	octave 1
	note A#, 16
;Bar 6
	octave 2
	note C_, 16
;Bar 7
	note D_, 16
;Bar 8
	note D_, 16
;Bar 9
	octave 1
	note A#, 16
;Bar 10
	octave 2
	note C_, 16
;Bar 11
	note D_, 12
	octave 1
	note A_, 16
	note A_, 3
;Bar 12
	note __, 1
;Bar 13
	note A#, 16
;Bar 14
	note A#, 16
;Bar 15
	octave 2
	note C_, 16
;Bar 16
	note C_, 16
;Bar 17
	octave 1
	note A#, 16
;Bar 18
	note A#, 16
;Bar 19
	octave 2
	note C_, 16
;Bar 20
	note C_, 16
;Bar 21
	octave 1
	note A#, 16
;Bar 22
	octave 2
	note C_, 16
;Bar 23
	note D_, 16
;Bar 24
	note D_, 16
;Bar 25
	octave 1
	note A#, 16
;Bar 26
	octave 2
	note C_, 16
;Bar 27
	note D_, 16
;Bar 28
	note D_, 16
;Bar 29
	note D_, 16
;Bar 30
	note C_, 16
;Bar 31
	octave 1
	note B_, 16
;Bar 32
	note A#, 16
;Bar 33
	octave 2
	note D_, 16
;Bar 34
	note C_, 16
;Bar 35
	note D_, 16
;Bar 36
	note D_, 16
;Bar 37
	note D_, 16
;Bar 38
	note C_, 16
;Bar 39
	octave 1
	note B_, 16
;Bar 40
	note A#, 16
;Bar 41
	note A#, 16
;Bar 42
	octave 2
	note C_, 16
;Bar 43
	note D_, 15
	note __, 16
	note __, 1
;Bar 45
	note D_, 16
;Bar 46
	note D_, 16
;Bar 47
	note D_, 15
	note __, 3
;Bar 48
	note C_, 4
	octave 1
	note B_, 10
;Bar 49
	octave 2
	note D_, 16
;Bar 50
	note D_, 16
;Bar 51
	note D_, 15
	note __, 3
;Bar 52
	note C_, 4
	octave 1
	note B_, 10
	loopchannel 0, Music_MarnieBattle_Ch2Loop

; ============================================================================================================

Music_MarnieBattle_Ch3:
	notetype 12, $10
;Bar 1
	octave 4
	intensity $20
	note G_, 2
	note D_, 2
	note A_, 16
	note A_, 11
;Bar 2
	note __, 1
;Bar 3
	note G_, 2
	note D_, 2
	note A_, 16
	note A_, 11
;Bar 4
	note __, 1
;Bar 5
Music_MarnieBattle_Ch3Loop:
	note D_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note A_, 2
	note G_, 2
	note A_, 4
	note D_, 4
;Bar 6
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note F_, 2
;Bar 7
	note __, 2
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note G_, 2
;Bar 8
	note F_, 2
	note C_, 2
	note G_, 2
	note F_, 10
;Bar 9
	note D_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note A_, 2
	note G_, 2
	note A_, 4
	note D_, 4
;Bar 10
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note F_, 2
;Bar 11
	note __, 2
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 2
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 4
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 2
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 16
	note A_, 3
;Bar 12
	note __, 5
;Bar 13
	octave 5
	note D_, 2
	note C_, 2
	note D_, 2
	octave 4
	note A#, 4
	octave 5
	note F_, 4
;Bar 14
	note E_, 2
	note F_, 4
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note F_, 2
;Bar 15
	note G_, 6
	note E_, 16
	note E_, 9
;Bar 16
	note __, 5
;Bar 17
	note D_, 2
	note C_, 2
	note D_, 2
	octave 4
	note A#, 4
	octave 5
	note F_, 4
;Bar 18
	note E_, 2
	note F_, 4
	octave 4
	note A#, 4
	octave 5
	note A_, 4
;Bar 19
	note G_, 6
	octave 6
	note C_, 4
	octave 5
	note E_, 4
	note G_, 4
;Bar 20
	note A_, 2
	note G_, 11
	note __, 5
;Bar 21
	note D_, 2
	note E_, 2
	note F_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	note A_, 2
;Bar 22
	note G_, 6
	octave 6
	note C_, 6
	octave 5
	note E_, 4
;Bar 23
	note E_, 2
	note F_, 13
	note __, 16
	note __, 5
;Bar 25
	note D_, 2
	note E_, 2
	note F_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	note A_, 2
;Bar 26
	note G_, 6
	octave 6
	note C_, 6
	note E_, 4
;Bar 27
	note E_, 6
	note F_, 9
	note __, 9
;Bar 28
	octave 5
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 29
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 30
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 31
	note G_, 4
	note A_, 2
	note D_, 9
	note __, 9
;Bar 32
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 33
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 34
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 35
	note G_, 6
	note A_, 9
	note __, 9
;Bar 36
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 37
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 38
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 39
	note G_, 4
	note A_, 2
	note D_, 16
	note D_, 2
;Bar 40
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note F_, 2
	note E_, 2
;Bar 41
	note D_, 6
	note A_, 6
	octave 6
	note C_, 6
;Bar 42
	octave 5
	note E_, 6
	note C_, 4
	octave 4
	note A_, 4
;Bar 43
	octave 5
	note C_, 2
	note D_, 4
	note D_, 9
	note __, 16
	note __, 1
;Bar 45
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 2
	note C_, 4
;Bar 46
	note D_, 4
	note G_, 2
	note F_, 4
	note C_, 4
;Bar 47
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 6
;Bar 48
	note C_, 4
	octave 3
	note B_, 10
;Bar 49
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 2
	note C_, 4
;Bar 50
	note D_, 4
	note G_, 2
	note F_, 4
	note C_, 4
;Bar 51
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 6
;Bar 52
	note C_, 4
	octave 3
	note B_, 10
	loopchannel 0, Music_MarnieBattle_Ch3Loop

; ============================================================================================================
Music_MarnieBattle_Ch4:
	togglenoise $3
	notetype $c
;Bar 1
	octave 4
	intensity $20
	note G_, 2
	note D_, 2
	note A_, 16
	note A_, 11
;Bar 2
	note __, 1
;Bar 3
	note G_, 2
	note D_, 2
	note A_, 16
	note A_, 11
;Bar 4
	note __, 1
;Bar 5
Music_MarnieBattle_Ch4Loop:
	note D_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note A_, 2
	note G_, 2
	note A_, 4
	note D_, 4
;Bar 6
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note F_, 2
;Bar 7
	note __, 2
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note G_, 2
;Bar 8
	note F_, 2
	note C_, 2
	note G_, 2
	note F_, 10
;Bar 9
	note D_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note A_, 2
	note G_, 2
	note A_, 4
	note D_, 4
;Bar 10
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note F_, 2
;Bar 11
	note __, 2
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 2
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 4
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 2
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 16
	note A_, 3
;Bar 12
	note __, 5
;Bar 13
	octave 5
	note D_, 2
	note C_, 2
	note D_, 2
	octave 4
	note A#, 4
	octave 5
	note F_, 4
;Bar 14
	note E_, 2
	note F_, 4
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note F_, 2
;Bar 15
	note G_, 6
	note E_, 16
	note E_, 9
;Bar 16
	note __, 5
;Bar 17
	note D_, 2
	note C_, 2
	note D_, 2
	octave 4
	note A#, 4
	octave 5
	note F_, 4
;Bar 18
	note E_, 2
	note F_, 4
	octave 4
	note A#, 4
	octave 5
	note A_, 4
;Bar 19
	note G_, 6
	octave 6
	note C_, 4
	octave 5
	note E_, 4
	note G_, 4
;Bar 20
	note A_, 2
	note G_, 11
	note __, 5
;Bar 21
	note D_, 2
	note E_, 2
	note F_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	note A_, 2
;Bar 22
	note G_, 6
	octave 6
	note C_, 6
	octave 5
	note E_, 4
;Bar 23
	note E_, 2
	note F_, 13
	note __, 16
	note __, 5
;Bar 25
	note D_, 2
	note E_, 2
	note F_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	note A_, 2
;Bar 26
	note G_, 6
	octave 6
	note C_, 6
	note E_, 4
;Bar 27
	note E_, 6
	note F_, 9
	note __, 9
;Bar 28
	octave 5
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 29
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 30
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 31
	note G_, 4
	note A_, 2
	note D_, 9
	note __, 9
;Bar 32
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 33
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 34
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 35
	note G_, 6
	note A_, 9
	note __, 9
;Bar 36
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 37
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 38
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 39
	note G_, 4
	note A_, 2
	note D_, 16
	note D_, 2
;Bar 40
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note F_, 2
	note E_, 2
;Bar 41
	note D_, 6
	note A_, 6
	octave 6
	note C_, 6
;Bar 42
	octave 5
	note E_, 6
	note C_, 4
	octave 4
	note A_, 4
;Bar 43
	octave 5
	note C_, 2
	note D_, 4
	note D_, 9
	note __, 16
	note __, 1
;Bar 45
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 2
	note C_, 4
;Bar 46
	note D_, 4
	note G_, 2
	note F_, 4
	note C_, 4
;Bar 47
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 6
;Bar 48
	note C_, 4
	octave 3
	note B_, 10
;Bar 49
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 2
	note C_, 4
;Bar 50
	note D_, 4
	note G_, 2
	note F_, 4
	note C_, 4
;Bar 51
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 6
;Bar 52
	note C_, 4
	octave 3
	note B_, 10
	loopchannel 0, Music_MarnieBattle_Ch4Loop
