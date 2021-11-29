;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 4.0 (17-Jun-2020)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.

; ============================================================================================================

Music_CinnabarIslandGBS:
	musicheader 2, 1, Music_CinnabarIslandGBS_Ch1
	musicheader 1, 2, Music_CinnabarIslandGBS_Ch2

Music_CinnabarIslandGBS_Ch1:
	volume $77
	dutycycle $3
	notetype 12, $c7
	vibrato $08, $16
	tempo 277
	stereopanning $f
;Bar 1
	note __, 4
	intensity $a7
	octave 3
	note D_, 4
	note E_, 6
	note C#, 2
;Bar 2
	note D_, 4
	note B_, 4
	octave 4
	note C_, 6
	octave 3
	note A_, 2
;Bar 3
	note B_, 4
	note G_, 4
	note F#, 4
	note E_, 2
	note F#, 2
;Bar 4
	note G_, 8
	note F#, 4
	intensity $97
	note E_, 4
;Bar 5
	intensity $a7
	note D_, 4
	note E_, 4
	note F#, 6
	note A_, 2
;Bar 6
	note G_, 4
	note B_, 4
	octave 4
	note C_, 6
	octave 3
	note A_, 2
;Bar 7
	note B_, 4
	note G_, 4
	note F#, 3
	note E_, 1
	note F#, 2
	note A_, 2
;Bar 8
	note G_, 4
	intensity $97
	octave 4
rept 2
	note D_, 1
	note E_, 1
	note D_, 4
endr
;Bar 9
	intensity $a7
	octave 3
	note B_, 6
	intensity $97
	note G_, 2
	note E_, 8
;Bar 10
	intensity $a7
	octave 4
	note C_, 6
	intensity $97
	octave 3
	note A_, 2
	note F#, 8
;Bar 11
	intensity $a7
	octave 4
	note F#, 6
	intensity $97
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
;Bar 12
	intensity $a7
	note G_, 8
	intensity $97
	note F#, 4
	note E_, 4
	loopchannel 0, Music_CinnabarIslandGBS_Ch1

; ============================================================================================================

Music_CinnabarIslandGBS_Ch2:
	dutycycle $2
	notetype 12, $b7
	vibrato $08, $16
	stereopanning $f0
;Bar 1
	callchannel Music_CinnabarIslandGBS_Ch2_Main
	note E_, 2
;Bar 4
	note D_, 4
	octave 3
	note B_, 8
	intensity $a7
	note A_, 4
;Bar 5
	intensity $b7
	callchannel Music_CinnabarIslandGBS_Ch2_Main
	
	note D_, 1
	note E_, 1
;Bar 8
	note D_, 4
	octave 3
	note A_, 4
	note G_, 4
	note F#, 4
;Bar 9
	octave 4
	note D_, 6
	octave 3
	note B_, 2
	note G_, 8
;Bar 10
	octave 4
	note E_, 6
	note C_, 2
	octave 3
	note A_, 8
;Bar 11
	octave 4
	note A_, 6
	note F#, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
;Bar 12
	note B_, 4
	octave 4
	note D_, 4
	octave 3
	note B_, 2
	note A_, 6
	loopchannel 0, Music_CinnabarIslandGBS_Ch2

Music_CinnabarIslandGBS_Ch2_Main:
	octave 3
	note G_, 6
	note A_, 1
	note B_, 1
	octave 4
	note C_, 6
	note D_, 1
	note E_, 1
;Bar 2
	note D_, 4
	note G_, 4
	note A_, 6
	note G_, 1
	note F#, 1
;Bar 3
	note E_, 4
	note D_, 4
	note C_, 3
	octave 3
	note B_, 1
	octave 4
	note C_, 2
	endchannel

; ============================================================================================================
