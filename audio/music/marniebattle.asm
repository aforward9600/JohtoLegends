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
	notetype 3, $a7
	tempo 110
;Bar 1
	octave 3
	intensity $77
	note G_, 8
	note D_, 8
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 10
;Bar 2
	note __, 6
;Bar 3
	note G_, 8
	note D_, 8
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 10
;Bar 4
	note __, 6
;Bar 5
Music_MarnieBattleLoop:
	notetype 3, $a7
	note D_, 8
	octave 4
	note D_, 8
	note C_, 8
	octave 3
	note A_, 8
	note G_, 8
	note A_, 16
	note D_, 16
;Bar 6
	octave 4
	note D_, 8
	note C_, 8
	octave 3
	note G_, 8
	note A_, 8
	note G_, 8
	note E_, 8
	note F_, 8
;Bar 7
	note __, 8
	note C_, 8
	note D_, 16
	note C_, 8
	note D_, 16
	note G_, 8
;Bar 8
	note F_, 8
	note C_, 8
	note G_, 8
	note F_, 16
	note F_, 16
	note F_, 6
	note __, 2
;Bar 9
	note D_, 8
	octave 4
	note D_, 8
	note C_, 8
	octave 3
	note A_, 8
	note G_, 8
	note A_, 16
	note D_, 16
;Bar 10
	octave 4
	note D_, 8
	note C_, 8
	octave 3
	note G_, 8
	note A_, 8
	note G_, 8
	note E_, 8
	note F_, 8
;Bar 11
	note __, 8
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 8
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 16
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 8
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 8
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 12
;Bar 12
	note __, 16
	note __, 4
;Bar 13
	octave 4
	note D_, 8
	note C_, 8
	note D_, 8
	octave 3
	note A#, 16
	octave 4
	note F_, 16
;Bar 14
	note E_, 8
	note F_, 16
	octave 3
	note A#, 8
	octave 4
	note C_, 8
	note D_, 8
	note F_, 8
;Bar 15
	note G_, 16
	note G_, 7
	note __, 1
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 3
;Bar 16
	note __, 16
	note __, 5
;Bar 17
	note D_, 8
	note C_, 8
	note D_, 8
	octave 3
	note A#, 16
	octave 4
	note F_, 16
;Bar 18
	note E_, 8
	note F_, 16
	octave 3
	note A#, 16
	octave 4
	note A_, 16
;Bar 19
	note G_, 16
	note G_, 7
	note __, 1
	octave 5
	note C_, 16
	octave 4
	note E_, 16
	note G_, 16
;Bar 20
	note A_, 8
	note G_, 16
	note G_, 16
	note G_, 14
	note __, 16
	note __, 2
;Bar 21
	note D_, 8
	note E_, 8
	note F_, 8
	octave 3
	note A#, 8
	octave 4
	note D_, 8
	note A_, 8
;Bar 22
	note G_, 16
	note G_, 7
	note __, 1
	octave 5
	note C_, 16
	note C_, 7
	note __, 1
	octave 4
	note E_, 16
;Bar 23
	note E_, 8
	note F_, 16
	note F_, 16
	note F_, 16
	note F_, 5
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 3
;Bar 25
	note D_, 8
	note E_, 8
	note F_, 8
	octave 3
	note A#, 8
	octave 4
	note D_, 8
	note A_, 8
;Bar 26
	note G_, 16
	note G_, 7
	note __, 1
	octave 5
	note C_, 16
	note C_, 7
	note __, 1
	note E_, 16
;Bar 27
	note E_, 16
	note E_, 7
	note __, 1
	note F_, 16
	note F_, 16
	note F_, 6
	note __, 16
	note __, 16
	note __, 2
;Bar 28
	octave 4
	note A_, 8
	note F_, 8
	octave 5
	note C_, 8
	octave 4
	note A#, 8
;Bar 29
	note A_, 16
	note A_, 14
	note __, 2
	note D_, 8
	note E_, 8
	note F_, 8
	note A_, 8
;Bar 30
	octave 5
	note C_, 16
	octave 4
	note A#, 8
	octave 5
	note C_, 4
	octave 4
	note A#, 4
	note A_, 16
	note G_, 16
