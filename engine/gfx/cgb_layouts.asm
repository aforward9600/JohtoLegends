; Replaces the functionality of sgb.asm to work with CGB hardware.

CheckCGB:
	ldh a, [hCGB]
	and a
	ret

LoadSGBLayoutCGB:
	ld a, b
	cp SCGB_RAM
	jr nz, .not_ram
	ld a, [wSGBPredef]
.not_ram
	cp SCGB_PARTY_MENU_HP_PALS
	jp z, CGB_ApplyPartyMenuHPPals
	call ResetBGPals
	ld l, a
	ld h, 0
	add hl, hl
	ld de, .dw
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .ReturnFromJumpTable
	push de
	jp hl

.ReturnFromJumpTable:
	ret

.dw
	dw _CGB_BattleGrayscale
	dw _CGB_BattleColors
	dw _CGB_PokegearPals
	dw _CGB_StatsScreenHPPals
	dw _CGB_Pokedex
	dw _CGB_SlotMachine
	dw _CGB_BetaTitleScreen
	dw _CGB_GSIntro
	dw _CGB_Diploma
	dw _CGB_MapPals
	dw _CGB_PartyMenu
	dw _CGB_Evolution
	dw _CGB_GSTitleScreen
	dw _CGB0d
	dw _CGB_MoveList
	dw _CGB_BetaPikachuMinigame
	dw _CGB_PokedexSearchOption
	dw _CGB_BetaPoker
	dw _CGB_Pokepic
	dw _CGB_MagnetTrain
	dw _CGB_PackPals
	dw _CGB_TrainerCard
	dw _CGB_TrainerCardKanto
	dw _CGB_PokedexUnownMode
	dw _CGB_BillsPC
	dw _CGB_UnownPuzzle
	dw _CGB_GamefreakLogo
	dw _CGB_PlayerOrMonFrontpicPals
	dw _CGB_TradeTube
	dw _CGB_TrainerOrMonFrontpicPals
	dw _CGB_MysteryGift
	dw _CGB1e

_CGB_BattleGrayscale:
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wBGPals1
	ld c, 4
	call CopyPalettes
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wBGPals1 palette PAL_BATTLE_BG_EXP
	ld c, 4
	call CopyPalettes
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wOBPals1
	ld c, 2
	call CopyPalettes
	jp _CGB_FinishBattleScreenLayout

SetDefaultBattlePalette:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTempBattleMonSpecies)
	ldh [rSVBK], a
	ld a, b
	and a ; PAL_BATTLE_BG_PLAYER
	jr z, SetBattlePal_Player
	dec a ; PAL_BATTLE_BG_ENEMY
	jr z, SetBattlePal_Enemy
	dec a ; PAL_BATTLE_BG_ENEMY_HP
	jr z, SetBattlePal_EnemyHP
	dec a ; PAL_BATTLE_BG_PLAYER_HP
	jr z, SetBattlePal_PlayerHP
	dec a ; PAL_BATTLE_BG_EXP
	jr z, SetBattlePal_Exp
	dec a ; PAL_BATTLE_BG_5 (unused)
	jr z, SetBattlePal_Player
	dec a ; PAL_BATTLE_BG_6 (unused)
	jr z, SetBattlePal_Player
	dec a ; PAL_BATTLE_BG_TEXT
	jr z, SetBattlePal_Text
	dec a ; PAL_BATTLE_OB_ENEMY
	jr z, SetBattlePal_Enemy
	dec a ; PAL_BATTLE_OB_PLAYER
	jr z, SetBattlePal_Player

	; At this point, a is 1-6. Load a battle object pal.
	ld hl, BattleObjectPals - 1 palettes
	ld bc, 1 palettes
	call AddNTimes
	call FarCopyWRAM
	pop af
	ldh [rSVBK], a
	ret

SetBattlePal_Player:
	call GetBattlemonBackpicPalettePointer
	jp LoadPalette_White_Col1_Col2_Black

