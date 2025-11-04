SaveMenu:
	call LoadStandardMenuHeader
	farcall DisplaySaveInfoOnSave
	call SpeechTextbox
	call UpdateSprites
	farcall SaveMenu_CopyTilemapAtOnce
	ld hl, Text_WouldYouLikeToSaveTheGame
	call SaveTheGame_yesorno
	jr nz, .refused
	call AskOverwriteSaveFile
	jr c, .refused
	call PauseGameLogic
	call SavedTheGame
	call ResumeGameLogic
	call ExitMenu
	and a
	ret

.refused
	call ExitMenu
	farcall SaveMenu_CopyTilemapAtOnce
	scf
	ret

SaveAfterLinkTrade:
	call PauseGameLogic
	farcall StageRTCTimeForSave
	farcall BackupMysteryGift
	call SavePokemonData
	call SaveIndexTables
	call SaveChecksum
	farcall BackupPartyMonMail
	farcall SaveRTC
	jp ResumeGameLogic

ChangeBoxSaveGame:
	push de
	ld hl, Text_SaveOnBoxSwitch
	call MenuTextbox
	call YesNoBox
	call ExitMenu
	jr c, .refused
	call AskOverwriteSaveFile
	jr c, .refused
	call PauseGameLogic
	call SaveBox
	pop de
	ld a, e
	ld [wCurBox], a
	call LoadBox
	call SavedTheGame
	call ResumeGameLogic
	and a
	ret
.refused
	pop de
	ret

Link_SaveGame:
	call AskOverwriteSaveFile
	jr c, .refused
	call PauseGameLogic
	call SavedTheGame
	call ResumeGameLogic
	and a

.refused
	ret

MoveMonWOMail_SaveGame:
	call PauseGameLogic
	push de
	call SaveBox
	pop de
	ld a, e
	ld [wCurBox], a
	call LoadBox
	jp ResumeGameLogic

MoveMonWOMail_InsertMon_SaveGame:
	call PauseGameLogic
	push de
	call SaveBox
	pop de
	ld a, e
	ld [wCurBox], a
	ld a, TRUE
	ld [wSaveFileExists], a
	farcall StageRTCTimeForSave
	farcall BackupMysteryGift
	call ValidateSave
	call SaveOptions
	call SavePlayerData
	call SavePokemonData
	call SaveIndexTables
	call SaveChecksum
	farcall BackupPartyMonMail
	farcall BackupMobileEventIndex
	farcall SaveRTC
	call LoadBox
	call ResumeGameLogic
	ld de, SFX_SAVE
	jp PlaySFX

StartMoveMonWOMail_SaveGame:
	ld hl, Text_SaveOnMoveMonWOMail
	call MenuTextbox
	call YesNoBox
	call ExitMenu
	jr c, .refused
	call AskOverwriteSaveFile
	jr c, .refused
	call PauseGameLogic
	call SavedTheGame
	call ResumeGameLogic
	and a
	ret

.refused
	scf
	ret

PauseGameLogic:
	ld a, TRUE
	ld [wGameLogicPaused], a
	ret

ResumeGameLogic:
	xor a ; FALSE
	ld [wGameLogicPaused], a
	ret

AddHallOfFameEntry:
	ld a, BANK(sHallOfFame)
	call GetSRAMBank
	ld hl, sHallOfFame + HOF_LENGTH * (NUM_HOF_TEAMS - 1) - 1
	ld de, sHallOfFame + HOF_LENGTH * NUM_HOF_TEAMS - 1
	ld bc, HOF_LENGTH * (NUM_HOF_TEAMS - 1)
.loop
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ld hl, wHallOfFamePokemonList
	ld de, sHallOfFame
	ld bc, HOF_LENGTH
	call CopyBytes
	jp CloseSRAM

AskOverwriteSaveFile:
	ld a, [wSaveFileExists]
	and a
	jr z, .erase
	call CompareLoadedAndSavedPlayerID
	ret z
	ld hl, Text_AnotherSaveFile
	call SaveTheGame_yesorno
	jr nz, .refused

