;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 5.2.1 (08-May-2023)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.

; ============================================================================================================

Music_MarnieBattle:
	musicheader 4, 1, Music_MarnieBattle_Ch1
	musicheader 1, 2, Music_MarnieBattle_Ch2
	musicheader 1, 3, Music_MarnieBattle_Ch3
	musicheader 1, 4, Music_MarnieBattle_Ch4

Music_MarnieBattle_Ch1:
	dutycycle $0
	notetype 12, $78
	tempo 119
;Bar 0
	note __, 16
;Bar 1
	octave 4
	note __, 2
	intensity $4f
	note A_, 12
	intensity $e2
	note A_, 1
;Bar 1
	vibrato $08, $24
	intensity $78
	octave 2
	callchannel Music_MarnieBattle_Ch1_Type2
;Bar 3
	note A_, 16
;Bar 4
	callchannel Music_MarnieBattle_Ch1_Type2
;Bar 5
	note A_, 16
;Bar 6
Music_MarnieBattle_Ch1_loop:
	notetype 12, $77
	dutycycle $0
	octave 1
	note A#, 2
	note A#, 2
	note A#, 6
	note A#, 6
;Bar 7
	octave 2
	note C_, 6
	note C_, 6
	note C_, 4
;Bar 8
	note __, 2
	note C_, 2
	note D_, 2
	note __, 2
	note C_, 2
	note D_, 2
	note __, 2
	octave 1
	note G_, 2
;Bar 9
	octave 2
	note F_, 2
	note C_, 2
	octave 1
	note G_, 2
	octave 2
	note F_, 2
	note __, 4
	note C_, 2
	note __, 2
;Bar 10
	octave 1
	note A#, 2
	note A#, 2
	note A#, 6
	note A#, 6
;Bar 11
	octave 2
	note C_, 6
	note C_, 6
	note C_, 4
;Bar 12
	note __, 2
	octave 1
	note G_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	intensity $68
	note A_, 16
	intensity $67
	note A_, 4
;Bar 14
	intensity $77
	note A#, 2
	note A_, 2
	note A#, 2
	note __, 4
	note F_, 3
	note __, 1
	note A#, 4
;Bar 15
	note A_, 2
	note A#, 2
	note __, 6
	note F_, 2
	note __, 2
;Bar 16
	callchannel Music_MarnieBattle_Ch1_Type1
;Bar 17
	octave 1
	note G_, 2
	octave 2
	note C_, 2
	note __, 6
	note C_, 2
	octave 1
	note B_, 2
;Bar 18
	note A#, 2
	note A_, 2
	note A#, 2
	note __, 4
	note F_, 3
	note __, 1
	note A#, 4
;Bar 19
	note A_, 2
	note A#, 2
	note __, 6
	note F_, 2
	note __, 2
;Bar 20
	callchannel Music_MarnieBattle_Ch1_Type1
;Bar 21
	note D_, 2
	note C_, 2
	note __, 6
	note C_, 2
	octave 1
	note B_, 2
;Bar 22
	note A#, 2
	note A#, 2
	note A#, 2
	note __, 4
	note A#, 2
	note __, 4
;Bar 23
	octave 2
	note C_, 2
	note __, 4
	note C_, 2
	note __, 4
	note C_, 2
	note __, 2
;Bar 24
	note C_, 1
	note __, 1
	note D_, 1
	note __, 3
	note C_, 1
	note __, 1
	note D_, 1
	note __, 3
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
;Bar 25
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 4
	note C_, 4
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
;Bar 26
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 5
	note A#, 1
	note __, 5
;Bar 27
	octave 2
	note C_, 1
	note __, 5
	note C_, 1
	note __, 5
	note C_, 1
	note __, 3
;Bar 28
	note C_, 1
	note __, 1
	note D_, 1
	note __, 3
	note C_, 1
	note __, 1
	note D_, 1
	note __, 3
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
;Bar 29 ;part 2
	intensity $77
	note C_, 1
	note __, 9
	note D_, 2
	note __, 4