;Bar 31
	note G_, 16
	note A_, 8
	note D_, 16
	note D_, 16
	note D_, 6
	note __, 16
	note __, 16
	note __, 2
;Bar 32
	note A_, 8
	note F_, 8
	octave 5
	note C_, 8
	octave 4
	note A#, 8
;Bar 33
	note A_, 16
	note A_, 14
	note __, 2
	note D_, 8
	note E_, 8
	note F_, 8
	note A_, 8
;Bar 34
	octave 5
	note C_, 16
	octave 4
	note A#, 8
	octave 5
	note C_, 4
	octave 4
	note A#, 4
	note A_, 16
	note G_, 16
;Bar 35
	note G_, 16
	note G_, 7
	note __, 1
	note A_, 16
	note A_, 16
	note A_, 6
	note __, 16
	note __, 16
	note __, 2
;Bar 36
	note A_, 8
	note F_, 8
	octave 5
	note C_, 8
	octave 4
	note A#, 8
;Bar 37
	note A_, 16
	note A_, 14
	note __, 2
	note D_, 8
	note E_, 8
	note F_, 8
	note A_, 8
;Bar 38
	octave 5
	note C_, 16
	octave 4
	note A#, 8
	octave 5
	note C_, 4
	octave 4
	note A#, 4
	note A_, 16
	note G_, 16
;Bar 39
	note G_, 16
	note A_, 8
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 4
;Bar 40
	note __, 4
	note D_, 8
	octave 3
	note A#, 8
	octave 4
	note F_, 8
	note E_, 8
;Bar 41
	note D_, 16
	note D_, 7
	note __, 1
	note A_, 16
	note A_, 7
	note __, 1
	octave 5
	note C_, 16
	note C_, 7
;Bar 42
	note __, 1
	octave 4
	note E_, 16
	note E_, 7
	note __, 1
	note C_, 16
	octave 3
	note A_, 16
;Bar 43
	octave 4
	note C_, 8
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 6
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 2
;Bar 45
	octave 3
	note C_, 8
	note D_, 16
	note C_, 8
	note D_, 15
	note __, 9
	note C_, 16
;Bar 46
	note D_, 16
	note G_, 8
	note F_, 16
	note C_, 16
;Bar 47
	note C_, 8
	note D_, 16
	note C_, 8
	note D_, 15
	note __, 16
	note __, 9
;Bar 48
	note C_, 16
	octave 2
	note B_, 16
	note B_, 16
	note B_, 6
	note __, 2
;Bar 49
	octave 3
	note C_, 8
	note D_, 16
	note C_, 8
	note D_, 15
	note __, 9
	note C_, 16
;Bar 50
	note D_, 16
	note G_, 8
	note F_, 16
	note C_, 16
;Bar 51
	note C_, 8
	note D_, 16
	note C_, 8
	note D_, 15
	note __, 16
	note __, 9
;Bar 52
	note C_, 16
	octave 2
	note B_, 16
	note B_, 16
	note B_, 6
	note __, 2
;Bar 53
	octave 3
	note D_, 8
	octave 4
	note D_, 8
	note C_, 8
	octave 3
	note A_, 8
	note G_, 8
	note A_, 16
	note D_, 16
;Bar 54
	octave 4
	note D_, 8
	note C_, 8
	octave 3
	note G_, 8
	note A_, 8
	note G_, 8
	note E_, 8
	note F_, 8
;Bar 55
	note __, 8
	note C_, 8
	note D_, 16
	note C_, 8
	note D_, 16
	note G_, 8
;Bar 56
	note F_, 8
	note C_, 8
	note G_, 8
	note F_, 16
	note F_, 16
	note F_, 6
	note __, 2
;Bar 57
	note D_, 8
	octave 4
	note D_, 8
	note C_, 8
	octave 3
	note A_, 8
	note G_, 8
	note A_, 16
	note D_, 16
;Bar 58
	octave 4
	note D_, 8
	note C_, 8
	octave 3
	note G_, 8
	note A_, 8
	note G_, 8
	note E_, 8
	note F_, 8
;Bar 59
	note __, 8
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 8
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 16
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 8
	;note D_, 0 | WARNING: Rounded down to 0
	note A_, 8
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 12
;Bar 60
	note __, 16
	note __, 4
