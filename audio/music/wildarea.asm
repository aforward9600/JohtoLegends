Music_SafariZone:
	musicheader 4, 1, Music_SafariZone_Ch1
	musicheader 1, 2, Music_SafariZone_Ch2
	musicheader 1, 3, Music_SafariZone_Ch3
	musicheader 1, 4, Music_SafariZone_Ch4
 
Music_SafariZone_Ch1:
	tempo 208
	volume $77
	dutycycle 0
	vibrato $8, $15
	notetype $c, $82
	note __, 14
	octave 2
Music_SafariZone_Ch1_loop:
	note C_, 3
	note C_, 3
	note C_, 3
	note C_, 3
	note C_, 1
	dutycycle 2
	intensity $72
	octave 4
	note D#, 2
	note G#, 1
	octave 5
	note C_, 3
	octave 4
	note C_, 2
	note D#, 1
	note F_, 3
	note F_, 2
	note G#, 1
	octave 5
	note C#, 3
	octave 4
	note F_, 3
	note G_, 3
	note D#, 2
	note G_, 1
	note A#, 3
	note D#, 2
	octave 5
	note C#, 1
	note C_, 1
	note C_, 1
	octave 4
	note B_, 1
	octave 5
	note C_, 2
	octave 4
	note G#, 1
	note D#, 2
	note G#, 1
	note C_, 1
	note C#, 1
	note D#, 1
	dutycycle 0
	note F_, 2
	note F_, 1
	note C#, 1
	note F_, 1
	note G#, 1
	intensity $75
	octave 5
	note C#, 3
	octave 4
	note F_, 3
	intensity $72
	note D#, 2
	note D#, 1
	note C_, 1
	note D#, 1
	note G#, 1
	intensity $75
	octave 5
	note C_, 3
	octave 4
	note D#, 3
	dutycycle 2
	note D_, 3
	note D_, 3
	octave 3
	note A#, 3
	octave 4
	note F_, 3
	dutycycle 0
	intensity $72
	note D#, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 5
	note D#, 2
	note D#, 1
	octave 4
	intensity $94
	note D#, 3
	dutycycle 2
	callchannel Music_SafariZone_Ch1_branch_1
	dutycycle 3
	note C#, 3
	octave 3
	note F_, 1
	note G#, 1
	octave 4
	note C#, 1
	note D#, 3
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note D#, 1
	note F_, 3
	octave 6
	dutycycle 2
	intensity $73
	note C#, 3
	octave 5
	note F_, 2
	note F_, 1
	note G#, 3
	octave 4
	intensity $94
	dutycycle 3
	note G_, 5
	note G#, 1
	note G_, 3
	note F_, 3
	note D#, 3
	note C#, 3
	note C_, 3
	octave 3
	note A#, 3
	note G#, 3
	note G#, 2
	note G_, 1
	note G#, 1
	note __, 2
	note A#, 1
	note __, 2
	note G_, 3
	octave 5
	dutycycle 2
	intensity $93
	note D#, 2
	note F_, 1
	note D#, 3
	note C#, 3
	intensity $94
	callchannel Music_SafariZone_Ch1_branch_1
	dutycycle 3
	note C#, 3
	octave 3
	note F_, 1
	note G#, 1
	octave 4
	note C#, 1
	note F_, 3
	octave 3
	note F_, 1
	note G#, 1
	octave 4
	note C#, 1
	note G#, 3
	dutycycle 2
	octave 3
	note F_, 3
	note D#, 3
	note D_, 3
	intensity $74
	octave 4
	note D#, 2
	note D#, 1
	octave 5
	note D#, 3
	octave 4
	note D#, 2
	note D#, 1
	octave 5
	note D#, 3
	octave 4
	note D#, 2
	note D#, 1
	octave 5
	note D#, 3
	octave 4
	note D#, 2
	note D#, 1
	octave 5
	note D#, 3
	dutycycle 0
	octave 3
	note F_, 3
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	note F_, 1
	note G#, 1
	note __, 2
	octave 4
	dutycycle 3
	intensity $a4
	note F_, 3
 
	intensity $74
	dutycycle 0
	octave 3
	note F_, 3
	note D_, 1
	note F_, 1
	note G#, 1
	octave 4
	note D_, 1
	note __, 2
	dutycycle 3
	intensity $a4
	note F_, 3 
	dutycycle 2
	intensity $a2
	note G#, 3
	note B_, 3
	octave 5
	note C_, 3
	octave 4
	note G#, 3
	note G_, 3
	octave 3
	note G_, 3
	intensity $a4
	note D#, 1
	note G_, 1
	note A#, 1
	octave 4
	note C#, 3
	dutycycle 0
	intensity $c7
	octave 3
	note G#, 12
	note __, 14
	intensity $82
	octave 2
	note C_, 3
	note C_, 3
	note C_, 3
	note C_, 3
	loopchannel 0, Music_SafariZone_Ch1_loop
 
