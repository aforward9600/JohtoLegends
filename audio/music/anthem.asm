Music_Anthem:
	musicheader 4, 1, Music_Anthem_Ch1
	musicheader 1, 2, Music_Anthem_Ch2
	musicheader 1, 3, Music_Anthem_Ch3
	musicheader 1, 4, Music_Anthem_Ch4

Music_Anthem_Ch1:
	tempo $A0
	volume $77
	stereopanning $77
Music_Anthem_Ch1_loop:
	dutycycle 1
	octave 3
	notetype $C, $F1
	callchannel Music_Anthem_Ch1_ditty1
	note __, 5
	callchannel Music_Anthem_Ch1_ditty1
	note __, 5
	callchannel Music_Anthem_Ch1_ditty2
	note __, 5
	callchannel Music_Anthem_Ch1_ditty2
	note __, 5
	callchannel Music_Anthem_Ch1_ditty3
	note __, 5
	callchannel Music_Anthem_Ch1_ditty4
	note __, 5
	callchannel Music_Anthem_Ch1_ditty5
	note __, 5
	callchannel Music_Anthem_Ch1_ditty5
	note __, 5
	dutycycle 0
	callchannel Music_Anthem_Ch1_ditty1
	note __, 5
	callchannel Music_Anthem_Ch1_ditty1
	note __, 5
	callchannel Music_Anthem_Ch1_ditty2
	note __, 5
	callchannel Music_Anthem_Ch1_ditty2
	note __, 1
	dutycycle 1
	intensity $F7
	vibrato $0F, $13
	note G#, 4
	note F#, 16
	note F_, 8
	note C#, 8
	note D#, 12
	notetype $F, $0F
	note D#, 16
	loopchannel 0, Music_Anthem_Ch1_loop

Music_Anthem_Ch1_ditty1:
	note A#, 2
	note A#, 2
	note __, 2
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	endchannel

Music_Anthem_Ch1_ditty2:
	note G#, 2
	note G#, 2
	note __, 2
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	endchannel

Music_Anthem_Ch1_ditty3:
	note F#, 2
	note F#, 2
	note __, 2
	note F#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	endchannel

Music_Anthem_Ch1_ditty4:
	note F_, 2
	note F_, 2
	note __, 2
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	endchannel

Music_Anthem_Ch1_ditty5:
	note D#, 2
	note D#, 2
	note __, 2
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	endchannel

Music_Anthem_Ch2:
Music_Anthem_Ch2_loop:
	octave 2
	notetype $C, $F1
	callchannel Music_Anthem_Ch1_ditty1
	note __, 5
	callchannel Music_Anthem_Ch1_ditty1
	note __, 5
	callchannel Music_Anthem_Ch1_ditty2
	note __, 5
	callchannel Music_Anthem_Ch1_ditty2
	note __, 5
	callchannel Music_Anthem_Ch1_ditty3
	note __, 5
	callchannel Music_Anthem_Ch1_ditty4
	note __, 5
	callchannel Music_Anthem_Ch1_ditty5
	note __, 5
	callchannel Music_Anthem_Ch1_ditty5
	note __, 1
	dutycycle 1
	intensity $F7
	vibrato $0F, $13
	octave 3
	note F_, 4
	note A#, 10
	note F_, 2
	note G#, 2
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note G#, 4
	note D#, 4
	note F_, 12
	note G#, 8
	note G#, 4
	note A#, 4
	note F_, 4
	note A#, 10
	note F_, 2
	note G#, 2
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note G#, 4
	octave 4
	note F_, 4
	note D#, 12
	notetype $F, $0F
	note D#, 16
	loopchannel 0, Music_Anthem_Ch2_loop

Music_Anthem_Ch3:
	notetype $C, $17
	octave 1
Music_Anthem_Ch3_loop:
	note A#, 16
	note A#, 16
	note G#, 16
	note G#, 16
	note F#, 16
	note F_, 16
	note D#, 16
	note D#, 16
	loopchannel 0, Music_Anthem_Ch3_loop

Music_Anthem_Ch4:
	togglenoise 1
	notetype $C
Music_Anthem_Ch4_loop:
	note F_, 1
	note __, 3
	loopchannel 0, Music_Anthem_Ch4_loop
