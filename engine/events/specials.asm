Special::
; Run script special de.
	ld hl, SpecialsPointers
	add hl, de
	add hl, de
	add hl, de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret

INCLUDE "data/special_pointers.asm"

SetPlayerPalette:
	ld a, [wScriptVar]
	ld d, a
	farcall _SetPlayerPalette
	ret

GameCornerPrizeMonCheckDex:
	ld a, [wScriptVar]
	call CheckCaughtMon
	ret nz
	ld a, [wScriptVar]
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [wScriptVar]
	ld [wNamedObjectIndexBuffer], a
	farcall NewPokedexEntry
	call ExitAllMenus
	ret

FindPartyMonAboveLevel:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAboveLevel
	jr z, FoundNone
	jr FoundOne

FindPartyMonAtLeastThatHappy:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAtLeastThatHappy
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpecies:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpecies
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpeciesYourTrainerID:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpeciesYourTrainerID
	jr z, FoundNone
	jr FoundOne

FoundOne:
	ld a, TRUE
	ld [wScriptVar], a
	ret

FoundNone:
	xor a
	ld [wScriptVar], a
	ret

NameRival:
	ld b, NAME_RIVAL
	ld de, wRivalName
	farcall _NamingScreen
	; default to "SILVER"
	ld hl, wRivalName
	ld de, .default
	call InitName
	ret

.default
	db "Dahlia@"

NameRivalFemale:
	ld b, NAME_RIVAL_FEMALE
	ld de, wRivalName
	farcall _NamingScreen
	; default to "SILVER"
	ld hl, wRivalName
	ld de, .default
	call InitName
	ret

.default
	db "Draco@"

NameRater:
	farcall _NameRater
	ret

OverworldTownMap:
	call FadeToMenu
	farcall _TownMap
	call ExitAllMenus
	ret

UnownPrinter:
	call FadeToMenu
	farcall _UnownPrinter
	call ExitAllMenus
	ret

DisplayLinkRecord:
	call FadeToMenu
	farcall _DisplayLinkRecord
	call ExitAllMenus
	ret

PlayersHousePC:
	xor a
	ld [wScriptVar], a
	farcall _PlayersHousePC
	ld a, c
	ld [wScriptVar], a
	ret

CheckMysteryGift:
	ld a, BANK(sMysteryGiftItem)
	call GetSRAMBank
	ld a, [sMysteryGiftItem]
	and a
	jr z, .no
	inc a

.no
	ld [wScriptVar], a
	call CloseSRAM
	ret

GetMysteryGiftItem:
	ld a, BANK(sMysteryGiftItem)
	call GetSRAMBank
	ld a, [sMysteryGiftItem]
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .no_room
	xor a
	ld [sMysteryGiftItem], a
	call CloseSRAM
	ld a, [wCurItem]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, .ReceiveItemText
	call PrintText
	ld a, TRUE
	ld [wScriptVar], a
	ret

.no_room
	call CloseSRAM
	xor a
	ld [wScriptVar], a
	ret

.ReceiveItemText:
	; received item
	text_far _ReceiveItemText
	text_end

BugContestJudging:
	ret

MapRadio:
	ld a, [wScriptVar]
	ld e, a
	farcall PlayRadio
	ret

UnownPuzzle:
	call FadeToMenu
	farcall _UnownPuzzle
	ld a, [wSolvedUnownPuzzle]
	ld [wScriptVar], a
	call ExitAllMenus
	ret

SlotMachine:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_SlotMachine)
	ld hl, _SlotMachine
	call StartGameCornerGame
	ret

CardFlip:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_CardFlip)
	ld hl, _CardFlip
	call StartGameCornerGame
	ret

DummyNonfunctionalGameCornerGame:
	ret

StartGameCornerGame:
	call FarQueueScript
	call FadeToMenu
	ld hl, wQueuedScriptBank
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	call ExitAllMenus
	ret

CheckCoinsAndCoinCase:
	ld hl, wCoins
	ld a, [hli]
	or [hl]
	jr z, .no_coins
	ld a, COIN_CASE
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jr nc, .no_coin_case
	and a
	ret

.no_coins
	ld hl, .NoCoinsText
	jr .print

.no_coin_case
	ld hl, .NoCoinCaseText

.print
	call PrintText
	scf
	ret

.NoCoinsText:
	; You have no coins.
	text_far _NoCoinsText
	text_end

.NoCoinCaseText:
	; You don't have a COIN CASE.
	text_far _NoCoinCaseText
	text_end

ClearBGPalettesBufferScreen:
	call ClearBGPalettes
	call BufferScreen
	ret

ScriptReturnCarry:
	jr c, .carry
	xor a
	ld [wScriptVar], a
	ret
.carry
	ld a, 1
	ld [wScriptVar], a
	ret

ActivateFishingSwarm:
	ld a, [wScriptVar]
	ld [wFishingSwarmFlag], a
	jr SetSwarmFlag

StoreSwarmMapIndices::
	ld a, d
	ld [wSwarmMapGroup], a
	ld a, e
	ld [wSwarmMapNumber], a

SetSwarmFlag:
	ld hl, wDailyFlags1
	set DAILYFLAGS1_SWARM_F, [hl]
	ret

CheckSwarmFlag::
	ld hl, wDailyFlags1
	bit DAILYFLAGS1_SWARM_F, [hl]
	jr z, .clear_swarm
	xor a
	ld [wScriptVar], a
	ret

.clear_swarm
	ld a, 1
	ld [wScriptVar], a
	xor a
	ld [wFishingSwarmFlag], a
	ld [wSwarmMapGroup], a
	ld [wSwarmMapNumber], a
	ret

CheckPokerus:
; Check if a monster in your party has Pokerus
	farcall _CheckPokerus
	jp ScriptReturnCarry

ResetLuckyNumberShowFlag:
	farcall LoadOrRegenerateLuckyIDNumber
	ret

CheckLuckyNumberShowFlag:
	ld hl, wLuckyNumberShowFlag
	bit LUCKYNUMBERSHOW_GAME_OVER_F, [hl]
	ret

SnorlaxAwake:
	ret

PlayCurMonCry:
	ld a, [wCurPartySpecies]
	jp PlayMonCry

GameboyCheck:
	ldh a, [hCGB]
	and a
	jr nz, .cgb

	ldh a, [hSGB]
	and a
	jr nz, .sgb

.gb
	xor a ; GBCHECK_GB
	jr .done
.sgb
	ld a, GBCHECK_SGB
	jr .done
.cgb
	ld a, GBCHECK_CGB
.done
	ld [wScriptVar], a
	ret

FadeOutMusic:
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld a, $2
	ld [wMusicFade], a
	ret

Diploma:
	call FadeToMenu
	farcall _Diploma
	call ExitAllMenus
	ret

PrintDiploma:
	call FadeToMenu
	farcall _PrintDiploma
	call ExitAllMenus
	ret

TrainerHouse:
	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call GetSRAMBank
	ld a, [sMysteryGiftTrainerHouseFlag]
	ld [wScriptVar], a
	jp CloseSRAM
