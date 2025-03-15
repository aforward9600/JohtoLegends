DrawPlayerHP:
	ld a, $1
	jr DrawHP

DrawEnemyHP:
	ld a, $2

DrawHP:
	ld [wWhichHPBar], a
	push hl
	push bc
	; box mons have full HP
	ld a, [wMonType]
	cp BOXMON
	jr z, .at_least_1_hp

	ld a, [wTempMonHP]
	ld b, a
	ld a, [wTempMonHP + 1]
	ld c, a

; Any HP?
	or b
	jr nz, .at_least_1_hp

	xor a
	ld c, a
	ld e, a
	ld a, 6
	ld d, a
	jp .fainted

.at_least_1_hp
	ld a, [wTempMonMaxHP]
	ld d, a
	ld a, [wTempMonMaxHP + 1]
	ld e, a
	ld a, [wMonType]
	cp BOXMON
	jr nz, .not_boxmon

	ld b, d
	ld c, e

.not_boxmon
	predef ComputeHPBarPixels
	ld a, 6
	ld d, a
	ld c, a

.fainted
	ld a, c
	pop bc
	ld c, a
	pop hl
	push de
	push hl
	push hl
	call DrawBattleHPBar
	pop hl

; Print HP
	bccoord 1, 1, 0
	add hl, bc
	ld de, wTempMonHP
	ld a, [wMonType]
	cp BOXMON
	jr nz, .not_boxmon_2
	ld de, wTempMonMaxHP
.not_boxmon_2
	lb bc, 2, 3
	call PrintNum

	ld a, "/"
	ld [hli], a

; Print max HP
	ld de, wTempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	pop hl
	pop de
	ret

PrintTempMonStats:
; Print wTempMon's stats at hl, with spacing bc.
	push bc
	push hl
	ld de, .StatNames
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld de, wTempMonAttack
	lb bc, 2, 3
	call .PrintStat
	ld de, wTempMonDefense
	call .PrintStat
	ld de, wTempMonSpclAtk
	call .PrintStat
	ld de, wTempMonSpclDef
	call .PrintStat
	ld de, wTempMonSpeed
	jp PrintNum

.PrintStat:
	push hl
	call PrintNum
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

.StatNames:
	db   "Attack"
	next "Defense"
	next "Spcl.Atk"
	next "Spcl.Def"
	next "Speed"
	next "@"

GetGender:
; Return the gender of a given monster (wCurPartyMon/wCurOTMon/wCurWildMon).
; When calling this function, a should be set to an appropriate wMonType value.

; return values:
; a = 1: f = nc|nz; male
; a = 0: f = nc|z;  female
;        f = c:  genderless

; This is determined by comparing the Attack and Speed DVs
; with the species' gender ratio.

; Figure out what type of monster struct we're looking at.

; 0: PartyMon
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wMonType]
	and a
	jr z, .PartyMon

; 1: OTPartyMon
	ld hl, wOTPartyMon1DVs
	dec a
	jr z, .PartyMon

; 2: sBoxMon
	ld hl, sBoxMon1DVs
	ld bc, BOXMON_STRUCT_LENGTH
	dec a
	jr z, .sBoxMon

; 3: Unknown
	ld hl, wTempMonDVs
	dec a
	jr z, .DVs

; else: WildMon
	ld hl, wEnemyMonDVs
	jr .DVs

; Get our place in the party/box.

.PartyMon:
.sBoxMon
	ld a, [wCurPartyMon]
	call AddNTimes

.DVs:
; sBoxMon data is read directly from SRAM.
	ld a, [wMonType]
	cp BOXMON
	ld a, BANK(sBox)
	call z, GetSRAMBank

; Attack DV
	ld a, [hl]
	cpl
	and $10
	swap a
	add a    ; Atk DV << 1
	ld b, a  ; Store it in register b
; Defense DV
	ld a, [hli]
	and $1
	add a    ; Def DV << 1
	add a    ; Def DV << 2
	or b    ; Add (Atk DV << 1) + (Def DV << 2)
	ld b, a  ; Store result in b
; Special DV
	ld a, [hl]
	cpl
	and $1
	add a    ; Spec DV << 1
	add a    ; Spec DV << 2
	add a    ; Spec DV << 3
	or b    ; Add (Spec DV << 3)
	swap a
	ld b, a  ; Again, stored in b.

; Close SRAM if we were dealing with a sBoxMon.
	ld a, [wMonType]
	cp BOXMON
	call z, CloseSRAM

; We need the gender ratio to do anything with this.
	push bc
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, BaseData
	ld a, BANK(BaseData)
	call LoadIndirectPointer
	ld bc, BASE_GENDER
	add hl, bc
	pop bc
	jr z, .Genderless

	call GetFarByte