.erase
	call ErasePreviousSave
	and a
	ret

.refused
	scf
	ret

SaveTheGame_yesorno:
	ld b, BANK(Text_WouldYouLikeToSaveTheGame)
	call MapTextbox
	call LoadMenuTextbox
	lb bc, 0, 7
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	dec a
	call CloseWindow
	push af
	pop af
	and a
	ret

CompareLoadedAndSavedPlayerID:
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld hl, sPlayerData + (wPlayerID - wPlayerData)
	ld a, [hli]
	ld c, [hl]
	ld b, a
	call CloseSRAM
	ld a, [wPlayerID]
	cp b
	ret nz
	ld a, [wPlayerID + 1]
	cp c
	ret

SavedTheGame:
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	push hl
	ld hl, .saving_text
	call PrintText
	pop hl
	res NO_TEXT_SCROLL, [hl]
	call SaveGameData
	; <PLAYER> saved the game!
	ld hl, Text_PlayerSavedTheGame
	call PrintText
	ld de, SFX_SAVE
	call WaitPlaySFX
	jp WaitSFX

.saving_text
	text "Saving…"
	done

SaveGameData:
	ld a, TRUE
	ld [wSaveFileExists], a
	farcall StageRTCTimeForSave
	farcall BackupMysteryGift
	call ValidateSave
	call SaveOptions
	call SavePlayerData
	call SavePokemonData
	call SaveIndexTables
	call SaveBox
	call SaveChecksum
	farcall BackupPartyMonMail
	farcall BackupMobileEventIndex
	farcall SaveRTC
	ld a, BANK(sBattleTowerChallengeState)
	call GetSRAMBank
	ld a, [sBattleTowerChallengeState]
	cp BATTLETOWER_RECEIVED_REWARD
	jp nz, CloseSRAM
	xor a
	ld [sBattleTowerChallengeState], a
	jp CloseSRAM

ErasePreviousSave:
	call EraseBoxes
	call EraseHallOfFame
	call EraseLinkBattleStats
	call EraseMysteryGift
	call SaveData
	call EraseBattleTowerStatus
	ld a, $1
	ld [wSavedAtLeastOnce], a
	ret

EraseLinkBattleStats:
	ld a, BANK(sLinkBattleStats)
	call GetSRAMBank
	ld hl, sLinkBattleStats
	ld bc, sLinkBattleStatsEnd - sLinkBattleStats
	xor a
	call ByteFill
	jp CloseSRAM

EraseMysteryGift:
	ld a, BANK(sBackupMysteryGiftItem)
	call GetSRAMBank
	ld hl, sBackupMysteryGiftItem
	ld bc, sBackupMysteryGiftItemEnd - sBackupMysteryGiftItem
	xor a
	call ByteFill
	jp CloseSRAM

EraseHallOfFame:
	ld a, BANK(sHallOfFame)
	call GetSRAMBank
	ld hl, sHallOfFame
	ld bc, sHallOfFameEnd - sHallOfFame
	xor a
	call ByteFill
	jp CloseSRAM

EraseBattleTowerStatus:
	ld a, BANK(sBattleTowerChallengeState)
	call GetSRAMBank
	xor a
	ld [sBattleTowerChallengeState], a
	jp CloseSRAM

SaveData:
	jp _SaveData

HallOfFame_InitSaveIfNeeded:
	ld a, [wSavedAtLeastOnce]
	and a
	ret nz
	jp ErasePreviousSave

ValidateSave:
	ld a, BANK(sCheckValue1) ; aka BANK(sCheckValue2)
	call GetSRAMBank
	ld a, SAVE_CHECK_VALUE_1
	ld [sCheckValue1], a
	ld a, SAVE_CHECK_VALUE_2
	ld [sCheckValue2], a
	jp CloseSRAM