;Bar 61
	octave 4
	note D_, 8
	note C_, 8
	note D_, 8
	octave 3
	note A#, 16
	octave 4
	note F_, 16
;Bar 62
	note E_, 8
	note F_, 16
	octave 3
	note A#, 8
	octave 4
	note C_, 8
	note D_, 8
	note F_, 8
;Bar 63
	note G_, 16
	note G_, 7
	note __, 1
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 3
;Bar 64
	note __, 16
	note __, 5
;Bar 65
	note D_, 8
	note C_, 8
	note D_, 8
	octave 3
	note A#, 16
	octave 4
	note F_, 16
;Bar 66
	note E_, 8
	note F_, 16
	octave 3
	note A#, 16
	octave 4
	note A_, 16
;Bar 67
	note G_, 16
	note G_, 7
	note __, 1
	octave 5
	note C_, 16
	octave 4
	note E_, 16
	note G_, 16
;Bar 68
	note A_, 8
	note G_, 16
	note G_, 16
	note G_, 14
	note __, 16
	note __, 2
;Bar 69
	note D_, 8
	note E_, 8
	note F_, 8
	octave 3
	note A#, 8
	octave 4
	note D_, 8
	note A_, 8
;Bar 70
	note G_, 16
	note G_, 7
	note __, 1
	octave 5
	note C_, 16
	note C_, 7
	note __, 1
	octave 4
	note E_, 16
;Bar 71
	note E_, 8
	note F_, 16
	note F_, 16
	note F_, 16
	note F_, 5
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 3
;Bar 73
	note D_, 8
	note E_, 8
	note F_, 8
	octave 3
	note A#, 8
	octave 4
	note D_, 8
	note A_, 8
;Bar 74
	note G_, 16
	note G_, 7
	note __, 1
	octave 5
	note C_, 16
	note C_, 7
	note __, 1
	note E_, 16
;Bar 75
	note E_, 16
	note E_, 7
	note __, 1
	note F_, 16
	note F_, 16
	note F_, 6
	note __, 16
	note __, 16
	note __, 2
;Bar 76
	octave 4
	note A_, 8
	note F_, 8
	octave 5
	note C_, 8
	octave 4
	note A#, 8
;Bar 77
	note A_, 16
	note A_, 14
	note __, 2
	note D_, 8
	note E_, 8
	note F_, 8
	note A_, 8
;Bar 78
	octave 5
	note C_, 16
	octave 4
	note A#, 8
	octave 5
	note C_, 4
	octave 4
	note A#, 4
	note A_, 16
	note G_, 16
;Bar 79
	note G_, 16
	note A_, 8
	note D_, 16
	note D_, 16
	note D_, 6
	note __, 16
	note __, 16
	note __, 2
;Bar 80
	note A_, 8
	note F_, 8
	octave 5
	note C_, 8
	octave 4
	note A#, 8
;Bar 81
	note A_, 16
	note A_, 14
	note __, 2
	note D_, 8
	note E_, 8
	note F_, 8
	note A_, 8
;Bar 82
	octave 5
	note C_, 16
	octave 4
	note A#, 8
	octave 5
	note C_, 4
	octave 4
	note A#, 4
	note A_, 16
	note G_, 16
;Bar 83
	note G_, 16
	note G_, 7
	note __, 1
	note A_, 16
	note A_, 16
	note A_, 6
	note __, 16
	note __, 16
	note __, 2
;Bar 84
	note A_, 8
	note F_, 8
	octave 5
	note C_, 8
	octave 4
	note A#, 8
;Bar 85
	note A_, 16
	note A_, 14
	note __, 2
	note D_, 8
	note E_, 8
	note F_, 8
	note A_, 8
;Bar 86
	octave 5
	note C_, 16
	octave 4
	note A#, 8
	octave 5
	note C_, 4
	octave 4
	note A#, 4
	note A_, 16
	note G_, 16
;Bar 87
	note G_, 16
	note A_, 8
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 4
;Bar 88
	note __, 4
	note D_, 8
	octave 3
	note A#, 8
	octave 4
	note F_, 8
	note E_, 8