; The higher the ratio, the more likely the monster is to be female.

	cp GENDER_UNKNOWN
	jr z, .Genderless

	and a ; GENDER_F0?
	jr z, .Male

	cp GENDER_F100
	jr z, .Female

; Values below the ratio are male, and vice versa.
	cp b
	jr c, .Male

.Female:
	xor a
	ret

.Male:
	ld a, 1
	and a
	ret

.Genderless:
	scf
	ret

ListMovePP:
	ld a, [wNumMoves]
	inc a
	ld c, a
	ld a, NUM_MOVES
	sub c
	ld b, a
	push hl
	ld a, [wBuffer1]
	ld e, a
	ld d, $0
	ld a, $3e ; P
	call .load_loop
	ld a, b
	and a
	jr z, .skip
	ld c, a
	ld a, "-"
	call .load_loop

.skip
	pop hl
	inc hl
	inc hl
	inc hl
	ld d, h
	ld e, l
	ld hl, wTempMonMoves
	ld b, 0
.loop
	ld a, [hli]
	and a
	jr z, .done
	push bc
	push hl
	push de
	ld hl, wMenuCursorY
	ld a, [hl]
	push af
	ld [hl], b
	push hl
	callfar GetMaxPPOfMove
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, wTempMonPP - (wTempMonMoves + 1)
	add hl, bc
	ld a, [hl]
	and $3f
	ld [wStringBuffer1 + 4], a
	ld h, d
	ld l, e
	push hl
	ld de, wStringBuffer1 + 4
	lb bc, 1, 2
	call PrintNum
	ld a, "/"
	ld [hli], a
	ld de, wTempPP
	lb bc, 1, 2
	call PrintNum
	pop hl
	ld a, [wBuffer1]
	ld e, a
	ld d, 0
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp NUM_MOVES
	jr nz, .loop

.done
	ret

.load_loop
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, .load_loop
	ret

Unreferenced_Function50cd0:
.loop
	ld [hl], $32
	inc hl
	ld [hl], $3e
	dec hl
	add hl, de
	dec c
	jr nz, .loop
	ret

Unused_PlaceEnemyHPLevel:
	push hl
	push hl
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNick
	pop hl
	call PlaceString
	call CopyMonToTempMon
	pop hl
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	push hl
	ld bc, -12
	add hl, bc
	ld b, $0
	call DrawEnemyHP
	pop hl
	ld bc, 5
	add hl, bc
	push de
	call PrintLevel
	pop de

.egg
	ret

PlaceStatusString:
	push de
	inc de
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	or b
	pop de
	jr nz, PlaceNonFaintStatus
	push de
	ld de, FntString
	call CopyStatusString
	pop de
	ld a, $1
	and a
	ret

FntString:
	db "FNT@"

CopyStatusString:
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret

PlaceNonFaintStatus:
	push de
	ld a, [de]
	ld de, PsnString
	bit PSN, a
	jr nz, .place
	ld de, BrnString
	bit BRN, a
	jr nz, .place
	ld de, FrzString
	bit FRZ, a
	jr nz, .place
	ld de, ParString
	bit PAR, a
	jr nz, .place
	ld de, SlpString
	and SLP
	jr z, .no_status

.place
	call CopyStatusString
	ld a, $1
	and a

.no_status
	pop de
	ret

SlpString: db "SLP@"
PsnString: db "PSN@"
BrnString: db "BRN@"
FrzString: db "FRZ@"
ParString: db "PAR@"

ListMoves:
; List moves at hl, spaced every [wBuffer1] tiles.
	ld de, wListMoves_MoveIndicesBuffer
	ld b, $0
