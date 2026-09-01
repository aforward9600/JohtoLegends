Music_UnwaveringHeart:
	musicheader 3, 1, Music_UnwaveringHeart_Ch1
	musicheader 1, 2, Music_UnwaveringHeart_Ch2
	musicheader 1, 3, Music_UnwaveringHeart_Ch3

Music_UnwaveringHeart_Ch1:
	volume $77
	dutycycle $2
	notetype 12, $a6
	tempo 214
;Bar 1
	callchannel Music_UnwaveringHeart_Ch1_Bar1_3
;Bar 4
	notetype 3, $53
	octave 3
	note F#, 1
	octave 4
	note C#, 1
	intensity $88
	note E_, 2
	notetype 12, $86
	note E_, 7
	intensity $a6
	note E_, 8
;Bar 5
	callchannel Music_UnwaveringHeart_Ch1_Bar1_3
;Bar 7
;Bar 8
	octave 3
	notetype 3, $53
	note F#, 1
	note A_, 1
	intensity $88
	note B_, 2
	notetype 12, $86
	note B_, 7
	note __, 8
;Bar 9
	intensity $a6
	note E_, 16
;Bar 10
	note E_, 4
	note E_, 8
;Bar 11
	note E_, 4
	octave 2
	note B_, 4
	note B_, 2
	octave 3
	note E_, 2
	note G#, 4
;Bar 12
	note A_, 4
	note E_, 2
	note C#, 2
	note E_, 2
	note G#, 2
	note E_, 4
;Bar 13
	note C#, 4
	note __, 2
	octave 2
	note F#, 2
	note A_, 4
	octave 3
	note D_, 4
;Bar 14
	note D_, 4
	note E_, 6
	note E_, 2
	note E_, 4
;Bar 15
	note E_, 4
	octave 2
	note A_, 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note F#, 2
	note A_, 8
;Bar 16
	octave 3
	note E_, 16
;Bar 17
	note A_, 8
	octave 4
	note C#, 8
;Bar 18
	octave 3
	notetype 6, $78 ;30
	note B_, 3
	intensity $68
	note B_, 3
	intensity $58
	note B_, 3
	intensity $48
	note B_, 3
	intensity $38
	note B_, 3
	intensity $28
	note B_, 3
	intensity $18
	note B_, 3
	intensity $17
	note B_, 2
	note __, 7
	loopchannel 0, Music_UnwaveringHeart_Ch1

Music_UnwaveringHeart_Ch1_Bar1_3:
	octave 3
	notetype 3, $53
	note D_, 1
	note A_, 1
	octave 4
	intensity $88
	note F#, 10
	notetype 12, $86
	note F#, 13
;Bar 2
	octave 3
	notetype 3, $53
	note E_, 1
	note A_, 1
	octave 4
	intensity $88
	note F#, 10
	notetype 12, $86
	note F#, 13
;Bar 3
	octave 3
	notetype 3, $53
	note C#, 1
	note G#, 1
	octave 4
	intensity $88
	note F#, 10
	notetype 12, $86
	note F#, 13
	endchannel

; ============================================================================================================

Music_UnwaveringHeart_Ch2:
	dutycycle $2
;Bar 1
	callchannel Music_UnwaveringHeart_Ch2_Type1
	octave 5
	note C#, 2
	note E_, 8
	loopchannel 2, Music_UnwaveringHeart_Ch2
;Bar 3
	notetype 3, $53
	octave 3
	note B_, 1
	octave 4
	intensity $98
	note E_, 3
	notetype 12, $96
	note E_, 7
	intensity $a6
	octave 5
	note E_, 4
;Bar 4
	note F#, 4
	octave 4
	notetype 3, $53
	note A_, 1
	note B_, 1
	octave 5
	intensity $98
	note C#, 6
	notetype 12, $96
	note C#, 6
	intensity $a6
	note C#, 2
	octave 4
	note B_, 2
;Bar 5
	note A_, 2
	note G#, 2
Music_UnwaveringHeart_Ch2_Bar5:
	callchannel Music_UnwaveringHeart_Ch2_Type1
	octave 5
	note C#, 2
	note E_, 8
	loopchannel 2, Music_UnwaveringHeart_Ch2_Bar5
;Bar 6
;Bar 7
	notetype 3, $53
	octave 3
	note B_, 1
	octave 4
	intensity $98
	note E_, 3
	notetype 12, $96
	note E_, 9
	intensity $a6
	note B_, 2
;Bar 8
	note A_, 2
	note G#, 2
	note E_, 8

	octave 4
	note C#, 2
	octave 3
	note B_, 2
;Bar 9
	note A_, 2
	note G#, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	octave 4
	note C#, 2
	note E_, 8
;Bar 10
	note __, 6
	note C#, 2
	note E_, 5
;Bar 11
	note __, 1
	octave 3
	note B_, 2
	notetype 3, $53
	note E_, 1
	intensity $98
	note F#, 3
	notetype 12, $96
	note F#, 7
	intensity $a6
	octave 4
	note E_, 4
;Bar 12
	note F#, 4
	octave 3
	
	notetype 3, $53
	note A_, 1
	octave 4
	intensity $98
	note C#, 3
	notetype 12, $96
	note C#, 7
	
	intensity $a6
	note C#, 2
	octave 3
	note B_, 2
;Bar 13
	note A_, 2
	note G#, 2
	note F#, 8
	note F#, 4
;Bar 14
	note B_, 4
	note G#, 8
	note G#, 4
;Bar 15
	note B_, 4
	
	notetype 3, $53
	note E_, 1
	note F#, 1
	intensity $98
	note A_, 2
	notetype 12, $96
	note A_, 9
	
	intensity $a6
	note D_, 2
;Bar 16
	note F#, 2
	note A_, 2
	note A_, 8
	note G#, 4
;Bar 17
	octave 4
	note G#, 2
	note A_, 2

	notetype 3, $53
	note C#, 1
	intensity $98
	note A_, 3
	notetype 12, $96
	note A_, 7
	
	intensity $a6
	note G#, 4
;Bar 18
	note E_, 4
	
	notetype 3, $53
	note C#, 1
	intensity $88
	note F#, 3
	notetype 6, $78 ;28
	note F#, 3
	intensity $68
	note F#, 3
	intensity $58
	note F#, 3
	intensity $48
	note F#, 3
	intensity $38
	note F#, 3
	intensity $28
	note F#, 3
	intensity $18
	note F#, 3
	note __, 7
	loopchannel 0, Music_UnwaveringHeart_Ch2
	
Music_UnwaveringHeart_Ch2_Type1: ;6
	notetype 3, $53
	octave 3
	note B_, 1
	octave 4
	intensity $98
	note E_, 3
	notetype 12, $96
	note E_, 5
	intensity $a6
	endchannel

; ============================================================================================================

Music_UnwaveringHeart_Ch3:
	notetype 12, $26
;Bar 1
	note __, 16
	loopchannel 8, Music_UnwaveringHeart_Ch3
;Bar 9
	octave 3
	note D_, 16
;Bar 10
	note E_, 16
;Bar 11
	note C#, 15
;Bar 12
	note __, 1
	note F#, 8
	note E_, 8
;Bar 13
	octave 2
	note B_, 16
;Bar 14
	octave 3
	note C#, 16
;Bar 15
	note D_, 16
;Bar 16
	note E_, 16
;Bar 17
	octave 4
	note F#, 8
	note E_, 8
;Bar 18
	note D_, 5
	intensity $36
	note D_, 6
	note __, 4
	loopchannel 0, Music_UnwaveringHeart_Ch3

; ============================================================================================================