;Bar 89
	note D_, 16
	note D_, 7
	note __, 1
	note A_, 16
	note A_, 7
	note __, 1
	octave 5
	note C_, 16
	note C_, 7
;Bar 90
	note __, 1
	octave 4
	note E_, 16
	note E_, 7
	note __, 1
	note C_, 16
	octave 3
	note A_, 16
;Bar 91
	octave 4
	note C_, 8
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 6
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 2
;Bar 93
	octave 3
	note C_, 8
	note D_, 16
	note C_, 8
	note D_, 15
	note __, 9
	note C_, 16
;Bar 94
	note D_, 16
	note G_, 8
	note F_, 16
	note C_, 16
;Bar 95
	note C_, 8
	note D_, 16
	note C_, 8
	note D_, 15
	note __, 16
	note __, 9
;Bar 96
	note C_, 16
	octave 2
	note B_, 16
	note B_, 16
	note B_, 6
	note __, 2
;Bar 97
	octave 3
	note C_, 8
	note D_, 16
	note C_, 8
	note D_, 15
	note __, 9
	note C_, 16
;Bar 98
	note D_, 16
	note G_, 8
	note F_, 16
	note C_, 16
;Bar 99
	note C_, 8
	note D_, 16
	note C_, 8
	note D_, 15
	note __, 16
	note __, 9
;Bar 100
	note C_, 16
	octave 2
	note B_, 16
	note B_, 16
	note B_, 6
	loopchannel 0, Music_MarnieBattleLoop

; ============================================================================================================

Music_MarnieBattle_Ch2:
	dutycycle $1
	notetype 3, $a7
;Bar 1
	octave 2
	intensity $97
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 2
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 3
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 4
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 5
Music_MarnieBattleBackLoop:
	notetype 3, $a7
	octave 1
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 6
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 7
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 8
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 9
	octave 1
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 10
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 11
	note D_, 16
	note D_, 16
	note D_, 14
	note __, 2
	octave 1
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 12
;Bar 12
	note __, 4
;Bar 13
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 14
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 15
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 16
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 17
	octave 1
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 18
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 19
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 20
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 21
	octave 1
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 22
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 23
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 24
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 25
	octave 1
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 26
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 27
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 28
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 29
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 30
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 31
	octave 1
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 13
	note __, 3
;Bar 32
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 33
	octave 2
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 34
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 35
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 36
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 37
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 38
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 39
	octave 1
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 13
	note __, 3
;Bar 40
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 41
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 42
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 43
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 3
;Bar 45
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 46
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 47
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 11
;Bar 48
	note C_, 16
	octave 1
	note B_, 16
	note B_, 16
	note B_, 6
	note __, 2
;Bar 49
	octave 2
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 50
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 51
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 11
;Bar 52
	note C_, 16
	octave 1
	note B_, 16
	note B_, 16
	note B_, 6
	note __, 2
;Bar 53
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 54
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 55
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 56
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 57
	octave 1
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 58
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 59
	note D_, 16
	note D_, 16
	note D_, 14
	note __, 2
	octave 1
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 12
;Bar 60
	note __, 4
;Bar 61
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 62
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 63
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 64
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 65
	octave 1
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 66
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 67
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 68
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 69
	octave 1
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 70
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 71
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 72
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 73
	octave 1
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 74
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 75
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 76
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 77
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 78
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 79
	octave 1
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 13
	note __, 3
;Bar 80
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 81
	octave 2
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 82
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 83
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 84
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 85
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 86
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 87
	octave 1
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 13
	note __, 3
;Bar 88
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 89
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 13
	note __, 3
;Bar 90
	octave 2
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 13
	note __, 3
;Bar 91
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 3
;Bar 93
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 94
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 95
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 11
;Bar 96
	note C_, 16
	octave 1
	note B_, 16
	note B_, 16
	note B_, 6
	note __, 2
;Bar 97
	octave 2
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 98
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 3
;Bar 99
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 13
	note __, 11
;Bar 100
	note C_, 16
	octave 1
	note B_, 16
	note B_, 16
	note B_, 6
	loopchannel 0, Music_MarnieBattleBackLoop

; ============================================================================================================

Music_MarnieBattle_Ch3:
	endchannel

Music_MarnieBattle_Ch4:
	endchannel
