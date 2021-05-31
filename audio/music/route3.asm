Music_Route3: ; ec2ca
	musicheader 4, 1, Music_Route3_Ch1
	musicheader 1, 2, Music_Route3_Ch2
	musicheader 1, 3, Music_Route3_Ch3
	musicheader 1, 4, Music_Route3_Ch4
; ec2d6
 
Music_Route3_Ch1: ; ec2d6
	tempo 160
	dutycycle $0
Music_Route3_Entry:
	stereopanning $f
	volume $77
	notetype $c, $91
	note __, 10
	vibrato $14, $6
	octave 3
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	callchannel Music_Route3_Ch1_CE
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note G#, 1
Music_Route3_branch_ec307: ; ec307
	callchannel Music_Route3_branch_ec3a4
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	callchannel Music_Route3_Ch1_CE
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	callchannel Music_Route3_Ch1_CE
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	intensity $6f
	note G_, 1
	note D_, 1
	intensity $77
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 4
	intensity $6f
	octave 3
	note G#, 2
	note E_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note E_, 8
	note D#, 1
	note E_, 1
	note G#, 2
	octave 2
	note B_, 4
	octave 3
	note D_, 2
	note E_, 2
	note G#, 2
	note B_, 2
	note A_, 1
	note G#, 1
	note F_, 3
	note E_, 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note F_, 2
	intensity $91
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	note A_, 1
	note B_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 4
	note D_, 1
	loopchannel 0, Music_Route3_branch_ec307
; ec3a4
 
Music_Route3_branch_ec3a4: ; ec3a4
	octave 3
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	loopchannel 3, Music_Route3_branch_ec3a4
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
Music_Route3_branch_ec3b1: ; ec3b1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	loopchannel 3, Music_Route3_branch_ec3b1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
Music_Route3_branch_ec3bd: ; ec3bd
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	loopchannel 3, Music_Route3_branch_ec3bd
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	endchannel
; ec3d0
Music_Route3_Ch1_CE:
rept 3
	note C#, 1
	note E_, 1
endr
	endchannel
 
Music_Route3_Ch2: ; ec3d0
	callchannel Music_Route3_Ch2_Intro
Music_Route3_branch_ec3f5: ; ec3f5
	intensity $7d
	callchannel Music_Route3_branch_ec443
	note G_, 1
	note B_, 10
	intensity $b7
	note B_, 6
	intensity $7d
	note __, 4
	dutycycle $3
	note G#, 4
	callchannel Music_Route3_branch_ec443
	note B_, 1
	intensity $7d
	octave 5
	note D_, 5
	intensity $b7
	octave 5
	note D_, 5
	dutycycle $0
	callchannel Music_Route3_Ch2_Part2
	loopchannel 0, Music_Route3_branch_ec3f5
; ec443
 
Music_Route3_branch_ec443: ; ec443
	note A_, 6
	note E_, 1
	note A_, 1
	octave 5
	note C#, 7
	intensity $b7
	octave 5
	note C#, 3
	intensity $7d
	octave 4
	note E_, 2
	note A_, 2
	octave 5
	note E_, 2
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 6
	note D_, 1
	endchannel
; ec45b
 
Music_Route3_Ch2_Intro:
	dutycycle $2
	vibrato $6, $3
	stereopanning $f0
	notetype $c, $5e
	octave 4
	note E_, 1
	note G_, 1
	note G#, 6
	intensity $87
	note F#, 1
	note G#, 1
	note A_, 1
	note __, 7
	note C#, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	intensity $a7
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 1
	note G#, 1
	endchannel
 
Music_Route3_Ch2_Part2:
	octave 3
	note D_, 1
	note G_, 1
	note B_, 1
	note __, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 4
	intensity $8f
	dutycycle $2
	octave 4
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 8
	note G#, 1
	note A_, 1
	note B_, 2
	note E_, 4
	octave 4
	note E_, 8
	note D_, 1
	note C#, 1
	note D_, 3
	note C#, 3
	octave 3
	note A_, 10
	octave 4
	note F#, 6
	note E_, 1
	note F#, 1
	note G#, 6
	note F#, 1
	note G#, 1
	endchannel
 
Music_Route3_Ch3: ; ec45b
	stereopanning $ff
	vibrato $6, $3
	notetype $c, $13
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note E_, 6
	note D_, 1
	octave 3
	note B_, 1
	intensity $14
	callchannel Music_Route3_Ch3_Intro
	callchannel Music_Route3_branch_ec4bd
Music_Route3_branch_ec47f: ; ec47f
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4ce
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4ce
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note A_, 6
	note G#, 2
	note F#, 2
	note E_, 2
	note D_, 2
	octave 2
	note B_, 2
	note G#, 2
	note E_, 1
	note __, 1
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
	note F_, 6
	note E_, 2
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note C#, 2
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 1
	note D_, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	note F#, 1
	note G#, 1
	loopchannel 0, Music_Route3_branch_ec47f
; ec4bd
 
Music_Route3_branch_ec4bd: ; ec4bd
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 2
	note G#, 2
	endchannel
; ec4ce
 
Music_Route3_branch_ec4ce: ; ec4ce
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note D_, 2
	note G_, 2
	note G_, 1
	note __, 1
	octave 2
	note G_, 2
	note __, 2
	note G_, 1
	note G_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G#, 2
	note B_, 2
	endchannel
; ec4eb
Music_Route3_Ch3_Intro:
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 2
	endchannel
 
Music_Route3_Ch4: ; ec4eb
	togglenoise $4
	notetype $c
	note __, 10
Music_Route3_branch_ec4f0: ; ec4f0
	notetype $c
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	notetype $6
rept 8
	note C#, 1
endr
	loopchannel 0, Music_Route3_branch_ec4f0
; ec506
 
; ============================================================================================================
; ============================================================================================================
 
Music_Route3_Night: ; ec2ca
	musicheader 4, 1, Music_Route3_Night_Ch1
	musicheader 1, 2, Music_Route3_Night_Ch2
	musicheader 1, 3, Music_Route3_Night_Ch3
	musicheader 1, 4, Music_Route3_Night_Ch4
 
Music_Route3_Night_Ch1:
	tempo 168
	dutycycle $1
	callchannel Music_Route3_Entry
	endchannel
 
Music_Route3_Night_Ch2:
	callchannel Music_Route3_Ch2_Intro
Music_Route3_Night_Ch2_loop:
	intensity $7d
	callchannel Music_Route3_branch_ec443
	note G_, 1
	note B_, 10
	intensity $b7
	note B_, 6
	intensity $7d
	note __, 4
	dutycycle $2
	note G#, 4
	callchannel Music_Route3_branch_ec443
	note B_, 1
	intensity $7d
	octave 5
	note D_, 5
	intensity $b7
	octave 5
	note D_, 5
	dutycycle $1
	callchannel Music_Route3_Ch2_Part2
	loopchannel 0, Music_Route3_Night_Ch2_loop
 
Music_Route3_Night_Ch3: ; ec45b
	stereopanning $ff
	vibrato $6, $3
	notetype $c, $10
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note E_, 6
	note D_, 1
	octave 3
	note B_, 1
	intensity $12
	callchannel Music_Route3_Ch3_Intro
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec47f
 
Music_Route3_Night_Ch4: ; ec4eb
	togglenoise $4
	notetype $c
	note __, 10
	callchannel Music_Route3_branch_ec4f0
