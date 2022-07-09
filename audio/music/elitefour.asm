;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 5.0.1 (7-Feb-2021)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.

; ============================================================================================================

Music_KantoGymLeaderFRLG:
	musicheader 4, 1, Music_KantoGymLeaderFRLG_Ch1
	musicheader 1, 2, Music_KantoGymLeaderFRLG_Ch2
	musicheader 1, 3, Music_KantoGymLeaderFRLG_Ch3
	musicheader 1, 4, Music_KantoGymLeaderFRLG_Ch4

Music_KantoGymLeaderFRLG_Ch1:
	volume $77
	dutycycle $3
	tone $0001
	notetype 12, $e3
	tempo 104
	stereopanning $f
	callchannel Music_KantoGymLeaderFRLG_Ch1_Master_Intro
;Bar 3
	dutycycle $2
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 10
;Bar 4
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 4
	intensity $d7
	note F_, 6
;Bar 5
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 10
;Bar 6
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 4
	intensity $d7
	note F_, 6
;Bar 7
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	intensity $48
	note F#, 1
	note __, 9
;Bar 8
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 4
	intensity $d7
	note F_, 6
;Bar 9
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 10
;Bar 10
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 4
	intensity $b7
	note A_, 6
;Bar 11
Music_KantoGymLeaderFRLG_Ch1_loop:
	vibrato $8, $34
	dutycycle $3
	stereopanning $f
	note F#, 1
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch1_Bar11
	stereopanning $f0
	note C#, 1
;Bar 13
	octave 2
	stereopanning $f
	note F_, 1
	callchannel Music_KantoGymLeaderFRLG_Ch1_Bar13
	stereopanning $f0
	note A_, 1
;Bar 15
	stereopanning $f
	note F#, 1
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch1_Bar11
	stereopanning $f0
	note C#, 1
;Bar 17
	octave 2
	stereopanning $f
	note F_, 1
	callchannel Music_KantoGymLeaderFRLG_Ch1_Bar13
	intensity $c7
	stereopanning $ff
	note A_, 1
;Bar 19
	stereopanning $f
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type1
	octave 2
	note C#, 2
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type1
	note B_, 1
	note __, 1
	octave 2
	note C#, 2
	octave 1
	note B_, 2
	note A_, 2
	octave 2
	note C#, 2
;Bar 23
	;stereopanning $ff
	stereopanning $f
	octave 1
	intensity $b7
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	intensity $b3
Music_KantoGymLeaderFRLG_Ch1_Bar23_25:
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type2
	loopchannel 11, Music_KantoGymLeaderFRLG_Ch1_Bar23_25
;Bar 26
	stereopanning $ff
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type3
	note A_, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
;Bar 27
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	intensity $b3
Music_KantoGymLeaderFRLG_Ch1_Bar27_30:
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type2
	loopchannel 12, Music_KantoGymLeaderFRLG_Ch1_Bar27_30
;Bar 30
	stereopanning $ff
	octave 3
	intensity $93
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type3
	callchannel Music_KantoGymLeaderFRLG_Ch1_Bar31_44
	loopchannel 0, Music_KantoGymLeaderFRLG_Ch1_loop

Music_KantoGymLeaderFRLG_Ch1_Bar11:
	stereopanning $f0
	note C#, 1
	stereopanning $f
	note F#, 1
	stereopanning $ff
	note E_, 1
	loopchannel 10, Music_KantoGymLeaderFRLG_Ch1_Bar11
	endchannel

Music_KantoGymLeaderFRLG_Ch1_Bar13:
	stereopanning $f0
	note A_, 1
	octave 3
	stereopanning $f
	note C#, 1
	octave 2
	stereopanning $ff
	note B_, 1
	loopchannel 10, Music_KantoGymLeaderFRLG_Ch1_Bar13
	endchannel

Music_KantoGymLeaderFRLG_Ch1_Type1:
	octave 1;
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 2
	note D_, 4
	octave 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 2
	intensity $a7
	note E_, 4
	octave 1
	intensity $c7
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 2
	note D_, 4
	octave 1
	note B_, 1
	note __, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch1_Type2:
	octave 3;
	stereopanning $f0
	note C_, 1
	octave 2
	stereopanning $ff
	note B_, 1
	note A_, 1
	stereopanning $f
	note B_, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch1_Type3:
	note C_, 1;
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch1_Intro:
	intensity $f8
	note F#, 1
	note __, 1
	intensity $98
	note F#, 1
	note __, 1
	intensity $68
	note F#, 1
	note __, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch1_Master_Intro:
