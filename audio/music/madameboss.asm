;MIDI made by CynthiaCelestic
;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 5.0.1 (7-Feb-2021)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.

; ============================================================================================================

Music_MadameBoss:
	musicheader 4, 1, Music_MadameBoss_Ch1
	musicheader 1, 2, Music_MadameBoss_Ch2
	musicheader 1, 3, Music_MadameBoss_Ch3
	musicheader 1, 4, Music_MadameBoss_Ch4

Music_MadameBoss_Ch1:
	volume $77
	dutycycle $2
	notetype 12, $a7
	tempo 142
;Bar 1
	octave 4
	intensity $97
	note A_, 1
	intensity $87
	note G#, 1
	note A_, 1
	note G#, 1
	intensity $97
	note A#, 1
	intensity $87
	note G#, 1
	note A_, 1
	note G#, 1
	intensity $97
	note B_, 1
	intensity $87
	note G#, 1 ; WARNING: Auto-Sync says: Rounded up!
	note A_, 1
	note G#, 1
	octave 5
	intensity $97
	note C_, 1
	octave 4
	intensity $87
	note G#, 1
	note A_, 1 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 1
;Bar 2
	octave 5
	note C#, 1
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	octave 5
	note D_, 1
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	octave 5
	note D#, 1
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	octave 5
	note E_, 1
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
;Bar 3
	note __, 16
;Bar 4
Music_MadameBoss_Ch1Loop:
	octave 3
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	note __, 5 ; WARNING: Auto-Sync says: Rounded up!
	octave 3
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	note __, 3
	octave 3
	intensity $67
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $77
	note D_, 2
	octave 3
	intensity $47
	;note D#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $77
	note D#, 16
	note D#, 4
;Bar 6
	note __, 16
	note __, 16
;Bar 8
	octave 3
	intensity $67
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	note __, 5
	octave 3
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	note __, 3
	octave 3
	intensity $57
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note D_, 2
	octave 3
	intensity $57
	;note D#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $a7
	note D#, 16
	note D#, 4
;Bar 10
	note __, 16
	note __, 16
	note __, 16
	note __, 16
;Bar 14
	octave 3
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 2
	octave 2
	intensity $87
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 1
	note __, 1
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $97
	note F_, 1
	note __, 1
	intensity $87
	;note D_, 0 | WARNING: Rounded down to 0
	note G_, 1
	note __, 1
	intensity $97
	;note F_, 0 | WARNING: Rounded down to 0
	note A_, 2
	intensity $87
	;note D#, 0 | WARNING: Rounded down to 0
	note G#, 1
	note __, 1
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $97
	note A_, 1
	note __, 1
	intensity $87
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	note C_, 1
	note __, 1
;Bar 15
	octave 3
	intensity $97
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 2
	octave 3
	intensity $87
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note C#, 1
	note __, 1
	octave 3
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	note __, 1
	octave 3
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $97
	note E_, 1
	note __, 1
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 2
	octave 3
	intensity $87
	;note B_, 0 | WARNING: Rounded down to 0
	octave 4
	note E_, 1
	note __, 1
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $97
	note G_, 1
	note __, 1
	intensity $87
	;note F_, 0 | WARNING: Rounded down to 0
	note A#, 1
	note G_, 1
;Bar 16
	intensity $77
	;note G#, 0 | WARNING: Rounded down to 0
	intensity $97
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 1
	note __, 16
	note __, 13
;Bar 17
	octave 2
	intensity $87
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	octave 2
	intensity $87
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 1
;Bar 18
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 2
	octave 2
	intensity $87
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	;note E_, 0 | WARNING: Rounded down to 0
	note __, 2
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $97
	;note F_, 0 | WARNING: Rounded down to 0
	note __, 2
	intensity $87
	;note D_, 0 | WARNING: Rounded down to 0
	;note G_, 0 | WARNING: Rounded down to 0
	note __, 2
	intensity $97
	;note F_, 0 | WARNING: Rounded down to 0
	note A_, 2
	intensity $87
	;note D#, 0 | WARNING: Rounded down to 0
	;note G#, 0 | WARNING: Rounded down to 0
	note __, 2
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $97
	;note A_, 0 | WARNING: Rounded down to 0
	note __, 2
	intensity $87
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	;note C_, 0 | WARNING: Rounded down to 0
	note __, 2
;Bar 19
	intensity $97
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 2
	intensity $87
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	;note C#, 0 | WARNING: Rounded down to 0
	note __, 2
	octave 3
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	;note D_, 0 | WARNING: Rounded down to 0
	note __, 2
	octave 3
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $97
	;note E_, 0 | WARNING: Rounded down to 0
	note __, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 2 ; WARNING: Auto-Sync says: Rounded up!
	octave 3
	intensity $87
	;note B_, 0 | WARNING: Rounded down to 0
	octave 4
	;note E_, 0 | WARNING: Rounded down to 0
	note __, 2
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $97
	;note G_, 0 | WARNING: Rounded down to 0
	note __, 2
	intensity $87
	;note F_, 0 | WARNING: Rounded down to 0
	;note A#, 0 | WARNING: Rounded down to 0
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 2
;Bar 24
	octave 3
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note E_, 6
	octave 3
	intensity $77
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note D_, 4
	octave 3
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $87
	note G_, 2
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $87
	note A#, 4