Music_SafariZone_Ch1_branch_1:
	octave 4
	note G#, 5
	note A#, 1
	octave 5
	note C_, 3
	octave 4
	note A#, 3
	note G#, 3
	note G_, 3
	note F_, 3
	note D#, 3
	endchannel
 
Music_SafariZone_Ch2:
	dutycycle $2
	vibrato $12, $25
	tone $0001
	callchannel Music_SafariZone_Ch2_branch_2
	notetype $c, $a2
	note G#, 12
Music_SafariZone_Ch2_loop:
	dutycycle 1
	octave 3
	intensity $c5
	note D#, 2
	intensity $c2
	note D_, 1
	note D#, 3
	intensity $c5
	note G#, 2
	intensity $c2
	note G_, 1
	note G#, 3
	intensity $c5
	note F_, 2
	note E_, 1
	note F_, 2
	note G_, 1
	note G#, 3
	note __, 3
	note A#, 2
	intensity $c2
	note G#, 1
	note G_, 3
	intensity $c5
	note G_, 2
	intensity $c2
	note F_, 1
	note D#, 3
	note G#, 1
	note G#, 1
	note G_, 1
	intensity $c5
	note G#, 2
	note F_, 1
	note D#, 3
	note __, 3
	dutycycle 2
	note G#, 2
	note G_, 1
	note G#, 2
	note A#, 1
	note G#, 3
	note __, 3
	note G#, 2
	note G_, 1
	note G#, 2
	note A#, 1
	note G#, 3
	note __, 3
	dutycycle 1
	intensity $c2
	note G_, 2
	note G#, 1
	note G_, 2
	note G#, 1
	note A#, 2
	note F_, 1
	note G_, 2
	note G#, 1
	intensity $c5
	note A#, 9
	notetype $3, $52
	note __, 6
	note D#, 1
	intensity $62
	note F_, 1
	intensity $72
	note G_, 1
	intensity $82
	note G#, 1
	intensity $92
	note A#, 1
	intensity $a2
	note B_, 1
	notetype $c, $c7
	callchannel Music_SafariZone_Ch2_branch_1
	note F_, 3
	note __, 3
	note G_, 3
	note __, 3
	intensity $c0
	note G#, 3
	intensity $c5
	note G#, 9
	dutycycle 0
	intensity $c7
	note A#, 5
	octave 4
	note C_, 1
	octave 3
	note A#, 3
	note G#, 3
	note G_, 3
	note F_, 3
	note D#, 3
	note C#, 3
	intensity $c3
	note C_, 3
	note C_, 2
	octave 2
	note B_, 1
	octave 3
	note C_, 3
	note C#, 3
	intensity $c0
	note D#, 3
	intensity $c5
	note D#, 9
	intensity $c7
	dutycycle 1
	callchannel Music_SafariZone_Ch2_branch_1
	note G#, 3
	note __, 3
	octave 4
	note C#, 3
	note __, 3
	intensity $c3
	note F_, 3
	intensity $92
	dutycycle 0
	octave 3
	note G#, 3
	note G_, 3
	note F_, 3
	intensity $c7
	dutycycle 3
	note D#, 3
	note __, 3
	note F_, 3
	note __, 3
	note G_, 3
	note __, 3
	note G#, 3
	note __, 3
	dutycycle 2
	note A#, 1
	note __, 2
	octave 4
	note C#, 1
	note __, 2
	note F_, 1
	note __, 2
	octave 3
	note F_, 3
	note G_, 1
	note __, 2
	note G#, 1
	note __, 2
	note G_, 1
	note __, 2
	note F_, 3
	intensity $c2
	dutycycle 0
	note D#, 3
	note D_, 3
	note D#, 3
	note F_, 3
	note D#, 3
	note D#, 2
	octave 4
	note C#, 1
	intensity $c5
	note C_, 3
	octave 3
	note G_, 3
	dutycycle 2
	callchannel Music_SafariZone_Ch2_branch_2
	intensity $a2
	octave 4
	note G#, 4
	octave 5
	note D#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	intensity $a5
	note F#, 4
	note F_, 1
	note E_, 1
	note D#, 4
	note F_, 1
	note G_, 1
	notetype $c, $a2
	note G#, 12
	note __, 12
	loopchannel 0, Music_SafariZone_Ch2_loop
 
