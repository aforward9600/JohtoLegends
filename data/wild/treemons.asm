TreeMons:
; entries correspond to TREEMON_SET_* constants
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_Route_47

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	dbbw 50, 10, SPEAROW
	dbbw 15, 10, VENONAT
	dbbw 15, 10, PINECO
	dbbw 10, 10, AIPOM
	dbbw  5, 10, AIPOM
	dbbw  5, 10, AIPOM
	db -1
; rare
	dbbw 50, 10, SPEAROW
	dbbw 15, 10, VENONAT
	dbbw 15, 10, PINECO
	dbbw 10, 10, AIPOM
	dbbw  5, 10, AIPOM
	dbbw  5, 10, AIPOM
	db -1

TreeMonSet_Town:
; common
	dbbw 50, 10, SPEAROW
	dbbw 15, 10, VENONAT
	dbbw 15, 10, PINECO
	dbbw 10, 10, AIPOM
	dbbw  5, 10, AIPOM
	dbbw  5, 10, AIPOM
	db -1
; rare
	dbbw 50, 10, SPEAROW
	dbbw 15, 10, VENONAT
	dbbw 15, 10, PINECO
	dbbw 10, 10, AIPOM
	dbbw  5, 10, AIPOM
	dbbw  5, 10, AIPOM
	db -1

TreeMonSet_Route:
; common
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, PINECO
	dbbw 15, 10, PINECO
;	dbbw 10, 10, SWABLU
	dbbw 10, 10, PINECO
	dbbw  5, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	db -1
; rare
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, PINECO
	dbbw 15, 10, PINECO
;	dbbw 10, 10, SWABLU
	dbbw 10, 10, PINECO
	dbbw  5, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	db -1

TreeMonSet_Kanto:
; common
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, PINECO
	dbbw 15, 10, PINECO
	dbbw 10, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	db -1
; rare
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, PINECO
	dbbw 15, 10, PINECO
	dbbw 10, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	db -1

TreeMonSet_Lake:
; common
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, VENONAT
	dbbw 15, 10, PINECO
	dbbw 10, 10, EXEGGCUTE
	dbbw  5, 10, MUNCHLAX
	dbbw  5, 10, MUNCHLAX
	db -1
; rare
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, PINECO
	dbbw 15, 10, PINECO
	dbbw 10, 10, EXEGGCUTE
	dbbw  5, 10, MUNCHLAX
	dbbw  5, 10, MUNCHLAX
	db -1

TreeMonSet_Forest:
; common
	dbbw 50, 30, NOCTOWL
	dbbw 15, 30, PINECO
	dbbw 15, 30, PINECO
	dbbw 10, 30, FORRETRESS
	dbbw  5, 30, BUTTERFREE
	dbbw  5, 30, BEEDRILL
	db -1
; rare
	dbbw 50, 30, NOCTOWL
	dbbw 15, 30, PINECO
	dbbw 15, 30, PINECO
	dbbw 10, 30, FORRETRESS
	dbbw  5, 30, BUTTERFREE
	dbbw  5, 30, BEEDRILL
	db -1

TreeMonSet_Rock:
	dbbw 50, 15, GEODUDE
	dbbw 20, 15, KRABBY
	dbbw 20, 15, BONSLY
	dbbw 10, 15, SHUCKLE
	db -1

TreeMonSet_Route_47:
; common
	dbbw 50, 20, SPEAROW
	dbbw 15, 20, EKANS
	dbbw 15, 20, HERACROSS
	dbbw 10, 20, PINSIR
	dbbw  5, 20, AIPOM
	dbbw  5, 20, AIPOM
	db -1
; rare
	dbbw 50, 20, SPEAROW
	dbbw 15, 20, EKANS
	dbbw 15, 20, HERACROSS
	dbbw 10, 20, PINSIR
	dbbw  5, 20, AIPOM
	dbbw  5, 20, AIPOM
	db -1