;Bar 30
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 3
	note C_, 1
	note __, 3
;Bar 31
	note C_, 1
	note __, 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
;Bar 32
	octave 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 3
	note A#, 1
	note __, 3
;Bar 33
	note A#, 1
	note __, 3
	note A#, 1
	note __, 1
	note A#, 1
	note __, 3
	note A#, 1
	note __, 3
;Bar 34
	octave 2
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 3
	note C_, 1
	note __, 3
;Bar 35
	note C_, 1
	note __, 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
;Bar 36
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
;Bar 37
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	intensity $87
	dutycycle $2
	octave 3
	note A_, 2
	note F_, 2
	dutycycle $0
	octave 2
	note D_, 1
	note __, 3
;Bar 38
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 2
	note D_, 1
	note __, 3
	note C_, 1
	note __, 3
;Bar 39
	note C_, 1
	note __, 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
;Bar 40
	octave 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 3
	note A#, 1
	note __, 3
;Bar 41
	note A#, 1
	note __, 3
	note A#, 1
	note __, 1
	note A#, 1
	note __, 3
	note A#, 1
	note __, 3
;Bar 42
	note A#, 1
	note __, 5
	note A#, 1
	note __, 5
	octave 2
	note C_, 1
	note __, 5
;Bar 43
	note C_, 1
	note __, 5
	note C_, 1
	note __, 3
	octave 1
	note A_, 1
	note __, 3
;Bar 44
	octave 2
	note C_, 1
	note __, 1
	note D_, 4
	note D_, 1
	note __, 16
	note __, 9
;Bar 46
	note C_, 1
	note __, 1
	note D_, 1
	note __, 3
	note C_, 1
	note __, 1
	note D_, 1
	note __, 5
	note C_, 1
	note __, 3
;Bar 47
	note D_, 1
	note __, 3
	note G_, 1
	note __, 1
	note F_, 1
	note __, 3
	note C_, 1
	note __, 3
;Bar 48
	callchannel Music_MarnieBattle_Ch1_Type3
;Bar 49
	note C_, 1
	note __, 3
	octave 1
	note B_, 1
	note __, 9
;Bar 50
	octave 2
	note C_, 1
	note __, 1
	note D_, 1
	note __, 3
	note C_, 1
	note __, 1
	note D_, 1
	note __, 5
	note C_, 1
	note __, 3
;Bar 51
	note D_, 1
	note __, 3
	note G_, 1
	note __, 1
	note F_, 1
	note __, 3
	note C_, 1
	note __, 3
;Bar 52
	callchannel Music_MarnieBattle_Ch1_Type3
;Bar 53
	note C_, 1
	note __, 3
	octave 1
	note B_, 1
	note __, 9
	loopchannel 0, Music_MarnieBattle_Ch1_loop

Music_MarnieBattle_Ch1_Type1:
	octave 2
	note C_, 2
	octave 1
	note B_, 2
	octave 2
	note C_, 2
	note __, 4
	octave 1
	note G_, 2
	note __, 2
	octave 2
	note C_, 4
	endchannel

Music_MarnieBattle_Ch1_Type2:
	note G_, 2
	note D_, 2
	note A_, 12
	endchannel

Music_MarnieBattle_Ch1_Type3:
	note C_, 1
	note __, 1
	note D_, 1
	note __, 3
	note C_, 1
	note __, 1
	note D_, 1
	note __, 9
	endchannel

; ============================================================================================================

Music_MarnieBattle_Ch2:
	dutycycle $0
	notetype 12, $75
;Bar 0
	note __, 1
	octave 4
	note G#, 1
	note F_, 1
	note D#, 1

	note C#, 1
	octave 3
	note B_, 1
	note A#, 1
	note G#, 1

	note F#, 1
	note G#, 1
	note G#, 1
	note F#, 1

	note G#, 1
	note A#, 1
	note G#, 1
	note F#, 1