;Bar 25
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $87
	note A_, 6
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $87
	note G_, 4
	octave 2
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note E_, 2
	octave 2
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note F_, 4
;Bar 26
	octave 2
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note E_, 6 ; WARNING: Auto-Sync says: Rounded down!
	octave 2
	intensity $77
	;note G_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note D_, 6
	octave 2
	intensity $77
	;note G#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note D#, 4
;Bar 27
	octave 2
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note E_, 16
;Bar 28
	intensity $57
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 29
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 30
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 31
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
;Bar 32
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 33
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 34
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 35
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 36
	note __, 8
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	intensity $97
	note A_, 4
	octave 2
	intensity $a7
	note A_, 2
	octave 3
	note D#, 1
	intensity $97
	note F_, 1
;Bar 37
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	note A#, 6
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	;note D#, 0 | WARNING: Rounded down to 0
	note A_, 1
	note __, 3
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	note A#, 1
	note __, 1
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	;note D#, 0 | WARNING: Rounded down to 0
	note A_, 1
	note __, 1
	octave 4
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	octave 5
	note C_, 1
	note __, 3
;Bar 38
	octave 3
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	note D#, 1
	note __, 5
	octave 3
	;note C_, 0 | WARNING: Rounded down to 0
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $97
	note F_, 4
	octave 3
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $a7
	note C_, 1
	octave 3
	intensity $97
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	octave 3
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	note D#, 1
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 1
;Bar 39
	octave 3
	;note D#, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	note F#, 6
	octave 3
	intensity $97
	;note D#, 0 | WARNING: Rounded down to 0
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note D#, 1
	note __, 3
	octave 3
	;note D#, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	note F#, 1
	note __, 1
	octave 3
	intensity $97
	;note D#, 0 | WARNING: Rounded down to 0
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note D#, 1
	note __, 1
	octave 3
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	octave 5
	note D#, 1
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 1
;Bar 44
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 5
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 5
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 3
;Bar 45
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 5
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 3
	octave 2
	intensity $a7
	;note F_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note F_, 1
	note __, 1
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 3
	note __, 1
;Bar 46
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 5
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 3
	octave 2
	intensity $a7
	;note F_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note F_, 1
	note __, 1
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 3
	note __, 1
;Bar 47
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 15
;Bar 48
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 5
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 5
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 3
;Bar 49
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 5
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 3
	octave 2
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note F#, 1
	note __, 1
	octave 2
	intensity $a7
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note E_, 3
	note __, 1
;Bar 50
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 5
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 3
	octave 2
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note F#, 1
	note __, 1
	octave 2
	intensity $a7
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note E_, 3
	note __, 1
;Bar 51
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 15
;Bar 52
	note A_, 6
	note G_, 6
	note A_, 4
;Bar 53
	note A#, 6
	octave 4
	note D_, 6
	octave 3
	note A#, 4
;Bar 54
	note A_, 6
	note G_, 6
	note A_, 4
;Bar 55
	octave 2
	intensity $87
	note A_, 16
;Bar 56
	octave 3
	intensity $67
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	note __, 5
	octave 3
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	note __, 3
	octave 3
	intensity $47
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $77
	note D_, 2
	octave 3
	intensity $47
	;note D#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $77
	note D#, 16
	note D#, 4
;Bar 58
	note __, 16
	note __, 16
;Bar 60
	octave 3
	intensity $67
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	note __, 5
	octave 3
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	note __, 3
	octave 3
	intensity $57
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note D_, 2
	octave 3
	intensity $57
	;note D#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $a7
	note D#, 16
	note D#, 4
;Bar 62
	note __, 16
	note __, 16
	note __, 16
	note __, 14
;Bar 65
	octave 2
	intensity $87
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	octave 2
	intensity $87
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 1
;Bar 66
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 2
	octave 2
	intensity $87
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 1
	note __, 1
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $97
	note F_, 1
	note __, 1
	intensity $87
	;note D_, 0 | WARNING: Rounded down to 0
	note G_, 1
	note __, 1
	intensity $97
	;note F_, 0 | WARNING: Rounded down to 0
	note A_, 2
	intensity $87
	;note D#, 0 | WARNING: Rounded down to 0
	note G#, 1
	note __, 1
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $97
	note A_, 1
	note __, 1
	intensity $87
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	note C_, 1
	note __, 1
;Bar 67
	octave 3
	intensity $97
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 2
	octave 3
	intensity $87
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note C#, 1
	note __, 1
	octave 3
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	note __, 1
	octave 3
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $97
	note E_, 1
	note __, 1
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 2
	octave 3
	intensity $87
	;note B_, 0 | WARNING: Rounded down to 0
	octave 4
	note E_, 1
	note __, 1
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $97
	note G_, 1
	note __, 1
	intensity $87
	;note F_, 0 | WARNING: Rounded down to 0
	note A#, 1
	note G_, 1