SetBattlePal_Enemy:
	call GetEnemyFrontpicPalettePointer
	jp LoadPalette_White_Col1_Col2_Black

SetBattlePal_EnemyHP:
	ld a, [wEnemyHPPal]
	jr SetBattlePal_HP

SetBattlePal_PlayerHP:
	ld a, [wPlayerHPPal]
	; fallthrough
SetBattlePal_HP:
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	jp LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_PLAYER_HP

SetBattlePal_Exp:
	ld hl, ExpBarPalette
	jp LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_EXP

SetBattlePal_Text:
	; Mobile Adapter connectivity changes bg pal 7.
	farcall Function100dc0 ; is a mobile adapter session active?
	ld hl, PartyMenuBGPalette
	jr nc, .got_pal
	ld hl, PartyMenuBGMobilePalette
.got_pal
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM

_CGB_BattleColors:
	ld de, wBGPals1
	call SetBattlePal_Player
	call SetBattlePal_Enemy
	call SetBattlePal_EnemyHP
	call SetBattlePal_PlayerHP
	call SetBattlePal_Exp
	ld de, wOBPals1
	call SetBattlePal_Enemy
	call SetBattlePal_Player
	ld a, SCGB_BATTLE_COLORS
	ld [wSGBPredef], a
	call ApplyPals
_CGB_FinishBattleScreenLayout:
	call InitPartyMenuBGPal7
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, PAL_BATTLE_BG_ENEMY_HP
	call ByteFill
	hlcoord 0, 4, wAttrMap
	lb bc, 8, 10
	ld a, PAL_BATTLE_BG_PLAYER
	call FillBoxCGB
	hlcoord 10, 0, wAttrMap
	lb bc, 7, 10
	ld a, PAL_BATTLE_BG_ENEMY
	call FillBoxCGB
	hlcoord 0, 0, wAttrMap
	lb bc, 4, 10
	ld a, PAL_BATTLE_BG_ENEMY_HP
	call FillBoxCGB
	hlcoord 10, 7, wAttrMap
	lb bc, 5, 10
	ld a, PAL_BATTLE_BG_PLAYER_HP
	call FillBoxCGB
	hlcoord 10, 11, wAttrMap
	lb bc, 1, 9
	ld a, PAL_BATTLE_BG_EXP
	call FillBoxCGB
	hlcoord 0, 12, wAttrMap
	ld bc, 6 * SCREEN_WIDTH
	ld a, PAL_BATTLE_BG_TEXT
	call ByteFill
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 6 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	call ApplyAttrMap
	ret

InitPartyMenuBGPal7:
	farcall Function100dc0
Mobile_InitPartyMenuBGPal7:
	ld hl, PartyMenuBGPalette
	jr nc, .not_mobile
	ld hl, PartyMenuBGMobilePalette
.not_mobile
	ld de, wBGPals1 palette 7
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

InitPartyMenuBGPal0:
	farcall Function100dc0
	ld hl, PartyMenuBGPalette
	jr nc, .not_mobile
	ld hl, PartyMenuBGMobilePalette
.not_mobile
	ld de, wBGPals1 palette 0
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

_CGB_PokegearPals:
	push de
	push hl
	ld de, MonochromePassword
	ld hl, wMomsName
	ld c, 4
	call CompareBytes
	jr z, .MonochromePokegear
	pop hl
	pop de
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	ld hl, FemalePokegearPals
	jr .got_pals

.male
	ld hl, MalePokegearPals
.got_pals
	ld de, wBGPals1
	ld bc, 6 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.MonochromePokegear:
	pop de
	pop hl
	ld hl, .Palette
	ld de, wBGPals1
	ld bc, 6 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.Palette:
INCLUDE "gfx/pokegear/sgb.pal"