;Bar 1
	note __, 6;
	octave 3
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
;Bar 2
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	octave 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch1_Bar31_44:
	intensity $97;
	note A#, 1
	note A_, 1
;Bar 31
	stereopanning $f
	note __, 4
	octave 3
	intensity $b8
	note C#, 12
;Bar 32
	note __, 4
	note A_, 12
;Bar 33
	intensity $e7
	note D#, 4
	note C#, 4
	note D#, 4
	note E_, 2
	note F#, 4
;Bar 34
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note F#, 2
	note B_, 2
	note F#, 2
	note D#, 2
	note F#, 2
;Bar 35
	note __, 4
	intensity $b8
	note A_, 12
;Bar 36
	intensity $c7
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F#, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note D#, 1
	note C#, 1
;Bar 37
	intensity $f7
	note D#, 4
	note E_, 4
	note C#, 2
	note D#, 6
;Bar 38
	note F#, 4
	note E_, 2
	note D#, 4
	note C#, 6
;Bar 39
	note D#, 4
	note E_, 4
	note C#, 2
	note D#, 6
;Bar 40
	note F#, 4
	note A_, 2
	note G#, 4
	note E_, 6
;Bar 41
	note D#, 4
	note E_, 4
	note C#, 2
	note D#, 6
;Bar 42
	note E_, 4
	note D#, 2
	note C#, 4
	octave 2
	note B_, 6
;Bar 43
	octave 3
	note D#, 4
	note E_, 4
	note C#, 2
	note D#, 6
;Bar 44
	note F#, 4
	note A_, 2
	note G#, 4
	intensity $e7
	note E_, 6
	endchannel

; ============================================================================================================

Music_KantoGymLeaderFRLG_Ch2:
	dutycycle $1
	vibrato $8, $34
	notetype 12, $e7
	stereopanning $f0
;Bar 1
	callchannel Music_KantoGymLeaderFRLG_Ch2_Intro
;Bar 3
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 10
;Bar 4
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 4
	octave 4
	intensity $e7
	note C_, 4
;Bar 5
	notetype 6, $c7
	note D_, 2
	note C#, 1
	note C_, 1
	notetype 12, $c7
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 10
;Bar 6
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 4
	intensity $e7
	note A#, 6
;Bar 7
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	intensity $58
	note B_, 1
	note __, 9
;Bar 8
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 4
	octave 4
	intensity $e7
	note C_, 6
;Bar 9
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 10
;Bar 10
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 4
	octave 4
	intensity $e7
	note C#, 6
;Bar 11
Music_KantoGymLeaderFRLG_Ch2_loop:
	stereopanning $ff
	dutycycle $2
	vibrato $8, $22
	callchannel Music_KantoGymLeaderFRLG_Ch2_Main
	loopchannel 0, Music_KantoGymLeaderFRLG_Ch2_loop

Music_KantoGymLeaderFRLG_Ch2_Type1:
	intensity $f8
	note B_, 1
	note __, 1
	intensity $98
	note B_, 1
	note __, 1
	intensity $68
	note B_, 1
	note __, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch2_Intro:
	octave 4
	note F_, 1;
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	intensity $d7
	note B_, 1
	note __, 5
;Bar 2
	intensity $e7
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch2_Main:
	intensity $d7;
	note D#, 4
	note C#, 4
	note D#, 4
	note E_, 2
	note F#, 4
;Bar 12
	note E_, 4
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
;Bar 13
	octave 3
	note A_, 8
	octave 4
	note C#, 8
;Bar 14
	note E_, 10
	note C#, 4
	vibrato $8, $34
	dutycycle $0
	note D_, 2
;Bar 15
	notetype 6, $d6
	note D#, 6
	note E_, 1
	note D#, 1
	note C#, 7
	note D_, 1
	note D#, 8
	note E_, 3
	note F_, 1
	note F#, 8