;Bar 68
	intensity $77
	;note G#, 0 | WARNING: Rounded down to 0
	intensity $97
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 1
	note __, 16
	note __, 16
	note __, 1
;Bar 70
	octave 2
	intensity $87
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	;note E_, 0 | WARNING: Rounded down to 0
	note __, 2
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $97
	;note F_, 0 | WARNING: Rounded down to 0
	note __, 2
	intensity $87
	;note D_, 0 | WARNING: Rounded down to 0
	;note G_, 0 | WARNING: Rounded down to 0
	note __, 2
	intensity $97
	;note F_, 0 | WARNING: Rounded down to 0
	note A_, 2
	intensity $87
	;note D#, 0 | WARNING: Rounded down to 0
	;note G#, 0 | WARNING: Rounded down to 0
	note __, 2
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $97
	;note A_, 0 | WARNING: Rounded down to 0
	note __, 2
	intensity $87
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	;note C_, 0 | WARNING: Rounded down to 0
	note __, 2
;Bar 71
	intensity $97
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 2
	intensity $87
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	;note C#, 0 | WARNING: Rounded down to 0
	note __, 2
	octave 3
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	;note D_, 0 | WARNING: Rounded down to 0
	note __, 2
	octave 3
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $97
	;note E_, 0 | WARNING: Rounded down to 0
	note __, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 2
	octave 3
	intensity $87
	;note B_, 0 | WARNING: Rounded down to 0
	octave 4
	;note E_, 0 | WARNING: Rounded down to 0
	note __, 2
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $97
	;note G_, 0 | WARNING: Rounded down to 0
	note __, 2
	intensity $87
	;note F_, 0 | WARNING: Rounded down to 0
	;note A#, 0 | WARNING: Rounded down to 0
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 2
;Bar 76
	octave 3
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note E_, 6
	octave 3
	intensity $77
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note D_, 4
	octave 3
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $87
	note G_, 2
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $87
	note A#, 4
;Bar 77
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $87
	note A_, 6
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $87
	note G_, 4
	octave 2
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note E_, 2
	octave 2
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note F_, 4
;Bar 78
	octave 2
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note E_, 6
	octave 2
	intensity $77
	;note G_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note D_, 6
	octave 2
	intensity $77
	;note G#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note D#, 4
;Bar 79
	octave 2
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note E_, 16
;Bar 80
	intensity $57
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 81
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 82
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 83
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
;Bar 84
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 85
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 86
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 87
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
;Bar 88
	note __, 8
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	intensity $97
	note A_, 4
	octave 2
	intensity $a7
	note A_, 2
	octave 3
	note D#, 1
	intensity $97
	note F_, 1
;Bar 89
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	note A#, 6
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	;note D#, 0 | WARNING: Rounded down to 0
	note A_, 1
	note __, 3
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	note A#, 1
	note __, 1
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	;note D#, 0 | WARNING: Rounded down to 0
	note A_, 1
	note __, 1
	octave 4
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	octave 5
	note C_, 1
	note __, 3
;Bar 90
	octave 3
	intensity $97
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	note D#, 1
	note __, 5
	octave 3
	;note C_, 0 | WARNING: Rounded down to 0
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $97
	note F_, 4
	octave 3
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $a7
	note C_, 1
	octave 3
	intensity $97
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note D_, 1
	octave 3
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	note D#, 1
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 1
;Bar 91
	octave 3
	;note D#, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	note F#, 6
	octave 3
	intensity $97
	;note D#, 0 | WARNING: Rounded down to 0
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note D#, 1
	note __, 3
	octave 3
	;note D#, 0 | WARNING: Rounded down to 0
	intensity $a7
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	note F#, 1
	note __, 1
	octave 3
	intensity $97
	;note D#, 0 | WARNING: Rounded down to 0
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note D#, 1
	note __, 1
	octave 3
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	octave 5
	note D#, 1
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 1
;Bar 96
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 5
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 5
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 3
;Bar 97
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 5
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 3
	octave 2
	intensity $a7
	;note F_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note F_, 1
	note __, 1
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 3
	note __, 1
;Bar 98
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 5
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 3
	octave 2
	intensity $a7
	;note F_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note F_, 1
	note __, 1
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 3
	note __, 1
;Bar 99
	octave 2
	intensity $a7
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D_, 1
	note __, 15
;Bar 100
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 5
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 5
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 3
;Bar 101
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 5
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 3
	octave 2
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note F#, 1
	note __, 1
	octave 2
	intensity $a7
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note E_, 3
	note __, 1
;Bar 102
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 5
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 3
	octave 2
	intensity $a7
	;note F#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note F#, 1
	note __, 1
	octave 2
	intensity $a7
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note E_, 3
	note __, 1
;Bar 103
	octave 2
	intensity $a7
	;note D#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $97
	note D#, 1
	note __, 15
;Bar 104
	note A_, 6
	note G_, 6
	note A_, 4
;Bar 105
	note A#, 6
	octave 4
	note D_, 6
	octave 3
	note A#, 4
;Bar 106
	note A_, 6
	note G_, 6
	note A_, 4
