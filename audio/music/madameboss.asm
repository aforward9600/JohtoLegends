; Conversion by TriteHexagon
Music_GiovanniBattle:
	musicheader 4, 1, Music_GiovanniBattle_Ch1
	musicheader 1, 2, Music_GiovanniBattle_Ch2
	musicheader 1, 3, Music_GiovanniBattle_Ch3
	musicheader 1, 4, Music_GiovanniBattle_Ch4

Music_GiovanniBattle_Ch1:
	volume $77
	dutycycle $2
	notetype 12, $a8
	tempo 108
;Bar 3
	octave 5
	note A_, 1
	note __, 3
	note A#, 1
	note __, 3
	note B_, 1
	note __, 3
	octave 6
	note C_, 1
	note __, 3
;Bar 4
	note C#, 1
	note __, 3
	note D_, 1
	note __, 3
	note D#, 1
	note __, 3
	note E_, 1
	note __, 3
;Bar 5
	note __, 16
;Bar 6
	tempo 142
Music_GiovanniBattle_Ch1_loop:
	vibrato $00, $00
	dutycycle $1
	note __, 10
	octave 4
	note F_, 2
	note D#, 16
	note D#, 4
;Bar 8
	note __, 16
	note __, 16
	note __, 10
;Bar 10
	note F_, 2
	note D#, 16
	note D#, 4
;Bar 12
	note __, 16
	note __, 16
	note __, 16
	note __, 16
;Bar 16
	dutycycle $2
	octave 3
	callchannel Music_GiovanniBattle_Ch1_Bar16
;Bar 17
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
;Bar 18
	intensity $a7
	note A_, 8
	intensity $a8
	note __, 16
	note __, 8
;Bar 20
	octave 3
	callchannel Music_GiovanniBattle_Ch1_Bar16
;Bar 21
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 16
	note __, 1
;Bar 23
	dutycycle $1
	intensity $88
	note D_, 2
	note __, 4
	note D_, 10
;Bar 24
	note __, 4
	octave 3
	note A#, 12
	intensity $84
	note A#, 2
;Bar 25
	intensity $88
	note A#, 2
	note __, 6
	intensity $a8
	note D#, 1
	note G_, 1
	note A#, 4
;Bar 26
	octave 4
	note D_, 6
	note C_, 6
	octave 3
	note A#, 4
;Bar 27
	note A_, 6
	note A#, 6
	octave 4
	note C_, 4
;Bar 28
	note D_, 6
	note D#, 6
	note C#, 4
;Bar 29
	note D_, 16
;Bar 30
	octave 1
Music_GiovanniBattle_Ch1_Bar30_35:
	intensity $b4
	dutycycle $0
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 16
	note __, 7
	loopchannel 4, Music_GiovanniBattle_Ch1_Bar30_35
;Bar 36
	note __, 10
	note __, 16
;Bar 39
	intensity $a8
	dutycycle $2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	octave 4
	note G#, 2
;Bar 40
	octave 3
	note D_, 4
	note __, 16
	note __, 6
;Bar 41
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	octave 4
	note G#, 2
;Bar 42
	octave 3
	note D#, 4
	note __, 2
	octave 4
	note G_, 6
	note F_, 4
;Bar 43
	note D#, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note D#, 2
;Bar 44
	note D_, 2
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note D#, 2
	note D_, 2
	octave 4
	note A_, 2
	note G_, 2
	note A_, 2
;Bar 45
	octave 5
	note D_, 2
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note D_, 2
	octave 4
	note A_, 2
;Bar 46
	dutycycle $0
	vibrato $00, $41
	octave 2
	note D_, 1
	note __, 1
	octave 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	octave 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	octave 1
	note D_, 1
	note __, 1
;Bar 47
Music_GiovanniBattle_Ch1_Bar47:
	octave 2
	note D_, 1
	note __, 1
	octave 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	octave 1
	note D_, 1
	note __, 1
	octave 2
	note F_, 2
	note D#, 4
	loopchannel 2, Music_GiovanniBattle_Ch1_Bar47
;Bar 49
	note D_, 1
	note __, 15
;Bar 50
Music_GiovanniBattle_Ch1_Bar50:
	note D#, 1
	note __, 1
	octave 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	octave 1
	note D#, 1
	note __, 1
	octave 2
	note G_, 2
	note F_, 4
	loopchannel 3, Music_GiovanniBattle_Ch1_Bar50
;Bar 53
	note D#, 1
	note __, 5
	note D#, 1
	note __, 9
;Bar 54
	callchannel Music_GiovanniBattle_Ch1_Bar54
;Bar 55
	octave 2
	note D#, 2
	octave 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note D#, 2
	octave 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note D#, 2
	octave 1
	note D#, 1
	note __, 1
