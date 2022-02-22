;Based on MIDI by ryanisthebomb203
Music_DahliaEncounter:
	musicheader 4, 1, Music_DahliaEncounter_Ch1
	musicheader 1, 2, Music_DahliaEncounter_Ch2
	musicheader 1, 3, Music_DahliaEncounter_Ch3
	musicheader 1, 4, Music_DahliaEncounter_Ch4

Music_DahliaEncounter_Ch1:
	volume $77
	dutycycle $2
	notetype 12, $a7
	tempo 115
;Bar 28
	octave 4
	intensity $77
	note A_, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
;Bar 29
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 30
	octave 5
	note C_, 4
	octave 4
	note A#, 2
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 31
	note G_, 4
	note A_, 2
	note D_, 9
	note __, 9
;Bar 32
	note A_, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
;Bar 33
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 34
	octave 5
	note C_, 4
	octave 4
	note A#, 2
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 35
	note G_, 6
	note A_, 9
	note __, 9
;Bar 36
	note A_, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
;Bar 37
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 38
	octave 5
	note C_, 4
	octave 4
	note A#, 2
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note A_, 4
	note G_, 4
;Bar 39
	note G_, 4
	note A_, 2
	note D_, 16
	note D_, 2
;Bar 40
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note F_, 2
	note E_, 2
;Bar 41
	note D_, 6
	note A_, 6
	octave 5
	note C_, 6
;Bar 42
	octave 4
	note E_, 6
	note C_, 4
	octave 3
	note A_, 4
;Bar 43
	octave 4
	note C_, 2
	note D_, 4
	note D_, 9
	note __, 16
	note __, 1
	loopchannel 0, Music_DahliaEncounter_Ch1

Music_DahliaEncounter_Ch2:
	dutycycle $1
	notetype 12, $a7
;Bar 28
	octave 2
	intensity $97
Music_DahliaEncounter_Ch2Loop:
	note D_, 16
;Bar 29
	note D_, 16
;Bar 30
	note C_, 16
;Bar 31
	octave 1
	note B_, 16
;Bar 32
	note A#, 16
;Bar 33
	octave 2
	note D_, 16
;Bar 34
	note C_, 16
;Bar 35
	note D_, 16
;Bar 36
	note D_, 16
;Bar 37
	note D_, 16
;Bar 38
	note C_, 16
;Bar 39
	octave 1
	note B_, 16
;Bar 40
	note A#, 16
;Bar 41
	note A#, 16
;Bar 42
	octave 2
	note C_, 16
;Bar 43
	note D_, 15
	note __, 16
	note __, 1
	loopchannel 0, Music_DahliaEncounter_Ch2Loop

Music_DahliaEncounter_Ch3:
	notetype 12, $10
;Bar 28
	octave 4
	intensity $20
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 29
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 30
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
;Bar 31
	note G_, 4
	note A_, 2
	note D_, 9
	note __, 9
;Bar 32
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 33
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 34
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
;Bar 35
	note G_, 6
	note A_, 9
	note __, 9
;Bar 36
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 37
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 38
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
;Bar 39
	note G_, 4
	note A_, 2
	note D_, 16
	note D_, 2
;Bar 40
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note F_, 2
	note E_, 2
;Bar 41
	note D_, 6
	note A_, 6
	octave 6
	note C_, 6
;Bar 42
	octave 5
	note E_, 6
	note C_, 4
	octave 4
	note A_, 4
;Bar 43
	octave 5
	note C_, 2
	note D_, 4
	note D_, 9
	note __, 16
	note __, 1
	loopchannel 0, Music_DahliaEncounter_Ch3

Music_DahliaEncounter_Ch4:
	togglenoise $3
	notetype $c
;Bar 28
	octave 5
	intensity $20
Music_DahliaEncounter_Ch4Loop:
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 29
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 30
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
;Bar 31
	note G_, 4
	note A_, 2
	note D_, 9
	note __, 9
;Bar 32
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 33
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 34
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
;Bar 35
	note G_, 6
	note A_, 9
	note __, 9
;Bar 36
	note A_, 2
	note F_, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
;Bar 37
	note A_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
;Bar 38
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
;Bar 39
	note G_, 4
	note A_, 2
	note D_, 16
	note D_, 2
;Bar 40
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note F_, 2
	note E_, 2
;Bar 41
	note D_, 6
	note A_, 6
	octave 6
	note C_, 6
;Bar 42
	octave 5
	note E_, 6
	note C_, 4
	octave 4
	note A_, 4
;Bar 43
	octave 5
	note C_, 2
	note D_, 4
	note D_, 9
	note __, 16
	note __, 1
	loopchannel 0, Music_DahliaEncounter_Ch4Loop