;Bar 107
	octave 2
	intensity $a7
	note A_, 15
	loopchannel 0, Music_MadameBoss_Ch1Loop

; ============================================================================================================

Music_MadameBoss_Ch2:
	dutycycle $1
	notetype 12, $a7
;Bar 1
	octave 4
	intensity $97
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
;Bar 2
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1 ; WARNING: Auto-Sync says: Rounded up!
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
;Bar 3
	note __, 16
Music_MadameBoss_Ch2Loop:
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 10
;Bar 11
	octave 3
	note C_, 2
	intensity $a7
	note C#, 4
;Bar 12
	intensity $87
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 6
	;note E_, 0 | WARNING: Rounded down to 0
	note G#, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 13
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 6
	;note E_, 0 | WARNING: Rounded down to 0
	note G#, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 14
	octave 2
	;note F_, 0 | WARNING: Rounded down to 0
	octave 3
	note F_, 16
	note F_, 14
;Bar 15
	note __, 1
	note G_, 1
;Bar 16
	intensity $77
	;note G#, 0 | WARNING: Rounded down to 0
	intensity $87
	;note C_, 0 | WARNING: Rounded down to 0
	note A_, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 17
	;note C_, 0 | WARNING: Rounded down to 0
	note A_, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 18
	octave 2
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note F_, 16
;Bar 19
	;note D_, 0 | WARNING: Rounded down to 0
	note A#, 16
;Bar 20
	octave 2
	intensity $67
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 16
;Bar 21
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 6
	octave 2
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 6
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 4
;Bar 22
	octave 2
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note F_, 16
;Bar 23
	;note F_, 0 | WARNING: Rounded down to 0
	note A#, 6
	octave 2
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note F_, 6
	;note F_, 0 | WARNING: Rounded down to 0
	note A#, 4
;Bar 24
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 16
;Bar 25
	;note C_, 0 | WARNING: Rounded down to 0
	note A_, 16
;Bar 26
	octave 2
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 16
;Bar 27
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 16
;Bar 28
	intensity $97
	note D_, 4
	note A_, 4
	note G#, 4
	octave 4
	note C_, 4
;Bar 29
	octave 3
	note B_, 4
	note F#, 4
	note F_, 4
	note A_, 4
;Bar 30
	note G#, 4
	note D_, 4
	note C#, 4
	note G_, 4
;Bar 31
	note F#, 4
	note D_, 4
	note E_, 4
	note C#, 4
;Bar 32
	note D_, 4
	note A_, 4
	note G#, 4
	octave 4
	note C_, 4
;Bar 33
	octave 3
	note B_, 4 ; WARNING: Auto-Sync says: Rounded up!
	note F#, 4 ; WARNING: Auto-Sync says: Rounded up!
	note F_, 4
	note A_, 4
;Bar 34
	note G#, 4
	note D_, 4
	note C#, 4
	note G_, 4
;Bar 35
	note F#, 4
	note D_, 4
	note E_, 4
	note C#, 4
;Bar 36
	note __, 2
	intensity $a7
	note A_, 1
	octave 4
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $b7
	note D_, 2
	note __, 16
	note __, 13
;Bar 38
	octave 3
	intensity $97
	note A#, 1
	octave 4
	;note C#, 0 | WARNING: Rounded down to 0
	note D#, 2
	note __, 16
	note __, 11
;Bar 40
	octave 2
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note A#, 6
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note D_, 6
	octave 3
	intensity $77
	;note C_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note C_, 4
;Bar 41
	octave 2
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note A#, 2
	intensity $77
	;note C_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note C_, 2
	octave 3
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note D_, 2
	octave 3
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note E_, 2
	octave 3
	intensity $77
	;note F_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note F_, 2
	octave 3
	intensity $77
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note G_, 2
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	octave 3
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A#, 2
;Bar 42
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	octave 3
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note E_, 2
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	octave 3
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A#, 2
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	octave 3
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note E_, 2
	octave 3
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note D_, 2
	octave 3
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note E_, 2
;Bar 43
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	octave 3
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note E_, 2
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	intensity $77
	;note C#, 0 | WARNING: Rounded down to 0
	octave 5
	intensity $87
	note C#, 2
	octave 4
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	octave 5
	intensity $87
	note D_, 2
	octave 4
	intensity $77
	;note C#, 0 | WARNING: Rounded down to 0
	octave 5
	intensity $87
	note C#, 2
	octave 3
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A#, 2
	octave 3
	intensity $77
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note G_, 2
;Bar 44
	note __, 16
	note __, 16
	note __, 16
	note __, 6
;Bar 47
	octave 3
	intensity $a7
	note E_, 1
	note G_, 1
	intensity $b7
	note A_, 7
	note __, 16
	note __, 16
	note __, 16
	note __, 7
;Bar 51
	intensity $a7
	note F_, 1
	note G#, 1
	intensity $b7
	note A#, 8
;Bar 52
	intensity $97
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $a7
	note A_, 6
	intensity $87
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $97
	note G_, 6
	intensity $87
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $97
	note A_, 4