Music_SafariZone_Ch2_branch_1:
	octave 4
	note C_, 5
	note C#, 1
	note D#, 3
	note C#, 3
	note C_, 3
	octave 3
	note A#, 3
	note G#, 3
	note G_, 3
	endchannel
 
Music_SafariZone_Ch2_branch_2:
	notetype $6, $a2
	octave 4
	note C_, 4
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note C#, 2
	note D#, 2
	intensity $a5
	note F#, 4
	note F_, 1
	note E_, 1
	note D#, 4
	note F_, 1
	note G_, 1
	endchannel
 
 
Music_SafariZone_Ch3:
	vibrato $12, $15
	callchannel Music_SafariZone_Ch3_branch_5
Music_SafariZone_Ch3_loop:
	callchannel Music_SafariZone_Ch3_branch_1
	callchannel Music_SafariZone_Ch3_branch_1
	callchannel Music_SafariZone_Ch3_branch_1
	callchannel Music_SafariZone_Ch3_branch_1
	callchannel Music_SafariZone_Ch3_branch_2
	callchannel Music_SafariZone_Ch3_branch_2
	octave 2
	note D#, 2
	note __, 2
	octave 4
	note C#, 2
	octave 2
	note A#, 2
	note __, 2
	octave 4
	note C#, 2
	octave 2
	note D#, 2
	note __, 2
	octave 4
	note C#, 2
	octave 2
	note A#, 2
	note __, 2
	octave 3
	note G_, 2
	callchannel Music_SafariZone_Ch3_branch_1
	callchannel Music_SafariZone_Ch3_branch_1
	callchannel Music_SafariZone_Ch3_branch_3
	octave 3
	note C#, 1
	note __, 1
	note F_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note F_, 2
	note __, 4 
	callchannel Music_SafariZone_Ch3_branch_4
	octave 3
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note D#, 2
	note __, 4 
	octave 2
	note D_, 2
	note __, 2
	octave 3
	note F_, 2
	octave 1
	note A#, 2
	note __, 2
	octave 3
	note F_, 2
	octave 2
	note C_, 2
	note __, 2
	octave 4
	note D_, 2
	octave 2
	note D_, 2
	note __, 2
	octave 4
	note D_, 2
	octave 2
	note D#, 2
	note __, 2
	octave 3
	note G_, 2
	octave 2
	note A#, 2
	note __, 4
	octave 3
	note D#, 2
	note __, 2
	note A#, 2
	octave 2
	note D#, 2
	note __, 4
	note G#, 2
	note __, 4
	note D#, 2
	note __, 4
	note G#, 2
	note __, 4
	note D#, 2
	note __, 4
	note G#, 2
	note __, 4
	note D#, 2
	note __, 4
	octave 3
	note C_, 2
	note __, 4
	octave 2
	note D#, 2
	note __, 4
	note C#, 2
	note __, 4
	note G#, 2
	note __, 4
	note C#, 2
	note __, 4
	note G#, 2
	note __, 4
	octave 3
	note C#, 2
	note __, 4
	octave 2
	note G#, 2
	note __, 4
	note F_, 2
	note __, 4
	note G#, 2
	note __, 4
	note D#, 2
	note __, 4
	note A#, 2
	note __, 4
	note D#, 2
	note __, 4
	note A#, 2
	note __, 4
	note D#, 2
	note __, 4
	note D#, 2
	note __, 4
	note F_, 2
	note __, 4
	note G_, 2
	note __, 4
	note G#, 2
	note __, 4
	octave 3
	note D#, 2
	note __, 4
	octave 2
	note G#, 2
	note __, 4
	octave 3
	note D#, 2
	note __, 4
	octave 2
	note A#, 2
	note __, 4
	note D#, 2
	note __, 4
	note F_, 2
	note __, 4
	note G_, 2
	note __, 4
	note G#, 2
	note __, 4
	note D#, 2
	note __, 4
	note G#, 2
	note __, 4
	note D#, 2
	note __, 4
	note G#, 2
	note __, 4
	note D#, 2
	note __, 4
	note G#, 2
	note __, 4
	octave 3
	note C_, 2
	note __, 4
	note C#, 2
	note __, 4
	octave 2
	note G#, 2
	note __, 4
	octave 3
	note C#, 2
	note __, 4
	octave 2
	note G#, 2
	note __, 4
	octave 3
	note D_, 2
	note __, 4
	octave 2
	note D_, 2
	note __, 4
	note D#, 2
	note __, 4
	note F_, 2
	note __, 4
	octave 4
	notetype $c, $14
	note C_, 2
	note __, 1
	octave 2
	note D#, 2
	note __, 1
	octave 4
	note D_, 2
	note __, 1
	octave 2
	note D#, 2
	note __, 1
	octave 4
	note C#, 2
	note __, 1
	octave 2
	note D#, 2
	note __, 1
	octave 4
	note C_, 2
	note __, 1
	octave 2
	note D#, 2
	note __, 1
	note C#, 1
	note __, 11
	note D_, 1
	note __, 14
	note D#, 2
	note __, 4
	note D#, 2
	note __, 1
	note D#, 2
	note __, 1
	note D#, 2
	note __, 4
	note D#, 1
	note __, 1
	note D#, 1
	callchannel Music_SafariZone_Ch3_branch_5
	callchannel Music_SafariZone_Ch3_branch_5
	callchannel Music_SafariZone_Ch3_branch_1
	callchannel Music_SafariZone_Ch3_branch_1
	loopchannel 0, Music_SafariZone_Ch3_loop
 