;Bar 16
	note E_, 8
	note D#, 4
	note C#, 4
	octave 3
	note B_, 3
	octave 4
	note C_, 1
	note C#, 3
	note D_, 1
	note D#, 4
;Bar 17
	note C#, 15
	note C_, 1
	octave 3
	note B_, 15
	note A#, 1
;Bar 18
	notetype 12, $d7
	note A_, 8
	octave 4
	note E_, 4
	note E_, 2
	note C#, 2
;Bar 19
	stereopanning $f0
	dutycycle $1
	octave 1
	note B_, 1
	note __, 3
	octave 3
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note __, 4
	note E_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
;Bar 20
	note __, 4
	note F#, 1
	note E_, 1
	note C#, 1
	note F#, 1
	note __, 2
	note E_, 1
	note C#, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
;Bar 21
	octave 4
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note __, 4
	note E_, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note __, 4
;Bar 22
	note F#, 1
	note E_, 1
	note C#, 1
	note F#, 1
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 2
;Bar 23
	octave 1
	stereopanning $ff
	vibrato 0, $44
	intensity $c8
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note A_, 4
;Bar 24
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note A_, 4
	note G_, 4
;Bar 25
	intensity $b8
	note F#, 16
;Bar 26
	intensity $b8
	note F#, 12
	intensity $b5
	note F#, 4
;Bar 27
	octave 1
	intensity $a7
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	intensity $b8
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note A_, 4
;Bar 28
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note A_, 4
	octave 4
	note C_, 4
;Bar 29
	octave 3
	vibrato $8, $24
	intensity $a8
	note B_, 16
;Bar 30
	octave 4
	intensity $4f
	note F#, 16
;Bar 31
	stereopanning $f0
	note __, 4
	octave 3
	intensity $c8
	note A_, 12
;Bar 32
	note __, 4
	octave 4
	note C#, 12
;Bar 33
	note D#, 16
	note D#, 12
	intensity $c6
	note D#, 4
	intensity $c8
;Bar 35
	note __, 4
	note C#, 12
;Bar 36
	note A_, 8
	note E_, 8
;Bar 37
	intensity $a8
	note B_, 16
	note B_, 16
	note B_, 16
	intensity $a7
	note B_, 12
;Bar 40
	octave 3
	intensity $c8
	note B_, 1
	octave 4
	note D#, 1
	note F#, 1
	note A#, 1
;Bar 41
	note B_, 16
;Bar 42
	note F#, 16
;Bar 43
	note A_, 16
;Bar 44
	octave 5
	note C#, 10
	octave 4
	intensity $c5
	note A_, 6
	endchannel

; ============================================================================================================

Music_KantoGymLeaderFRLG_Ch3:
	notetype 12, $14
	tone $0001
	callchannel Music_KantoGymLeaderFRLG_Ch3_Intro
;Bar 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type4
	octave 4
	note F#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note F#, 1
	note F#, 1
;Bar 4
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type5
	octave 4
	note F#, 2
	octave 3
	note B_, 1
	note B_, 1
	octave 4
	note C_, 6
;Bar 5
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type5
	octave 4
	note C_, 2
;Bar 6
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type5
	octave 4
	note F#, 2
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C_, 5
	note __, 1
;Bar 7
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 8
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type4
	octave 4
	note C_, 5
	note __, 1
;Bar 9
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 10
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type4
	octave 4
	note C#, 5
	note __, 1
;Bar 11
Music_KantoGymLeaderFRLG_Ch3_loop:
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 12
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 13
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar13
;Bar 15
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 16
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 17
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar13
;Bar 19
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type6
	octave 4
	note E_, 4
;Bar 20
	callchannel Music_KantoGymLeaderFRLG_Ch2_Bar20
;Bar 21
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type6
	octave 4
	note E_, 4
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
;Bar 22
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type6
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note C#, 2
;Bar 23
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type3
;Bar 26
	note B_, 1
	note __, 1
	note B_, 1
	note __, 7
	octave 4
	note E_, 4
	note F#, 2
;Bar 27
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type3
;Bar 30
	note B_, 1
	note __, 1
	note B_, 1
	note __, 7
	note A#, 6
;Bar 31
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note C#, 12
;Bar 32
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar32
;Bar 33
	note D#, 16
;Bar 34
	octave 3
	note B_, 16