SaveOptions:
	ld a, BANK(sOptions)
	call GetSRAMBank
	ld hl, wOptions
	ld de, sOptions
	ld bc, wOptionsEnd - wOptions
	call CopyBytes
	ld a, [wOptions]
	and $ff ^ (1 << NO_TEXT_SCROLL)
	ld [sOptions], a
	jp CloseSRAM

SavePlayerData:
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld hl, wPlayerData
	ld de, sPlayerData
	ld bc, wPlayerDataEnd - wPlayerData
	call CopyBytes
	ld hl, wCurMapData
	ld de, sCurMapData
	ld bc, wCurMapDataEnd - wCurMapData
	call CopyBytes
	jp CloseSRAM

SavePokemonData:
	ld a, BANK(sPokemonData)
	call GetSRAMBank
	ld hl, wPokemonData
	ld de, sPokemonData
	ld bc, wPokemonDataEnd - wPokemonData
	call CopyBytes
	jp CloseSRAM

SaveIndexTables:
	; saving is already a long operation, so take the chance to GC the table
	farcall ForceGarbageCollection
	ldh a, [rSVBK]
	push af
	ld a, BANK("16-bit WRAM tables")
	ldh [rSVBK], a
	ld a, BANK(sPokemonIndexTable)
	call GetSRAMBank
	ld hl, wPokemonIndexTable
	ld de, sPokemonIndexTable
	ld bc, wPokemonIndexTableEnd - wPokemonIndexTable
	call CopyBytes
	ld a, BANK(sMoveIndexTable)
	call GetSRAMBank
	ld hl, wMoveIndexTable
	ld de, sMoveIndexTable
	ld bc, wMoveIndexTableEnd - wMoveIndexTable
	call CopyBytes
	pop af
	ldh [rSVBK], a
	jp CloseSRAM

SaveBox:
	call GetBoxAddress
	push de
	push af
	call SaveBoxAddress
	pop af
	call GetSRAMBank
	pop hl
	call ComputeSavedBoxIndexTable
	call GetBoxPokemonIndexesAddress
	call GetSRAMBank
	ld d, h
	ld e, l
	ld hl, wBoxPartialData
	ld bc, 2 * MONS_PER_BOX
	call CopyBytes
	call GetBoxAddress
	ld b, a
	ld c, 0
	farcall BillsPC_ConvertBoxData
	jp CloseSRAM

SaveChecksum:
	ld a, BANK(sConversionTables)
	call GetSRAMBank
	ld hl, sConversionTables
	ld bc, sConversionTablesEnd - sConversionTables
	call Checksum
	ld a, BANK(sSaveData)
	call GetSRAMBank
	ld hl, sConversionTableChecksum
	ld a, e
	ld [hli], a
	ld [hl], d
	ld hl, sSaveData
	ld bc, sSaveDataEnd - sSaveData
	call Checksum
	ld a, e
	ld [sChecksum + 0], a
	ld a, d
	ld [sChecksum + 1], a
	jp CloseSRAM

TryLoadSaveFile:
	call VerifyChecksum
	jr nz, .corrupt
	call LoadPlayerData
	call LoadPokemonData
	call LoadIndexTables
	call LoadBox
	farcall RestorePartyMonMail
	farcall RestoreMobileEventIndex
	farcall RestoreMysteryGift
	and a
	ret

.corrupt
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	ld hl, Text_SaveFileCorrupted
	call PrintText
	pop af
	ld [wOptions], a
	scf
	ret

TryLoadSaveData:
	xor a ; FALSE
	ld [wSaveFileExists], a
	call CheckPrimarySaveFile
	ld a, [wSaveFileExists]
	and a
	jr z, .corrupt

	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld hl, sPlayerData + wStartDay - wPlayerData
	ld de, wStartDay
	ld bc, 8
	call CopyBytes
	ld hl, sPlayerData + wStatusFlags - wPlayerData
	ld de, wStatusFlags
	ld a, [hl]
	ld [de], a
	jp CloseSRAM