;Bar 56
	callchannel Music_GiovanniBattle_Ch1_Bar54
;Bar 57
	callchannel Music_GiovanniBattle_Ch1_Bar54
	loopchannel 0, Music_GiovanniBattle_Ch1_loop

Music_GiovanniBattle_Ch1_Bar16:
	note D#, 1;
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	endchannel

Music_GiovanniBattle_Ch1_Bar54:
	octave 2
	note D_, 2;
	octave 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note D_, 2
	octave 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note D_, 2
	octave 1
	note D_, 1
	note __, 1
	endchannel

; ============================================================================================================

Music_GiovanniBattle_Ch2:
	dutycycle $3
	notetype 12, $a8
	vibrato $08, $24
;Bar 3
	octave 5
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 4
	note B_, 1
	octave 5
	note C_, 1
	octave 4
	note B_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
;Bar 4
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
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
	octave 3
	note B_, 1
;Bar 5
	note __, 16
;Bar 6
Music_GiovanniBattle_Ch2_loop:
	octave 3
	note __, 10
	note D_, 2
	octave 2
	note A#, 4
	note A#, 16
;Bar 8
	dutycycle $0
	vibrato $00, $41
	note D_, 2
	octave 1
	note D_, 2
	note D_, 2
	octave 2
	note D_, 2
	note __, 16
	note __, 8
;Bar 10
	dutycycle $3
	vibrato $08, $24
	octave 3
	note __, 10
	note D_, 2
	octave 2
	note A#, 4
	note A#, 16
;Bar 12
	dutycycle $0
	vibrato $00, $41
	note D_, 2
	octave 1
	note D_, 2
	note D_, 2
	octave 2
	note D_, 2
	note __, 16
	note __, 4
	vibrato $08, $24
	dutycycle $1
	note B_, 2
	octave 3
	note C_, 2
;Bar 14
	;octave 3
	note D_, 6
	note C#, 6
	octave 2
	note A_, 4
;Bar 15
	octave 3
	note D_, 6
	note C#, 6
	octave 2
	note A_, 4
;Bar 16
	note A#, 16
;Bar 17
	note G_, 8
	note A#, 8
;Bar 18
	octave 3
	note D_, 6
	note C#, 6
	octave 2
	note A_, 4
;Bar 19
	octave 3
	note D_, 6
	note C#, 6
	octave 2
	note A_, 4
;Bar 20
	note A#, 16
;Bar 21
	note G_, 8
	note A#, 8
;Bar 22
	dutycycle $0
	vibrato $00, $41
	note D_, 2
	note C_, 2
	note D_, 2
	note F_, 4
	note D#, 2
	note D_, 2
	note C_, 2
;Bar 23
	note D_, 2
	note C_, 4
	note F_, 10
;Bar 24
	note D#, 2
	note D_, 2
	note D#, 2
	note G_, 4
	note F_, 2
	note D#, 2
	note D_, 2
;Bar 25
	note D#, 2
	note G_, 4
	note G_, 10
;Bar 26
	note F_, 6
	note E_, 6
	note D#, 4
;Bar 27
	note D_, 6
	note D#, 6
	note F_, 4
;Bar 28
	note F_, 6
	note G_, 6
	note F_, 4
;Bar 29
	note F_, 16
;Bar 30
	vibrato $08, $24
	dutycycle $1
	note __, 4
	octave 3
	note A_, 4
	note G#, 4
	octave 4
	note C_, 4
;Bar 31
	octave 3
	note B_, 4
	note F#, 4
	note F_, 4
	note A_, 4
;Bar 32
	note G#, 4
	note D_, 4
	note C#, 4
	note G_, 4
;Bar 33
	note F#, 4
	note D_, 4
	note E_, 4
	note C#, 4
;Bar 34
	note D_, 4
	note A_, 4
	note G#, 4
	octave 4
	note C_, 4
;Bar 35
	octave 3
	note B_, 4
	note F#, 4
	note F_, 4
	note A_, 4
;Bar 36
	note G#, 4
	note D_, 4
	note C#, 4
	note G_, 4
;Bar 37
	note F#, 4
	note D_, 4
	note E_, 4
	note C#, 4
;Bar 38
	note D_, 2
	note F_, 1
	octave 4
	intensity $d8
	note D_, 1
	intensity $a8
	note __, 4
	octave 3
	note B_, 8
;Bar 39
	octave 4
	note C_, 6
	octave 3
	note B_, 1
	note __, 12
;Bar 40
	octave 4
	intensity $d8
	note D_, 1
	intensity $a8
	note __, 4
	note G_, 5
	note E_, 1
	note F_, 1
	note G_, 1
;Bar 41
	note G#, 6
	note F_, 1
	note __, 9