.moves_loop
	ld a, [de]
	inc de
	and a
	jr z, .no_more_moves
	push de
	push hl
	push hl
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	ld de, wStringBuffer1
	pop hl
	push bc
	call PlaceString
	pop bc
	ld a, b
	ld [wNumMoves], a
	inc b
	pop hl
	push bc
	ld a, [wBuffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	pop de
	ld a, b
	cp NUM_MOVES
	jr z, .done
	jr .moves_loop

.no_more_moves
	ld a, b
.nonmove_loop
	push af
	ld [hl], "-"
	ld a, [wBuffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop af
	inc a
	cp NUM_MOVES
	jr nz, .nonmove_loop

.done
	ret

PrintTempMonStatsDVs:
; Print wTempMon's stats at hl, with spacing bc.
	push bc
	push hl
	ld de, .StatNames
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld bc, SCREEN_WIDTH - 7
	add hl, bc
	
	 ; Attack DVs, EVs and stat
	ld a, [wTempMonDVs]
    and $f0
    swap a
	ld [wTempMonPadding + 1], a
	xor a
	ld [wTempMonPadding], a
	ld de, wTempMonPadding
	lb bc, 2, 3
	call .PrintDVEVs

if DEF(_CHALLENGE)
	lb bc, 2, 3
	ld de, $f6
else
	ld de, wTempMonAtkEV
	ld a, [de]
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
	lb bc, 2, 3
endc
	call .PrintDVEVs
	
	lb bc, 2, 3
	ld de, wTempMonAttack
	call .PrintStat
	
	 ; Defense DVs, EVs and stat
	ld a, [wTempMonDVs]
    and $f
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
	lb bc, 2, 3
	call .PrintDVEVs

if DEF(_CHALLENGE)
	lb bc, 2, 3
	ld de, $f6
else
	ld de, wTempMonDefEV
	ld a, [de]
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
	lb bc, 2, 3
endc
	call .PrintDVEVs
	
	lb bc, 2, 3
	ld de, wTempMonDefense
	call .PrintStat
	
	 ; Special DVs and Sp. Atk EVs and stat
	ld a, [wTempMonDVs + 1]
    and $f
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
	lb bc, 2, 3
	call .PrintDVEVs

if DEF(_CHALLENGE)
	lb bc, 2, 3
	ld de, $f6
else
	ld de, wTempMonSpclAtkEV
	ld a, [de]
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
	lb bc, 2, 3
endc
	call .PrintDVEVs
	
	lb bc, 2, 3
	ld de, wTempMonSpclAtk
	call .PrintStat
	
	 ; Special DVs and Sp. Def EVs and stat
	ld a, [wTempMonDVs + 1]
    and $f
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
	lb bc, 2, 3
	call .PrintDVEVs

if DEF(_CHALLENGE)
	lb bc, 2, 3
	ld de, $f6
else
	ld de, wTempMonSpclDefEV
	ld a, [de]
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
	lb bc, 2, 3
endc
	call .PrintDVEVs
	
	lb bc, 2, 3
	ld de, wTempMonSpclDef
	call .PrintStat
	
	 ; Speed DVs and stat
	ld a, [wTempMonDVs + 1]
    and $f0
    swap a
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
	lb bc, 2, 3
	call .PrintDVEVs

if DEF(_CHALLENGE)
	lb bc, 2, 3
	ld de, $f6
else
	ld de, wTempMonSpdEV
	lb bc, 2, 3
	ld a, [de]
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
endc
	call .PrintDVEVs
	
	xor a
	ld [wTempMonPadding + 1], a
	lb bc, 2, 3
	ld de, wTempMonSpeed
	jp PrintNum

.PrintStat:
	push hl
	call PrintNum
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	ld de, SCREEN_WIDTH - 8
	add hl, de
	ret

.PrintDVEVs:
	push hl
	call PrintNum
	pop hl
	ld de, 4
	add hl, de
	ret

.StatNames:
	db   "DV  EV Atk"
	next "DV  EV Def"
	next "DV  EV SpA"
	next "DV  EV SpD"
	next "DV  EV Spe"
	next "@"

PrintTempMonHPDVs:
	ld a, [wTempMonDVs]
	and $f0
	swap a
	ld [wTempMonPadding + 1], a
	ld c, 0
	and 1
	jr z, .atk_not_odd
	ld a, 0
	add 8
	ld b, 0
	ld c, a
.atk_not_odd
	push bc
	ld a, [wTempMonDVs]
	and $f
	ld [wTempMonPadding + 1], a
	pop bc
	and 1
	jr z, .def_not_odd
	ld a, c
	add 4
	ld b, 0
	ld c, a
.def_not_odd
	push bc
	ld a, [wTempMonDVs + 1]
	and $f0
	swap a
	ld [wTempMonPadding + 1], a
	pop bc
	and 1
	jr z, .speed_not_odd
	ld a, c
	add 2
	ld b, 0
	ld c, a
.speed_not_odd
	push bc
	ld a, [wTempMonDVs + 1]
	and $f
	ld [wTempMonPadding + 1], a
	pop bc
	and 1
	jr z, .spc_not_odd
	ld a, c
	add 1
	ld b, 0
	ld c, a
.spc_not_odd
	ld a, c
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
	lb bc, 2, 3
	call .PrintHPDVEVs

if DEF(_CHALLENGE)
	lb bc, 2, 3
	ld de, $f6
else
	ld de, wTempMonHPEV
	ld a, [de]
	ld [wTempMonPadding + 1], a
	ld de, wTempMonPadding
	lb bc, 2, 3
endc
	call .PrintHPDVEVs
	ret

.PrintHPDVEVs:
	push hl
	call PrintNum
	pop hl
	ld de, 4
	add hl, de
	ret