;Bar 35
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar32
;Bar 36
	note C#, 8
	note E_, 8
;Bar 37
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type1
	octave 3
	note B_, 2
	octave 4
	note E_, 6
;Bar 39
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type1
	octave 3
	note B_, 2
	octave 4
	note F_, 6
;Bar 41
	notetype 6, $14
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type2
	octave 4
	note C_, 4
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type2
	note A_, 4
	notetype 12, $14
;Bar 42
	callchannel Music_KantoGymLeaderFRLG_Ch2_Bar42
;Bar 43
	notetype 6, $14
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type2
	octave 4
	note C_, 4
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type2
	note A_, 4
	notetype 12, $14
;Bar 44
	octave 4
	note C#, 2
	note A_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note F#, 2
	octave 3
	note G_, 4
	loopchannel 0, Music_KantoGymLeaderFRLG_Ch3_loop

Music_KantoGymLeaderFRLG_Ch3_Bar7:
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	loopchannel 4, Music_KantoGymLeaderFRLG_Ch3_Bar7
	endchannel

Music_KantoGymLeaderFRLG_Ch3_Bar13:
	octave 3;
	note A_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	loopchannel 8, Music_KantoGymLeaderFRLG_Ch3_Bar13
	endchannel

Music_KantoGymLeaderFRLG_Ch3_Type2:
	note B_, 1
	intensity $24
	note B_, 1
	intensity $14
	loopchannel 4, Music_KantoGymLeaderFRLG_Ch3_Type2
	note B_, 4
	endchannel

Music_KantoGymLeaderFRLG_Ch3_Type1:
	octave 3
	note B_, 2
	octave 4
	note F#, 2
	loopchannel 6, Music_KantoGymLeaderFRLG_Ch3_Type1
	endchannel

Music_KantoGymLeaderFRLG_Ch3_Type3:
	note B_, 1;
	note __, 1
	note B_, 1
	note __, 13
	loopchannel 3, Music_KantoGymLeaderFRLG_Ch3_Type3
	endchannel

Music_KantoGymLeaderFRLG_Ch3_Type4:
	octave 3;
	note B_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch3_Type5:
	octave 3;
	note B_, 1
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch3_Type6:
	octave 4;
	note D_, 4
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch3_Bar32:
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note E_, 12
	endchannel

Music_KantoGymLeaderFRLG_Ch3_Intro:
;Bar 1
	note __, 12;
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note C#, 1
	note C_, 1
;Bar 2
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch2_Bar20:
	octave 3;
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note D_, 4
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C#, 2
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch2_Bar42:
	note B_, 1;
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note G#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	endchannel

; ============================================================================================================

Music_KantoGymLeaderFRLG_Ch4:
	togglenoise $3
	notetype 12
;Bar 1
	note __, 16
;Bar 2
	note __, 16
;Bar 3
	note B_, 4
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	note G#, 2
	note G#, 1
	note G#, 1
;Bar 4
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	note G#, 2
	noisesampleset 1
	note E_, 6
	noisesampleset 3
;Bar 5
	note G#, 2
	note G#, 1
	note G#, 1
	noisesampleset 1
	note E_, 2
	noisesampleset 3
	note G#, 1
	note G#, 1
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
;Bar 6
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	note G#, 2
	noisesampleset 1
	note E_, 6
	noisesampleset 3
;Bar 7
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
;Bar 8
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	note G#, 2
	noisesampleset 1
	note E_, 6
	noisesampleset 3
;Bar 9
	note G#, 2
	note G#, 1
	note G#, 1
	noisesampleset 1
	note E_, 2
	noisesampleset 3
	note G#, 1
	note G#, 1
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
;Bar 10
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	note G#, 2
	noisesampleset 1
	note E_, 6
	noisesampleset 3
;Bar 11
Music_KantoGymLeaderFRLG_Ch4_loop:
Music_KantoGymLeaderFRLG_Ch4_bar11_18:
	noisesampleset 1
	note E_, 2
	noisesampleset 3
	note G#, 2
	note G#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	loopchannel 8, Music_KantoGymLeaderFRLG_Ch4_bar11_18
;Bar 19
	noisesampleset 1
	note E_, 2
	noisesampleset 3
	note F#, 2
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type1
;Bar 20
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type1
	noisesampleset 1
	note E_, 2
	noisesampleset 3
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	noisesampleset 1
	note E_, 2
	noisesampleset 3