;Bar 42
	octave 3
	note A#, 16
;Bar 43
	note A#, 16
;Bar 44
	note A_, 12
	note G_, 4
;Bar 45
	note F#, 16
;Bar 46
	note D_, 1
	note __, 5
	note D_, 1
	note __, 5
	note D_, 1
	note __, 3
;Bar 47
	note D_, 1
	note __, 5
	note D_, 1
	note __, 3
	note F_, 2
	note D#, 4
;Bar 48
	note D_, 1
	note __, 5
	note D_, 1
	note __, 3
	note F_, 2
	note D#, 4
;Bar 49
	note D_, 1
	note __, 5
	octave 2
	note A_, 1
	octave 3
	note G_, 1
	note A_, 8
;Bar 50
	note D#, 1
	note __, 5
	note D#, 1
	note __, 3
	note G_, 2
	note F_, 4
;Bar 51
	note D#, 1
	note __, 5
	note D#, 1
	note __, 3
	note G_, 2
	note F_, 4
;Bar 52
	note D#, 1
	note __, 5
	note D#, 1
	note __, 3
	note G_, 2
	note F_, 4
;Bar 53
	note D#, 1
	note __, 6
	note C#, 1
	note A#, 8
;Bar 54
	note A_, 6
	note G_, 6
	note A_, 4
;Bar 55
	note A#, 6
	note G_, 6
	note A#, 4
;Bar 56
	note A_, 6
	note G_, 6
	note G#, 4
;Bar 57
	note A_, 16
	loopchannel 0, Music_GiovanniBattle_Ch2_loop

; ============================================================================================================

Music_GiovanniBattle_Ch3:
	notetype 12, $14
;Bar 3
	octave 4
	note A_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note G#, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
;Bar 4
	octave 4
	note F_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 16
	note __, 3
;Bar 6
Music_GiovanniBattle_Ch3_loop:
	intensity $16
	octave 2
Music_GiovanniBattle_Ch3_Bar7:
	note D_, 16
;Bar 7
	note D#, 16
	loopchannel 4, Music_GiovanniBattle_Ch3_Bar7

Music_GiovanniBattle_Ch3_Bar14:
;Bar 14
	note D_, 16
;Bar 15
	note D_, 16
;Bar 16
	note D#, 16
;Bar 17
	note D#, 16
	loopchannel 3, Music_GiovanniBattle_Ch3_Bar14

Music_GiovanniBattle_Ch3_Bar26:
;Bar 26
	note D_, 16
	loopchannel 16, Music_GiovanniBattle_Ch3_Bar26
;Bar 42
	note D#, 16
;Bar 43
	note D#, 16
;Bar 44
	note D_, 16
;Bar 45
	note D_, 16
;Bar 46
	note D_, 16
;Bar 47
	note D_, 16
;Bar 48
	note D_, 16
;Bar 49
	note D_, 16
;Bar 50
	note D#, 16
;Bar 51
	note D#, 16
;Bar 52
	note D#, 16
;Bar 53
	note D#, 16
;Bar 54
	note D_, 16
;Bar 55
	note D#, 16
;Bar 56
	note D_, 16
;Bar 57
	note D_, 16
	loopchannel 0, Music_GiovanniBattle_Ch3_loop

; ============================================================================================================

Music_GiovanniBattle_Ch4:
	togglenoise 1
	notetype 6
;Bar 1
	note __, 16
	note __, 16
	note __, 16
	note __, 16
;Bar 5
	callchannel Music_GiovanniBattle_Ch4_Bar5_P1
	callchannel Music_GiovanniBattle_Ch4_Bar5_P2
	callchannel Music_GiovanniBattle_Ch4_Bar5_P3
;Bar 6
Music_GiovanniBattle_Ch4_loop:
	callchannel Music_GiovanniBattle_Ch4_Bar6
;Bar 7
	callchannel Music_GiovanniBattle_Ch4_Bar7
;Bar 8
	callchannel Music_GiovanniBattle_Ch4_Bar6
;Bar 9
	callchannel Music_GiovanniBattle_Ch4_Bar7
;Bar 10
	callchannel Music_GiovanniBattle_Ch4_Bar6
;Bar 11
	callchannel Music_GiovanniBattle_Ch4_Bar7
;Bar 12
	callchannel Music_GiovanniBattle_Ch4_Bar12
;Bar 13
	callchannel Music_GiovanniBattle_Ch4_Bar7
;Bar 14
	callchannel Music_GiovanniBattle_Ch4_Bar12
;Bar 15
	callchannel Music_GiovanniBattle_Ch4_Bar7
;Bar 16
	callchannel Music_GiovanniBattle_Ch4_Bar12
;Bar 17
	callchannel Music_GiovanniBattle_Ch4_Bar17
