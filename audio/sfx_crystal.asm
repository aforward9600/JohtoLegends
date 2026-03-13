Sfx_DittoPopUp:
	musicheader 1, 5, Sfx_DittoPopUp_Ch5

Sfx_DittoPopUp_Ch5:
	dutycycle $2
	soundinput $1e
	sound __,  4, $82, $0700
	sound __,  2, $31, $0701
	soundinput $16
	sound __,  5, $b1, $0640
	sound C_,  1, $31, $0641
	endchannel

Sfx_DittoTransform:
	musicheader 1, 5, Sfx_DittoTransform_Ch5

Sfx_DittoTransform_Ch5:
	dutycycle $1
	soundinput $26
	sound C_,  5, $3b, $0440
	sound __,  5, $97, $04c0
	sound __,  5, $67, $04c1
	sound __,  5, $42, $04c2
	endchannel

Sfx_DittoBounce:
	musicheader 1, 5, Sfx_DittoBounce_Ch5

Sfx_DittoBounce_Ch5:
	dutycycle $2
	soundinput $2c
	sound __,  3, $82, $04b0
	sound __,  1, $31, $04b0
	soundinput $34
	sound C_,  1, $b1, $0420
	endchannel

Sfx_GameFreakPresents:
	musicheader 1, 5, Sfx_GameFreakPresents_Ch5

Sfx_GameFreakPresents_Ch5:
	togglesfx
	dutycycle $2
	notetype $2, $b1
	soundinput $ff
	pitchoffset 1, A#
	octave 5
	note C_, 2
	note E_, 2
	note G_, 2
	octave 6
	note C_, 2
	note E_, 2
	note G_, 3
	intensity $81
	note G_, 3
	intensity $51
	note G_, 3
	intensity $31
	note G_, 3
	endchannel

Sfx_Tingle:
	musicheader 1, 5, Sfx_Tingle_Ch5

Sfx_Tingle_Ch5:
	togglesfx
	dutycycle $1
	pitchoffset 0, B_
	notetype $1, $b1
.loop
	octave 5
	note C_, 3
	octave 6
	note G_, 2
	octave 5
	note C_, 3
	note __, 2
	loopchannel 2, .loop
	note C_, 2
	intensity $a1
	note G_, 13
	endchannel

Sfx_Puddle:
	musicheader 1, 5, Sfx_PuddleCh5

Sfx_PuddleCh5:
	dutycycle $1
	soundinput $97
	sound __, 16, $98, $0700
	soundinput $8
	endchannel

Sfx_StatDown:
	musicheader 1, 5, .Ch5

.Ch5:
	sound __, 2, $e8, $07d0 ; 2000
	sound __, 2, $e8, $0708 ; 1800
	sound __, 2, $e8, $07c6 ; 1990
	sound __, 2, $e8, $06fe ; 1790
	sound __, 2, $e8, $07bc ; 1980
	sound __, 2, $e8, $06f4 ; 1780
	sound __, 2, $e8, $07b2 ; 1970
	sound __, 2, $e8, $06ea ; 1770
	sound __, 2, $e8, $07a8 ; 1960
	sound __, 2, $e8, $06e0 ; 1760
	sound __, 2, $e8, $079e ; 1950
	sound __, 2, $e8, $06d6 ; 1750
	sound __, 2, $e8, $0794 ; 1940
	sound __, 2, $e8, $06cc ; 1740
	sound __, 2, $e8, $078a ; 1930
	sound __, 2, $e8, $06c2 ; 1730
	sound __, 2, $e8, $0780 ; 1920
	sound __, 2, $e8, $06b8 ; 1720
	sound __, 2, $e8, $0776 ; 1910
	sound __, 2, $e8, $06ae ; 1710
	sound __, 2, $e8, $076c ; 1900
	sound __, 2, $e8, $06a4 ; 1700
	endchannel

Sfx_StatUp:
	musicheader 1, 5, .Ch5

.Ch5:
	sound __, 2, $e8, $076c ; 1900
	sound __, 2, $e8, $06a4 ; 1700
	sound __, 2, $e8, $0776 ; 1910
	sound __, 2, $e8, $06ae ; 1710
	sound __, 2, $e8, $0780 ; 1920
	sound __, 2, $e8, $06b8 ; 1720
	sound __, 2, $e8, $078a ; 1930
	sound __, 2, $e8, $06c2 ; 1730
	sound __, 2, $e8, $0794 ; 1940
	sound __, 2, $e8, $06cc ; 1740
	sound __, 2, $e8, $079e ; 1950
	sound __, 2, $e8, $06d6 ; 1750
	sound __, 2, $e8, $07a8 ; 1960
	sound __, 2, $e8, $06e0 ; 1760
	sound __, 2, $e8, $07b2 ; 1970
	sound __, 2, $e8, $06ea ; 1770
	sound __, 2, $e8, $07bc ; 1980
	sound __, 2, $e8, $06f4 ; 1780
	sound __, 2, $e8, $07c6 ; 1990
	sound __, 2, $e8, $06fe ; 1790
	sound __, 2, $e8, $07d0 ; 2000
	sound __, 2, $e8, $0708 ; 1800
	endchannel