Music_SafariZone_Ch3_branch_1:
	octave 2
	note G#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 2
	note D#, 2
	note __, 2
	octave 4
	note D#, 2
	endchannel
 
Music_SafariZone_Ch3_branch_2:
	octave 2
	note C#, 2
	note __, 2
	octave 4
	note C#, 2
	octave 2
	note G#, 2
	note __, 2
	octave 4
	note C#, 2
	endchannel
 
Music_SafariZone_Ch3_branch_3:
	octave 2
	note C#, 2
	note __, 2
	octave 4
	note C#, 2
	octave 2
	note C#, 2
	note __, 2
	octave 4
	note C#, 2
	endchannel
 
Music_SafariZone_Ch3_branch_4:
	octave 2
	note G#, 2
	note __, 2
	octave 4
	note C_, 2
	octave 2
	note G#, 2
	note __, 2
	octave 4
	note C_, 2
	endchannel
 
Music_SafariZone_Ch3_branch_5:
	notetype $6, $14
	octave 2
	note G#, 2
	note __, 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note D#, 4
	note __, 2
	octave 2
	note D#, 4
	note F_, 1
	note G_, 1
	endchannel
 
Music_SafariZone_Ch4:
	togglenoise $3
	notetype $c
	note __, 12
Music_SafariZone_Ch4_loop:
	callchannel Music_SafariZone_Ch4_branch_5
	callchannel Music_SafariZone_Ch4_branch_1
	callchannel Music_SafariZone_Ch4_branch_1
	callchannel Music_SafariZone_Ch4_branch_2
	callchannel Music_SafariZone_Ch4_branch_2
	callchannel Music_SafariZone_Ch4_branch_5
	callchannel Music_SafariZone_Ch4_branch_2
	callchannel Music_SafariZone_Ch4_branch_3
	callchannel Music_SafariZone_Ch4_branch_5
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	callchannel Music_SafariZone_Ch4_branch_5
	callchannel Music_SafariZone_Ch4_branch_3
	callchannel Music_SafariZone_Ch4_branch_4
	callchannel Music_SafariZone_Ch4_branch_5
	callchannel Music_SafariZone_Ch4_branch_4
	callchannel Music_SafariZone_Ch4_branch_3
	callchannel Music_SafariZone_Ch4_branch_4
	callchannel Music_SafariZone_Ch4_branch_5
	callchannel Music_SafariZone_Ch4_branch_4
	note B_, 3
	note C_, 3
	note B_, 3
	note C_, 3
	note B_, 3
	note C_, 3
	note B_, 3
	note C_, 3
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 3
	note B_, 3
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 3
	note B_, 3
	callchannel Music_SafariZone_Ch4_branch_5
	note C_, 3
	note C_, 6
	note B_, 3
	note B_, 12
	note __, 12
	callchannel Music_SafariZone_Ch4_branch_5
	loopchannel 0, Music_SafariZone_Ch4_loop
 
Music_SafariZone_Ch4_branch_1:
	note C_, 2
	note C_, 1
	note C_, 3
	note C_, 2
	note C_, 1
	note C_, 3
	note C_, 2
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 3
	endchannel
 
Music_SafariZone_Ch4_branch_2:
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note B_, 6
	endchannel
 
Music_SafariZone_Ch4_branch_3:
	note B_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 3
	endchannel
 
Music_SafariZone_Ch4_branch_4:
	note C_, 3
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	endchannel
 
Music_SafariZone_Ch4_branch_5:
	note C_, 2
	note C_, 1
	note C_, 3
	note C_, 2
	note C_, 1
	note C_, 3
	endchannel