;Bar 21
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type1
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type1
	callchannel Music_KantoGymLeaderFRLG_Ch4_Bar22_23
;Bar 24
Music_KantoGymLeaderFRLG_Ch4_Bar24_25:
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	loopchannel 2, Music_KantoGymLeaderFRLG_Ch4_Bar24_25
;Bar 26
	note B_, 4
	note D_, 2
	note A#, 1
	note A#, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note B_, 4
;Bar 27
	note B_, 4
Music_KantoGymLeaderFRLG_Ch4_Bar27_28_29:
	note G#, 2
	loopchannel 27, Music_KantoGymLeaderFRLG_Ch4_Bar27_28_29
	callchannel Music_KantoGymLeaderFRLG_Ch4_Bar29_38
;Bar 39
Music_KantoGymLeaderFRLG_Ch4_Bar39_44:
	note G#, 2
	note G#, 1
	note G#, 1
	noisesampleset 1
	note E_, 2
	noisesampleset 3
	note G#, 1
	note G#, 1
	loopchannel 12, Music_KantoGymLeaderFRLG_Ch4_Bar39_44
	loopchannel 0, Music_KantoGymLeaderFRLG_Ch4_loop

Music_KantoGymLeaderFRLG_Ch4_Type1:
	noisesampleset 1
	note E_, 2
	noisesampleset 3;
	noisesampleset 1
	note E_, 2
	noisesampleset 3
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch4_Type2:
	note G#, 2;
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 1
	note G#, 1
	endchannel

Music_KantoGymLeaderFRLG_Ch4_Bar22_23:
;Bar 22;
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note C_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note C_, 1
;Bar 23
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	endchannel

Music_KantoGymLeaderFRLG_Ch4_Bar29_38:
;Bar 29;
	noisesampleset 1
	note E_, 2
	noisesampleset 3
	note G#, 2
	note G#, 2
;Bar 31
	note A#, 2
	note A#, 2
	note B_, 8
	notetype 6
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	notetype 12
;Bar 32
	note C_, 2
	note A#, 2
	note B_, 4
	note B_, 8
;Bar 33
	note E_, 4
	note E_, 6
	note E_, 2
	note E_, 4
;Bar 34
	note E_, 6
	note E_, 4
	note E_, 2
	note E_, 4
	note __, 16
;Bar 36
	note A#, 7
	notetype 6
	note A#, 1
	note A#, 1
	notetype 12
	note A#, 2
	note A#, 6
;Bar 37
	note A#, 4
	note D_, 4
	note A#, 2
	note A#, 4
	note C_, 2
;Bar 38
	note A#, 2
	note D_, 2
	note A#, 2
	note A#, 2
	note C_, 2
	note A#, 2
	note D_, 2
	note A#, 2
	endchannel

; ============================================================================================================
; ============================================================================================================
; ============================================================================================================
; ============================================================================================================

Music_KantoEliteFourFRLG:
	musicheader 4, 1, Music_KantoEliteFourFRLG_Ch1
	musicheader 1, 2, Music_KantoEliteFourFRLG_Ch2
	musicheader 1, 3, Music_KantoEliteFourFRLG_Ch3
	musicheader 1, 4, Music_KantoEliteFourFRLG_Ch4

Music_KantoEliteFourFRLG_Ch1:
	volume $77
	pitchoffset 0, D#
	dutycycle $3
	tone $0001
	notetype 12, $e3
	tempo 104
	stereopanning $f
	callchannel Music_KantoGymLeaderFRLG_Ch1_Master_Intro
;Bar 3
Music_KantoEliteFourFRLG_Ch1_loop:
	pitchoffset 0, D#
	dutycycle $2
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 10
;Bar 4
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 4
	intensity $d7
	note F_, 6
;Bar 5
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 10
;Bar 6
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 4
	intensity $d7
	note F_, 6
;Bar 7
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	intensity $48
	note F#, 1
	note __, 9
;Bar 8
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 4
	intensity $d7
	note F_, 6
;Bar 9
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 10
;Bar 10
	callchannel Music_KantoGymLeaderFRLG_Ch1_Intro
	note __, 4
	intensity $b7
	note A_, 6