.corrupt
	ld hl, DefaultOptions
	ld de, wOptions
	ld bc, wOptionsEnd - wOptions
	call CopyBytes
	jp PanicResetClock

INCLUDE "data/default_options.asm"

CheckPrimarySaveFile:
	ld a, BANK(sCheckValue1) ; aka BANK(sCheckValue2)
	call GetSRAMBank
	ld a, [sCheckValue1]
	cp SAVE_CHECK_VALUE_1
	jp nz, CloseSRAM
	ld a, [sCheckValue2]
	cp SAVE_CHECK_VALUE_2
	jp nz, CloseSRAM
	ld hl, sOptions
	ld de, wOptions
	ld bc, wOptionsEnd - wOptions
	call CopyBytes
	call CloseSRAM
	ld a, TRUE
	ld [wSaveFileExists], a
	jp CloseSRAM

LoadPlayerData:
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld hl, sPlayerData
	ld de, wPlayerData
	ld bc, wPlayerDataEnd - wPlayerData
	call CopyBytes
	ld hl, sCurMapData
	ld de, wCurMapData
	ld bc, wCurMapDataEnd - wCurMapData
	call CopyBytes
	call CloseSRAM
	ld a, BANK(sBattleTowerChallengeState)
	call GetSRAMBank
	ld a, [sBattleTowerChallengeState]
	cp BATTLETOWER_RECEIVED_REWARD
	jp nz, CloseSRAM
	ld a, BATTLETOWER_WON_CHALLENGE
	ld [sBattleTowerChallengeState], a
	jp CloseSRAM

LoadPokemonData:
	ld a, BANK(sPokemonData)
	call GetSRAMBank
	ld hl, sPokemonData
	ld de, wPokemonData
	ld bc, wPokemonDataEnd - wPokemonData
	call CopyBytes
	jp CloseSRAM

LoadIndexTables:
	ldh a, [rSVBK]
	push af
	ld a, BANK("16-bit WRAM tables")
	ldh [rSVBK], a
	ld a, BANK(sPokemonIndexTable)
	call GetSRAMBank
	ld hl, sPokemonIndexTable
	ld de, wPokemonIndexTable
	ld bc, wPokemonIndexTableEnd - wPokemonIndexTable
	call CopyBytes
	ld a, BANK(sMoveIndexTable)
	call GetSRAMBank
	ld hl, sMoveIndexTable
	ld de, wMoveIndexTable
	ld bc, wMoveIndexTableEnd - wMoveIndexTable
	call CopyBytes
	pop af
	ldh [rSVBK], a
	jp CloseSRAM

LoadBox:
	call GetBoxAddress
	call LoadBoxAddress
	lb bc, BANK(sBox), 1
	ld de, sBox
	farcall BillsPC_ConvertBoxData
	call GetBoxPokemonIndexesAddress
	call GetSRAMBank
	ld de, wBoxPartialData
	ld bc, 2 * MONS_PER_BOX
	call CopyBytes
	ld a, BANK(sBox)
	call GetSRAMBank
	call ClearIndexesForLoadedBox
	; GC the table now that lots of entries are free
	farcall ForceGarbageCollection
	call UpdateIndexesForLoadedBox
	jp CloseSRAM

VerifyChecksum:
	ld hl, sSaveData
	ld bc, sSaveDataEnd - sSaveData
	ld a, BANK(sSaveData)
	call GetSRAMBank
	call Checksum
	ld a, [sChecksum + 0]
	cp e
	jr nz, .fail
	ld a, [sChecksum + 1]
	cp d
	jr nz, .fail
	ld hl, sConversionTableChecksum
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, BANK(sConversionTables)
	call GetSRAMBank
	ld hl, sConversionTables
	ld bc, sConversionTablesEnd - sConversionTables
	call Checksum
	pop hl
	ld a, d
	cp h
	jr nz, .fail
	ld a, e
	cp l