_CGB_StatsScreenHPPals:
	push de
	push hl
	ld de, MonochromePassword
	ld hl, wMomsName
	ld c, 4
	call CompareBytes
	jp z, .MonochromeStats
	pop hl
	pop de
	ld de, wBGPals1
	ld a, [wCurHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; hp palette
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; mon palette
	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; exp palette
	ld hl, StatsScreenPagePals
.MonochromeStatsResume:
	ld de, wBGPals1 palette 3
	ld bc, 4 palettes ; pink, green, blue and orange page palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call WipeAttrMap

	hlcoord 0, 0, wAttrMap
	lb bc, 8, SCREEN_WIDTH
	ld a, $1 ; mon palette
	call FillBoxCGB

	hlcoord 10, 16, wAttrMap
	ld bc, 10
	ld a, $2 ; exp palette
	call ByteFill

	hlcoord 11, 5, wAttrMap
	lb bc, 2, 2
	ld a, $3 ; pink page palette
	call FillBoxCGB

	hlcoord 13, 5, wAttrMap
	lb bc, 2, 2
	ld a, $4 ; green page palette
	call FillBoxCGB

	hlcoord 15, 5, wAttrMap
	lb bc, 2, 2
	ld a, $5 ; blue page palette
	call FillBoxCGB

	hlcoord 17, 5, wAttrMap
	lb bc, 2, 2
	ld a, $6 ; orange page palette
	call FillBoxCGB

	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.MonochromeStats:
	pop hl
	pop de
	ld de, wBGPals1
	ld a, [wCurHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; hp palette
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; mon palette
	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; exp palette
	ld hl, StatsScreenPagePalsSGB
	jp .MonochromeStatsResume

StatsScreenPagePals:
INCLUDE "gfx/stats/pages.pal"

StatsScreenPals:
INCLUDE "gfx/stats/stats.pal"

StatsScreenPalsSGB:
INCLUDE "gfx/stats/stats_sgb.pal"

StatsScreenPagePalsSGB:
INCLUDE "gfx/stats/pages_sgb.pal"

_CGB_Pokedex:
	push de
	push hl
	ld de, MonochromePassword
	ld hl, wMomsName
	ld c, 4
	call CompareBytes
	jp z, .MonochromePokedex
	pop hl
	pop de
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .is_pokemon
	ld hl, .PokedexQuestionMarkPalette
	call LoadHLPaletteIntoDE ; green question mark palette
	jr .got_palette

.is_pokemon
	call GetMonPalettePointer
	ld a, [wPokedexShinyToggle]
	and a
	jr z, .not_shiny
	; Get shiny palette pointer
	inc hl
	inc hl
	inc hl
	inc hl
.not_shiny
	call LoadPalette_White_Col1_Col2_Black ; mon palette
.got_palette
	call WipeAttrMap
	hlcoord 1, 1, wAttrMap
	lb bc, 7, 7
	ld a, $1 ; green question mark palette
	call FillBoxCGB
	call InitPartyMenuOBPals
	ld hl, .PokedexCursorPalette
	ld de, wOBPals1 palette 7 ; green cursor palette
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.MonochromePokedex:
	pop hl
	pop de
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .is_pokemon_sgb
	ld hl, .PokedexCursorSGBPalette
	call LoadHLPaletteIntoDE ; green question mark palette
	jr .got_palette_sgb

.is_pokemon_sgb
	call GetMonPalettePointer
	ld a, [wPokedexShinyToggle]
	and a
	jr z, .not_shiny_sgb
	; Get shiny palette pointer
	inc hl
	inc hl
	inc hl
	inc hl
.not_shiny_sgb
	call LoadPalette_White_Col1_Col2_Black ; mon palette
.got_palette_sgb
	call WipeAttrMap
	hlcoord 1, 1, wAttrMap
	lb bc, 7, 7
	ld a, $1 ; green question mark palette
	call FillBoxCGB
	call InitPartyMenuOBPals
	ld hl, .PokedexCursorSGBPalette
	ld de, wOBPals1 palette 7 ; green cursor palette
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.PokedexQuestionMarkPalette:
INCLUDE "gfx/pokedex/question_mark.pal"

.PokedexCursorPalette:
INCLUDE "gfx/pokedex/cursor.pal"

.PokedexCursorSGBPalette:
INCLUDE "gfx/pokedex/cursor_sgb.pal"

_CGB_BillsPC:
	push de
	push hl
	ld de, MonochromePassword
	ld hl, wMomsName
	ld c, 4
	call CompareBytes
	jp z, .MonochromeBillsPC
	pop hl
	pop de
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .GetMonPalette
	ld hl, .BillsPCOrangePalette
.MonochromeBillsPCResume:
	call LoadHLPaletteIntoDE
	jr .Resume

.GetMonPalette:
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
.Resume:
	call WipeAttrMap
	hlcoord 1, 4, wAttrMap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.Function9009:
	ld hl, .BillsPCOrangePalette
	call LoadHLPaletteIntoDE
	jr .asm_901a

.unused
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
.asm_901a
	call WipeAttrMap
	hlcoord 1, 1, wAttrMap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.MonochromeBillsPC:
	pop hl
	pop de
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .GetMonPalette
	ld hl, .BillsPCGreyPalette
	jp .MonochromeBillsPCResume

.BillsPCOrangePalette:
INCLUDE "gfx/pc/orange.pal"

.BillsPCGreyPalette:
INCLUDE "gfx/pc/grey.pal"

_CGB_PokedexUnownMode:
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	hlcoord 7, 5, wAttrMap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_SlotMachine:
	push de
	push hl
	ld de, MonochromePassword
	ld hl, wMomsName
	ld c, 4
	call CompareBytes
	jp z, .MonochromeSlots
	pop hl
	pop de
	ld hl, SlotMachinePals
.MonochromeSlotsResume:
	ld de, wBGPals1
	ld bc, 16 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call WipeAttrMap
	hlcoord 0, 2, wAttrMap
	lb bc, 10, 3
	ld a, $2
	call FillBoxCGB
	hlcoord 17, 2, wAttrMap
	lb bc, 10, 3
	ld a, $2
	call FillBoxCGB
	hlcoord 0, 4, wAttrMap
	lb bc, 6, 3
	ld a, $3
	call FillBoxCGB
	hlcoord 17, 4, wAttrMap
	lb bc, 6, 3
	ld a, $3
	call FillBoxCGB
	hlcoord 0, 6, wAttrMap
	lb bc, 2, 3
	ld a, $4
	call FillBoxCGB
	hlcoord 17, 6, wAttrMap
	lb bc, 2, 3
	ld a, $4
	call FillBoxCGB
	hlcoord 4, 2, wAttrMap
	lb bc, 2, 12
	ld a, $1
	call FillBoxCGB
	hlcoord 3, 2, wAttrMap
	lb bc, 10, 1
	ld a, $1
	call FillBoxCGB
	hlcoord 16, 2, wAttrMap
	lb bc, 10, 1
	ld a, $1
	call FillBoxCGB
	hlcoord 0, 12, wAttrMap
	ld bc, $78
	ld a, $7
	call ByteFill
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.MonochromeSlots:
	pop hl
	pop de
	ld hl, .SlotsPalette
	jp .MonochromeSlotsResume

.SlotsPalette:
INCLUDE "gfx/slots/slots_sgb.pal"

_CGB_BetaTitleScreen:
	ld hl, PalPacket_BetaTitleScreen + 1
	call CopyFourPalettes
	call WipeAttrMap
	ld de, wOBPals1
	ld a, PREDEFPAL_PACK
	call GetPredefPal
	call LoadHLPaletteIntoDE
	hlcoord 0, 6, wAttrMap
	lb bc, 12, SCREEN_WIDTH
	ld a, $1
	call FillBoxCGB
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_GSIntro:
	ld b, 0
	ld hl, .Jumptable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw .ShellderLaprasScene
	dw .JigglypuffPikachuScene
	dw .StartersCharizardScene

.ShellderLaprasScene:
	ld hl, .ShellderLaprasBGPalette
	ld de, wBGPals1
	call LoadHLPaletteIntoDE
	ld hl, .ShellderLaprasOBPals
	ld de, wOBPals1
	ld bc, 2 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	call WipeAttrMap
	ret

.ShellderLaprasBGPalette:
	RGB 19, 31, 19
	RGB 18, 23, 31
	RGB 11, 21, 28
	RGB 04, 16, 24

.ShellderLaprasOBPals:
	RGB 29, 29, 29
	RGB 20, 19, 20
	RGB 19, 06, 04
	RGB 03, 04, 06

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 03, 04, 06

.JigglypuffPikachuScene:
	ld de, wBGPals1
	ld a, PREDEFPAL_GS_INTRO_JIGGLYPUFF_PIKACHU_BG
	call GetPredefPal
	call LoadHLPaletteIntoDE

	ld de, wOBPals1
	ld a, PREDEFPAL_GS_INTRO_JIGGLYPUFF_PIKACHU_OB
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrMap
	ret

.StartersCharizardScene:
	ld hl, PalPacket_Pack + 1
	call CopyFourPalettes
	ld de, wOBPals1
	ld a, PREDEFPAL_GS_INTRO_STARTERS_TRANSITION
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrMap
	ret

_CGB_BetaPoker:
	ld hl, BetaPokerPals
	ld de, wBGPals1
	ld bc, 5 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrMap
	call ApplyAttrMap
	ret

_CGB_Diploma:
	ld hl, DiplomaPalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	ld hl, PalPacket_Diploma + 1
	call CopyFourPalettes
	call WipeAttrMap
	call ApplyAttrMap
	ret

_CGB_MapPals:
	push de
	push hl
	ld de, MonochromePassword
	ld hl, wMomsName
	ld c, 4
	call CompareBytes
	jr z, .MonochromeOverworld
	pop hl
	pop de
	call LoadMapPals
	ld a, SCGB_MAPPALS
	ld [wSGBPredef], a
	ret

.MonochromeOverworld:
	pop hl
	pop de
	call SGBLayoutJumptable.GetMapPalsIndex
	call GetPredefPal
	ld de, wBGPals1
	ld b, 7
.bg_loop
	call .LoadHLBGPaletteIntoDE
	dec b
	jr nz, .bg_loop
	ld b, 7
.ob_loop
	call .LoadHLOBPaletteIntoDE
	dec b
	jr nz, .ob_loop
	call .LoadHLBGPaletteIntoDE
	call .LoadHLBGPaletteIntoDE
	ld a, SCGB_MAPPALS
	ld [wSGBPredef], a
	ret

.LoadHLBGPaletteIntoDE:
; morn/day: shades 0, 1, 2, 3 -> 0, 1, 2, 3
; nite: shades 0, 1, 2, 3 -> 1, 2, 2, 3
	push hl
	ld a, [wTimeOfDayPal]
	cp NITE_F
	jr c, .bg_morn_day
	inc hl
	inc hl
	call .LoadHLColorIntoDE
	call .LoadHLColorIntoDE
	dec hl
	dec hl
	call .LoadHLColorIntoDE
	call .LoadHLColorIntoDE
.bg_done
	pop hl
	ret

.bg_morn_day
	call LoadHLPaletteIntoDE
	jr .bg_done

.LoadHLOBPaletteIntoDE:
; shades 0, 1, 2, 3 -> 0, 0, 1, 3
	push hl
	call .LoadHLColorIntoDE
	dec hl
	dec hl
	call .LoadHLColorIntoDE
	call .LoadHLColorIntoDE
	inc hl
	inc hl
	call .LoadHLColorIntoDE
	pop hl
	ret

.LoadHLColorIntoDE:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
rept PAL_COLOR_SIZE
	ld a, [hli]
	ld [de], a
	inc de
endr
	pop af
	ldh [rSVBK], a
	ret

MonochromePassword:
	db "MONOCHROME"

_CGB_PartyMenu:
	ld hl, PalPacket_PartyMenu + 1
	call CopyFourPalettes
	call InitPartyMenuBGPal0
	call InitPartyMenuBGPal7
	call InitPartyMenuOBPals
	call ApplyAttrMap
	ret

_CGB_Evolution:
	ld de, wBGPals1
	ld a, c
	and a
	jr z, .pokemon
	ld a, PREDEFPAL_BLACKOUT
	call GetPredefPal
	call LoadHLPaletteIntoDE
	jr .got_palette

.pokemon
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [wPlayerHPPal]
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 6 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

.got_palette
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_GSTitleScreen:
	ld hl, UnusedGSTitleBGPals
	ld de, wBGPals1
	ld bc, 5 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ld hl, UnusedGSTitleOBPals
	ld de, wOBPals1
	ld bc, 2 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld a, SCGB_DIPLOMA
	ld [wSGBPredef], a
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB0d:
	ld hl, PalPacket_Diploma + 1
	call CopyFourPalettes
	call WipeAttrMap
	call ApplyAttrMap
	ret

_CGB_UnownPuzzle:
	ld hl, PalPacket_UnownPuzzle + 1
	call CopyFourPalettes
	ld de, wOBPals1
	ld a, PREDEFPAL_UNOWN_PUZZLE
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld hl, wOBPals1
	ld a, LOW(palred 31 + palgreen 0 + palblue 0)
	ld [hli], a
	ld a, HIGH(palred 31 + palgreen 0 + palblue 0)
	ld [hl], a
	pop af
	ldh [rSVBK], a
	call WipeAttrMap
	call ApplyAttrMap
	ret

_CGB_TrainerCard:
	push de
	push hl
	ld de, MonochromePassword
	ld hl, wMomsName
	ld c, 4
	call CompareBytes
	jp z, .MonochromeTrainerCard
	pop hl
	pop de
	ld de, wBGPals1
	xor a ; CHRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, KRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, CHIGUSA
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, MILTON
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, KURT
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, WALKER ; CLAIR
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, BYRON
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, PRYCE ; CHUCK
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld hl, .BadgePalettes
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

.MonochromeTrainerCardResume:
	; fill screen with opposite-gender palette for the card border
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; kris
	jr z, .got_gender
	ld a, $0 ; chris
.got_gender
	call ByteFill
	; fill trainer sprite area with same-gender palette
	hlcoord 14, 1, wAttrMap
	lb bc, 7, 5
	ld a, [wPlayerGender]
	and a
	ld a, $0 ; chris
	jr z, .got_gender2
	ld a, $1 ; kris
.got_gender2
	call FillBoxCGB
	hlcoord 3, 10, wAttrMap
	lb bc, 3, 3
	ld a, $7 ; pryce
	call FillBoxCGB
	hlcoord 7, 10, wAttrMap
	lb bc, 3, 3
	ld a, $4 ; enoki
	call FillBoxCGB
	hlcoord 11, 10, wAttrMap
	lb bc, 3, 3
	ld a, $2 ; chigusa
	call FillBoxCGB
	hlcoord 15, 10, wAttrMap
	lb bc, 3, 3
	ld a, $6 ; byron
	call FillBoxCGB
	hlcoord 3, 13, wAttrMap
	lb bc, 3, 3
	ld a, $7 ; milton
	call FillBoxCGB
	hlcoord 7, 13, wAttrMap
	lb bc, 3, 3
	ld a, $4 ; kurt
	call FillBoxCGB
	hlcoord 11, 13, wAttrMap
	lb bc, 3, 3
	ld a, $5 ; walker
	call FillBoxCGB
	hlcoord 15, 13, wAttrMap
	lb bc, 3, 3
	ld a, $5 ; master
	call FillBoxCGB
	; top-right corner still uses the border's palette
	hlcoord 18, 1, wAttrMap
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; kris
	jr z, .got_gender3
	ld a, $0 ; chris
.got_gender3
	ld [hl], a
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.MonochromeTrainerCard:
	pop hl
	pop de
	ld de, wBGPals1
	ld hl, SGBTrainerCardPals
	ld bc, 8 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ld hl, SGBTrainerCardPals
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	jp .MonochromeTrainerCardResume

.BadgePalettes:
INCLUDE "gfx/trainer_card/badges.pal"

SGBTrainerCardPals:
INCLUDE "gfx/trainer_card/sgb_trainer_card.pal"

_CGB_TrainerCardKanto:
	push de
	push hl
	ld de, MonochromePassword
	ld hl, wMomsName
	ld c, 4
	call CompareBytes
	jp z, .MonochromeTrainerCardKanto
	pop hl
	pop de
	ld de, wBGPals1
	xor a ; CHRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, KRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, CHIGUSA
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, MILTON
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, KURT
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, WALKER ; CLAIR
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, BYRON
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, PRYCE ; CHUCK
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld hl, .BadgePalettesKanto
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

.MonochromeTrainerCardKantoResume:
	; fill screen with opposite-gender palette for the card border
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; kris
	jr z, .got_gender
	ld a, $0 ; chris
.got_gender
	call ByteFill
	; fill trainer sprite area with same-gender palette
	hlcoord 14, 1, wAttrMap
	lb bc, 7, 5
	ld a, [wPlayerGender]
	and a
	ld a, $0 ; chris
	jr z, .got_gender2
	ld a, $1 ; kris
.got_gender2
	call FillBoxCGB
	hlcoord 2, 11, wAttrMap
	lb bc, 2, 4
	ld a, $6 ; brock
	call FillBoxCGB
	hlcoord 6, 11, wAttrMap
	lb bc, 2, 4
	ld a, $0 ; misty / chris
	call FillBoxCGB
	hlcoord 10, 11, wAttrMap
	lb bc, 2, 4
	ld a, $3 ; lt.surge / erika
	call FillBoxCGB
	hlcoord 14, 11, wAttrMap
	lb bc, 2, 4
	ld a, $3 ; erika / lt.surge
	call FillBoxCGB
	hlcoord 2, 14, wAttrMap
	lb bc, 2, 4
	ld a, $6 ; koga
	call FillBoxCGB
	hlcoord 6, 14, wAttrMap
	lb bc, 2, 4
	ld a, $5 ; sabrina
	call FillBoxCGB
	hlcoord 10, 14, wAttrMap
	lb bc, 2, 4
	ld a, $7 ; blaine
	call FillBoxCGB
	hlcoord 14, 14, wAttrMap
	lb bc, 2, 4
	ld a, $1 ; giovanni
	call FillBoxCGB
	; top-right corner still uses the border's palette
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; kris
	jr z, .got_gender3
	ld a, $0 ; chris
    .got_gender3
	hlcoord 18, 1, wAttrMap
	ld [hl], a
	call ApplyAttrMap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.MonochromeTrainerCardKanto:
	pop hl
	pop de
	ld de, wBGPals1
	ld hl, SGBTrainerCardPals
	ld bc, 8 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ld hl, SGBTrainerCardPals
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	jp .MonochromeTrainerCardKantoResume

.BadgePalettesKanto:
INCLUDE "gfx/trainer_card/kanto_badges.pal"

_CGB_MoveList:
	ld de, wBGPals1
	ld a, PREDEFPAL_GOLDENROD
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	hlcoord 11, 1, wAttrMap
	lb bc, 2, 9
	ld a, $1
	call FillBoxCGB
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_BetaPikachuMinigame:
	ld hl, PalPacket_BetaPikachuMinigame + 1
	call CopyFourPalettes
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_PokedexSearchOption:
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_PackPals:
; pack pals
	push de
	push hl
	ld de, MonochromePassword
	ld hl, wMomsName
	ld c, 4
	call CompareBytes
	jr z, .MonochromePack
	pop hl
	pop de
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .tutorial_male

	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .tutorial_male

	ld hl, .KrisPackPals
	jr .got_gender

.tutorial_male
	ld hl, .ChrisPackPals
	jr .got_gender

.MonochromePack
	pop hl
	pop de
	ld hl, .SGBPackPals

.got_gender
	ld de, wBGPals1
	ld bc, 8 palettes ; 6 palettes?
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call WipeAttrMap
	hlcoord 0, 0, wAttrMap
	lb bc, 1, 10
	ld a, $1
	call FillBoxCGB
	hlcoord 10, 0, wAttrMap
	lb bc, 1, 10
	ld a, $2
	call FillBoxCGB
	hlcoord 7, 2, wAttrMap
	lb bc, 9, 1
	ld a, $3
	call FillBoxCGB
	hlcoord 0, 7, wAttrMap
	lb bc, 3, 5
	ld a, $4
	call FillBoxCGB
	hlcoord 0, 3, wAttrMap
	lb bc, 3, 5
	ld a, $5
	call FillBoxCGB
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.SGBPackPals:
INCLUDE "gfx/pack/sgb_pack.pal"

.ChrisPackPals:
INCLUDE "gfx/pack/pack.pal"

.KrisPackPals:
INCLUDE "gfx/pack/pack_f.pal"

_CGB_Pokepic:
	call _CGB_MapPals
	ld de, SCREEN_WIDTH
	hlcoord 0, 0, wAttrMap
	ld a, [wMenuBorderTopCoord]
.loop
	and a
	jr z, .found_top
	dec a
	add hl, de
	jr .loop

.found_top
	ld a, [wMenuBorderLeftCoord]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	inc a
	sub b
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	inc a
	ld c, a
	ld a, $7
	call FillBoxCGB
	call ApplyAttrMap
	ret

_CGB_MagnetTrain:
	ld hl, PalPacket_MagnetTrain + 1
	call CopyFourPalettes
	call WipeAttrMap
	hlcoord 0, 4, wAttrMap
	lb bc, 10, SCREEN_WIDTH
	ld a, $2
	call FillBoxCGB
	hlcoord 0, 6, wAttrMap
	lb bc, 6, SCREEN_WIDTH
	ld a, $1
	call FillBoxCGB
	call ApplyAttrMap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_GamefreakLogo:
	ld de, wBGPals1
	ld a, PREDEFPAL_GAMEFREAK_LOGO_BG
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld hl, .Palette
	ld de, wOBPals1
	call LoadHLPaletteIntoDE
	ld hl, .Palette
	ld de, wOBPals1 palette 1
	call LoadHLPaletteIntoDE
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ret

.Palette:
INCLUDE "gfx/splash/logo.pal"

_CGB_PlayerOrMonFrontpicPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ret

_CGB1e:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	call ApplyAttrMap
	ret

_CGB_TradeTube:
	ld hl, PalPacket_TradeTube + 1
	call CopyFourPalettes
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld de, wOBPals1 palette 7
	ld a, PREDEFPAL_TRADE_TUBE
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrMap
	ret

_CGB_TrainerOrMonFrontpicPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetFrontpicPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ret

_CGB_MysteryGift:
	ld hl, .Palettes
	ld de, wBGPals1
	ld bc, 2 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrMap
	hlcoord 3, 7, wAttrMap
	lb bc, 8, 14
	ld a, $1
	call FillBoxCGB
	hlcoord 1, 5, wAttrMap
	lb bc, 1, 18
	ld a, $1
	call FillBoxCGB
	hlcoord 1, 16, wAttrMap
	lb bc, 1, 18
	ld a, $1
	call FillBoxCGB
	hlcoord 0, 0, wAttrMap
	lb bc, 17, 2
	ld a, $1
	call FillBoxCGB
	hlcoord 18, 5, wAttrMap
	lb bc, 12, 1
	ld a, $1
	call FillBoxCGB
	call ApplyAttrMap
	ret

.Palettes:
INCLUDE "gfx/mystery_gift/mystery_gift.pal"