;Bar 11
	vibrato $8, $34
	dutycycle $3
	stereopanning $f
	note F#, 1
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch1_Bar11
	stereopanning $f0
	note C#, 1
;Bar 13
	octave 2
	stereopanning $f
	note F_, 1
	callchannel Music_KantoGymLeaderFRLG_Ch1_Bar13
	stereopanning $f0
	note A_, 1
;Bar 15
	stereopanning $f
	note F#, 1
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch1_Bar11
	stereopanning $f0
	note C#, 1
;Bar 17
	octave 2
	stereopanning $f
	note F_, 1
	callchannel Music_KantoGymLeaderFRLG_Ch1_Bar13
	intensity $c7
	stereopanning $ff
	note A_, 1
;Bar 19
	stereopanning $f
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type1
	octave 2
	note C#, 2
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type1
	note B_, 1
	note __, 1
	octave 2
	note C#, 2
	octave 1
	note B_, 2
	note A_, 2
	octave 2
	note C#, 2
;Bar 23
	stereopanning $f
	octave 1
	intensity $b7
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	intensity $b3
Music_KantoEliteFourFRLG_Ch1_Bar23_25:
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type2
	loopchannel 11, Music_KantoEliteFourFRLG_Ch1_Bar23_25
;Bar 26
	stereopanning $ff
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type3
	note A_, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
;Bar 27
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	intensity $b3
Music_KantoEliteFourFRLG_Ch1_Bar27_30:
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type2
	loopchannel 12, Music_KantoEliteFourFRLG_Ch1_Bar27_30
;Bar 30
	stereopanning $ff
	octave 3
	intensity $93
	callchannel Music_KantoGymLeaderFRLG_Ch1_Type3
	callchannel Music_KantoGymLeaderFRLG_Ch1_Bar31_44
	loopchannel 0, Music_KantoEliteFourFRLG_Ch1_loop

; ============================================================================================================

Music_KantoEliteFourFRLG_Ch2:
	pitchoffset 0, D#
	dutycycle $1
	vibrato $8, $34
	notetype 12, $e7
	stereopanning $f0
;Bar 1
	callchannel Music_KantoGymLeaderFRLG_Ch2_Intro
;Bar 3
Music_KantoEliteFourFRLG_Ch2_loop:
	pitchoffset 0, D#
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 10
;Bar 4
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 4
	octave 4
	intensity $e7
	note C_, 4
;Bar 5
	notetype 6, $c7
	note D_, 2
	note C#, 1
	note C_, 1
	notetype 12, $c7
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 10
;Bar 6
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 4
	intensity $e7
	note A#, 6
;Bar 7
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	intensity $58
	note B_, 1
	note __, 9
;Bar 8
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 4
	octave 4
	intensity $e7
	note C_, 6
;Bar 9
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 10
;Bar 10
	callchannel Music_KantoGymLeaderFRLG_Ch2_Type1
	note __, 4
	octave 4
	intensity $e7
	note C#, 6
;Bar 11
	stereopanning $ff
	dutycycle $1
	vibrato $8, $22
	callchannel Music_KantoGymLeaderFRLG_Ch2_Main
	loopchannel 0, Music_KantoEliteFourFRLG_Ch2_loop

; ============================================================================================================

Music_KantoEliteFourFRLG_Ch3:
	pitchoffset 0, D#
	notetype 12, $14
	tone $0001
	callchannel Music_KantoGymLeaderFRLG_Ch3_Intro
;Bar 3
Music_KantoEliteFourFRLG_Ch3_loop:
	pitchoffset 0, D#
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type4
	octave 4
	note F#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note F#, 1
	note F#, 1
;Bar 4
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type5
	octave 4
	note F#, 2
	octave 3
	note B_, 1
	note B_, 1
	octave 4
	note C_, 6
;Bar 5
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type5
	octave 4
	note C_, 2
;Bar 6
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type5
	octave 4
	note F#, 2
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C_, 5
	note __, 1
;Bar 7
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 8
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type4
	octave 4
	note C_, 5
	note __, 1
;Bar 9
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 10
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type4
	octave 4
	note C#, 5
	note __, 1