.fail
	push af
	call CloseSRAM
	pop af
	ret

_SaveData:
	; This is called within two scenarios:
	;   a) ErasePreviousSave (the process of erasing the save from a previous game file)
	;   b) unused mobile functionality
	; It is not part of a regular save.

	ld a, BANK(sCrystalData)
	call GetSRAMBank
	ld hl, wCrystalData
	ld de, sCrystalData
	ld bc, wCrystalDataEnd - wCrystalData
	call CopyBytes

	; This block originally had some mobile functionality, but since we're still in
	; BANK(sCrystalData), it instead overwrites the sixteen wEventFlags starting at 1:a603 with
	; garbage from wd479. This isn't an issue, since ErasePreviousSave is followed by a regular
	; save that unwrites the garbage.

	ld hl, wd479
	ld a, [hli]
	ld [$a60e + 0], a
	ld a, [hli]
	ld [$a60e + 1], a

	jp CloseSRAM

_LoadData:
	ld a, BANK(sCrystalData)
	call GetSRAMBank
	ld hl, sCrystalData
	ld de, wCrystalData
	ld bc, wCrystalDataEnd - wCrystalData
	call CopyBytes

	; This block originally had some mobile functionality to mirror _SaveData above, but instead it
	; (harmlessly) writes the aforementioned wEventFlags to the unused wd479.

	ld hl, wd479
	ld a, [$a60e + 0]
	ld [hli], a
	ld a, [$a60e + 1]
	ld [hli], a

	jp CloseSRAM

GetBoxAddress:
	ld a, [wCurBox]
	cp NUM_BOXES
	jr c, .ok
	xor a
	ld [wCurBox], a

.ok
	ld e, a
	ld d, 0
	ld hl, BoxAddresses
rept 5
	add hl, de
endr
	ld a, [hli]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ret

GetBoxPokemonIndexesAddress:
	ld a, [wCurBox]
	ld e, a
	ld d, 0
	ld hl, BoxAddresses + 5 * NUM_BOXES
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ret
	ret

SaveBoxAddress:
; Save box via wBoxPartialData.
; We do this in three steps because the size of wBoxPartialData is less than
; the size of sBox.
	push hl
; Load the first part of the active box.
	push af
	push de
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBox
	ld de, wBoxPartialData
	ld bc, (wBoxPartialDataEnd - wBoxPartialData)
	call CopyBytes
	call CloseSRAM
	pop de
	pop af
; Save it to the target box.
	push af
	push de
	call GetSRAMBank
	ld hl, wBoxPartialData
	ld bc, (wBoxPartialDataEnd - wBoxPartialData)
	call CopyBytes
	call CloseSRAM

; Load the second part of the active box.
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBox + (wBoxPartialDataEnd - wBoxPartialData)
	ld de, wBoxPartialData
	ld bc, (wBoxPartialDataEnd - wBoxPartialData)
	call CopyBytes
	call CloseSRAM
	pop de
	pop af

	ld hl, (wBoxPartialDataEnd - wBoxPartialData)
	add hl, de
	ld e, l
	ld d, h
; Save it to the next part of the target box.
	push af
	push de
	call GetSRAMBank
	ld hl, wBoxPartialData
	ld bc, (wBoxPartialDataEnd - wBoxPartialData)
	call CopyBytes
	call CloseSRAM

; Load the third and final part of the active box.
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBox + (wBoxPartialDataEnd - wBoxPartialData) * 2
	ld de, wBoxPartialData
	ld bc, sBoxEnd - (sBox + (wBoxPartialDataEnd - wBoxPartialData) * 2) ; $8e
	call CopyBytes
	call CloseSRAM
	pop de
	pop af

	ld hl, (wBoxPartialDataEnd - wBoxPartialData)
	add hl, de
	ld e, l
	ld d, h