;Bar 53
	;note F_, 0 | WARNING: Rounded down to 0
	intensity $a7
	note A#, 6
	intensity $87
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $97
	note D_, 6 ; WARNING: Auto-Sync says: Rounded up!
	octave 3
	intensity $87
	;note F_, 0 | WARNING: Rounded down to 0
	intensity $97
	note A#, 4
;Bar 54
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $a7
	note A_, 6
	intensity $87
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $97
	note G_, 6
	intensity $87
	;note D#, 0 | WARNING: Rounded down to 0
	intensity $97
	note A_, 4
;Bar 55
	intensity $87
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $97
	note A_, 15
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 11
;Bar 63
	note C_, 2
	intensity $a7
	note C#, 4
;Bar 64
	intensity $87
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 6
	;note E_, 0 | WARNING: Rounded down to 0
	note G#, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 65
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 6
	;note E_, 0 | WARNING: Rounded down to 0
	note G#, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 66
	octave 2
	;note F_, 0 | WARNING: Rounded down to 0
	octave 3
	note F_, 16
	note F_, 14
;Bar 67
	note __, 1 ; WARNING: Auto-Sync says: Rounded up!
	note G_, 1
;Bar 68
	intensity $77
	;note G#, 0 | WARNING: Rounded down to 0
	intensity $87
	;note C_, 0 | WARNING: Rounded down to 0
	note A_, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 69
	;note C_, 0 | WARNING: Rounded down to 0
	note A_, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note B_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 70
	octave 2
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note F_, 16
;Bar 71
	;note D_, 0 | WARNING: Rounded down to 0
	note A#, 16
;Bar 72
	octave 2
	intensity $67
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 16
;Bar 73
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 6
	octave 2
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 6
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 4
;Bar 74
	octave 2
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note F_, 16
;Bar 75
	;note F_, 0 | WARNING: Rounded down to 0
	note A#, 6
	octave 2
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note F_, 6
	;note F_, 0 | WARNING: Rounded down to 0
	note A#, 4
;Bar 76
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 16
;Bar 77
	;note C_, 0 | WARNING: Rounded down to 0
	note A_, 16
;Bar 78
	octave 2
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 16
;Bar 79
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 16
;Bar 80
	intensity $97
	note D_, 4
	note A_, 4
	note G#, 4
	octave 4
	note C_, 4
;Bar 81
	octave 3
	note B_, 4
	note F#, 4
	note F_, 4
	note A_, 4
;Bar 82
	note G#, 4
	note D_, 4
	note C#, 4
	note G_, 4
;Bar 83
	note F#, 4
	note D_, 4
	note E_, 4
	note C#, 4
;Bar 84
	note D_, 4
	note A_, 4
	note G#, 4
	octave 4
	note C_, 4
;Bar 85
	octave 3
	note B_, 4
	note F#, 4
	note F_, 4
	note A_, 4
;Bar 86
	note G#, 4
	note D_, 4
	note C#, 4
	note G_, 4
;Bar 87
	note F#, 4
	note D_, 4
	note E_, 4
	note C#, 4
;Bar 88
	note __, 2
	intensity $a7
	note A_, 1
	octave 4
	;note C_, 0 | WARNING: Rounded down to 0
	intensity $b7
	note D_, 2
	note __, 16
	note __, 13
;Bar 90
	octave 3
	intensity $97
	note A#, 1
	octave 4
	;note C#, 0 | WARNING: Rounded down to 0
	note D#, 2
	note __, 16
	note __, 11
;Bar 92
	octave 2
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note A#, 6
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note D_, 6
	octave 3
	intensity $77
	;note C_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note C_, 4
;Bar 93
	octave 2
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	intensity $87
	note A#, 2
	intensity $77
	;note C_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note C_, 2
	octave 3
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note D_, 2
	octave 3
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note E_, 2
	octave 3
	intensity $77
	;note F_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note F_, 2
	octave 3
	intensity $77
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note G_, 2
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	octave 3
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A#, 2
;Bar 94
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	octave 3
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note E_, 2
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	octave 3
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A#, 2
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	octave 3
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note E_, 2
	octave 3
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note D_, 2
	octave 3
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note E_, 2
;Bar 95
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	octave 3
	intensity $77
	;note E_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note E_, 2
	octave 3
	intensity $77
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A_, 2
	intensity $77
	;note C#, 0 | WARNING: Rounded down to 0
	octave 5
	intensity $87
	note C#, 2
	octave 4
	intensity $77
	;note D_, 0 | WARNING: Rounded down to 0
	octave 5
	intensity $87
	note D_, 2
	octave 4
	intensity $77
	;note C#, 0 | WARNING: Rounded down to 0
	octave 5
	intensity $87
	note C#, 2
	octave 3
	intensity $77
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note A#, 2
	octave 3
	intensity $77
	;note G_, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $87
	note G_, 2
;Bar 96
	note __, 16
	note __, 16
	note __, 16
	note __, 6
;Bar 99
	octave 3
	intensity $a7
	note E_, 1
	note G_, 1
	intensity $b7
	note A_, 8
;Bar 100
	note __, 16
	note __, 16
	note __, 16
	note __, 6
