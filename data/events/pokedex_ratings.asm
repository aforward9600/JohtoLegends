OakRatings:
; if you caught at most this many, play this sound, load this text
; (text is defined in engine/events/prof_oaks_pc.asm)
	dw   7, SFX_DEX_FANFARE_LESS_THAN_20, OakRating01
	dw  15, SFX_DEX_FANFARE_LESS_THAN_20, OakRating02
	dw  22, SFX_DEX_FANFARE_20_49,        OakRating03
	dw  33, SFX_DEX_FANFARE_20_49,        OakRating04
	dw  42, SFX_DEX_FANFARE_50_79,        OakRating05
	dw  55, SFX_DEX_FANFARE_50_79,        OakRating06
	dw  60,  SFX_DEX_FANFARE_80_109,       OakRating07
	dw  70, SFX_DEX_FANFARE_80_109,       OakRating08
	dw  95, SFX_CAUGHT_MON,               OakRating09
	dw 110, SFX_CAUGHT_MON,               OakRating10
	dw 135, SFX_DEX_FANFARE_140_169,      OakRating11
	dw 160, SFX_DEX_FANFARE_140_169,      OakRating12
	dw 190, SFX_DEX_FANFARE_170_199,      OakRating13
	dw 210, SFX_DEX_FANFARE_170_199,      OakRating15
	dw 240, SFX_DEX_FANFARE_200_229,      OakRating14
	dw 270, SFX_DEX_FANFARE_200_229,      OakRating16
	dw 300, SFX_DEX_FANFARE_230_PLUS,     OakRating17
	dw 320, SFX_DEX_FANFARE_230_PLUS,     OakRating18
	dw  -1, SFX_DEX_FANFARE_230_PLUS,     OakRating19