; Save it to the final part of the target box.
	call GetSRAMBank
	ld hl, wBoxPartialData
	ld bc, sBoxEnd - (sBox + (wBoxPartialDataEnd - wBoxPartialData) * 2) ; $8e
	call CopyBytes
	call CloseSRAM

	pop hl
	ret

ComputeSavedBoxIndexTable:
	push hl
	ld a, [hl]
	ld de, wBoxPartialData
	and a
	jr z, .empty_box
	cp MONS_PER_BOX
	jr c, .valid_count
	ld a, MONS_PER_BOX
.valid_count
	ld bc, sBoxMons - sBox
	add hl, bc
	ld [wTempLoopCounter], a
	ld c, BOXMON_STRUCT_LENGTH
.loop
	ld a, [hl]
	add hl, bc
	push hl
	call GetPokemonIndexFromID
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	inc de
	ld hl, wTempLoopCounter
	dec [hl]
	pop hl
	jr nz, .loop
.empty_box
	pop hl
	ld a, MONS_PER_BOX
	sub [hl]
	ret c
	add a, a
	ld h, d
	ld l, e
	ld c, a
	xor a
	ld b, a
	jp ByteFill

LoadBoxAddress:
; Load box via wBoxPartialData.
; We do this in three steps because the size of wBoxPartialData is less than
; the size of sBox.
	push hl
	ld l, e
	ld h, d
; Load part 1
	push af
	push hl
	call GetSRAMBank
	ld de, wBoxPartialData
	ld bc, (wBoxPartialDataEnd - wBoxPartialData)
	call CopyBytes
	call CloseSRAM
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, wBoxPartialData
	ld de, sBox
	ld bc, (wBoxPartialDataEnd - wBoxPartialData)
	call CopyBytes
	call CloseSRAM
	pop hl
	pop af

	ld de, (wBoxPartialDataEnd - wBoxPartialData)
	add hl, de
; Load part 2
	push af
	push hl
	call GetSRAMBank
	ld de, wBoxPartialData
	ld bc, (wBoxPartialDataEnd - wBoxPartialData)
	call CopyBytes
	call CloseSRAM
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, wBoxPartialData
	ld de, sBox + (wBoxPartialDataEnd - wBoxPartialData)
	ld bc, (wBoxPartialDataEnd - wBoxPartialData)
	call CopyBytes
	call CloseSRAM
	pop hl
	pop af
; Load part 3
	ld de, (wBoxPartialDataEnd - wBoxPartialData)
	add hl, de
	call GetSRAMBank
	ld de, wBoxPartialData
	ld bc, sBoxEnd - (sBox + (wBoxPartialDataEnd - wBoxPartialData) * 2) ; $8e
	call CopyBytes
	call CloseSRAM
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, wBoxPartialData
	ld de, sBox + (wBoxPartialDataEnd - wBoxPartialData) * 2
	ld bc, sBoxEnd - (sBox + (wBoxPartialDataEnd - wBoxPartialData) * 2) ; $8e
	call CopyBytes
	call CloseSRAM

	pop hl
	ret

ClearIndexesForLoadedBox:
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, MONS_PER_BOX
.loop
	ld [hl], 0
	add hl, bc
	dec a
	jr nz, .loop
	ret

UpdateIndexesForLoadedBox:
	ld de, sBox
	ld a, [de]
	cp MONS_PER_BOX
	jr c, .count_OK
	ld a, MONS_PER_BOX
	ld [de], a
.count_OK
	inc de
	and a
	jr z, .done
	ld [wTempLoopCounter], a
	ld bc, sBoxMon1Species
	ld hl, wBoxPartialData - 1
.loop
	inc hl
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call GetPokemonIDFromIndex
	ld [bc], a
	ld a, [de]
	cp EGG
	jr z, .is_egg
	ld a, [bc]
	ld [de], a
.is_egg
	ld hl, BOXMON_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	inc de
	ld hl, wTempLoopCounter
	dec [hl]
	pop hl
	jr nz, .loop
