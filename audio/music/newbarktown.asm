Music_NewBarkTown: ; eb2d3
	musicheader 3, 1, Music_NewBarkTown_Ch1
	musicheader 1, 2, Music_NewBarkTown_Ch2
	musicheader 1, 3, Music_NewBarkTown_Ch3
; eb2dc
 
Music_NewBarkTown_Ch1: ; eb2dd
	tempo 187
	volume $77
	stereopanning $f
	vibrato $12, $23
	notetype $c, $87
	note __, 4
Music_NewBarkTown_branch_eb2eb: ; eb2eb
	dutycycle $0
	callchannel Music_NewBarkTown_branch_eb349
	callchannel Music_NewBarkTown_Ch1_Part1
	dutycycle $2
	intensity $82
	callchannel Music_NewBarkTown_Ch1_Part2
	dutycycle $0
	intensity $87
	callchannel Music_NewBarkTown_branch_eb349
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note E_, 2
	dutycycle $2
	intensity $82
	callchannel Music_NewBarkTown_Ch1_Part3
	dutycycle $1
	intensity $5e
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_branch_eb37c
		callchannel Music_NewBarkTown_Ch1_Part4
	intensity $87
	loopchannel 0, Music_NewBarkTown_branch_eb2eb
; eb349
 
Music_NewBarkTown_branch_eb349: ; eb349
	octave 3
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 2
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note A#, 2
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 4
	note C_, 2
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note G_, 2
	octave 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note E_, 2
	octave 2
	note B_, 1
	note __, 1
	endchannel
; eb37c
 
Music_NewBarkTown_branch_eb37c: ; eb37c
	octave 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note E_, 2
	endchannel
 
;New Parts
Music_NewBarkTown_Ch1_Part1:
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note G_, 2
	note F#, 2
	endchannel
 
Music_NewBarkTown_Ch1_Part2:
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	endchannel
 
Music_NewBarkTown_Ch1_Part3:
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C#, 1
	note E_, 1
	note A_, 1
	endchannel
 
Music_NewBarkTown_Ch1_Part4:
	octave 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note B_, 2
	endchannel
 
; eb38d
 
Music_NewBarkTown_Ch2: ; eb38d
	stereopanning $ff
	vibrato $12, $23
	notetype $6, $a7
	note __, 8
Music_NewBarkTown_branch_eb396: ; eb396
	dutycycle $2
	notetype $6, $a7
	callchannel Music_NewBarkTown_branch_eb3bf
	callchannel Music_NewBarkTown_branch_eb3bf
	callchannel Music_NewBarkTown_branch_eb3f2
	intensity $87
	octave 5
	note B_, 6
	note A_, 6
	intensity $77
	octave 6
	note D_, 4
	note C#, 16
	callchannel Music_NewBarkTown_branch_eb3f2
	intensity $87
	octave 5
	note B_, 6
	note A_, 6
	intensity $77
	octave 6
	note D_, 4
	note E_, 16
	loopchannel 0, Music_NewBarkTown_branch_eb396
; eb3bf
 
Music_NewBarkTown_branch_eb3bf: ; eb3bf
	octave 2
	note D_, 4
	note __, 8
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 8
	note A#, 2
	note __, 2
	note D_, 4
	note __, 8
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 8
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note G_, 4
	note __, 8
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 1
	note G#, 2
	note __, 2
	note G#, 8
	octave 2
	note D_, 2
	note __, 2
	note A_, 4
	note __, 8
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 1
	note A_, 2
	note __, 2
	note A_, 8
	octave 2
	note C#, 4
	endchannel
; eb3f2
 
Music_NewBarkTown_branch_eb3f2: ; eb3f2
	notetype $6, $97
	dutycycle $2
	octave 4
	note B_, 12
	note A_, 12
	note G_, 8
	notetype $c, $97
	note E_, 16
	endchannel
; eb400
 
Music_NewBarkTown_Ch3: ; eb400
	stereopanning $f0
	notetype $c, $10
	octave 5
	note D_, 2
	note E_, 2
Music_NewBarkTown_branch_eb408: ; eb408
	vibrato $16, $23
	callchannel Music_NewBarkTown_Ch3_Part1
	intensity $25
	vibrato $12, $53
	callchannel Music_NewBarkTown_Ch3_Part2
	intensity $10
	vibrato $16, $23
	octave 5
	note D_, 1
	note E_, 1
	loopchannel 0, Music_NewBarkTown_branch_eb408
; eb453
 
;New Parts
Music_NewBarkTown_Ch3_Part1:
	note F#, 4
	note A_, 4
	note G_, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note F#, 6
	note D_, 2
	octave 4
	note A_, 6
	note G_, 1
	note A_, 1
	note B_, 4
	octave 5
	note D_, 4
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 6
	note F#, 2
	note E_, 4
	note __, 2
	note D_, 1
	note E_, 1
	note F#, 4
	note A_, 4
	note A#, 2
	note A_, 2
	note G_, 2
	note A#, 2
	note A_, 6
	octave 6
	note C#, 2
	note D_, 6
	octave 5
	note E_, 1
	note F#, 1
	note G_, 6
	note A_, 2
	note B_, 8
	note A_, 6
	note G_, 1
	note F#, 1
	note E_, 4
	note __, 4
	endchannel
 
Music_NewBarkTown_Ch3_Part2:
	octave 2
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 14
	endchannel
 
Music_NewBarkTownNight:
	musicheader 3, 1, Music_NewBarkTownNight_Ch1
	musicheader 1, 2, Music_NewBarkTownNight_Ch2
	musicheader 1, 3, Music_NewBarkTownNight_Ch3
 
Music_NewBarkTownNight_Ch1:
	tempo 197
	volume $77
	stereopanning $f
	vibrato $12, $22
	notetype $c, $87
	note __, 4
 
Music_NewBarkTownNight_main:
	dutycycle $1
	callchannel Music_NewBarkTown_branch_eb349
	callchannel Music_NewBarkTown_Ch1_Part1
	dutycycle $2
	intensity $82
	callchannel Music_NewBarkTown_Ch1_Part2
	dutycycle $1
	intensity $87
	callchannel Music_NewBarkTown_branch_eb349
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note E_, 2
	dutycycle $2
	intensity $82
	callchannel Music_NewBarkTown_Ch1_Part3
	dutycycle $2
	intensity $5e
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_Ch1_Part4
	intensity $87
	loopchannel 0, Music_NewBarkTownNight_main
 
Music_NewBarkTownNight_Ch2:
	stereopanning $ff
	vibrato $12, $22
	notetype $6, $a7
	note __, 8
 
	callchannel Music_NewBarkTown_branch_eb396
	endchannel
 
Music_NewBarkTownNight_Ch3: ; eb400
	stereopanning $f0
	notetype $c, $12
	octave 5
	note D_, 2
	note E_, 2
Music_NewBarkTownNight_Ch3_main: ; eb408
	vibrato $16, $12
	callchannel Music_NewBarkTown_Ch3_Part1
	intensity $24
	vibrato $12, $42
	callchannel Music_NewBarkTown_Ch3_Part2
	intensity $12
	vibrato $16, $12
	octave 5
	note D_, 1
	note E_, 1
	loopchannel 0, Music_NewBarkTownNight_Ch3_main