;Bar 1
	note F_, 1
	note D#, 1
	note C#, 1
	octave 2
	note B_, 1

	note A#, 1
	note G#, 1
	note F#, 1
	note F_, 1

	note D#, 1
	note C#, 1
	octave 1
	note B_, 1
	note A#, 1
	intensity $72
	note G#, 3
;Bar 2
	dutycycle $1
	intensity $95
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
;Bar 3
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
;Bar 4
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
;Bar 5
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
;Bar 6
Music_MarnieBattle_Ch2_loop:
	octave 3
	dutycycle $1
	intensity $95
	note D_, 16
;Bar 7
	note E_, 16
;Bar 8
	note D_, 16
	note D_, 16
;Bar 10
	note D_, 16
;Bar 11
	note E_, 16
	note __, 2
;Bar 12
	intensity $87
	note E_, 2
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	intensity $88
	note C#, 14
	intensity $87
	note C#, 6
;Bar 14
	dutycycle $2
	vibrato $04, $16
	intensity $A5
	note __, 4
	octave 5
	note D_, 2
	note C_, 2
	note D_, 2
	octave 4
	note A#, 4
	octave 5
	note F_, 4
;Bar 15
	note E_, 2
	note F_, 4
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note F_, 2
;Bar 16
	note G_, 6
	note E_, 16
;Bar 17
	note __, 14
;Bar 18
	note D_, 2
	note C_, 2
	note D_, 2
	octave 4
	note A#, 4
	octave 5
	note F_, 4
;Bar 19
	note E_, 2
	note F_, 4
	octave 4
	note A#, 4
	octave 5
	note A_, 4
;Bar 20
	note G_, 6
	octave 6
	note C_, 4
	octave 5
	note E_, 4
	note G_, 4
;Bar 21
	note A_, 2
	note G_, 11
	note __, 5
;Bar 22
	note D_, 2
	note E_, 2
	note F_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	note A_, 2
;Bar 23
	note G_, 6
	octave 6
	note C_, 6
	octave 5
	note E_, 4
;Bar 24
	note E_, 2
	note F_, 14
	note __, 16
	note __, 4
;Bar 26
	note D_, 2
	note E_, 2
	note F_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	note A_, 2
;Bar 27
	note G_, 6
	octave 6
	note C_, 6
	note E_, 4
;Bar 28
	note E_, 6
	intensity $b7
	note F_, 11
	note __, 7
	;end octave shift
;Bar 29
	dutycycle $1
	vibrato 0,0 
	intensity $97
	octave 3
	note A_, 2
	note D_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
;Bar 30
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 31
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 32
	note G_, 4
	note A_, 2
	octave 5
	intensity $A5
	dutycycle $2
	note D_, 2
	note F_, 2
	note A_, 2
	note __, 2
	note G_, 2
;Bar 33
	note __, 2
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	dutycycle $1
	intensity $97
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
;Bar 34
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 35
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note A_, 4
	note __, 4
;Bar 36
	intensity $A5
	dutycycle $2
	octave 4
	note D_, 2
	octave 3
	note G_, 2
	note A_, 2
	note G_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note A_, 4
;Bar 37
	octave 4
	note C_, 2
	note D_, 2
	intensity $95
	note A_, 2
	dutycycle $1
	intensity $97
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
;Bar 38
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 39
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 40
	note G_, 4
	note A_, 2
	octave 5
	intensity $A5
	dutycycle $2
	note D_, 2
	note F_, 2
	note A_, 2
	note __, 2
	note G_, 2
;Bar 41
	note __, 2
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	intensity $87
	dutycycle $1
	octave 3
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note E_, 2
;Bar 42
	octave 3
	note D_, 6
	note A_, 6
	note G_, 6
;Bar 43
	note E_, 6
	note C_, 4
	octave 2
	note A_, 4