.done
	ld a, -1
	ld [de], a
	ret

EraseBoxes:
	ld hl, BoxAddresses
	ld c, NUM_BOXES
.next
	push bc
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	xor a
	ld [de], a
	inc de
	ld a, -1
	ld [de], a
	inc de
	ld bc, sBoxEnd - (sBox + 2)
.clear
	xor a
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .clear
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, -1
	ld [de], a
	inc de
	xor a
	ld [de], a
	call CloseSRAM
	pop bc
	dec c
	jr nz, .next
	ld e, NUM_BOXES
.index_loop
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld b, a
	ld a, [hli]
	push hl
	ld h, a
	ld l, b
	xor a
	ld bc, 2 * MONS_PER_BOX
	call ByteFill
	pop hl
	dec e
	jr nz, .index_loop
	ret

BoxAddresses:
; dbww bank, address, address
	dbww BANK(sBox1),  sBox1,  sBox1End
	dbww BANK(sBox2),  sBox2,  sBox2End
	dbww BANK(sBox3),  sBox3,  sBox3End
	dbww BANK(sBox4),  sBox4,  sBox4End
	dbww BANK(sBox5),  sBox5,  sBox5End
	dbww BANK(sBox6),  sBox6,  sBox6End
	dbww BANK(sBox7),  sBox7,  sBox7End
	dbww BANK(sBox8),  sBox8,  sBox8End
	dbww BANK(sBox9),  sBox9,  sBox9End
	dbww BANK(sBox10), sBox10, sBox10End
	dbww BANK(sBox11), sBox11, sBox11End
	dbww BANK(sBox12), sBox12, sBox12End
	dbww BANK(sBox13), sBox13, sBox13End
	dbww BANK(sBox14), sBox14, sBox14End
	dbww BANK(sBox15), sBox15, sBox15End
	dbww BANK(sBox16), sBox16, sBox16End
	dbww BANK(sBox17), sBox17, sBox17End
	dbww BANK(sBox18), sBox18, sBox18End
	dbww BANK(sBox19), sBox19, sBox19End
	dbww BANK(sBox20), sBox20, sBox20End

	; index addresses
	dba sBox1PokemonIndexes
	dba sBox2PokemonIndexes
	dba sBox3PokemonIndexes
	dba sBox4PokemonIndexes
	dba sBox5PokemonIndexes
	dba sBox6PokemonIndexes
	dba sBox7PokemonIndexes
	dba sBox8PokemonIndexes
	dba sBox9PokemonIndexes
	dba sBox10PokemonIndexes
	dba sBox11PokemonIndexes
	dba sBox12PokemonIndexes
	dba sBox13PokemonIndexes
	dba sBox14PokemonIndexes
	dba sBox15PokemonIndexes
	dba sBox16PokemonIndexes
	dba sBox17PokemonIndexes
	dba sBox18PokemonIndexes
	dba sBox19PokemonIndexes
	dba sBox20PokemonIndexes

Checksum:
	ld de, 0
.loop
	ld a, [hli]
	add e
	ld e, a
	ld a, 0
	adc d
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Text_WouldYouLikeToSaveTheGame:
	; Would you like to save the game?
	text_far UnknownText_0x1c454b
	text_end

Text_PlayerSavedTheGame:
	; saved the game.
	text_far UnknownText_0x1c4590
	text_end

Text_AnotherSaveFile:
	; There is another save file. Is it OK to overwrite?
	text_far UnknownText_0x1c45d9
	text_end

Text_SaveFileCorrupted:
	; The save file is corrupted!
	text_far UnknownText_0x1c460d
	text_end

Text_SaveOnBoxSwitch:
	; When you change a #MON BOX, data will be saved. OK?
	text_far UnknownText_0x1c462a
	text_end

Text_SaveOnMoveMonWOMail:
	; Each time you move a #MON, data will be saved. OK?
	text_far UnknownText_0x1c465f
	text_end
