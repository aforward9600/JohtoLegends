;MIDI made by LyricWulf
;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 5.0.1 (7-Feb-2021)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.

; ============================================================================================================

Music_UnwaveringHeart:
	musicheader 4, 1, Music_UnwaveringHeart_Ch1
	musicheader 1, 2, Music_UnwaveringHeart_Ch2
	musicheader 1, 3, Music_UnwaveringHeart_Ch3
	musicheader 1, 4, Music_UnwaveringHeart_Ch4

; ============================================================================================================

Music_UnwaveringHeart_Ch1:
	tempo 222
	volume $77
	dutycycle $1
	notetype 3, $a7
;Bar 1, 64
UnwaveringHeartLoop1:
	octave 4
	intensity $57
	note F#, 16
	note __, 7
	octave 5
	note C#, 8
	note E_, 16
	note __, 16
	note __, 1
;Bar 2, 64
	octave 4
	note F#, 16
	note __, 7
	octave 5
	note C#, 8
	note E_, 16
	note __, 16
	note __, 1
;Bar 3, 64
	octave 4
	note F#, 16
	note __, 16
	octave 5
	note E_, 16
	note F#, 16
;Bar 4, 64
	note C#, 16
	note __, 15
	note C#, 8
	octave 4
	note B_, 8
	note A_, 8
	note G#, 7
	note __, 2
;Bar 5, 64
	note F#, 16
	note __, 7
	octave 5
	note C#, 8
	note E_, 16
	note __, 16
	note __, 1 ; WARNING: Auto-Sync says: Rounded down!
;Bar 6, 64
	octave 4
	note F#, 16
	note __, 7
	octave 5
	note C#, 8
	note E_, 16
	note __, 16
	note __, 1
;Bar 7, 64
	octave 4
	note F#, 16
	note __, 16
	note __, 8
	note B_, 8
	note A_, 8
	note G#, 8
;Bar 8, 64
	note E_, 16
	note __, 16
	intensity $87
	note C#, 8
	octave 3
	note B_, 8
	note A_, 8
	note G#, 8
;Bar 9, 72
	note F#, 8
	octave 2
	intensity $57
	note A_, 8
	octave 3
	intensity $67
	note D_, 8
	octave 4
	intensity $97
	note C#, 8
	note E_, 16
	octave 3
	intensity $77
	note A_, 16
	octave 1
	intensity $97
	note A_, 8
;Bar 10, 64
	octave 3
	note F#, 8
	octave 2
	intensity $57
	note B_, 8
	octave 3
	intensity $67
	note E_, 8
	octave 4
	intensity $97
	note C#, 8
	note E_, 16
	octave 3
	intensity $67
	note E_, 8
	note __, 8
;Bar 11, 64
	intensity $97
	note F#, 8
	octave 2
	intensity $57
	note G#, 8
	intensity $67
	note B_, 8
	octave 3
	note C#, 8
	octave 4
	intensity $87
	note E_, 8
	octave 2
	intensity $57
	note B_, 8
	octave 4
	intensity $87
	note F#, 8
	octave 1
	intensity $77
	note B_, 8
;Bar 12, 64
	octave 4
	intensity $97
	note C#, 8
	octave 2
	intensity $57
	note A_, 8
	octave 3
	intensity $67
	note C#, 8
	note E_, 8
	octave 4
	intensity $87
	note C#, 8
	octave 3
	note B_, 8
	note A_, 8
	intensity $77
	note G#, 8
;Bar 13, 64
	intensity $87
	note F#, 8
	octave 2
	intensity $47
	note F#, 8
	intensity $57
	note B_, 8
	octave 3
	note D_, 8
	intensity $77
	note F#, 8
	octave 2
	intensity $67
	note A_, 8 ; WARNING: Auto-Sync says: Rounded down!
	octave 3
	intensity $77
	note A_, 8
	octave 1 ;WARNING: Octave 0 isn't supported, won't work correctly
	intensity $97
	note F#, 8
;Bar 14, 64
	octave 3
	note G#, 8
	octave 2
	intensity $47
	note G#, 8
	intensity $57
	note B_, 8
	octave 3
	note E_, 8
	intensity $77
	note G#, 8
	octave 2
	intensity $67
	note B_, 8
	octave 3
	intensity $77
	note B_, 8
	octave 1
	intensity $67
	note C#, 8