;Bar 103
	intensity $a7
	note F_, 1
	note G#, 1
	intensity $b7
	note A#, 8
;Bar 104
	intensity $97
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $a7
	note A_, 6
	intensity $87
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $97
	note G_, 6
	intensity $87
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $97
	note A_, 4
;Bar 105
	;note F_, 0 | WARNING: Rounded down to 0
	intensity $a7
	note A#, 6
	intensity $87
	;note A#, 0 | WARNING: Rounded down to 0
	octave 4
	intensity $97
	note D_, 6
	octave 3
	intensity $87
	;note F_, 0 | WARNING: Rounded down to 0
	intensity $97
	note A#, 4
;Bar 106
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $a7
	note A_, 6
	intensity $87
	;note D_, 0 | WARNING: Rounded down to 0
	intensity $97
	note G_, 6
	intensity $87
	;note D#, 0 | WARNING: Rounded down to 0
	intensity $97
	note A_, 4
;Bar 107
	intensity $87
	;note E_, 0 | WARNING: Rounded down to 0
	intensity $97
	note A_, 16
	loopchannel 0, Music_MadameBoss_Ch2Loop

; ============================================================================================================

Music_MadameBoss_Ch3:
	notetype 12, $10
;Bar 1
	intensity $20
	note __, 16
	note __, 16
	note __, 16
;Bar 4
Music_MadameBoss_Ch3Loop:
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 4
	note __, 16
	note __, 12
;Bar 6
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 5
;Bar 8
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 4
	note __, 16
	note __, 12
;Bar 10
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note A_, 2 ; WARNING: Auto-Sync says: Rounded up!
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 5
;Bar 12
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 6
	octave 2
	;note G#, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 13
	octave 2
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 6
	octave 2
	;note G#, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 14
	octave 1
	;note F_, 0 | WARNING: Rounded down to 0
	octave 2
	note F_, 16
;Bar 15
	;note F_, 0 | WARNING: Rounded down to 0
	octave 3
	;note F_, 0 | WARNING: Rounded down to 0
	note __, 8
	octave 2
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note A#, 7
	octave 2
	;note G_, 0 | WARNING: Rounded down to 0
	octave 3
	note G_, 1
;Bar 16
	octave 2
;Bar 16
	octave 3
	note G#, 1
	octave 2
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 6
	octave 2
	;note G#, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 17
	octave 2
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 6
	octave 2
	;note G#, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 18
	octave 2
	;note F_, 0 | WARNING: Rounded down to 0
	octave 3
	note F_, 16
;Bar 19
	octave 2
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	;note A#, 0 | WARNING: Rounded down to 0
	note __, 15
	octave 4
	intensity $10
	note G_, 1
;Bar 20
	;note G#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	note A_, 2
	octave 5
	note C_, 4
	octave 4
	intensity $20
	note A#, 1
	note __, 1
	intensity $10
	note A_, 2
	note G_, 1
	note __, 1
;Bar 21
	note A_, 2
	octave 5
	note C_, 1
	note __, 3
	note C_, 9
	octave 4
	;note G#, 0 | WARNING: Rounded down to 0
	note A_, 1
;Bar 22
	note A#, 2
	note A_, 2
	note A#, 2
	octave 5
	note D_, 4
	intensity $20
	note C_, 1
	note __, 1
	octave 4
	intensity $10
	note A#, 2
	note A_, 1
	note __, 1
;Bar 23
	note A#, 2
	octave 5
	note D_, 1
	note __, 3
	note D_, 9
	note __, 1
;Bar 24
	octave 4
	intensity $20
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 6
	;note D_, 0 | WARNING: Rounded down to 0
	note G_, 6
	;note D_, 0 | WARNING: Rounded down to 0
	note F_, 4
;Bar 25
	octave 3
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note E_, 6
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 6
	;note D_, 0 | WARNING: Rounded down to 0
	note G_, 4
;Bar 26
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 6
	;note F_, 0 | WARNING: Rounded down to 0
	note A#, 6
	;note D#, 0 | WARNING: Rounded down to 0
	note G#, 4
;Bar 27
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 4
	note __, 12
;Bar 28
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 4
;Bar 30
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 4
;Bar 32
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 4
;Bar 34
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 4
;Bar 40
	octave 1
	intensity $10
	;note F_, 0 | WARNING: Rounded down to 0
	octave 2
	note F_, 2
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	intensity $20
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	note __, 1
	intensity $10
	;note F_, 0 | WARNING: Rounded down to 0
	octave 2
	note F_, 2
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	intensity $20
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1 ; WARNING: Auto-Sync says: Rounded up!
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	note __, 4
;Bar 41
	octave 2
	intensity $10
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 2
	octave 1
	intensity $20
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	octave 1
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	octave 1
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1 ; WARNING: Auto-Sync says: Rounded up!
	note __, 1
	intensity $10
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 2
	octave 1
	intensity $20
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	octave 1
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	octave 1
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	octave 1
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	note __, 4
;Bar 42
	intensity $10
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 2
	octave 1
	intensity $20
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	note __, 1
	intensity $10
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 2
	octave 1
	intensity $20
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	note __, 4
;Bar 43
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 2
	octave 2
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	note __, 1
	octave 2
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 2
	octave 2
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	note __, 4
;Bar 44
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	note __, 1
;Bar 45
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	note __, 1
;Bar 46
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	note __, 1
;Bar 47
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	note __, 14
;Bar 48
	octave 1
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	note __, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D#, 1
	note __, 1