;Bar 44
	octave 3
	note C_, 2
	note D_, 4
	intensity $76
	note D_, 10
	dutycycle $1
	intensity $77
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
;Bar 50
	octave 5
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 2
	note C_, 4
;Bar 51
	note D_, 4
	note G_, 2
	note F_, 4
	note C_, 4
;Bar 52
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 6
;Bar 53
	note C_, 4
	octave 4
	note B_, 10
	loopchannel 0, Music_MarnieBattle_Ch2_loop

; ============================================================================================================

Music_MarnieBattle_Ch3:
	notetype 12, $17
	volume $55
;bar 0
	note __, 1
	octave 5
	note F#, 1
	note F#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note F_, 1
	note D#, 1
	note C#, 1
	octave 4
	note B_, 1
	note A#, 1
	note B_, 1
	octave 5
	note C#, 1
	note D#, 1
	octave 4
	note B_, 1
	octave 5
	note C#, 1
;Bar 1
	note D#, 1
	octave 4
	note A#, 1
	octave 5
	note F#, 1
	note F#, 12
	volume $77
;Bar 2
	intensity $16
	octave 4
	callchannel Music_MarnieBattle_Ch1_Type2
;Bar 3
	note A_, 16
;Bar 4
	callchannel Music_MarnieBattle_Ch1_Type2
;Bar 5
	note A_, 16
;Bar 6
Music_MarnieBattle_Ch3_loop:
	intensity $16
	octave 4
	note D_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note A_, 2
	note G_, 2
	note A_, 2
	note C_, 2
	note D_, 4
;Bar 7
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note F_, 2
;Bar 8
	note __, 2
	note C_, 2
	note D_, 2
	note __, 2
	note C_, 2
	note D_, 2
	note __, 2
	note G_, 2
;Bar 9
	note F_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note __, 4
	note C_, 2
	note __, 2
;Bar 10
	note D_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note A_, 2
	note G_, 2
	note A_, 2
	note C_, 2
	note D_, 4
;Bar 11
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note G_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note F_, 2
;Bar 12
	note __, 2
	note G_, 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 16
	intensity $26
	note G_, 4
;Bar 14
	intensity $16
	note __, 4
	note D_, 2
	note C_, 2
	note __, 2
	octave 3
	note A#, 4
	octave 4
	note F_, 4
;Bar 15
	note E_, 2
	note F_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 2
	note F_, 2
;Bar 16
	note G_, 6
	note E_, 16
	note E_, 5
	intensity $26
	note E_, 4
	intensity $16
;Bar 18
	note __, 5
	note D_, 2
	note C_, 2
	note D_, 2
	octave 3
	note A#, 4
	octave 4
	note F_, 4
;Bar 19
	note E_, 2
	note F_, 4
	octave 3
	note A#, 4
	octave 4
	note A_, 4
;Bar 20
	note G_, 6
	octave 5
	note C_, 4
	octave 4
	note E_, 4
	note G_, 4
;Bar 21
	note A_, 2
	note G_, 11
;Bar 22
	note __, 5
	note D_, 2
	note E_, 2
	note F_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note A_, 2
;Bar 23
	note G_, 6
	octave 5
	note C_, 6
	octave 4
	note E_, 4
;Bar 24
	note __, 2
	note F_, 14
;Bar 25
	note __, 16
	note __, 4
;Bar 26
	note D_, 2
	note E_, 2
	note F_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note A_, 2
;Bar 27
	note G_, 6
	octave 5
	note C_, 6
	note E_, 4
;Bar 28
	note E_, 6
	note F_, 11
	intensity $26
	note F_, 2
	note __, 5
;Bar 29 Part 2
	intensity $15
	octave 5
	note A_, 2
	note D_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 30
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 31
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
;Bar 32
	note G_, 4
	note A_, 2
	note D_, 11
	intensity $25
	note D_, 2
	intensity $15
	note __, 5