;Bar 15, 64
	octave 3
	intensity $97
	note A_, 8
	octave 2
	intensity $57
	note A_, 8
	octave 3
	intensity $67
	note D_, 8
	note E_, 8
	intensity $87
	note F#, 8
	octave 2
	intensity $57
	note A_, 8
	octave 3
	intensity $87
	note A_, 16
;Bar 16, 64
	note A_, 8
	octave 2
	intensity $57
	note B_, 8
	octave 3
	intensity $67
	note E_, 8
	intensity $77
	note A_, 8
	intensity $67
	note G#, 16
	octave 4
	intensity $77
	note G#, 8
	note A_, 8
;Bar 17, 64
	intensity $67
	note A_, 16
	note A_, 16
	intensity $57
	note G#, 16
	intensity $37
	note E_, 16
;Bar 18, 48, 1144
	note F#, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_UnwaveringHeart_Ch1
	endchannel

; ============================================================================================================

Music_UnwaveringHeart_Ch2:
	dutycycle $1
	notetype 3, $a7
;Bar 1, 64
UnwaveringHeartLoop2:
	octave 4
	intensity $57
	note F#, 16
	note __, 7
	octave 5
	note C#, 8
	note E_, 16
	note __, 16
	note __, 1
;Bar 2, 64
	octave 4
	note F#, 16
	note __, 7
	octave 5
	note C#, 8
	note E_, 16
	note __, 16
	note __, 1
;Bar 3, 64
	octave 4
	note F#, 16
	note __, 16
	octave 5
	note E_, 16
	note F#, 16
;Bar 4, 64
	note C#, 16
	note __, 15
	note C#, 8
	octave 4
	note B_, 8
	note A_, 8
	note G#, 7
	note __, 2
;Bar 5, 64
	note F#, 16
	note __, 7
	octave 5
	note C#, 8
	note E_, 16
	note __, 16
	note __, 1 ; WARNING: Auto-Sync says: Rounded down!
;Bar 6, 64
	octave 4
	note F#, 16
	note __, 7
	octave 5
	note C#, 8
	note E_, 16
	note __, 16
	note __, 1
;Bar 7, 64
	octave 4
	note F#, 16
	note __, 16
	note __, 8
	note B_, 8
	note A_, 8
	note G#, 8
;Bar 8, 64
	note E_, 16
	note __, 16
	intensity $87
	note C#, 8
	octave 3
	note B_, 8
	note A_, 8
	note G#, 8
;Bar 9, 72
	note F#, 8
	octave 2
	intensity $57
	note A_, 8
	octave 3
	intensity $67
	note D_, 8
	octave 4
	intensity $97
	note C#, 8
	note E_, 16
	octave 3
	intensity $77
	note A_, 16
	octave 1
	intensity $97
	note A_, 8
;Bar 10, 64
	octave 3
	note F#, 8
	octave 2
	intensity $57
	note B_, 8
	octave 3
	intensity $67
	note E_, 8
	octave 4
	intensity $97
	note C#, 8
	note E_, 16
	octave 3
	intensity $67
	note E_, 8
	note __, 8
;Bar 11, 64
	intensity $97
	note F#, 8
	octave 2
	intensity $57
	note G#, 8
	intensity $67
	note B_, 8
	octave 3
	note C#, 8
	octave 4
	intensity $87
	note E_, 8
	octave 2
	intensity $57
	note B_, 8
	octave 4
	intensity $87
	note F#, 8
	octave 1
	intensity $77
	note B_, 8
;Bar 12, 64
	octave 4
	intensity $97
	note C#, 8
	octave 2
	intensity $57
	note A_, 8
	octave 3
	intensity $67
	note C#, 8
	note E_, 8
	octave 4
	intensity $87
	note C#, 8
	octave 3
	note B_, 8
	note A_, 8
	intensity $77
	note G#, 8
;Bar 13, 64
	intensity $87
	note F#, 8
	octave 2
	intensity $47
	note F#, 8
	intensity $57
	note B_, 8
	octave 3
	note D_, 8
	intensity $77
	note F#, 8
	octave 2
	intensity $67
	note A_, 8 ; WARNING: Auto-Sync says: Rounded down!
	octave 3
	intensity $77
	note A_, 8
	octave 1 ;WARNING: Octave 0 isn't supported, won't work correctly
	intensity $97
	note F#, 8