;Bar 49
	octave 1
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	note __, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D#, 1
	note __, 1
;Bar 50
	octave 1
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	note __, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D#, 1
	note __, 1
;Bar 51
	octave 1
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	note __, 14
;Bar 52
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	note __, 1
;Bar 53
	octave 1
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	note __, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D#, 1
	note __, 1
;Bar 54
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	note __, 1
;Bar 55
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 2
;Bar 56
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 4
	note __, 16
	note __, 12
;Bar 58
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 5
;Bar 60
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 4
	note __, 16
	note __, 12
;Bar 62
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 5
;Bar 64
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 6
	octave 2
	;note G#, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 65
	octave 2
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 6
	octave 2
	;note G#, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 66
	octave 1
	;note F_, 0 | WARNING: Rounded down to 0
	octave 2
	note F_, 16
;Bar 67
	;note F_, 0 | WARNING: Rounded down to 0
	octave 3
	;note F_, 0 | WARNING: Rounded down to 0
	note __, 8
	octave 2
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	note A#, 7
	octave 2
	;note G_, 0 | WARNING: Rounded down to 0
	octave 3
	note G_, 1
;Bar 68
	octave 2
;Bar 68
	octave 3
	note G#, 1
	octave 2
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 6
	octave 2
	;note G#, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 69
	octave 2
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 6
	octave 2
	;note G#, 0 | WARNING: Rounded down to 0
	octave 3
	note G#, 6
	octave 2
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 4
;Bar 70
	octave 2
	;note F_, 0 | WARNING: Rounded down to 0
	octave 3
	note F_, 16
;Bar 71
	octave 2
	;note A#, 0 | WARNING: Rounded down to 0
	octave 3
	;note A#, 0 | WARNING: Rounded down to 0
	note __, 15
	octave 4
	intensity $10
	note G_, 1
;Bar 72
	;note G#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	note A_, 2
	octave 5
	note C_, 4
	octave 4
	intensity $20
	note A#, 1
	note __, 1
	intensity $10
	note A_, 2
	note G_, 1
	note __, 1
;Bar 73
	note A_, 2
	octave 5
	note C_, 1
	note __, 3
	note C_, 9
	octave 4
	;note G#, 0 | WARNING: Rounded down to 0
	note A_, 1
;Bar 74
	note A#, 2
	note A_, 2
	note A#, 2
	octave 5
	note D_, 4
	intensity $20
	note C_, 1
	note __, 1
	octave 4
	intensity $10
	note A#, 2
	note A_, 1
	note __, 1
;Bar 75
	note A#, 2
	octave 5
	note D_, 1
	note __, 3
	note D_, 9
	note __, 1
;Bar 76
	octave 4
	intensity $20
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 6
	;note D_, 0 | WARNING: Rounded down to 0
	note G_, 6
	;note D_, 0 | WARNING: Rounded down to 0
	note F_, 4
;Bar 77
	octave 3
	;note A_, 0 | WARNING: Rounded down to 0
	octave 4
	note E_, 6
	;note C_, 0 | WARNING: Rounded down to 0
	note F_, 6
	;note D_, 0 | WARNING: Rounded down to 0
	note G_, 4
;Bar 78
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 6
	;note F_, 0 | WARNING: Rounded down to 0
	note A#, 6
	;note D#, 0 | WARNING: Rounded down to 0
	note G#, 4
;Bar 79
	;note E_, 0 | WARNING: Rounded down to 0
	note A_, 4
	note __, 12
;Bar 80
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 4
;Bar 82
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 4
;Bar 84
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 4
;Bar 86
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 4
;Bar 92
	octave 1
	intensity $10
	;note F_, 0 | WARNING: Rounded down to 0
	octave 2
	note F_, 2
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	intensity $20
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	note __, 1
	intensity $10
	;note F_, 0 | WARNING: Rounded down to 0
	octave 2
	note F_, 2
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	intensity $20
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	octave 0 ;WARNING: Octave 0 isn't supported, won't work correctly
	;note A#, 0 | WARNING: Rounded down to 0
	octave 1
	note A#, 1
	note __, 4
;Bar 93
	octave 2
	intensity $10
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 2
	octave 1
	intensity $20
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	octave 1
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	octave 1
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	note __, 1
	intensity $10
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 2
	octave 1
	intensity $20
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	octave 1
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	octave 1
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	octave 1
	;note G_, 0 | WARNING: Rounded down to 0
	octave 2
	note G_, 1
	note __, 4
;Bar 94
	intensity $10
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 2
	octave 1
	intensity $20
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	note __, 1
	intensity $10
	;note E_, 0 | WARNING: Rounded down to 0
	octave 3
	note E_, 2
	octave 1
	intensity $20
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 1
	note __, 4