;Bar 33
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 34
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 35
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
;Bar 36
	note G_, 6
	note A_, 11
	intensity $25
	note A_, 2
	intensity $15
	note __, 5
;Bar 37
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 38
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 39
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
;Bar 40
	note G_, 4
	note A_, 2
	note D_, 15
	intensity $25
	note D_, 2
	intensity $15
	note __, 1
;Bar 41
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note F_, 2
	note E_, 2
;Bar 42
	note D_, 6
	note A_, 6
	note G_, 6
;Bar 43
	note E_, 6
	note C_, 4
	octave 4
	note A_, 4
;Bar 44
	octave 5
	note C_, 2
	note D_, 4
	note D_, 8
	intensity $25
	note D_, 2
	intensity $15
	note __, 16
;Bar 46
Music_Placeholder_Ch3_Finale:
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 2
	note C_, 4
;Bar 47
	note D_, 4
	note G_, 2
	note F_, 4
	note C_, 4
;Bar 48
	note C_, 2
	note D_, 4
	note C_, 2
	note D_, 4
	note __, 6
;Bar 49
	note C_, 4
	octave 3
	note B_, 10
	loopchannel 2, Music_Placeholder_Ch3_Finale
	loopchannel 0, Music_MarnieBattle_Ch3_loop

; ============================================================================================================

; A# kick A#
; A# kick A#
; C_ strong snare C_
; C_ clap C_
; D_ snare strong short C_
; G_ snare soft short G_
; F# hi hat F#
; B_ crash B_
; B_ crash B_

Music_MarnieBattle_Ch4:
	togglenoise 3
	notetype 12
	note __, 16
	note __, 15
	; noisesampleset 5
	; note __, 6
	; note F#, 9
	; noisesampleset 3
Music_MarnieBattle_Ch4_intro:
;Bar 2
	note A#, 1
	note C#, 1
	note G_, 2
	note A#, 1
	note C#, 1
	note G_, 2
	note A#, 1
	note C#, 1
	note G_, 1
	note C#, 1
	note A#, 1
	note C#, 1
	note G_, 1
	note C#, 1
	loopchannel 4, Music_MarnieBattle_Ch4_intro
;Bar 6
Music_MarnieBattle_Ch4_loop:
	note G_, 2
	note A#, 2
	note C_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note C_, 2
	note A#, 2
;Bar 7
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 8
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 9
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 10
	note G_, 2
	note A#, 2
	note C_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note C_, 2
	note A#, 2
;Bar 11
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 12
	note G_, 2
	note B_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note B_, 2
	note B_, 2
	note A#, 2
;Bar 13
	note G_, 2
	note A#, 2
	note C_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note F#, 2
	note A#, 2
;Bar 14
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 15
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 16
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 17
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 18
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 19
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 20
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 21
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 22
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 23
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 24
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 25
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 26
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 27
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 28
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 29
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 30
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 31
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 32
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 33
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 34
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 35
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 36
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 37
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 38
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 39
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 40
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 41
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 42
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 43
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 44
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 45
	callchannel Music_MarnieBattle_Ch4_Type1
;Bar 46
Music_MarnieBattle_Ch4_Bar46_49:
	callchannel Music_MarnieBattle_Ch4_Type2
;Bar 47
	callchannel Music_MarnieBattle_Ch4_Type2
;Bar 48
	callchannel Music_MarnieBattle_Ch4_Type2
;Bar 49
	note B_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	loopchannel 2, Music_MarnieBattle_Ch4_Bar46_49
	loopchannel 0, Music_MarnieBattle_Ch4_loop

Music_MarnieBattle_Ch4_Type1:
	note G_, 2;
	note A#, 2
	note F#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note F#, 2
	note A#, 2
	endchannel

Music_MarnieBattle_Ch4_Type2:
	note G_, 2;
	note A#, 2
	note F#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note B_, 4
	endchannel

; ; ============================================================================================================