;Bar 11
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 12
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 13
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar13
;Bar 15
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 16
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar7
;Bar 17
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar13
;Bar 19
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type6
	octave 4
	note E_, 4
;Bar 20
	callchannel Music_KantoGymLeaderFRLG_Ch2_Bar20
;Bar 21
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type6
	octave 4
	note E_, 4
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
;Bar 22
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type6
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note C#, 2
;Bar 23
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type3
;Bar 26
	note B_, 1
	note __, 1
	note B_, 1
	note __, 7
	octave 4
	note E_, 4
	note F#, 2
;Bar 27
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type3
;Bar 30
	note B_, 1
	note __, 1
	note B_, 1
	note __, 7
	note A#, 6
;Bar 31
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note C#, 12
;Bar 32
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar32
;Bar 33
	note D#, 16
;Bar 34
	octave 3
	note B_, 16
;Bar 35
	callchannel Music_KantoGymLeaderFRLG_Ch3_Bar32
;Bar 36
	note C#, 8
	note E_, 8
;Bar 37
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type1
	octave 3
	note B_, 2
	octave 4
	note E_, 6
;Bar 39
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type1
	octave 3
	note B_, 2
	octave 4
	note F_, 6
;Bar 41
	notetype 6, $14
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type2
	octave 4
	note C_, 4
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type2
	note A_, 4
	notetype 12, $14
;Bar 42
	callchannel Music_KantoGymLeaderFRLG_Ch2_Bar42
;Bar 43
	notetype 6, $14
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type2
	octave 4
	note C_, 4
	octave 3
	callchannel Music_KantoGymLeaderFRLG_Ch3_Type2
	note A_, 4
	notetype 12, $14
;Bar 44
	octave 4
	note C#, 2
	note A_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note F#, 2
	octave 3
	note G_, 4
	loopchannel 0, Music_KantoEliteFourFRLG_Ch3_loop

; ============================================================================================================

Music_KantoEliteFourFRLG_Ch4:
	togglenoise $3
	notetype 12
;Bar 1
	note __, 16
;Bar 2
	note __, 16
;Bar 3
Music_KantoEliteFourFRLG_Ch4_loop:
	note B_, 4
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	note G#, 2
	note G#, 1
	note G#, 1
;Bar 4
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	note G#, 2
	note F_, 6
;Bar 5
	note G#, 2
	note G#, 1
	note G#, 1
	note F_, 2
	note G#, 1
	note G#, 1
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
;Bar 6
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	note G#, 2
	note F_, 6
;Bar 7
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
;Bar 8
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	note G#, 2
	note F_, 6
;Bar 9
	note G#, 2
	note G#, 1
	note G#, 1
	note F_, 2
	note G#, 1
	note G#, 1
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
;Bar 10
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type2
	note G#, 2
	note F_, 6
;Bar 11
Music_KantoEliteFourFRLG_Ch4_bar11_18:
	note F_, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	loopchannel 8, Music_KantoEliteFourFRLG_Ch4_bar11_18
;Bar 19
	note F_, 2
	note F#, 2
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type1
;Bar 20
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type1
	note F_, 2
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note F_, 2
;Bar 21
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type1
	callchannel Music_KantoGymLeaderFRLG_Ch4_Type1
	callchannel Music_KantoGymLeaderFRLG_Ch4_Bar22_23
;Bar 24
Music_KantoEliteFourFRLG_Ch4_Bar24_25:
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	loopchannel 2, Music_KantoEliteFourFRLG_Ch4_Bar24_25
;Bar 26
	note B_, 4
	note D_, 2
	note A#, 1
	note A#, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note B_, 4
;Bar 27
	note B_, 4
Music_KantoEliteFourFRLG_Ch4_Bar27_28_29:
	note G#, 2
	loopchannel 27, Music_KantoEliteFourFRLG_Ch4_Bar27_28_29
	callchannel Music_KantoGymLeaderFRLG_Ch4_Bar29_38
;Bar 39
Music_KantoEliteFourFRLG_Ch4_Bar39_44:
	note G#, 2
	note G#, 1
	note G#, 1
	note F_, 2
	note G#, 1
	note G#, 1
	loopchannel 12, Music_KantoEliteFourFRLG_Ch4_Bar39_44
	loopchannel 0, Music_KantoEliteFourFRLG_Ch4_loop