;Bar 95
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 2
	octave 2
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	note __, 1
	octave 2
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 3
	note A_, 2
	octave 2
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	octave 2
	;note D_, 0 | WARNING: Rounded down to 0
	octave 3
	note D_, 1
	note __, 4
;Bar 96
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	note __, 1
;Bar 97
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	note __, 1
;Bar 98
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	note __, 1
;Bar 99
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	note __, 14
;Bar 100
	octave 1
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	note __, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D#, 1
	note __, 1
;Bar 101
	octave 1
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	note __, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D#, 1
	note __, 1
;Bar 102
	octave 1
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	note __, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D#, 1
	note __, 1
;Bar 103
	octave 1
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	note __, 14
;Bar 104
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	note __, 1
;Bar 105
	octave 1
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	note __, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	note D#, 1
	octave 1
	intensity $10
	;note A#, 0 | WARNING: Rounded down to 0
	octave 2
	note A#, 2
	octave 1
	intensity $20
	;note D#, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D#, 1
	note __, 1
;Bar 106
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	note __, 1
;Bar 107
	octave 1
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	note __, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	note D_, 1
	octave 1
	intensity $10
	;note A_, 0 | WARNING: Rounded down to 0
	octave 2
	note A_, 2
	octave 1
	intensity $20
	;note D_, 0 | WARNING: Rounded down to 0
	octave 2
	intensity $10
	note D_, 1
	loopchannel 0, Music_MadameBoss_Ch3Loop

; ============================================================================================================

Music_MadameBoss_Ch4:
	togglenoise 1 ; WARNING: this might sound bad.
	notetype 12
;Bar 1
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
;Bar 2
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
;Bar 3
	note C#, 16
;Bar 4
	;note F#, 0 | WARNING: Rounded down to 0
Music_MadameBoss_Ch4Loop:
	note A_, 2
	note G#, 2 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 2
	note F#, 2
	note G#, 2
	note G#, 2
	note F#, 2
	note G#, 2
;Bar 5
	note F#, 2
	note G#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note G#, 2
	note F#, 2
	note G#, 2 ; WARNING: Auto-Sync says: Rounded up!
;Bar 6
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2 ; WARNING: Auto-Sync says: Rounded up!
;Bar 7
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1 ; WARNING: Auto-Sync says: Rounded up!
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 8
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 9
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 10
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 11
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1 ; WARNING: Auto-Sync says: Rounded up!
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 12
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 13
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2 ; WARNING: Auto-Sync says: Rounded up!
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 14
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 15
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1 ; WARNING: Auto-Sync says: Rounded up!
;Bar 16
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 17
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 18
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2 ; WARNING: Auto-Sync says: Rounded up!
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 19
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2 ; WARNING: Auto-Sync says: Rounded up!
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 20
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 21
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 22
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 23
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 24
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 25
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 26
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 27
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2 ; WARNING: Auto-Sync says: Rounded up!
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 28
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 29
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 30
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 31
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 32
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2 ; WARNING: Auto-Sync says: Rounded up!
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 33
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2 ; WARNING: Auto-Sync says: Rounded up!
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 34
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 35
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 36
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2 ; WARNING: Auto-Sync says: Rounded up!
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 37
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 38
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 39
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1 ; WARNING: Auto-Sync says: Rounded up!
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 40
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2 ; WARNING: Auto-Sync says: Rounded up!
;Bar 41
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1 ; WARNING: Auto-Sync says: Rounded up!
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 42
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 43
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 44
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 45
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1 ; WARNING: Auto-Sync says: Rounded up!
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 46
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 47
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 16
;Bar 48
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 49
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 50
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 51
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 16
;Bar 52
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 53
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 54
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 55
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 56
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note G#, 2
	note F#, 2
	note G#, 2
;Bar 57
	note F#, 2
	note G#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note G#, 2
	note F#, 2
	note G#, 2
;Bar 58
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 59
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 60
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 61
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 62
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 63
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 64
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 65
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 66
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 67
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 68
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 69
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 70
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 71
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 72
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 73
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 74
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 75
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 76
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 77
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 78
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 79
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 80
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 81
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 82
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 83
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 84
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 85
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 86
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 87
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 88
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 89
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 90
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 91
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 92
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 93
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 94
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 95
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note F#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 96
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 97
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 98
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 99
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 16
;Bar 100
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 101
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 102
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 103
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 16
;Bar 104
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 105
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 106
	;note C#, 0 | WARNING: Rounded down to 0
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	;note C#, 0 | WARNING: Rounded down to 0
	note A_, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 2
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C_, 0 | WARNING: Rounded down to 0
	note G#, 2
;Bar 107
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	note G#, 1
	note C#, 1
	note G#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	;note F#, 0 | WARNING: Rounded down to 0
	note C#, 2
	;note C#, 0 | WARNING: Rounded down to 0
	note G#, 1
	;note C#, 0 | WARNING: Rounded down to 0
	note C#, 1
;Bar 108
	;note C#, 0 | WARNING: Rounded down to 0
	loopchannel 0, Music_MadameBoss_Ch4Loop

; ============================================================================================================