;Bar 14, 64
	octave 3
	note G#, 8
	octave 2
	intensity $47
	note G#, 8
	intensity $57
	note B_, 8
	octave 3
	note E_, 8
	intensity $77
	note G#, 8
	octave 2
	intensity $67
	note B_, 8
	octave 3
	intensity $77
	note B_, 8
	octave 1
	intensity $67
	note C#, 8
;Bar 15, 64
	octave 3
	intensity $97
	note A_, 8
	octave 2
	intensity $57
	note A_, 8
	octave 3
	intensity $67
	note D_, 8
	note E_, 8
	intensity $87
	note F#, 8
	octave 2
	intensity $57
	note A_, 8
	octave 3
	intensity $87
	note A_, 16
;Bar 16, 64
	note A_, 8
	octave 2
	intensity $57
	note B_, 8
	octave 3
	intensity $67
	note E_, 8
	intensity $77
	note A_, 8
	intensity $67
	note G#, 16
	octave 4
	intensity $77
	note G#, 8
	note A_, 8
;Bar 17, 64
	intensity $67
	note A_, 16
	note A_, 16
	intensity $57
	note G#, 16
	intensity $37
	note E_, 16
;Bar 18, 48, 1144
	note F#, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_UnwaveringHeart_Ch2
	endchannel

Music_UnwaveringHeart_Ch3:
	notetype 3, $a7
;Bar 1, 64
	octave 3
	intensity $20
	note D_, 16
	note __, 16 ; WARNING: Auto-Sync says: Rounded down!
	note __, 16
	note __, 16
;Bar 2, 64
	note B_, 16 ; WARNING: Auto-Sync says: Rounded down!
	note __, 16
	note __, 16
	note __, 16
;Bar 3, 64
	note B_, 16 ; WARNING: Auto-Sync says: Rounded down!
	note __, 16
	note __, 16
	note __, 16
;Bar 4, 64
	note F#, 16 ; WARNING: Auto-Sync says: Rounded down!
	note __, 16 ; WARNING: Auto-Sync says: Rounded down!
	note E_, 16 ; WARNING: Auto-Sync says: Rounded up!
	note __, 16
;Bar 5, 64
	note B_, 16 ; WARNING: Auto-Sync says: Rounded down!
	note __, 16
	note __, 16
	note __, 16
;Bar 6, 64
	note A_, 16
	note __, 16
	note __, 16
	note __, 16
;Bar 7, 64
	note B_, 16 ; WARNING: Auto-Sync says: Rounded down!
	note __, 48
;Bar 8, 64
	note __, 16
	note F#, 16
	note __, 16
	note __, 16
;Bar 9, 72
	note B_, 8
	note A_, 8
	note G#, 16
;Bar 9, 72
	note D_, 8
	note A_, 8
	note __, 16
	note __, 16
	note __, 16
	note __, 8
;Bar 10, 64
	note E_, 8
	note B_, 16
	note B_, 16
	note __, 8
	note B_, 8
	note __, 8
;Bar 11, 64
	note B_, 16
	note C#, 8
	note G#, 8
	note B_, 16
	note __, 16
;Bar 12, 64
	note F#, 16
	note __, 16
	note E_, 16
	note __, 16
;Bar 13, 64
	note B_, 8
	note F#, 8
	note B_, 8
	note F#, 8
	note __, 8
	note F_, 16
	note __, 8
;Bar 14, 64
	note C#, 12
	note G#, 4
	note B_, 16
	note __, 4
	note __, 16
	note __, 8
	note C#, 4
;Bar 15, 64
	note C#, 4
	note A_, 8
	note A_, 8
	note D_, 8
	note __, 4
	note A_, 10
	note __, 12
	note A_, 10
;Bar 16, 64
	note B_, 16
	note __, 16
	note __, 16
	note __, 16
;Bar 17, 64
	note A_, 16
	note __, 16
	note E_, 16
	note __, 16
;Bar 18, 48, 1144
	note B_, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_UnwaveringHeart_Ch3
	endchannel

Music_UnwaveringHeart_Ch4:
	notetype 3, $10
	endchannel

; ============================================================================================================