;Bar 18
	callchannel Music_GiovanniBattle_Ch4_Bar12
;Bar 19
	callchannel Music_GiovanniBattle_Ch4_Bar17
;Bar 20
	callchannel Music_GiovanniBattle_Ch4_Bar12
;Bar 21
	callchannel Music_GiovanniBattle_Ch4_Bar17
;Bar 22
	callchannel Music_GiovanniBattle_Ch4_Bar12
;Bar 23
	callchannel Music_GiovanniBattle_Ch4_Bar17
;Bar 24
	callchannel Music_GiovanniBattle_Ch4_Bar12
;Bar 25
	callchannel Music_GiovanniBattle_Ch4_Bar17
;Bar 26
	note A_, 12
	note A_, 12
	note A_, 12
;Bar 27
	note A_, 12
	note A_, 8
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
;Bar 28
	note A_, 12
	note A_, 12
	note A_, 12
;Bar 29
	note A_, 12
	note A_, 8
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
;Bar 30
	note A_, 4
	note A_, 16
	note __, 16
	note __, 12
;Bar 31
	note C_, 16
;Bar 32
Music_GiovanniBattle_Ch4_Bar32_33:
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 4
	note C_, 2
	note C_, 2
	note C_, 2
	note __, 16
	note __, 12
;Bar 33
	note C_, 2
	note C_, 16
	loopchannel 2, Music_GiovanniBattle_Ch4_Bar32_33
;Bar 36
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 4
	note C_, 2
	note C_, 2
	note C_, 16
;Bar 37
	callchannel Music_GiovanniBattle_Ch4_Bar5_P1
	callchannel Music_GiovanniBattle_Ch4_Bar5_P2
	callchannel Music_GiovanniBattle_Ch4_Bar5_P3
;Bar 38
	note A_, 4
	note A_, 8
	note A_, 4
	note A_, 8
	note A_, 8
;Bar 39
	note A_, 16
	note A_, 8
	note A_, 8
;Bar 40
	note A_, 4
	note A_, 8
	note A_, 4
	note A_, 8
	note A_, 8
;Bar 41
	note A_, 16
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
;Bar 42
	note A_, 16
	note A_, 8
	note A_, 8
;Bar 43
	note A_, 4
	note A_, 16
	note A_, 12
;Bar 44
	note A_, 16
	note A_, 8
	note A_, 8
;Bar 45
	callchannel Music_GiovanniBattle_Ch4_Bar7
;Bar 46
	callchannel Music_GiovanniBattle_Ch4_Bar46
;Bar 47
	callchannel Music_GiovanniBattle_Ch4_Bar46
;Bar 48
	callchannel Music_GiovanniBattle_Ch4_Bar46
;Bar 49
	callchannel Music_GiovanniBattle_Ch4_Bar17
;Bar 50
	callchannel Music_GiovanniBattle_Ch4_Bar46
;Bar 51
	callchannel Music_GiovanniBattle_Ch4_Bar46
;Bar 52
	callchannel Music_GiovanniBattle_Ch4_Bar46
;Bar 53
	note A_, 16
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
;Bar 54
	callchannel Music_GiovanniBattle_Ch4_Bar46
;Bar 55
	callchannel Music_GiovanniBattle_Ch4_Bar46
;Bar 56
	callchannel Music_GiovanniBattle_Ch4_Bar46
;Bar 57
	callchannel Music_GiovanniBattle_Ch4_Bar46
	loopchannel 0, Music_GiovanniBattle_Ch4_loop

Music_GiovanniBattle_Ch4_Bar5_P1:
	note B_, 1
	loopchannel 10, Music_GiovanniBattle_Ch4_Bar5_P1
	endchannel

Music_GiovanniBattle_Ch4_Bar5_P2:
	note A#, 1
	loopchannel 12, Music_GiovanniBattle_Ch4_Bar5_P1
	endchannel

Music_GiovanniBattle_Ch4_Bar5_P3:
	note A_, 1
	loopchannel 10, Music_GiovanniBattle_Ch4_Bar5_P1
	endchannel

Music_GiovanniBattle_Ch4_Bar6:
	note A_, 12;
	note A_, 8
	note A_, 12
	endchannel

Music_GiovanniBattle_Ch4_Bar7:
	note A_, 4;
	note A_, 16
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	endchannel

Music_GiovanniBattle_Ch4_Bar12:
	note A_, 12;
	note A_, 16
	note A_, 4
	endchannel

Music_GiovanniBattle_Ch4_Bar17:
	note A_, 16;
	note A_, 8
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	endchannel

Music_GiovanniBattle_Ch4_Bar46:
	note A_, 12;
	note A_, 12
	note A_, 8
	endchannel

; ============================================================================================================

