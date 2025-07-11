unownwall: MACRO
rept _NARG
if \1 == "-"
x = $64
elif \1 >= "Y"
x = 2 * (\1 - "Y") + $60
elif \1 >= "Q"
x = 2 * (\1 - "Q") + $40
elif \1 >= "I"
x = 2 * (\1 - "I") + $20
else
x = 2 * (\1 - "A")
endc
	db x
	shift
endr
	db -1 ; end
ENDM

UnownWalls:
; UNOWNWORDS_ESCAPE
	; db      $08, $44, $04, $00, $2e, $08, -1
	unownwall "E", "S", "C", "A", "P", "E"
; UNOWNWORDS_LIGHT
	; db      $26, $20, $0c, $0e, $46, -1
	unownwall "L", "I", "G", "H", "T"
; UNOWNWORDS_WATER
	; db      $4c, $00, $46, $08, $42, -1
	unownwall "W", "A", "T", "E", "R"
; UNOWNWORDS_HO_OH
	; db      $0e, $2c, $64, $2c, $0e, -1
	unownwall "H", "O", "-", "O", "H"
; UNOWNWORDS_DO_NOT
	unownwall "D", "O", "-", "N", "O", "T"
; UNOWNWORDS_FINISH
	unownwall "F", "I", "N", "I", "S", "H"
; UNOWNWORDS_PUZZLE
	unownwall "P", "U", "Z", "Z", "L", "E"
; UNOWNWORDS_HORROR
	unownwall "H", "O", "R", "R", "O", "R"
; UNOWNWORDS_WITHIN
	unownwall "W", "I", "T", "H", "I", "N"
; UNOWNWORDS_GATHER
	unownwall "G", "A", "T", "H", "E", "R"
; UNOWNWORDS_EVERY
	unownwall "E", "V", "E", "R", "Y"
; UNOWNWORDS_UNOWN
	unownwall "U", "N", "O", "W", "N"
; UNOWNWORDS_LEFT
	unownwall "L", "E", "F", "T"
; UNOWNWORDS_RIGHT
	unownwall "R", "I", "G", "H", "T"
; UNOWNWORDS_UP
	unownwall "U", "P"
; UNOWNWORDS_DOWN
	unownwall "D", "O", "W", "N"
; UNOWNWORDS_REGIDRAGO
	unownwall "F", "A", "N", "G"

MenuHeaders_UnownWalls:
; UNOWNWORDS_ESCAPE
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 4, 16, 9
; UNOWNWORDS_LIGHT
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_WATER
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_HO_OH
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_DO_NOT
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 4, 16, 9
; UNOWNWORDS_FINISH
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 4, 16, 9
; UNOWNWORDS_PUZZLE
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 4, 16, 9
; UNOWNWORDS_HORROR
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 4, 16, 9
; UNOWNWORDS_WITHIN
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 4, 16, 9
; UNOWNWORDS_GATHER
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 4, 16, 9
; UNOWNWORDS_EVERY
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_UNOWN
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_LEFT
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 13, 9
; UNOWNWORDS_RIGHT
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_UP
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 4, 11, 9
; UNOWNWORDS_DOWN
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 13, 9
; UNOWNWORDS_FANG
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 13, 9
